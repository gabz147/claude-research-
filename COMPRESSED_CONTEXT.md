# COMPRESSED CONTEXT

> **File contract** — Purpose: let a zero-context Claude reconstruct the whole project from ONE file. Owner: every cycle (rewrite at end). Update rules: full overwrite, keep it tight (<2 pages). Recovery: read this + MISSION.md + state/current_state.json and you can resume. Format: fixed sections. Lifecycle: volatile, always current.

## Mission (1 line)
Discover, validate, and execute a SMALL number of exceptional Blue-Ocean B2B opportunities (expensive painful problems; high-ticket; AI is a tool not the product). Repo is memory; durable, self-recovering, Discord-observable. Destination = a buildable business, not idea lists. Full detail: MISSION.md + prompts/opportunity-engine.md.

## Current objective
Platform + opportunity doctrine built. Next: deploy (systemd timer) and run the first discovery+scoring cycle (TASK-0003).

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

## Opportunity doctrine (core)
- `prompts/opportunity-engine.md` = canonical. Score 0–100 (Pain20/Spend20/Freq15/AI15/CompWk15/Defens15). Gates: <70 archive · 70–79 monitor · 80–89 validation project · 90+ execution project. Funnel: discover→validate→business-model→MVP→build-plan→acquisition.
- `research/OPPORTUNITIES.md` = scored ledger. `projects/<slug>/` = promoted (≥80). `templates/` = stage artifacts.
- runtime.md: advancing a leading project beats discovering a new idea. Try to DISPROVE every opportunity.

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
