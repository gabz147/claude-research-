# VALIDATION REPORT — 01-ira-audit-defense (IRA PWA Audit-Defense & Penalty-Remediation)
**Date:** 2026-06-16  **Confidence:** MED
**Goal of this report: try to DISPROVE the opportunity.**

> Method: desk validation (≥2 independent sources/claim, ranked official>Big-4/AmLaw>vendor; claims tagged FACT/LIKELY/SPEC/UNKNOWN). Mandate from PROJECT.md = kill on four tests. Supporting detail in `MARKET_ANALYSIS.md`, `CUSTOMER_ANALYSIS.md`, `COMPETITOR_ANALYSIS.md`.

## Hypothesis under test (falsifiable)
> There is a buildable, defensible, high-ticket B2B business in **defending already-claimed 2023–2025 IRA PWA-enhanced clean-energy tax credits against IRS audit, recapture, and penalties** (record reconstruction, apprenticeship-ratio cure, audit-response assembly), insulated from OBBBA's prospective repeal, winning because the work is today **manual Big-4/law-firm labor with no productized, AI-leveraged product**.
> **It is FALSE if:** (a) IRS does not actually audit/notice PWA at scale (demand latent); OR (b) buyers will not pay a *software-enabled* vendor over privileged law firms; OR (c) the remediation collapses into commodity self-attestation / preventive incumbents absorb it; OR (d) the runoff book decays before an engine can be built and generalized.

## The four kill-tests — verdict at a glance
| # | Test | Result | Net |
|---|---|---|---|
| 1 | Demand is real, not latent (audit cadence) | **Survives, partially** — enforcement *infrastructure* now FACT (Forms 7220 + 4255); actual audit *notice volume* still UNKNOWN; IRS enforcement funding **cut** is a real counter-risk | Not killed |
| 2 | Willingness to pay vs incumbent law firms | **UNRESOLVED** — no hard fee/WTP evidence obtainable by desk research | Open gap |
| 3 | Compete vs channel (privilege + commoditization) | **Weakened thesis** — preventive incumbents (esp. DSPTCH) encroaching downstream with penalty calculators; Form 7220 self-correction risks commoditizing remediation | Partial disconfirm |
| 4 | Terminal value vs runoff horizon | **Strengthened** — 45Q survives (BOC <2033, PWA 5×); Davis-Bacon audits perennial; FEOC adds new clawback vector → engine generalizes | Net positive |

## Customer demand (evidence buyers want this + will act)
- **[official/IRS — FACT]** IRS released **Form 7220** (Rev. Dec 2025), a *standardized* PWA Verification & Corrections form required **per facility/property** for TY2025, used to attest compliance and **calculate correction + penalty payments** ($5,000/worker base; $10,000 for intentional disregard; plus back-wage + interest cure). — irs.gov f7220/i7220, Eide Bailly, Cherry Bekaert.
- **[official/IRS — FACT]** IRS released **Form 4255** to report **PWA penalty amounts / credit recapture**. — JD Supra (Sep 2026).
  → *Two dedicated IRS filing instruments built specifically for PWA penalties/recapture = enforcement is operationalizing systemically, not anecdotally.* This **upgrades** the prior single-vendor "penalty wave" (Landgate/KPMG, LIKELY) to corroborated infrastructure-backed demand.
- **[vendor/advisory — LIKELY]** Multiple advisory firms now report 2023–2024-vintage penalties "landing" as projects move through the tax cycle; triggers = labor-hour ratio misses, inadequate subcontractor records, missed cure windows. — Landgate, Cherry Bekaert, Fredrikson.
- **[official/IRS — FACT]** §48/§48E ITC **recapture rules still not finalized** with 2024 final regs → unsettled mechanics = more disputes. — Mayer Brown.

## Willingness to pay (price points, budget authority, proof)
- **UNKNOWN (key gap).** No published fee schedules for PWA audit-defense engagements found. Audit-defense / tax-controversy is structurally the **least price-sensitive** spend category (LIKELY), and buyers protect multi-$M credits, but *whether they pay a software-enabled vendor vs a privileged law firm is untested*. **Desk research cannot close this — it requires primary customer/firm discovery.** See `CUSTOMER_ANALYSIS.md`.

