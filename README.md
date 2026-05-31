# claude-research-bot

An **Autonomous Research Organization (ARO)** that runs continuously on a VM. Claude sessions are disposable workers; **this repository is the organization's memory**. The system survives session limits, context resets, crashes, and reboots, then resumes automatically.

## How it works (60 seconds)
```
systemd timer ──hourly──▶ scripts/supervisor.sh
                              │ (lock, backoff, preflight)
                              ▼
                         claude -p prompts/bootstrap.md   (full-auto, headless)
                              │  reads MISSION + state + COMPRESSED_CONTEXT
                              ▼
                         prompts/runtime.md  → one research/build cycle
                              │  evidence-based, confidence-rated
                              ▼
                         update memory files + state + git commit
                              ▼
                         scripts/notify_discord.sh  → 🔬 RESEARCH ORG channels
                              ▼
                         exit  ── timer fires again in 1h ──┐
                              ▲──────────────────────────────┘
```

## Layout
| Path | Role |
|------|------|
| `MISSION.md` | The mandate (constitution) |
| `STATUS.md` `NEXT_ACTION.md` `COMPRESSED_CONTEXT.md` | Volatile snapshots, rewritten each cycle |
| `TODO.md` `DECISIONS.md` `RESEARCH.md` `REPORT.md` | Long-lived institutional memory |
| `state/current_state.json` | Machine-readable state (source for resume) |
| `queue/{pending,active,completed,failed}/` | Task records (JSON) |
| `research/` `knowledge/` `reports/` `projects/` | Outputs |
| `prompts/{bootstrap,runtime}.md` | What every worker reads + does |
| `scripts/` | supervisor, notifier, task queue, doctor, lib |
| `automation/` | systemd units, cron fallback, installer |
| `recovery/RECOVERY.md` | Failure → recovery runbook |
| `config/` | `config.json`, `discord.json`, `.env` (secrets, gitignored) |
| `docs/` | architecture, deployment, evaluations |

## Quick start
```bash
scripts/doctor.sh            # health check — all green?
scripts/supervisor.sh --once # run one cycle now; watch #📊-status
automation/install.sh        # enable the hourly systemd timer (24/7)
```

## Principles
Repo is truth. Evidence before claims (FACT/LIKELY/SPECULATION/UNKNOWN). Discord & vector memory are mirrors, never authoritative. Leave a clean handoff every cycle. See `MISSION.md` and `DECISIONS.md`.

## Security
Secrets live only in `config/.env` (chmod 600, gitignored). **Rotate the Discord token** — the initial one was shared in a chat session. Headless runs use `--dangerously-skip-permissions`; mitigated by project-scoped CWD, single-flight lock, full logging, and git history. See ADR-002.
