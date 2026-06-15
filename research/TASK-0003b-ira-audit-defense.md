# TASK-0003b — IRA PWA Audit-Defense & Penalty-Remediation (policy-insulated sub-wedge of OPP-001)
**Date:** 2026-06-15  **Owner:** Researcher  **Confidence:** MEDIUM
**Sector:** Compliance / tax controversy / clean-energy back-office  **ID:** OPP-001b / TASK-0003b
**Supersedes:** the *broad preventive-compliance* framing in `research/TASK-0003-ira-pwa-compliance.md` (OPP-001, 79 → MONITOR). This re-frames to the audit-defense sub-wedge that doc flagged for re-scoring.
**Scoring weights:** ADR-008 (Pain 25 · Spend 20 · Freq 15 · CompWk 15 · Defens 15 · AI 10)

## Question
Is there a buildable, defensible high-ticket B2B business in **defending already-claimed IRA Prevailing-Wage & Apprenticeship (PWA) tax credits against IRS audit, recapture, and penalties** — i.e. reconstructing contemporaneous records, closing apprenticeship-ratio gaps with cure/penalty payments, and assembling audit-response packages for the 2023–2025 vintage of clean-energy credits — *regardless of the IRA credit regime's future*?

## Why re-frame (the thesis shift)
OPP-001 (broad, forward-looking PWA *compliance* software) capped at 79 for two reasons: (1) **competition is forming with distribution** in preventive compliance/payroll (DSPTCH, eBacon, LCPtracker, Reunion, Crux); (2) **existential policy risk** — the whole opportunity sits downstream of the IRA credit regime, which the 2026 administration is curtailing. This sub-wedge **inverts both caps**:
- It targets the **runoff book** of credits *already claimed* (2023–2025 vintage), which is **insulated from prospective repeal** — those credits exist and are being audited now.
- Audit-defense / penalty-remediation is **not productized** — it is served manually by Big-4 and tax/construction law firms, *not* by the forming software incumbents (which are preventive/greenfield).

## New evidence (this re-score), ranked & tagged
- **[legal/Big-4 + tax press]** OBBBA (enacted **July 4, 2025**) is a **prospective** acceleration/phase-out of IRA clean-energy credits, *"not a wholesale repeal"* — repeals of some consumer credits (EV/residential), **phaseouts** for power-generation/business credits (wind components post-2027; tech-neutral 45Y/48E 100%→0% for BOC 2033→2036), plus **compressed beginning-of-construction deadlines**. — Sidley, RSM, Steptoe, Tax Foundation, Nat. Law Review — **FACT**. → Already-claimed 2023–2025 vintage credits are **not** clawed back; they remain valid and **auditable**.
- **[official/IRS]** **PWA requirements remain in effect** as the condition for the 5× multiplier; **final PWA regulations published June 25, 2024** (firm enforcement framework). Work performed before **Jan 29, 2023** is exempt; the audited population is therefore the **Jan-2023-onward** vintage. — irs.gov PWA page, Federal Register 2024-13331, Baker Botts, Mayer Brown — **FACT**.
- **[official/IRS + Big-4]** **Credit transferees remain liable for correction payments and penalties** on PWA non-compliance of credits they purchased. — IRS final regs commentary (Mayer Brown/Baker Botts) — **FACT**. → The §6418 **transfer market** (Crux, Reunion, et al.) means **corporate credit buyers** are an *independent, panicked* second buyer class for audit-defense, beyond developers/EPCs/tax-equity.
- **[legal]** Treasury/IRS **did not finalize §48/§48E ITC recapture rules** with the 2024 final regs — separate guidance still pending. — Mayer Brown — **FACT**. → Unsettled recapture mechanics = more disputes = more audit-defense demand.
- **[vendor/legal, carried from OPP-001]** IRS "**PWA penalty wave**" on 2023–2024 vintage is landing now; triggers = apprenticeship-ratio gaps, non-contemporaneous records, missed cure-payment windows. — Landgate/KPMG — **LIKELY**.
- **[market, carried]** OBBBA's compressed BOC deadlines triggered a **"rush to start construction"**, enlarging the **2025–2026 vintage** that will enter audit windows through ~2030 — **LIKELY** (an *expanding* runoff book, not a one-off).

