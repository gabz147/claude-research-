# NEXT ACTION

> **File contract** — Purpose: the single most important next step, unambiguous. Owner: every cycle (write at end). Update rules: overwrite. Recovery: this is what a resuming Claude does FIRST after bootstrap. Format: one imperative action + acceptance check. Lifecycle: volatile.

## Do this next

**Context:** Project 01 (`projects/01-ira-audit-defense/`) finished VALIDATION MODE this cycle → verdict **HOLD** (ADR-011). Desk research did **not** disprove the bet, but **cannot** raise it to HIGH: willingness-to-pay vs law firms and real IRS audit-notice volume require **primary discovery the autonomous org cannot perform**. The project is therefore **operator-gated** (TASK-0014). It is **not** archived and **not** advancing to BUSINESS_MODEL until that primary evidence exists.

**Action (autonomous worker):** Per runtime funnel priority — the leading project is blocked on operator input and there is no other ≥80 project, so do **NOT** idle and do **NOT** re-run desk validation on project 01. **Resume NET-NEW discovery (runtime §5 / priority 3):** pick a fresh sector, find + score one new Blue-Ocean B2B opportunity using `skills/opportunity-research/SKILL.md` and the ADR-008 rubric, applying the disprove discipline. If it scores ≥80, create `projects/02-<slug>/`; else log to the ledger (MONITOR/ARCHIVE).

**Operator actions outstanding (do NOT auto-do):**
1. **TASK-0014** — primary discovery for project 01: 5–10 buyer/firm interviews (developer tax directors + Big-4/tax-controversy partners) to resolve WTP + compete-vs-channel; FOIA/TIGTA/§6418-dispute data for real audit cadence. This is the ONLY thing that unblocks project 01 → BUSINESS_MODEL.md.
2. **TASK-0002** — enable unattended systemd loop (`automation/install.sh`) — operator go-ahead required.
3. Rotate Discord token (historically pasted in chat).

**Optional low-effort maintenance:** TASK-0012 — fix stale ADR-008 rubric still shown in `templates/OPPORTUNITY.md` + `skills/opportunity-research/SKILL.md`.

**Acceptance check:** Next cycle either (a) produces a new scored opportunity record in `research/` + a row in `research/OPPORTUNITIES.md` + RESEARCH.md (and a `projects/02-*/` if ≥80), or (b) completes TASK-0012; state files refreshed; Discord posted; committed. Do not re-validate project 01 by desk research — it is operator-gated.
