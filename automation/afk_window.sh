#!/usr/bin/env bash
# AFK research window for claude-research-bot.
# Drives the bot's real hourly cycle until a hard deadline, then PAUSES it for human review.
# Deadline: 2026-06-18 09:00 America/Denver (MDT, UTC-6) = 2026-06-18T15:00:00Z.
set -u
ROOT=/home/tar/claude-research-bot
SUP="$ROOT/scripts/supervisor.sh"
NOTIFY="$ROOT/scripts/notify_discord.sh"
END=$(date -u -d '2026-06-18 15:00:00' +%s)
LOG="$ROOT/logs/afk_window.log"
say(){ echo "[$(date -u +%FT%TZ)] $*" >> "$LOG"; }

say "=== AFK research window START — ends 2026-06-18T15:00Z (Thu 9:00 AM MT) ==="
# clear a stale pause so the window actually runs
[ -f "$ROOT/state/PAUSED" ] && { rm -f "$ROOT/state/PAUSED"; say "cleared pre-existing PAUSED"; }
bash "$NOTIFY" status "🟢 AFK research window started — autonomous discovery until **Thu Jun 18, 9:00 AM MT**, then auto-pause for review." || true

while [ "$(date -u +%s)" -lt "$END" ]; do
  if [ -f "$ROOT/state/PAUSED" ]; then say "PAUSED detected — ending window early"; break; fi
  say "tick: invoking supervisor (scheduled mode)"
  bash "$SUP" >> "$LOG" 2>&1
  say "supervisor returned rc=$?"
  now=$(date -u +%s); rem=$(( END - now ))
  [ "$rem" -le 0 ] && break
  nap="${ARO_CYCLE_GAP_SECONDS:-600}"   # breather between cycles (default 10m; was hourly 3600). usage-limit backoff overrides below.
  until_ts="$(jq -r '.usage_limit_until // empty' "$ROOT/state/current_state.json" 2>/dev/null)"
  if [ -n "$until_ts" ]; then
    until_s="$(date -u -d "$until_ts" +%s 2>/dev/null || echo 0)"
    [ "$until_s" -gt "$now" ] && nap=$(( until_s - now + 5 ))   # wake at the exact reset, not a flat hour
  fi
  [ "$rem" -lt "$nap" ] && nap="$rem"
  say "sleeping ${nap}s (until reset/next tick or deadline)"
  sleep "$nap"
done

touch "$ROOT/state/PAUSED"
say "=== window CLOSED — PAUSED set for human review ==="
bash "$NOTIFY" status "🛑 AFK research window closed (Thu Jun 18, 9:00 AM MT). Bot **PAUSED** for your review → check #🏆-opportunities + research/OPPORTUNITIES.md. Remove state/PAUSED to resume." || true