## Verification
The load-bearing claim — *repeal is prospective, already-claimed credits survive and remain auditable* — is corroborated across **≥4 independent Big-4/AmLaw/tax-policy sources** (Sidley, RSM, Steptoe, Tax Foundation) plus the structure of OBBBA itself, and is mechanically consistent with how tax law operates (statutory changes to credit availability are prospective; audit of a properly-claimed prior-year credit is governed by the law in effect when claimed). PWA persistence + final-reg date + transferee liability are **IRS/Federal-Register FACTs**. Confidence MEDIUM overall only because *willingness-to-pay for a software-enabled (vs law-firm) audit-defense product* is untested customer evidence — that is exactly what VALIDATION MODE must resolve.

## Contradiction search (attempt to disprove THIS wedge)
1. **Finite runoff horizon.** If new PWA-credit generation collapses post-OBBBA, the audited population is time-boxed (roughly 2023–2027 vintages working through audit windows to ~2030–2032). The business has a **decay curve**, not a perpetual TAM. — **LIKELY**, real ceiling on Defensibility/terminal value. *Mitigant:* statute-of-limitations + multi-year recapture tails + the 2025–2026 construction-rush vintage push the horizon out several years; enough runway to build, harvest, and pivot the audit-defense engine to adjacent credit regimes (45Q/45Z/45X survive/expand under OBBBA, and Davis-Bacon federal-contract audits are perennial).
2. **Legal privilege moat favors law firms.** Audit defense is liability-laden; buyers may prefer attorney-client/work-product privilege a software vendor can't offer. — **LIKELY.** *Mitigant:* sell **as a tool to the law/accounting firms** (channel, not compete) and/or partner under privilege; the document-reconstruction + ratio-analysis layer is valuable to the incumbents themselves.
3. **Episodic, not continuous, per buyer.** A given client needs defense when audited, not weekly — depresses Frequency vs the preventive wedge. — **FACT.** *Mitigant:* aggregate deal flow across a large vintage base is continuous for the firm; recapture/alteration tails and the transfer market create repeat exposure.
4. **IRS audit *rate* may be low / under-resourced.** If IRS doesn't actually audit PWA at scale, demand is latent not active. — **UNKNOWN, key risk.** The "penalty wave" is single-vendor-sourced (Landgate/KPMG). *VALIDATION must find hard evidence of actual notice volume / audit cadence.*

## Risk assessment
- **Terminal-value / runoff (MED-HIGH):** time-boxed unless the audit engine generalizes to surviving/perennial credit & Davis-Bacon regimes.
- **Privilege / positioning (MED):** mitigated by a firm-channel (sell to Big-4/law) rather than direct-compete model.
- **Demand-latency (MED, UNKNOWN):** depends on real IRS audit cadence — the #1 thing validation must verify.
- **Policy (LOW, the point):** prospective phase-out does not touch already-claimed credits → this wedge is structurally insulated.

## Conclusion / Final assessment
Re-deriving from evidence: the **pain is sharper** (acute audit/recapture/penalty event, transferees independently liable, recapture rules unsettled), the **competition is genuinely weak** (manual Big-4/law firms; no productized audit-defense), and the **policy risk that capped OPP-001 is removed** (already-claimed credits survive repeal). The honest downgrades are **Frequency** (episodic per buyer) and a **finite runoff horizon** that bounds terminal value. Net: clears the validation gate, but marginally and at MEDIUM confidence — the right disposition is **promote to a VALIDATION project whose explicit job is to try to kill it** on (a) real IRS audit cadence and (b) willingness-to-pay vs incumbent law firms.

**Confidence: MEDIUM.**

