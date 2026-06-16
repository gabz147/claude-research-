# TASK-0003 — IRA Prevailing-Wage & Apprenticeship (PWA) Compliance for Clean-Energy Projects
**Date:** 2026-06-15  **Owner:** Researcher  **Confidence:** MEDIUM
**Sector:** Compliance / construction / clean-energy back-office  **ID:** OPP-001 / TASK-0003
**Scoring weights:** ADR-008 (Pain 25 · Spend 20 · Freq 15 · CompWk 15 · Defens 15 · AI 10)

## Question
Is there a buildable, defensible high-ticket B2B business in helping clean-energy developers, tax-equity investors, and EPC contractors **stay compliant with the Inflation Reduction Act's Prevailing Wage & Apprenticeship (PWA) requirements** so they don't lose the 5× clean-energy tax-credit multiplier?

## Hypothesis (prior)
PWA is a new (2023+), complex, all-or-nothing compliance burden with millions of dollars riding on it per project, served today mostly by payroll tools and law/consulting firms — a blue-ocean wedge for a purpose-built compliance + audit-defense platform. Prior confidence: MEDIUM-HIGH that pain is real; LOW on competitive openness.

## Evidence (ranked sources, tagged)
- **[official/IRS]** Meeting PWA increases base clean-energy credits "in general, by 5 times"; penalties **$50/labor-hour** (unintentional) and **$500/labor-hour** (deliberate); apprentices must supply **12.5%/15%** of labor hours; taxpayers must maintain records establishing compliance — irs.gov PWA FAQ + Pub 5855 — **FACT**.
- **[official/IRS]** Up to **30% ITC** for projects meeting PWA (vs ~6% base) — irs.gov Clean Electricity Investment Credit — **FACT**. → the 5× swing is ~24 pts of project cost.
- **[official/DOL]** Davis-Bacon enforcement (the wage backbone PWA leans on): WHD recovered **$274M FY2024** / **$259M FY2025** for workers; civil fines up to **$13,508/violation**; back wages can be doubled via liquidated damages; **3-yr debarment** — dol.gov; Glenn O. Hawbaker paid **$20.7M** restitution (largest criminal prevailing-wage case) — **FACT**.
- **[vendor/market]** Clean-energy investment is large and recurring: **$24B** clean-electricity investment in Q4 2025 ($18B utility-scale solar+storage); §48C awarded **$6B/140 projects (2025)** + **$4B/100+ (2024)**; resi-solar ITC ≈ **$6B/2025** — Clean Air Task Force, Crux, Reunion — **FACT** (vendor-sourced, corroborated across 3).
- **[vendor/legal]** "PWA Penalty Wave": as 2023–2024-vintage projects move through the tax cycle, the **IRS has begun issuing PWA non-compliance penalties/late fees**; common triggers = apprenticeship-ratio gaps, non-"contemporaneous" records, missed cure-payment windows — Landgate/KPMG — **LIKELY** (single vendor framing, but mechanism consistent with IRS rules).
- **[vendor]** Recordkeeping must be **contemporaneous** and span the **multi-year recapture period** (alteration/repair), collected across **every contractor and subcontractor** — Trina Solar, Reunion, Plante Moran — **FACT**.
- **[vendor]** DOL estimates ~**55 min to compile certified-payroll data for just 8 employees**; manual certified payroll ≈ **6–8 hrs/week** for a mid-size contractor — eBacon, DOL, Contractor Foreman — **LIKELY**.

## Verification
Pain mechanism (5× multiplier, per-labor-hour penalties, contemporaneous multi-party records, recapture tail) corroborated across IRS primary sources + ≥3 independent vendor/legal sources. Market scale corroborated across 3 independent investment trackers. The "penalties are now landing" claim rests mainly on one vendor (Landgate/KPMG) but is mechanically consistent with the 2023–2024 vintage entering audit windows.

## Contradicting evidence (attempt to disprove)
1. **Existential policy risk (the killer).** "Federal priorities are now shifting, narrowing the federal incentives available" (CATF), and Landgate itself links to "proposed changes to the IRA." The **entire opportunity is downstream of the IRA credit regime**; if credits are repealed/narrowed under the current (2026) administration, new PWA-eligible project flow shrinks. — **LIKELY**, high impact.
2. **Competition is already forming with distribution.** **DSPTCH** — described as "the most widely-used app in the clean-energy sector" — launched a 100-page IRA Field Guide and is moving into PWA compliance; **eBacon** (payroll) markets IRA-solar PWA; **Reunion** and **Crux** cover credit + compliance; **KPMG/Landgate** sell PWA audit-resolution; Big-4 + construction law firms advise. No dominant *horizontal compliance software platform* yet, but the field is not empty and the best-positioned player already owns field-ops distribution. — **FACT**, moderates Competitive Weakness.
3. **Adjacent certified-payroll market is crowded** (LCPtracker ~7,500 contractors/200 agencies, Points North, Miter, hh2, Payroll4Construction) — a PWA platform overlaps these and they could extend downward. — **FACT**.
4. **AI leverage is real but not a step-change** — much of PWA is rules/ratio checking and document assembly; AI helps (extraction, classification, ratio tracking, audit-file generation, anomaly detection) but isn't the moat. — **LIKELY**.

