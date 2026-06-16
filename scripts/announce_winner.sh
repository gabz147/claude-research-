#!/usr/bin/env bash
# announce_winner.sh — announce a "winner": an opportunity that cleared the stage
# gate (score >= 80, promoted to a project / execution candidate). Posts a distinct
# GOLD embed to the #🏆-opportunities channel, visually separate from routine
# sub-70 archive/monitor ledger posts. Outbound-only; never fails the caller.
#
# Usage:
#   announce_winner.sh --name "<title>" --score 84 [--industry "<sector>"] \
#       [--confidence HIGH] [--status EXECUTION_CANDIDATE] [--id OPP-2026-009] \
#       --pitch "<one-line thesis>" [--why "<why it wins>"] [--next "<next gate>"]
set -euo pipefail
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck source=lib.sh
. "$DIR/lib.sh"
load_env

payload="$(python3 "$DIR/aro.py" --root "$ROOT" winner-payload "$@")"

if [ -z "${DISCORD_BOT_TOKEN:-}" ]; then
  log WARN "announce_winner: no DISCORD_BOT_TOKEN; skipping (payload kept in logs): $payload"
  exit 0
fi

chan_id="$(jq -r '.channels.opportunities.id // empty' "$DISCORD_CFG")"
if [ -z "$chan_id" ]; then
  log ERROR "announce_winner: no opportunities channel configured in $DISCORD_CFG"
  exit 0
fi

http_code="$(curl -s -o /tmp/aro_winner_resp -w '%{http_code}' -X POST \
  -H "Authorization: Bot $DISCORD_BOT_TOKEN" -H 'Content-Type: application/json' \
  "https://discord.com/api/v10/channels/${chan_id}/messages" \
  -d "$payload" 2>/dev/null)"

if [ "$http_code" = '200' ] || [ "$http_code" = '201' ]; then
  log INFO "announce_winner: posted WINNER to #opportunities"
else
  log WARN "announce_winner: HTTP $http_code to #opportunities: $(head -c 200 /tmp/aro_winner_resp 2>/dev/null)"
fi
exit 0
