#!/usr/bin/env bash
# supervisor.sh — runs ONE autonomous cycle, safely. Invoked by systemd timer / cron / manually.
#   supervisor.sh            normal scheduled run (respects backoff)
#   supervisor.sh --once     force a single run now (ignores backoff)
#   supervisor.sh --dry      everything except launching Claude (test plumbing)
#
# Guarantees: single-flight (lockfile), usage-limit backoff, full logging,
# Discord heartbeat, durable state updates, never leaves a stale lock.

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck source=lib.sh
. "$DIR/lib.sh"
load_env

MODE="${1:-}"
LOCK="$ROOT/state/aro.lock"
RUN_LOG="$LOG_DIR/cycle-$(date -u +%Y%m%d-%H%M%S).log"
notify() { "$DIR/notify_discord.sh" "$@" || true; }

# ---- single-flight lock -------------------------------------------------
exec 9>"$LOCK"
if ! flock -n 9; then
  log WARN "supervisor: another cycle holds the lock; exiting."
  exit 0
fi
state_set '.lock_held=true' || true
cleanup() { state_set '.lock_held=false' 2>/dev/null || true; flock -u 9 2>/dev/null || true; }
trap cleanup EXIT

# ---- kill switch (governance) ------------------------------------------
if [ -f "$ROOT/state/PAUSED" ]; then
  log WARN "supervisor: state/PAUSED present — refusing to run. Remove it to resume."
  exit 0
fi

# ---- usage-limit backoff ------------------------------------------------
if [ "$MODE" != "--once" ]; then
  until_ts="$(state_get '.usage_limit_until')"
  if [ -n "$until_ts" ] && [ "$until_ts" != "null" ]; then
    now_s=$(date -u +%s); until_s=$(date -u -d "$until_ts" +%s 2>/dev/null || echo 0)
    if [ "$now_s" -lt "$until_s" ]; then
      log WARN "supervisor: in usage-limit backoff until $until_ts; skipping."
      exit 0
    fi
    state_set '.usage_limit_until=null'
  fi
fi

# ---- preflight ----------------------------------------------------------
if ! "$DIR/doctor.sh" >/dev/null 2>&1; then
  log ERROR "supervisor: doctor failed; see doctor output."
  notify alerts "🚨 supervisor preflight (doctor) FAILED — cycle aborted. Check logs on VM."
  fails=$(( $(state_get '.consecutive_failures') + 1 )); state_set ".consecutive_failures=$fails"
  exit 1
fi

cycle_id="cycle-$(date -u +%Y%m%dT%H%M%SZ)"
log INFO "supervisor: starting $cycle_id (mode=${MODE:-scheduled})"
notify status "🔄 **$cycle_id** starting — objective: $(state_get '.current_objective')"
state_set ".last_execution=\"$(iso_now)\"" || true

if [ "$MODE" = "--dry" ]; then
  log INFO "supervisor: --dry, skipping Claude launch."
  notify status "🧪 dry run OK (plumbing healthy), Claude not launched."
  state_set '.consecutive_failures=0'
  exit 0
fi

# ---- launch Claude headless --------------------------------------------
MAXT="$(cfg_get '.cycle.max_runtime_seconds')"; MAXT="${MAXT:-3000}"
MODEL="${ARO_MODEL:-$(cfg_get '.cycle.model')}"
MODEL_ARG=(); [ -n "$MODEL" ] && MODEL_ARG=(--model "$MODEL")
EFFORT="${ARO_EFFORT:-$(cfg_get '.cycle.effort')}"
EFFORT_ARG=(); [ -n "$EFFORT" ] && EFFORT_ARG=(--effort "$EFFORT")
PROMPT="$(cat "$ROOT/prompts/bootstrap.md")"

set +e
( cd "$ROOT" && timeout "$MAXT" claude -p "$PROMPT" \
    --dangerously-skip-permissions "${MODEL_ARG[@]}" "${EFFORT_ARG[@]}" ) >"$RUN_LOG" 2>&1
rc=$?
set -e 2>/dev/null || true

# ---- interpret result ---------------------------------------------------
if grep -qiE 'usage limit|rate.?limit|reached your (usage|limit)|too many requests|session limit|hit your .*limit|limit .*reset|overloaded|quota' "$RUN_LOG"; then
  # Prefer the EXACT reset time Claude prints, e.g. "resets 2:20am (UTC)".
  rt="$(grep -oiE "resets[[:space:]]+[0-9]{1,2}:[0-9]{2}[[:space:]]*(am|pm)?" "$RUN_LOG" | tail -1 | grep -oiE "[0-9]{1,2}:[0-9]{2}[[:space:]]*(am|pm)?")"
  now_s="$(date -u +%s)"
  if [ -n "$rt" ] && reset_s="$(TZ=UTC date -u -d "$rt" +%s 2>/dev/null)" && [ -n "$reset_s" ]; then
    if [ "$reset_s" -le "$now_s" ]; then                       # printed clock time already passed today
      if [ "$(( now_s - reset_s ))" -gt 21600 ]; then          # >6h past => genuine next-day (am) reset
        reset_s="$(TZ=UTC date -u -d "tomorrow $rt" +%s)"
      else reset_s=$(( now_s + 120 )); fi                       # only just passed (parse lag) => usage back now
    fi
    reset_s=$(( reset_s + 90 ))                                                          # small buffer past boundary
    until_ts="$(date -u -d "@$reset_s" +%Y-%m-%dT%H:%M:%SZ)"
    log INFO "supervisor: parsed exact reset ('$rt' UTC) -> $until_ts"
  else
    back="$(cfg_get '.limits.usage_limit_backoff_minutes')"; back="${back:-60}"
    until_ts="$(date -u -d "+${back} minutes" +%Y-%m-%dT%H:%M:%SZ)"
    log WARN "supervisor: reset time unparseable; fallback +${back}m -> $until_ts"
  fi
  state_set ".usage_limit_until=\"$until_ts\""
  log WARN "supervisor: usage limit hit; backing off until $until_ts"
  notify alerts "⏳ Usage limit hit. Backing off until **$until_ts**. Will auto-resume."
  exit 0
fi

if [ "$rc" -eq 124 ]; then
  log WARN "supervisor: cycle timed out after ${MAXT}s (rc=124)"
  notify alerts "⏱️ $cycle_id timed out after ${MAXT}s — partial work may be saved. Continuing next tick."
fi

if [ "$rc" -ne 0 ] && [ "$rc" -ne 124 ]; then
  fails=$(( $(state_get '.consecutive_failures') + 1 )); state_set ".consecutive_failures=$fails"
  log ERROR "supervisor: Claude exited rc=$rc (failure #$fails)"
  notify alerts "🚨 $cycle_id FAILED (rc=$rc, streak=$fails). Tail: $(tail -c 300 "$RUN_LOG" | tr '\n' ' ')"
  maxf="$(cfg_get '.limits.max_consecutive_failures')"; maxf="${maxf:-5}"
  if [ "$fails" -ge "$maxf" ]; then
    notify alerts "🛑 $fails consecutive failures ≥ $maxf. Human attention needed. Auto-runs continue but review the VM."
  fi
  exit "$rc"
fi

# ---- success ------------------------------------------------------------
state_set '.consecutive_failures=0'
state_set '.recovery_status="CLEAN"'
log INFO "supervisor: $cycle_id completed rc=$rc"
notify status "✅ **$cycle_id** done. Next: $(state_get '.next_action')"
exit 0
