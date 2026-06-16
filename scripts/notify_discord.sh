#!/usr/bin/env bash
# notify_discord.sh <channel_key> [--image hero|card|/abs/path] <message...>
# channel_key one of: status research active completed alerts daily opportunities
# Outbound-only observability. Never fails the caller (returns 0 even on network error).

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck source=lib.sh
. "$DIR/lib.sh"
load_env

trim() {
  local s="$1"
  s="${s#"${s%%[![:space:]]*}"}"
  s="${s%"${s##*[![:space:]]}"}"
  printf '%s' "$s"
}

truncate_text() {
  local limit="$1" text="$2"
  if [ "${#text}" -le "$limit" ]; then
    printf '%s' "$text"
  else
    printf '%s…' "${text:0:$((limit - 1))}"
  fi
}

channel_title() {
  case "$1" in
    status) printf 'Status Update' ;;
    research) printf 'Research Update' ;;
    active) printf 'Active Task' ;;
    completed) printf 'Task Complete' ;;
    opportunities) printf 'Opportunity Ledger' ;;
    alerts) printf 'Operational Alert' ;;
    daily) printf 'Daily Report' ;;
    *) printf 'ARO Update' ;;
  esac
}

channel_color() {
  case "$1" in
    status) printf '%s' '4456367' ;;
    research) printf '%s' '5404535' ;;
    active) printf '%s' '4456367' ;;
    completed) printf '%s' '4391468' ;;
    opportunities) printf '%s' '5803266' ;;
    alerts) printf '%s' '15158332' ;;
    daily) printf '%s' '5265274' ;;
    *) printf '%s' '4456367' ;;
  esac
}

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
    *)
      break
      ;;
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

msg="$(truncate_text 6000 "$msg")"
first_line="${msg%%$'\n'*}"
rest=''
if [ "$msg" != "$first_line" ]; then
  rest="${msg#*$'\n'}"
fi

title="$(trim "$first_line")"
if [ -z "$title" ] || [ "${#title}" -gt 140 ]; then
  title="$(channel_title "$key")"
fi
title="$(truncate_text 240 "$title")"

description_lines=()
line_count=0
while IFS= read -r raw_line; do
  line="$(trim "$raw_line")"
  [ -z "$line" ] && continue

  if [[ "$line" == Next:* ]]; then
    line="**Next**: $(trim "${line#Next:}")"
  fi

  if [ "$line_count" -lt 8 ]; then
    description_lines+=("$line")
    line_count=$((line_count + 1))
  fi
done <<< "$rest"

description=''
if [ "${#description_lines[@]}" -gt 0 ]; then
  description="$(printf '%s\n' "${description_lines[@]}")"
  description="${description%$'\n'}"
fi
description="$(trim "$description")"
if [ -z "$description" ]; then
  description='Repo-backed autonomous research update.'
fi
description="$(truncate_text 4000 "$description")"

timestamp="$(iso_now)"
color="$(channel_color "$key")"
footer_text='claude-research-bot • repo remains source of truth'
payload="$(jq -nc \
  --arg title "$title" \
  --arg description "$description" \
  --arg footer_text "$footer_text" \
  --arg timestamp "$timestamp" \
  --argjson color "$color" \
  --arg image_name "$image_name" \
  '{
    embeds: [
      {
        title: $title,
        description: $description,
        color: $color,
        footer: {text: $footer_text},
        timestamp: $timestamp
      }
    ]
  }
  | if $image_name != "" then
      .embeds[0].image = {url: ("attachment://" + $image_name)}
    else .
    end')"

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
