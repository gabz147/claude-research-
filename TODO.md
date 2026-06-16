# TODO — Master Backlog

> **File contract** — Purpose: human-readable mirror of the task queue + backlog ideas. Owner: every cycle. Update rules: append new tasks; flip Status inline; the authoritative per-task records live in `queue/`. Recovery: rebuild from `queue/**` if this drifts (`scripts/task.sh sync`). Format: table below. Lifecycle: long-lived.

**Task schema:** ID · Priority(HIGH/MED/LOW) · Status(PENDING/ACTIVE/DONE/FAILED/BLOCKED) · Description · Dependencies · Created · Updated · Owner(role) · Confidence · Effort

| ID | Pri | Status | Description | Deps | Created | Updated | Owner | Conf | Effort |
|----|-----|--------|-------------|------|---------|---------|-------|------|--------|
| TASK-0001 | HIGH | DONE | Build ARO platform (memory, recovery, queue, research engine, Discord, automation, docs) | — | 2026-05-31 | 2026-05-31 | Builder | HIGH | L |
| TASK-0002 | HIGH | PENDING | Deploy: install systemd timer, run first supervised cycle, confirm Discord heartbeat | TASK-0001 | 2026-05-31 | 2026-05-31 | Recovery | HIGH | S |
| TASK-0003 | HIGH | PENDING | Discovery cycle: surface + score 3–5 blue-ocean B2B opportunities (opportunity-engine), promote any ≥80 to projects/ | TASK-0002 | 2026-05-31 | 2026-05-31 | Researcher | MED | M |
| TASK-0004 | MED | PENDING | Evaluate claude-mem (github.com/thedotmack/claude-mem) as optional semantic retrieval layer | TASK-0001 | 2026-05-31 | 2026-05-31 | Researcher | MED | S |
| TASK-0005 | MED | PENDING | Mine GSD agents/workflows for reusable research+planning patterns; fold useful ones into runtime.md | TASK-0001 | 2026-05-31 | 2026-05-31 | Reviewer | MED | M |
| TASK-0006 | LOW | PENDING | Add Discord slash-command bot (/status /tasks /report /recover) as a separate supervised gateway | TASK-0002 | 2026-05-31 | 2026-05-31 | Builder | MED | M |
| TASK-0013 | HIGH | PENDING | Add evaluator-loop gates: task acceptance fields, scripts/verify_cycle.sh, runtime completion rule | TASK-0002 | 2026-06-16 | 2026-06-16 | Reviewer | HIGH | M |

## Backlog (unscheduled ideas)
- Weekly rollup report → #📅-daily-report.
- Self-improvement scan: detect workflow bottlenecks, auto-file tasks.
- Obsidian export of `knowledge/` if a vault appears.
- Continuous discovery: keep scoring opportunities until a ≥80 project exists, then narrow to advancing it (per opportunity-engine).
