# OPPORTUNITY LEDGER

> Scored index of every opportunity the org evaluates. Owner: Researcher. Append-only (supersede with a new row + note; never delete). Source of detail: `research/<id>-*.md` (discovery record) and `projects/<slug>/` (promoted). Scoring + gates: `prompts/opportunity-engine.md`.

**Gate:** <70 Archive · 70–79 Monitor · 80–89 Validation (project) · 90+ Execution (project).

**Scoring weights:** ADR-008 — Pain **25** · Spend **20** · Freq **15** · CompWk **15** · Defens **15** · AI **10**.

| Date | ID | Opportunity (1-line) | Sector | Pain/25 | Spend/20 | Freq/15 | CompWk/15 | Defens/15 | AI/10 | **Score** | Gate | Project | Conf |
|------|----|----|--------|-----|-------|------|--------|--------|----|-------|------|---------|------|
| 2026-06-15 | OPP-001 | IRA prevailing-wage & apprenticeship (PWA) compliance + audit-defense for clean-energy projects (protect the 5× tax-credit multiplier) | Compliance / clean-energy | 23 | 19 | 13 | 8 | 10 | 6 | **79** | MONITOR | — | MED |

## Monitor list (70–79)
- **OPP-001 — IRA PWA compliance (79, MED).** Huge pain/spend (5× credit, $50–$500/labor-hr penalties, multi-year recapture), but capped by forming competition with distribution (DSPTCH, eBacon, Reunion, Crux, KPMG/Landgate) + **existential policy risk** to the IRA credit regime. **Watch triggers:** (a) IRA credits reaffirmed/extended → re-score competitive weakness toward ≥80; (b) re-frame to the policy-insulated **audit-defense/remediation sub-wedge** (already-claimed 2023–2024 vintage credits) and re-score. Detail: `research/TASK-0003-ira-pwa-compliance.md`.

## Promoted projects (≥80)
_(empty — see projects/)_

## Archived (<70, notable near-misses)
_(empty)_
