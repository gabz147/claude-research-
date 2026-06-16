# DEPLOYMENT GUIDE

## Prerequisites (verified present on this VM)
node, npm, python3, git, **claude CLI** (`~/.local/bin/claude`), jq, curl, systemctl, crontab, flock.

## 1. Secrets
`config/.env` already holds `DISCORD_BOT_TOKEN` (chmod 600). **Rotate it** in the Discord Developer Portal, then update the file:
```bash
nano config/.env        # paste new token
chmod 600 config/.env
```

## 2. Health check
```bash
cd /home/tar/claude-research-bot
scripts/doctor.sh
```
Expect all ✅ and `FAIL=0`. Fixes:
- ❌ claude CLI → ensure `~/.local/bin` on PATH.
- ❌ bot token → token invalid/expired; rotate.

## Safe live update
Use this procedure before changing the running checkout on the VM:

```bash
cd /home/tar/claude-research-bot
touch state/PAUSED
scripts/supervisor.sh --dry     # should refuse to run while paused

# make the change, then verify locally
python3 -m unittest discover -s tests -p 'test_*.py'
bash tests/task_queue.sh
bash -n scripts/*.sh
scripts/verify_cycle.sh
scripts/doctor.sh

git status --short
git add <changed-files>
git commit -m "<type>: <summary>"
rm state/PAUSED                 # resume the next scheduled tick
```

Do not run `supervisor.sh --once` during a Claude usage-limit backoff unless the goal is to consume that next available cycle immediately.

## 3. Smoke test (no scheduler yet)
```bash
scripts/supervisor.sh --dry     # tests lock + preflight + Discord, skips Claude
scripts/supervisor.sh --once    # full real cycle; watch #📊-status + #🔬-research-feed
```

## 4. Enable 24/7 (systemd — recommended)
```bash
automation/install.sh
systemctl --user list-timers claude-research-bot.timer
journalctl --user -u claude-research-bot.service -f
```
`install.sh` installs **user** units (no sudo), enables **linger** (runs without login), and starts the hourly timer. If linger needs root once:
```bash
sudo loginctl enable-linger "$USER"
```

The service includes a systemd filesystem sandbox. If Claude needs another persistent writable directory, add it to `ReadWritePaths` in `automation/claude-research-bot.service` and reinstall the unit.

### Alternative: cron
```bash
crontab automation/crontab.example
crontab -l
```

## 5. Verify recovery
- **Reboot test:** `sudo reboot` → after boot, `systemctl --user list-timers` shows next run; a cycle fires within ~2 min.
- **Crash test:** kill a running cycle → lock auto-releases; next tick proceeds.
- **Usage-limit:** simulated automatically; `state/current_state.json.usage_limit_until` gates runs.

## 6. Tuning (`config/config.json`)
- `cycle.interval_minutes` — change the timer too (`OnUnitActiveSec`).
- `cycle.max_runtime_seconds` — per-cycle hard cap (default 3000s).
- `cycle.model` or `ARO_MODEL` in `.env` — pin a model.
- `limits.usage_limit_backoff_minutes`, `limits.max_consecutive_failures`.

## Observability
- Discord: 🔬 RESEARCH ORG → `#📊-status` (heartbeat), `#🔬-research-feed`, `#🎯-active-work`, `#✅-completed`, `#🚨-alerts`, `#📅-daily-report`.
- Logs: `logs/aro.log` (rolling), `logs/cycle-*.log` (per run), `journalctl --user -u claude-research-bot.service`.
- State: `cat state/current_state.json | jq`.

## Uninstall
```bash
systemctl --user disable --now claude-research-bot.timer
rm ~/.config/systemd/user/claude-research-bot.{service,timer}
systemctl --user daemon-reload
# or: crontab -r
```
