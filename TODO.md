# TODO — Master Backlog

> **File contract** — Purpose: human-readable mirror of the task queue + backlog ideas. Owner: every cycle. Update rules: append new tasks; flip Status inline; the authoritative per-task records live in `queue/`. Recovery: rebuild from `queue/**` if this drifts (`scripts/task.sh sync`). Format: table below. Lifecycle: long-lived.

**Task schema:** ID · Priority(HIGH/MED/LOW) · Status(PENDING/ACTIVE/DONE/FAILED/BLOCKED) · Description · Dependencies · Created · Updated · Owner(role) · Confidence · Effort

| ID | Pri | Status | Description | Deps | Created | Updated | Owner | Conf | Effort |
|----|-----|--------|-------------|------|---------|---------|-------|------|--------|
| TASK-0001 | HIGH | DONE | Build ARO platform (memory, recovery, queue, research engine, Discord, automation, docs) | — | 2026-05-31 | 2026-05-31 | Builder | HIGH | L |
| TASK-0002 | HIGH | PENDING | Deploy: systemd timer (OPERATOR-GATED) — platform verified, 1st supervised cycle run manually; only the unattended-loop install remains | TASK-0001 | 2026-05-31 | 2026-06-15 | Recovery | HIGH | S |
| TASK-0003 | HIGH | DONE | Discovery cycle → OPP-001 IRA PWA compliance scored **79 → MONITOR** (research/TASK-0003-ira-pwa-compliance.md) | TASK-0002 | 2026-05-31 | 2026-06-15 | Researcher | MED | M |
| TASK-0003b | HIGH | DONE | Re-frame OPP-001 → audit-defense sub-wedge; re-scored **83 → VALIDATION**; promoted to projects/01-ira-audit-defense (ADR-010) | TASK-0003 | 2026-06-15 | 2026-06-15 | Researcher | MED | M |
| TASK-0013 | HIGH | PENDING | **VALIDATION MODE** project 01-ira-audit-defense: VALIDATION_REPORT.md + market/customer/competitor analyses; DISPROVE on audit cadence, WTP, compete-vs-channel, runoff horizon | TASK-0003b | 2026-06-15 | 2026-06-15 | Researcher | MED | M |
| TASK-0004 | MED | PENDING | Evaluate claude-mem (github.com/thedotmack/claude-mem) as optional semantic retrieval layer | TASK-0001 | 2026-05-31 | 2026-05-31 | Researcher | MED | S |
| TASK-0005 | MED | PENDING | Mine GSD agents/workflows for reusable research+planning patterns; fold useful ones into runtime.md | TASK-0001 | 2026-05-31 | 2026-05-31 | Reviewer | MED | M |
| TASK-0006 | LOW | PENDING | Add Discord slash-command bot (/status /tasks /report /recover) as a separate supervised gateway | TASK-0002 | 2026-05-31 | 2026-05-31 | Builder | MED | M |
| TASK-0012 | LOW | PENDING | Reconcile stale scoring weights: templates/OPPORTUNITY.md + skills/opportunity-research/SKILL.md still show old Pain20/AI15; update to ADR-008 (Pain25/AI10) | — | 2026-06-15 | 2026-06-15 | Reviewer | HIGH | S |

> Note: TASK-0007–0011 (from ADR-007 integration) exist in `queue/pending/` but are not yet mirrored into this table — run `scripts/task.sh list` for the authoritative set; backfill on next maintenance cycle.

## Backlog (unscheduled ideas)
- Weekly rollup report → #📅-daily-report.
- Self-improvement scan: detect workflow bottlenecks, auto-file tasks.
- Obsidian export of `knowledge/` if a vault appears.
- Continuous discovery: keep scoring opportunities until a ≥80 project exists, then narrow to advancing it (per opportunity-engine).