## SCORE (ADR-008 weights) — vs OPP-001 in brackets
| Dim | Max | Score | Δ | Justification |
|---|---|---|---|---|
| Pain Severity | 25 | 24 | [23→24] | Acute audit/recapture event; multi-$M credit at risk + $50–$500/labor-hr penalties + doubled back wages; final regs make enforcement concrete; transferees independently liable; §48 recapture rules unsettled |
| Buyer Spending Power | 20 | 19 | [19→19] | Developers / EPCs / tax-equity **+ corporate credit transferees**, all protecting multi-$M credits; audit-defense/legal spend is the least price-sensitive category |
| Frequency | 15 | 10 | [13→10] | **Downgrade:** episodic per buyer (audit-triggered), not weekly. Partly offset by an expanding multi-year vintage base + recapture/alteration tails giving the firm continuous deal flow |
| Competitive Weakness | 15 | 11 | [8→11] | **Upgrade:** audit-defense/remediation is manual Big-4 + tax/construction law firms; **no productized software-enabled product**. Capped by law-firm privilege preference |
| Defensibility | 15 | 12 | [10→12] | **Upgrade:** policy-insulated (already-claimed credits survive repeal — CONFIRMED prospective); data moat (audit-outcome corpus); workflow lock-in (we hold the reconstructed audit file). Discounted for finite runoff horizon |
| AI Leverage | 10 | 7 | [6→7] | **Upgrade:** reconstructing contemporaneous records from messy multi-party payroll, extraction/classification across thousands of certified-payroll docs, retroactive ratio-gap detection, audit-response assembly, penalty-mitigation drafting — genuine step-change vs manual associates |
| **Total** | **100** | **83** | **[79→83]** | **VALIDATION CANDIDATE (80–89)** |

**Gate decision:** **PROMOTE → VALIDATION project** (`projects/01-ira-audit-defense/`). Narrow: stop broad discovery; drive this down the funnel. Validation's mandate = **disprove** it on (1) actual IRS PWA audit cadence/notice volume, (2) willingness-to-pay vs incumbent law firms, (3) compete-vs-channel positioning re: privilege, (4) terminal value given the runoff horizon.

## Sources (new this re-score)
- Sidley Austin — OBBBA navigating the new energy landscape — https://www.sidley.com/en/insights/newsupdates/2025/07/the-one-big-beautiful-bill-act-navigating-the-new-energy-landscape
- RSM US — tax bill changes clean energy credits — https://rsmus.com/insights/services/business-tax/obbba-tax-clean-energy.html
- Steptoe — OBBBA impact on IRA clean energy credits — https://www.steptoe.com/en/news-publications/the-one-big-beautiful-bill-impact-on-the-iras-clean-energy-tax-credits.html
- Tax Foundation — OBBBA green energy tax credit changes — https://taxfoundation.org/blog/big-beautiful-bill-green-energy-tax-credit-changes/
- National Law Review — Congress phases out energy tax credits — https://natlawreview.com/article/congress-phases-out-energy-tax-credits
- IRS — Prevailing wage and apprenticeship requirements — https://www.irs.gov/credits-deductions/prevailing-wage-and-apprenticeship-requirements
- Federal Register — final PWA regs (2024-13331, eff. 2024-06-25) — https://www.federalregister.gov/documents/2024/06/25/2024-13331/increased-amounts-of-credit-or-deduction-for-satisfying-certain-prevailing-wage-and-registered
- Mayer Brown — final PWA regs (transferee liability; §48 recapture deferred) — https://www.mayerbrown.com/en/insights/publications/2024/06/final-regulations-issued-on-prevailing-wage-and-apprenticeship-requirements-under-the-inflation-reduction-act
- Baker Botts — final PWA regs analysis — https://www.bakerbotts.com/thought-leadership/publications/2024/june/irs-and-treasury-release-final-regulations-on-prevailing-wage-and-apprenticeship-requirements
- LCPtracker — IRA/OBBBA/PWA compliance FAQ — https://lcptracker.com/blog-post/faq-the-inflation-reduction-act-ira-the-one-big-beautiful-bill-act-obbba-and-prevailing-wage-apprenticeship-compliance/
- (carried) Landgate/KPMG — "The PWA Penalty Wave" — https://www.landgate.com/news/the-pwa-penalty-wave-why-renewable-developers-are-seeing-surprise-irs-notices
- Full OPP-001 evidence base (IRS PWA FAQ, Pub 5855, DOL Davis-Bacon, investment trackers): `research/TASK-0003-ira-pwa-compliance.md`
