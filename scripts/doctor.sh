#!/usr/bin/env bash
# doctor.sh — preflight health check. Exit 0 if all critical checks pass.
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck source=lib.sh
. "$DIR/lib.sh"
load_env

ok=0; fail=0
chk(){ if eval "$2" >/dev/null 2>&1; then echo "  ✅ $1"; ok=$((ok+1)); else echo "  ❌ $1"; fail=$((fail+1)); fi; }

echo "claude-research-bot doctor — $(iso_now)"
echo "[binaries]"
chk "jq"        "command -v jq"
chk "curl"      "command -v curl"
chk "claude CLI" "command -v claude"
chk "git"       "command -v git"
echo "[files]"
chk "state json valid" "jq -e . '$STATE_FILE'"
chk "discord cfg valid" "jq -e . '$DISCORD_CFG'"
chk "config valid"      "jq -e . '$CONFIG_FILE'"
chk "discord token available" "test -n '${DISCORD_BOT_TOKEN:-}' || test -f '$ENV_FILE'"
chk "bootstrap prompt"  "test -s '$ROOT/prompts/bootstrap.md'"
chk "runtime prompt"    "test -s '$ROOT/prompts/runtime.md'"
echo "[discord]"
if [ -n "${DISCORD_BOT_TOKEN:-}" ]; then
  code=$(curl -s -o /dev/null -w '%{http_code}' -H "Authorization: Bot $DISCORD_BOT_TOKEN" https://discord.com/api/v10/users/@me)
  chk "bot token valid (HTTP $code)" "test '$code' = '200'"
else
  echo "  ❌ DISCORD_BOT_TOKEN not set"; fail=$((fail+1))
fi
echo "[queue]"
pend=$(find "$ROOT/queue/pending" -name '*.json' 2>/dev/null | wc -l)
echo "  ℹ️  pending tasks: $pend"
echo "----"
echo "PASS=$ok FAIL=$fail"
[ "$fail" -eq 0 ]