## Risk assessment
- **Regulatory/political (HIGH):** business viability tied to IRA credit survival. Mitigant: the **remediation/audit-defense tail** for already-claimed 2023–2024 vintage credits is insulated from future repeal (those credits exist and are under audit now) — a more durable sub-wedge than greenfield compliance.
- **Competitive (MED-HIGH):** incumbent with distribution (DSPTCH) + payroll platforms + Big-4.
- **Acquisition (MED):** buyers are concentrated (developers, tax-equity investors, EPCs) and reachable via SEIA, conferences, project-finance networks — distribution is plausible but contested.

## Conclusion / Final assessment
A **genuinely expensive, frequent, painful** compliance problem with high-spend buyers and a strong defensibility thesis (regulatory complexity + contemporaneous multi-party records + multi-year recapture lock-in + accumulating audit dataset). **But** it is (a) not blue-ocean enough — credible early movers already hold distribution — and (b) exposed to existential policy risk to the IRA credit regime. Re-deriving from evidence alone: the evidence forces "big pain, big money," but does **not** force "open field" or "durable regime." Net score **79/100 → MONITOR**, just under the 80 validation gate. **Do not promote to a project yet.** The sub-wedge worth watching is **audit-defense / penalty-remediation for already-claimed 2023–2024 vintage credits**, which survives even if the credit is repealed.

**Confidence: MEDIUM** — pain and economics are HIGH-confidence; competitive openness and regime durability are LOW-confidence, and they cap the score.

## SCORE (ADR-008 weights)
| Dim | Max | Score | Justification |
|---|---|---|---|
| Pain Severity | 25 | 23 | Binary all-or-nothing; 5× multiplier ≈ 24 pts of project cost; $50–$500/labor-hr penalties + doubled back wages + recapture; penalty wave landing now |
| Buyer Spending Power | 20 | 19 | Developers / tax-equity investors / EPCs protecting multi-$M credits; $10k–$50k+/yr is trivial vs exposure |
| Frequency | 15 | 13 | Continuous during construction + weekly payroll certification + multi-year recapture/alteration tail; per-project, recurring |
| Competitive Weakness | 15 | 8 | No dominant horizontal compliance platform, but DSPTCH (distribution), eBacon, Reunion, Crux, KPMG/Landgate, Big-4 already active |
| Defensibility | 15 | 10 | Strong moat thesis (regulatory complexity, contemporaneous multi-party data, recapture lock-in) — discounted for policy risk to the underlying regime |
| AI Leverage | 10 | 6 | Real (extraction, ratio tracking, audit-file assembly, anomaly detection) but largely rules-based; not the moat |
| **Total** | **100** | **79** | **MONITOR (70–79)** — strong pain/spend, capped by forming competition + existential policy risk |

**Gate decision:** **MONITOR.** Log to ledger; no project. Re-evaluate if (a) IRA credits are reaffirmed/extended → competitive-weakness re-check could push ≥80, or (b) pivot the thesis to the policy-insulated **audit-defense/remediation** sub-wedge and re-score.

## Sources
- IRS PWA FAQ — https://www.irs.gov/credits-deductions/frequently-asked-questions-about-the-prevailing-wage-and-apprenticeship-under-the-inflation-reduction-act
- IRS Pub 5855 (PWA overview) — https://www.irs.gov/pub/irs-pdf/p5855.pdf
- IRS Clean Electricity Investment Credit — https://www.irs.gov/credits-deductions/clean-electricity-investment-credit
- DOL Davis-Bacon — https://www.dol.gov/agencies/whd/government-contracts/construction
- Points North — true cost of Davis-Bacon violations — https://www.points-north.com/trends-and-insights/the-real-cost-of-davis-bacon-violations
- Landgate/KPMG — "The PWA Penalty Wave" — https://www.landgate.com/news/the-pwa-penalty-wave-why-renewable-developers-are-seeing-surprise-irs-notices
- Trina Solar — developer/EPC PWA guide — https://www.trinasolar.com/us/resources/blog/solar_developer_and_epc_guide_to_the_iras_new_prevailing_wage_and_apprenticeship_requirements
- Reunion — PWA compliance guide — https://www.reunioninfra.com/insights/comprehensive-guide-to-complying-with-prevailing-wage-and-apprenticeship-requirements
- Clean Air Task Force — US clean-energy investments Q4 2025 — https://www.catf.us/2026/04/us-clean-energy-investments-2025-quarter-4-analysis/
- Crux — DOE §48C allocations — https://www.cruxclimate.com/insights/doe-announces-4-billion-in-48c-allocations
- DSPTCH — IRA Field Guide launch (PRNewswire) — https://www.prnewswire.com/news-releases/dsptch-inflation-reduction-act-field-guide-launches-for-clean-energy-compliance-302352286.html
- eBacon — WH-347 / certified payroll burden — https://www.ebacon.com/certified-payroll/wh-347-form/
- LCPtracker — market position — https://lcptracker.com/solutions/lcptracker
