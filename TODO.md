# TODO — Master Backlog

> **File contract** — Purpose: human-readable mirror of the task queue + backlog ideas. Owner: every cycle. Update rules: append new tasks; flip Status inline; the authoritative per-task records live in `queue/`. Recovery: rebuild from `queue/**` if this drifts (`scripts/task.sh sync`). Format: table below. Lifecycle: long-lived.

**Task schema:** ID · Priority(HIGH/MED/LOW) · Status(PENDING/ACTIVE/DONE/FAILED/BLOCKED) · Description · Dependencies · Created · Updated · Owner(role) · Confidence · Effort

| ID | Pri | Status | Description | Deps | Created | Updated | Owner | Conf | Effort |
|----|-----|--------|-------------|------|---------|---------|-------|------|--------|
| TASK-0001 | HIGH | DONE | Build ARO platform (memory, recovery, queue, research engine, Discord, automation, docs) | — | 2026-05-31 | 2026-05-31 | Builder | HIGH | L |
| TASK-0002 | HIGH | PENDING | Deploy: systemd timer (OPERATOR-GATED) — platform verified, 1st supervised cycle run manually; only the unattended-loop install remains | TASK-0001 | 2026-05-31 | 2026-06-15 | Recovery | HIGH | S |
| TASK-0003 | HIGH | DONE | Discovery cycle → OPP-001 IRA PWA compliance scored **79 → MONITOR** (research/TASK-0003-ira-pwa-compliance.md) | TASK-0002 | 2026-05-31 | 2026-06-15 | Researcher | MED | M |
| TASK-0003b | HIGH | DONE | Re-frame OPP-001 → audit-defense sub-wedge; re-scored **83 → VALIDATION**; promoted to projects/01-ira-audit-defense (ADR-010) | TASK-0003 | 2026-06-15 | 2026-06-15 | Researcher | MED | M |
| TASK-0013 | HIGH | DONE | **VALIDATION MODE** project 01-ira-audit-defense → 4 artifacts; verdict **HOLD** (not disproved, not HIGH; WTP+audit-volume need primary discovery). ADR-011 | TASK-0003b | 2026-06-15 | 2026-06-16 | Researcher | MED | M |
| TASK-0014 | HIGH | BLOCKED | **OPERATOR-GATED** primary discovery for project 01: 5–10 buyer/firm interviews (WTP + compete-vs-channel) + FOIA/TIGTA/§6418 data (real audit-notice volume). Unblocks BUSINESS_MODEL.md | TASK-0013 | 2026-06-16 | 2026-06-16 | Researcher | MED | M |
| TASK-0004 | MED | PENDING | Evaluate claude-mem (github.com/thedotmack/claude-mem) as optional semantic retrieval layer | TASK-0001 | 2026-05-31 | 2026-05-31 | Researcher | MED | S |
| TASK-0005 | MED | PENDING | Mine GSD agents/workflows for reusable research+planning patterns; fold useful ones into runtime.md | TASK-0001 | 2026-05-31 | 2026-05-31 | Reviewer | MED | M |
| TASK-0006 | LOW | PENDING | Add Discord slash-command bot (/status /tasks /report /recover) as a separate supervised gateway | TASK-0002 | 2026-05-31 | 2026-05-31 | Builder | MED | M |
| TASK-0012 | LOW | DONE | Reconciled stale scoring weights in templates/OPPORTUNITY.md + skills/opportunity-research/SKILL.md to ADR-008 (Pain25 Spend20 Freq15 CompWk15 Defens15 AI10). ADR-012 | — | 2026-06-15 | 2026-06-16 | Reviewer | HIGH | S |
| TASK-0015 | HIGH | DONE | Net-new discovery → OPP-002 PFAS liability record-reconstruction scored **71 → MONITOR** (not promoted; entrenched forensic incumbents, reporting slipped to 2027). ADR-012, research/TASK-0015-pfas-liability-reconstruction.md | — | 2026-06-16 | 2026-06-16 | Researcher | MED | M |
| TASK-0016 | HIGH | DONE | Net-new discovery (vacuum-screened 4 sectors) → OPP-003 SEC cyber-materiality & disclosure-defense scored **72 → MONITOR** (not promoted; Item-1.05 rescission risk, forming competition Kovrr/FAIR-MAM, episodic freq). ADR-013, research/TASK-0016-sec-cyber-materiality.md | — | 2026-06-16 | 2026-06-16 | Researcher | MED | M |
| TASK-0017 | LOW | PENDING | **REFINED (ADR-014):** discovery heuristic — (a) "just-landed" must mean a NOVEL/surprising obligation incumbents couldn't pre-build (not a recent effective date on a telegraphed reg); (b) defensive sub-wedge only where NO incumbent has productized the artifact. STRONG SIGNAL: 4 consecutive compliance caps (79/71/72/63) → "pick the newest regulation" is an anti-pattern. Forward bias: leave reg-compliance OR pass an affirmative named-incumbent vacuum check first | — | 2026-06-16 | 2026-06-16 | Reviewer | HIGH | M |
| TASK-0018 | HIGH | DONE | Net-new discovery (TASK-0017 heuristic) → OPP-004 EU Pay Transparency Directive per-decision pay-justification defense record scored **63 → ARCHIVE** (killed at vacuum screen; Syndio/beqom/Trusaic own "defensible documentation"; HRIS owns workflow; staggered enforcement; telegraphed since 2023). ADR-014, research/TASK-0018-eu-pay-transparency.md | — | 2026-06-16 | 2026-06-16 | Researcher | MED | M |

> Note: TASK-0007–0011 (from ADR-007 integration) exist in `queue/pending/` but are not yet mirrored into this table — run `scripts/task.sh list` for the authoritative set; backfill on next maintenance cycle.

## Backlog (unscheduled ideas)
- Weekly rollup report → #📅-daily-report.
- Self-improvement scan: detect workflow bottlenecks, auto-file tasks.
- Obsidian export of `knowledge/` if a vault appears.
- Continuous discovery: keep scoring opportunities until a ≥80 project exists, then narrow to advancing it (per opportunity-engine).
