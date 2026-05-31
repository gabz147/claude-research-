#!/usr/bin/env bash
# install.sh — install the ARO scheduler as user-level systemd units (no sudo).
# Enables linger so the timer runs 24/7 even when you're not logged in.
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
UDIR="$HOME/.config/systemd/user"

echo "==> chmod +x scripts"
chmod +x "$ROOT"/scripts/*.sh "$ROOT"/automation/install.sh

echo "==> installing user units to $UDIR"
mkdir -p "$UDIR"
cp "$ROOT/automation/claude-research-bot.service" "$UDIR/"
cp "$ROOT/automation/claude-research-bot.timer"   "$UDIR/"

echo "==> enable linger (24/7 without login)"
loginctl enable-linger "$USER" 2>/dev/null || echo "   (enable-linger needs once: 'sudo loginctl enable-linger $USER')"

echo "==> reload + enable timer"
systemctl --user daemon-reload
systemctl --user enable --now claude-research-bot.timer

echo "==> status"
systemctl --user list-timers claude-research-bot.timer --no-pager || true
echo
echo "Done. Manual single run:  $ROOT/scripts/supervisor.sh --once"
echo "Logs:                     journalctl --user -u claude-research-bot.service -f"
echo "                          tail -f $ROOT/logs/aro.log"