## Market size (TAM/SAM/SOM)
See `MARKET_ANALYSIS.md`. Summary: a **finite but multi-year runoff book** of 2023–2027-vintage PWA-enhanced credits (multi-$B of credit value at PWA-5× rates) entering audit/recapture windows through ~2030–2032, plus an **expanding adjacency** (45Q survivors, Davis-Bacon federal-contract audits, FEOC clawbacks).

## Competitive landscape (summary — see COMPETITOR_ANALYSIS.md)
- Incumbent audit-defense = **manual Big-4 + tax/construction law firms** (privileged, bespoke, high-cost). Pure **post-notice audit-defense remains unproductized** — thesis intact here.
- **BUT** preventive/payroll incumbents are **encroaching downstream**: **DSPTCH** ("TurboTax approach", 100+ payroll syncs, **PWA penalties calculator**, automated reconciliation), **LCPtracker** ("audit-readiness"), Empact, SkillSmart, b2gnow. These have **distribution** and are moving toward the remediation boundary. The "no product anywhere near this" claim is weakening at the edges.

## Regulatory / compliance barriers
- **Legal privilege** is the central barrier: audit defense is liability-laden; buyers may demand attorney-client/work-product privilege a software vendor cannot offer → favors a **sell-to-firms channel** over direct compete (LIKELY).
- FEOC restrictions (post-2025-07-04) add a new compliance/clawback vector (FACT) — expands adjacent demand but also complexity.

## Implementation complexity (build + ops + data)
- Core engine: extraction/classification across thousands of certified-payroll docs, contemporaneous-record reconstruction from messy multi-party payroll, retroactive apprenticeship-ratio gap detection, penalty/cure computation (now anchored to Form 7220 math), audit-response assembly. **Genuine AI step-change vs manual associates** (LIKELY) — but Form 7220 standardization also lowers the bar for *commodity* tooling.
- Data moat = audit-outcome corpus + the reconstructed audit file (workflow lock-in).

## Acquisition channels (CAC plausibility)
- **Channel-to-firms** (sell reconstruction/ratio engine to Big-4 + tax/construction law firms, privilege-safe) looks lower-CAC and higher-moat than **direct-to-developer**, given privilege preference and concentrated buyer set. See `CUSTOMER_ANALYSIS.md`.

