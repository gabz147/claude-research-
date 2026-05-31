# COMPRESSED CONTEXT

> **File contract** — Purpose: let a zero-context Claude reconstruct the whole project from ONE file. Owner: every cycle (rewrite at end). Update rules: full overwrite, keep it tight (<2 pages). Recovery: read this + MISSION.md + state/current_state.json and you can resume. Format: fixed sections. Lifecycle: volatile, always current.

## Mission (1 line)
Run a durable, self-recovering Autonomous Research Organization on this VM; repo is memory; produce evidence-backed research; mirror status to Discord. Full detail: MISSION.md.

## Current objective
Platform is built. Next: deploy (systemd timer) and run the first real research cycle.

## Completed work
- Full repo at `/home/tar/claude-research-bot` (git-initialized).
- 8 memory files (MISSION, STATUS, TODO, DECISIONS, RESEARCH, REPORT, NEXT_ACTION, this).
- `state/current_state.json` machine state.
- Task queue (`queue/{pending,active,completed,failed}`) + 6 seed tasks.
- Scripts: `lib.sh`, `notify_discord.sh`, `supervisor.sh`, `task.sh`, `doctor.sh`.
- Prompts: `prompts/bootstrap.md` (recovery), `prompts/runtime.md` (work cycle).
- Automation: systemd `.service`+`.timer`, `crontab.example`, `install.sh`.
- Discord: 🔬 RESEARCH ORG category + 6 channels provisioned; posting verified.
- Docs: ARCHITECTURE, DEPLOYMENT, GSD-EVALUATION, CLAUDE-MEM-EVALUATION, README.

## Critical discoveries
- GSD installed at `~/.claude/get-shit-done` (mine for patterns — TASK-0005).
- claude-mem NOT installed; deferred as optional layer (ADR-005, TASK-0004).
- Discord bot = "tarbot - code" in guild CODING. Channel IDs in `config/discord.json`. Token in `config/.env` (chmod 600, gitignored).
- Tools present: node, npm, python3, git, claude CLI, jq, systemctl, crontab, tmux.

## Known constraints
Repo = source of truth (ADR-001). Headless full-auto (ADR-002). systemd scheduler (ADR-003). Discord REST outbound (ADR-004). Never commit secrets. Tag claims FACT/LIKELY/SPECULATION/UNKNOWN.

## Open questions / active risks
- Live token was pasted in chat → ROTATE (operator action).
- Full-auto runs any tool → mitigated by project-scoped CWD + lockfile + logs + git.

## Immediate next actions
1. `scripts/doctor.sh` (health check).
2. `scripts/supervisor.sh --once` (one manual cycle; confirm Discord heartbeat).
3. Install systemd timer (see docs/DEPLOYMENT.md), then TASK-0003 research cycle.
