#!/usr/bin/env bash
# lib.sh — shared helpers. Source this; do not execute.
# Provides: ROOT paths, logging, .env loading, atomic JSON state read/write.

set -o pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
export ROOT
STATE_FILE="$ROOT/state/current_state.json"
ENV_FILE="$ROOT/config/.env"
DISCORD_CFG="$ROOT/config/discord.json"
CONFIG_FILE="$ROOT/config/config.json"
LOG_DIR="$ROOT/logs"
LOG_FILE="$LOG_DIR/aro.log"
mkdir -p "$LOG_DIR"

# Load secrets from config/.env (KEY=VALUE, ignore comments/blanks)
load_env() {
  [ -f "$ENV_FILE" ] || return 0
  set -a
  # shellcheck disable=SC1090
  while IFS= read -r line; do
    case "$line" in ''|\#*) continue ;; esac
    export "$line"
  done < "$ENV_FILE"
  set +a
}

iso_now() { date -u +%Y-%m-%dT%H:%M:%SZ; }

log() {
  local level="${1:-INFO}"; shift
  local msg="$*"
  printf '%s [%s] %s\n' "$(iso_now)" "$level" "$msg" | tee -a "$LOG_FILE" >&2
}

# state_get <jq-path>   e.g. state_get '.current_task'
state_get() { jq -r "$1 // empty" "$STATE_FILE" 2>/dev/null; }

# state_set <jq-assignment>  e.g. state_set '.current_task="TASK-0003"'
# Atomic: write temp then mv.
state_set() {
  local expr="$1" tmp
  tmp="$(mktemp)"
  if jq "$expr" "$STATE_FILE" > "$tmp" 2>/dev/null; then
    mv "$tmp" "$STATE_FILE"
  else
    rm -f "$tmp"; log ERROR "state_set failed: $expr"; return 1
  fi
}

cfg_get() { jq -r "$1 // empty" "$CONFIG_FILE" 2>/dev/null; }
