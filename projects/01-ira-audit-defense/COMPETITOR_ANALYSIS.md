# COMPETITOR ANALYSIS — 01-ira-audit-defense
**Date:** 2026-06-16  **Confidence:** MED

## Direct competitors
| Name | Offering | Pricing | Strengths | Weaknesses | Gap we exploit |
|---|---|---|---|---|---|
| **Big-4 (KPMG/EY/PwC/Deloitte)** | Manual PWA audit defense, recapture/penalty advisory | Bespoke, high $/hr | Trust, scale, IRS relationships, privilege-adjacent | Manual, slow, no productized engine; expensive | Productize reconstruction/ratio engine; sell *to* them as channel |
| **Tax-controversy / construction law firms** | Privileged audit defense, penalty negotiation | Bespoke legal fees | Attorney-client privilege, litigation backstop | Manual, no software; can't scale doc reconstruction | Same — engine-as-tool under privilege |
| **DSPTCH** | "TurboTax" PWA compliance; 100+ payroll syncs; **PWA penalties calculator**; auto reconciliation/certified payroll | "Best-in-class predictable" (SaaS) | Distribution, automation, downstream-creeping into penalty calc | Preventive-first; not contested-audit defense | Contested post-notice defense + missing-record reconstruction (their gap) |
| **LCPtracker (LCPcertified)** | Cloud certified payroll; "audit-readiness"; error/violation checks | SaaS | Incumbent, large user base, audit-ready storage | Preventive tracking, not remediation/defense | Post-claim reconstruction + IRS response assembly |
| **Empact, SkillSmart (InSight IQ), b2gnow** | PWA/certified-payroll compliance + credit max | SaaS | Niche distribution | Preventive; no audit-defense product | Same |

## Indirect / substitutes (incl. "do nothing" + spreadsheets + manual labor)
- **Do nothing / self-attest via Form 7220** — now a real substitute: IRS standardized the correction+penalty math, enabling DIY for routine cases. Strongest substitute for the *commodity* slice.
- **In-house tax team + spreadsheets** for record assembly.
- **Existing accounting firm** handling it manually as part of the relationship.

## Incumbent weakness thesis (why they can't/won't fix this)
- Big-4/law firms monetize **billable hours** → little incentive to productize away their own labor; software is not their model.
- Preventive SaaS incumbents are built for **greenfield, real-time payroll** ingestion — *contested, post-hoc reconstruction of missing/messy historical records and IRS-notice response* is a different product and data problem they have not built.
- BUT this is **eroding at the edges** — DSPTCH's penalty calculator shows the preventive players see the remediation-adjacent demand. Fast-follow risk is real (below).

## Our defensibility (data, integrations, workflow lock-in, switching cost)
- **Data moat:** an **audit-outcome corpus** (what IRS challenged, what cured, what survived) — accrues only to whoever runs enough defenses; not buyable.
- **Workflow lock-in:** we hold the reconstructed **audit file** of record.
- **Policy insulation:** targets already-claimed credits → survives OBBBA prospective repeal (FACT).
- **Generalization:** same engine → 45Q (survives), Davis-Bacon (perennial, OMB Compliance Supplement audits sample contracts >$2k, 100% weekly payroll testing — FACT), FEOC clawbacks. Extends life beyond IRA runoff.
- ⚠️ Discounted by: privilege barrier (favors channel), Form 7220 commoditization of routine cases, finite IRA vintage.

## Threat of fast-following
- **MED-HIGH.** Preventive incumbents (DSPTCH especially) have distribution + payroll data and are already inching downstream (penalty calculator). They could bolt remediation onto an installed base faster than a newcomer wins buyers. The defensible counter is the **contested-audit + reconstruction + outcome-data** layer they don't have — and a **firm-channel** lock that they can't easily serve (privilege).

## Evidence (sources, ranked + tagged)
- [vendor — LIKELY] DSPTCH IRA + penalties calculator — https://www.dsptch.work/ira · https://www.dsptch.work/pwa-penalties-calculator
- [vendor — LIKELY] LCPtracker energy/audit-readiness — https://lcptracker.com/lp/energy/
- [vendor — LIKELY] Empact — https://empacttechnologies.com/prevailing-wage-apprenticeship/ ; SkillSmart — https://www.skillsmart.us/skillsmart-insight/prevailing-wage-tracking-software/ ; b2gnow — https://b2gnow.com/solutions/prevailing-wage-labor-compliance/
- [official/IRS — FACT] Form 7220 self-correction/penalty regime — https://www.irs.gov/instructions/i7220
- [official/DOL — FACT] Davis-Bacon audit sampling (OMB Compliance Supplement) — https://www.dol.gov/agencies/whd/government-contracts/prevailing-wage-resource-book/db-wage-determinations
- Incumbent pricing for audit-defense engagements — **UNKNOWN** (not published).
