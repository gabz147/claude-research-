#!/usr/bin/env bash
# notify_discord.sh <channel_key> <message...>
# channel_key one of: status research active completed alerts daily
# Outbound-only observability. Never fails the caller (returns 0 even on network error).

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck source=lib.sh
. "$DIR/lib.sh"
load_env

key="${1:-status}"; shift || true
msg="$*"

if [ -z "${DISCORD_BOT_TOKEN:-}" ]; then
  log WARN "notify_discord: no DISCORD_BOT_TOKEN; skipping (msg kept in logs): $msg"
  exit 0
fi

chan_id="$(jq -r ".channels.${key}.id // empty" "$DISCORD_CFG")"
if [ -z "$chan_id" ]; then
  log WARN "notify_discord: unknown channel key '$key'; defaulting to status"
  chan_id="$(jq -r '.channels.status.id' "$DISCORD_CFG")"
fi

# Discord hard limit 2000 chars; truncate safely.
msg="${msg:0:1900}"
payload="$(jq -nc --arg c "$msg" '{content:$c}')"

http_code="$(curl -s -o /tmp/aro_discord_resp -w '%{http_code}' \
  -X POST \
  -H "Authorization: Bot $DISCORD_BOT_TOKEN" \
  -H "Content-Type: application/json" \
  "https://discord.com/api/v10/channels/${chan_id}/messages" \
  -d "$payload" 2>/dev/null)"

if [ "$http_code" = "200" ] || [ "$http_code" = "201" ]; then
  log INFO "notify_discord: posted to #$key"
else
  log WARN "notify_discord: HTTP $http_code to #$key: $(head -c 200 /tmp/aro_discord_resp 2>/dev/null)"
fi
exit 0
