# RECOVERY RUNBOOK

> Purpose: bring the org back to a CLEAN state after any interruption. Read when `recovery_status` != CLEAN, or when a human is debugging.

## The model
The org survives because **all durable state is on disk**. Any interruption is recoverable by re-reading state and continuing. There is no in-memory state that matters.

## Failure scenarios & responses

### 1. Claude session ended / context filled mid-cycle
- The supervisor's `claude -p` returned. State files may be partially updated.
- **Recovery:** Next worker reads `state/current_state.json` + `COMPRESSED_CONTEXT.md`. If `current_task` is ACTIVE but incomplete, resume it. Check `git status` / `git log` for the last commit to see what landed.

### 2. Usage limit hit
- `usage_limit_until` is set in state; supervisor skips runs until it passes, then auto-resumes. No action needed.

### 3. Process crash / VM reboot
- systemd timer has `Persistent=true` + `OnBootSec` → fires after boot. The lockfile (`state/aro.lock`) is released automatically (flock is tied to the process; a dead process holds no lock).
- **Recovery:** automatic. Confirm with `systemctl --user list-timers`.

### 4. Stale lock (rare)
- `flock` releases on process death, so true stale locks shouldn't happen. If `lock_held=true` in state but no supervisor runs: `scripts/state.sh` not needed — just run `scripts/supervisor.sh --once`; flock will acquire if truly free. Manually clear flag: `jq '.lock_held=false' state/current_state.json|sponge` (or edit).

### 5. Repeated failures
- `consecutive_failures` climbs; at `max_consecutive_failures` an alert fires to #🚨-alerts. Read latest `logs/cycle-*.log`, fix root cause, then `scripts/supervisor.sh --once`. Reset streak: `jq '.consecutive_failures=0' ...`.

### 6. Corrupted state JSON
- `jq -e . state/current_state.json` fails. Restore from git: `git -C /home/tar/claude-research-bot checkout -- state/current_state.json`, or from the last good `reports/` snapshot.

## Cold-start from zero (new operator / new VM)
1. `git clone` (or copy) the repo to `/home/tar/claude-research-bot`.
2. Recreate `config/.env` with a valid `DISCORD_BOT_TOKEN` (chmod 600).
3. `scripts/doctor.sh` → all green.
4. `automation/install.sh` → timer live.
5. `scripts/supervisor.sh --once` → confirm Discord heartbeat.

## Invariant
After any recovery, `state/current_state.json` must be valid JSON and `recovery_status` must be set back to `CLEAN`.
