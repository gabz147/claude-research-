#!/usr/bin/env bash
# notify_discord.sh <channel_key> [--image hero|card|/abs/path] <message...>
# channel_key one of: status research active completed alerts daily opportunities
# Outbound-only observability. Never fails the caller (returns 0 even on network error).
set -euo pipefail

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck source=lib.sh
. "$DIR/lib.sh"
load_env

key="${1:-status}"; shift || true
image_path=""
image_name=""

while [ $# -gt 0 ]; do
  case "$1" in
    --image)
      shift || true
      case "${1:-}" in
        hero) image_path="$ROOT/assets/hero.png"; image_name='hero.png' ;;
        card) image_path="$ROOT/assets/brand-card.png"; image_name='brand-card.png' ;;
        /*) image_path="$1"; image_name="$(basename "$1")" ;;
      esac
      shift || true
      ;;
    *) break ;;
  esac
done

msg="$*"

if [ -z "${DISCORD_BOT_TOKEN:-}" ]; then
  log WARN "notify_discord: no DISCORD_BOT_TOKEN; skipping (msg kept in logs): $msg"
  exit 0
fi

chan_id="$(jq -r ".channels.${key}.id // empty" "$DISCORD_CFG")"
if [ -z "$chan_id" ]; then
  log WARN "notify_discord: unknown channel key '$key'; defaulting to status"
  key='status'
  chan_id="$(jq -r '.channels.status.id' "$DISCORD_CFG")"
fi

payload="$(python3 "$DIR/aro.py" --root "$ROOT" discord-payload "$key" --image-name "$image_name" "$msg")"

if [ -n "$image_path" ] && [ -f "$image_path" ]; then
  http_code="$(curl -s -o /tmp/aro_discord_resp -w '%{http_code}' \
    -X POST \
    -H "Authorization: Bot $DISCORD_BOT_TOKEN" \
    --form-string "payload_json=$payload" \
    -F "files[0]=@$image_path;filename=$image_name" \
    "https://discord.com/api/v10/channels/${chan_id}/messages" 2>/dev/null)"
else
  http_code="$(curl -s -o /tmp/aro_discord_resp -w '%{http_code}' \
    -X POST \
    -H "Authorization: Bot $DISCORD_BOT_TOKEN" \
    -H 'Content-Type: application/json' \
    "https://discord.com/api/v10/channels/${chan_id}/messages" \
    -d "$payload" 2>/dev/null)"
fi

if [ "$http_code" = '200' ] || [ "$http_code" = '201' ]; then
  log INFO "notify_discord: posted to #$key"
else
  log WARN "notify_discord: HTTP $http_code to #$key: $(head -c 200 /tmp/aro_discord_resp 2>/dev/null)"
fi
exit 0