## Disconfirming evidence found (strongest case AGAINST — required)
1. **[official/TIGTA — FACT] IRS enforcement capacity is shrinking.** IRA enforcement funding cut **$45.6B → $24B**; TIGTA facing staffing cuts (−119 to −264 FTE scenarios). Fewer examiners → the human-audit *rate* may be **lower** than the "penalty wave" narrative implies, making demand more latent than active. *Counter-counter:* Forms 7220/4255 shift enforcement to **mandatory self-attestation + document-matching**, a low-headcount lever that scales without examiners — but that same mechanism (see #2) cuts against the product thesis.
2. **[official/IRS — FACT] Commoditization risk from Form 7220.** A standardized self-correction/penalty-calculation form turns much PWA remediation into **form-driven self-assessment** — precisely DSPTCH's "TurboTax" wedge. This threatens to commoditize the *remediation* layer before a premium audit-defense product can establish pricing power. The defensible residue is **post-notice contested audit defense + reconstruction of missing contemporaneous records**, a narrower slice than the original thesis.
3. **[vendor — LIKELY] Preventive incumbents have distribution and are moving downstream** (DSPTCH penalty calculator, LCPtracker audit-readiness). They could bolt on remediation faster than a new entrant builds a buyer base.
4. **[FACT] Finite runoff horizon** remains real; terminal value depends on successfully generalizing the engine to 45Q/Davis-Bacon/FEOC before the IRA vintage decays.
5. **WTP is unproven** (kill-test 2) — the single most important commercial assumption is still an UNKNOWN.

## Verdict
- [ ] PROCEED (validation HIGH → BUSINESS_MODEL.md)
- [x] **HOLD / MORE EVIDENCE**
- [ ] ARCHIVE

**Why HOLD, not PROCEED:** Desk validation **failed to kill** the opportunity — demand infrastructure is now FACT (Forms 7220/4255), terminal value is mitigated (45Q + Davis-Bacon + FEOC), and pure audit-defense is still unproductized. But it **could not raise confidence to HIGH** because the two load-bearing commercial questions are unresolvable from secondary sources: **(2) willingness-to-pay for a software-enabled vendor vs privileged law firms**, and the residual half of **(1) actual audit-notice volume**. It also surfaced a **new, material commoditization risk** (Form 7220 self-correction + downstream-encroaching preventive incumbents) that narrows the defensible wedge to *contested post-notice audit defense + record reconstruction*.

**Why not ARCHIVE:** Nothing disproved the core bet; the policy-insulation thesis is confirmed and demand machinery is real.

**Gate not advanced.** Confidence stays MED. Mission doctrine (customer evidence > analysis) says the next step is **primary discovery, not more desk research**.

### What would resolve HOLD → PROCEED (the named gap)
1. **5–10 primary discovery conversations** — with (a) clean-energy tax directors / EPC CFOs and (b) Big-4 + tax-controversy partners — to test: do they have active PWA notices? who do they call? what do they pay? would a firm buy a reconstruction/ratio engine? (resolves tests 2 + 3 + the human half of 1).
2. **Hard audit-volume data** — FOIA / TIGTA IRA-credit-examination reports, IRS SOI, or §6418 transfer-market dispute data, to quantify actual notice cadence (resolves test 1).
3. Confirm the **defensible wedge** post-Form-7220 = contested audit defense + missing-record reconstruction (not commodity self-attestation).

> ⚠️ **Org constraint:** this autonomous research org cannot place primary customer calls. The HOLD is therefore **operator-gated**: advancing this project requires the operator to run (or authorize) primary discovery. Desk-research value here is **exhausted**. See `NEXT_ACTION.md`.

## Sources (ranked, claims tagged)
- **[official/IRS — FACT]** Form 7220 (Rev. Dec 2025) + Instructions — https://www.irs.gov/pub/irs-pdf/f7220.pdf · https://www.irs.gov/instructions/i7220
- **[Big-4/advisory — FACT]** Eide Bailly, "Form 7220, PWA Verification and Corrections" — https://www.eidebailly.com/insights/alerts/2026/form-7220
- **[Big-4/advisory — FACT]** Cherry Bekaert, PWA requirements / 2025 reform limits — https://www.cbh.com/insights/articles/prevailing-wage-and-apprenticeship-pwa-requirements/ · https://www.cbh.com/insights/articles/2025-tax-reform-limits-clean-energy-tax-credits/
- **[AmLaw — FACT]** JD Supra, "IRS Releases Form 4255 to Report PWA Penalty Amounts" — https://www.jdsupra.com/legalnews/irs-releases-form-4255-to-report-9112026
- **[official/TIGTA — FACT]** IRA spending snapshot + FY2026 CJ (enforcement funding $45.6B→$24B; FTE cuts) — https://www.tigta.gov/sites/default/files/reports/2025-08/2025ier026fr.pdf · https://home.treasury.gov/system/files/266/09.-TIGTA-FY-2026-CJ.pdf
- **[AmLaw — FACT]** Mintz, "OBBBA: Major Shift in Federal Clean Energy Tax Incentives" (45Q survives, BOC<2033, PWA 5×; phaseouts) — https://www.mintz.com/insights-center/viewpoints/2906/2025-09-16-obbba-major-shift-federal-clean-energy-tax-incentives
- **[congressional — FACT]** CRS R48428, IRA PWA effect on credit values — https://www.congress.gov/crs-product/R48428
- **[official/DOL — FACT]** Davis-Bacon wage determinations + OMB Compliance Supplement audit sampling (perennial federal-contract audits) — https://www.dol.gov/agencies/whd/government-contracts/prevailing-wage-resource-book/db-wage-determinations
- **[vendor — LIKELY]** DSPTCH IRA/PWA + PWA penalties calculator — https://www.dsptch.work/ira · https://www.dsptch.work/pwa-penalties-calculator
- **[vendor — LIKELY]** LCPtracker IRA PWA tracking / audit-readiness — https://lcptracker.com/lp/energy/
- **[vendor/legal — LIKELY]** Landgate/KPMG, "The PWA Penalty Wave" — https://www.landgate.com/news/the-pwa-penalty-wave-why-renewable-developers-are-seeing-surprise-irs-notices
- (carried, prior cycle) Sidley/RSM/Steptoe/Tax Foundation/Mayer Brown/Baker Botts + IRS PWA page & final regs — see `research/TASK-0003b-ira-audit-defense.md`
