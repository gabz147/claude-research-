# OPPORTUNITY LEDGER

> Scored index of every opportunity the org evaluates. Owner: Researcher. Append-only (supersede with a new row + note; never delete). Source of detail: `research/<id>-*.md` (discovery record) and `projects/<slug>/` (promoted). Scoring + gates: `prompts/opportunity-engine.md`.

**Gate:** <70 Archive · 70–79 Monitor · 80–89 Validation (project) · 90+ Execution (project).

**Scoring weights:** ADR-008 — Pain **25** · Spend **20** · Freq **15** · CompWk **15** · Defens **15** · AI **10**.

| Date | ID | Opportunity (1-line) | Sector | Pain/25 | Spend/20 | Freq/15 | CompWk/15 | Defens/15 | AI/10 | **Score** | Gate | Project | Conf |
|------|----|----|--------|-----|-------|------|--------|--------|----|-------|------|---------|------|
| 2026-06-15 | OPP-001b | IRA PWA **audit-defense & penalty-remediation** for already-claimed 2023–2025 vintage credits (policy-insulated re-frame of OPP-001) | Compliance / tax controversy / clean-energy | 24 | 19 | 10 | 11 | 12 | 7 | **83** | VALIDATION | 01-ira-audit-defense | MED |
| 2026-06-15 | OPP-001 | IRA prevailing-wage & apprenticeship (PWA) *preventive* compliance for clean-energy projects (protect the 5× tax-credit multiplier) | Compliance / clean-energy | 23 | 19 | 13 | 8 | 10 | 6 | **79** | MONITOR (superseded by OPP-001b) | — | MED |

## Monitor list (70–79)
- **OPP-001 — IRA PWA *preventive* compliance (79, MED).** Superseded by **OPP-001b** (the audit-defense re-frame, promoted). Kept for the record: broad preventive-compliance framing capped by forming competition with distribution (DSPTCH, eBacon, Reunion, Crux, KPMG/Landgate) + existential IRA policy risk. Detail: `research/TASK-0003-ira-pwa-compliance.md`.

## Promoted projects (≥80)
- **OPP-001b — IRA PWA audit-defense & penalty-remediation (83, MED) → `projects/01-ira-audit-defense/`.** Re-frame of OPP-001 to the **runoff book** of already-claimed 2023–2025 vintage credits — insulated from OBBBA's *prospective* phase-out (CONFIRMED: OBBBA is not a wholesale repeal; already-claimed credits remain valid & auditable; PWA persists; transferees independently liable). Competition is weak (manual Big-4/law firms; no productized audit-defense). Promoted to VALIDATION to be disproven on: real IRS audit cadence, WTP vs law firms, compete-vs-channel, runoff terminal value. Detail: `research/TASK-0003b-ira-audit-defense.md`. ADR-010.

## Archived (<70, notable near-misses)
_(empty)_
