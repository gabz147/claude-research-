# OPPORTUNITY — SEC cyber-incident materiality-determination & disclosure-defense
**Date:** 2026-06-16  **ID:** OPP-003 / TASK-0016  **Sector:** Securities-law compliance / cyber-disclosure controversy  **Confidence:** MED

> Net-new discovery cycle (runtime priority 3). Project 01 operator-gated, no other ≥80 project. Sector chosen by a **productization-vacuum screen** across 4 candidate regimes (see "Screening notes" at end): CBAM and EU AI Act conformity were rejected as *crowded/forming* before deep research; SEC cyber-materiality advanced because its problem-shape (a liability-laden *decision/defense* workflow, not a reporting form) resists horizontal SaaS — the same shape as the org's only promoted win, OPP-001b.

## Problem description
Since July 2023 (effective Dec 2023), SEC rules require public companies to (a) determine the **materiality** of a cybersecurity incident "without unreasonable delay" after discovery, and (b) if material, file an **Item 1.05 Form 8-K within four business days of the materiality determination** describing the incident's nature, scope, timing, and material impact [FACT — SEC press release 2023-139]. The hard, high-stakes artifact is not the form — it is the **defensible, contemporaneous materiality judgment** (who decided, on what facts, against what financial/operational/reputational thresholds, and when) plus **consistency between that judgment and the company's other disclosures** (risk factors, prior 8-Ks). Getting this wrong is what the SEC actually punishes.

## Affected customer (who feels the pain)
US-listed public companies (~4,000+ domestic filers). The internal buyers are the **disclosure committee / General Counsel + CISO + Investor Relations + external securities counsel** — a cross-functional "war room" that must converge under a 4-day clock while a live incident is still being investigated. Foreign private issuers face the parallel Form 6-K regime.

## Current solution (status quo + why it's inadequate)
Manual, advisory-led: outside securities counsel (Cooley, MoFo, Davis Polk, Hunton) + Big-4 (PwC, RSM) run a bespoke materiality memo each time, modeled loosely on the SAB-99 financial-materiality memo [FACT — Cooley/PwC/RSM advisories]. Inadequate because: (1) it is slow and improvised under a 4-day clock; (2) it produces an *ad hoc* record that may not survive SEC/plaintiff scrutiny — and a privileged memo can become a **discoverable litigation record** if privilege is challenged [FACT — Cooley]; (3) it does not systematically reconcile the incident against the company's *existing* risk-factor language, which is precisely the failure the SEC charged.

## Pain level (how badly it hurts; what breaks)
HIGH when triggered. In Oct 2024 the SEC charged **Unisys, Avaya, Check Point, and Mimecast** for materially misleading cyber disclosures tied to SolarWinds — fines of **$4M / $1M / $995k / $990k** (~$7M total) plus, for Unisys, a **disclosure-controls violation** [FACT — SEC press release 2024-174; Davis Polk; CyberScoop; TechCrunch]. Unisys described its risk as "hypothetical" while knowing of two intrusions and gigabytes exfiltrated; Avaya understated file access; both are *consistency/controls* failures a product could catch. The SEC fines are modest, but they sit on top of the real exposure: **securities class actions, D&O liability, and reputational loss**. The cost is existential per-event, but the dollar penalties alone are smaller than IRA's 5× credit clawback.

## Frequency (how often it occurs)
WEAKEST dimension. *Material* incidents are episodic — only **24 companies** filed Item 1.05 disclosures in the rule's first ~year (by Dec 2024) [FACT — SEC/Gerding]. However, the *workflow* is more recurring than the material event: a large enterprise must triage and document a materiality call for **every** non-trivial incident (most concluded immaterial, but each needs a defensible record "without unreasonable delay"), and must reconcile risk-factor language **every quarter** (10-Q/10-K). So recurring at the triage/controls layer, episodic at the disclosure layer.

## Economic impact ($/yr to the buyer — show the math)
- Direct: a contested SEC disclosure matter + securities class action routinely runs **$2–10M+** in defense and settlement; D&O premiums rise. SEC fines here were ~$1–4M each [FACT].
- Process cost: each material-incident war-room consumes outside-counsel + Big-4 hours (tens to low-hundreds of $k per event) [LIKELY — inferred from AmLaw/Big-4 advisory engagement norms; UNKNOWN exact].
- A product that produces a clean, defensible contemporaneous record and prevents one Unisys-style "hypothetical risk factor" inconsistency pays for itself many times over. Plausible ACV **$30k–$150k/yr** (enterprise GRC + legal tier).

## Market characteristics (size, fragmentation, dynamics)
~4,000 US domestic filers; concentrated WTP in the ~1,500 mid/large-cap names with real cyber attack surface and active disclosure committees. Adjacent budgets already exist (GRC, CRQ, e-discovery, disclosure-management like Workiva). Dynamic: rule is ~2.5 years old, enforcement precedent now exists (2024), and the practice is still being codified — i.e., **early but no longer greenfield**.

## Competitive landscape (incumbents, gaps, weaknesses)
Forming, not absent — this is the cap.
- **Kovrr** — CRQ platform that "automates this [materiality] assessment process" [FACT — Kovrr]. Funded, real.
- **FAIR Institute — FAIR-MAM** — an adopted materiality-assessment *model/standard* (open framework) [FACT].
- **BitSight, 800+ GRC tools** generally [FACT — cybersectools lists 817 GRC solutions].
- Securities law firms + Big-4 own the high-end advisory.
**Gap (the wedge):** existing products quantify **$ impact** (CRQ) or provide a **scoring model** (FAIR-MAM); none own the **legal-defensible contemporaneous record + disclosure-consistency engine** — the artifact that reconciles a live incident against the company's prior risk factors/8-Ks and produces a privilege-aware, plaintiff-resistant memo + draft Item 1.05. That is the Unisys/Avaya failure surface, and it is a *legal/disclosure-controls* product (buyer = GC/disclosure committee), not a *security-quant* product (buyer = CISO). This is the same "incumbents serve the adjacent thing, not the defense record" structure that scored OPP-001b an 83.

## AI applicability (does AI create measurable leverage? where?)
Strong, specific, not a gimmick:
1. **Consistency engine** — LLM diffs a live incident's known facts against the company's filed risk factors and prior disclosures, flagging "hypothetical-language-vs-known-fact" contradictions (exactly Unisys's violation) before they're filed.
2. **Materiality drafting** — assembles a structured, precedent-aware materiality memo (facts → thresholds → conclusion → timestamped basis) from incident inputs, against a corpus of the ~24+ filed Item 1.05s and enforcement orders.
3. **Audit trail** — maintains the contemporaneous "who knew what when" record automatically. AI Leverage ~7/10 (step-change in speed + consistency; the legal judgment stays human-in-the-loop).

## Implementation difficulty
Moderate-high. Not the code — the **trust and privilege model**: the output is a legal work-product that may be discoverable, so the product must be built with counsel, privilege-aware logging, and SOC2/security to be trusted with incident facts. Sales cycle is GC-gated (slow). Defensible *because* of that: workflow lock-in + an accruing proprietary corpus of (anonymized) materiality determinations and outcomes.

## Risks (what kills this)
1. **Policy/rescission risk (primary, the OBBBA-analog).** Item 1.05 is **in effect as of June 2026**, but ABA/Bank Policy Institute petitioned to **rescind** it (May 2025), NAM supports, and the SEC now has a Republican majority under Chair Atkins (appt. Apr 2025) [FACT — DLA Piper; NAM; Hunton]. The 4-day rule could be narrowed/withdrawn. **Mitigant:** the 2024 enforcement rested on **anti-fraud + disclosure-controls (Section 13(a), Reg S-K Item 106)**, not solely Item 1.05 — so the materiality-record/consistency need survives a 1.05 rollback (mirrors OPP-001b surviving OBBBA's *prospective* phase-out). But near-term urgency/forcing-function weakens if 1.05 is cut.
2. **Forming competition** (Kovrr, FAIR-MAM, GRC suites) closes the vacuum faster than we can build the wedge.
3. **Episodic frequency** → hard to justify always-on ACV vs incident-triggered consulting.
4. **GC-gated, privilege-laden sales** → long cycles, high trust bar.

## Potential pricing (and the outcome economics that justify it)
SaaS subscription **$30k–$150k/yr** (tiered by market cap / incident volume), optionally + per-incident "war-room" surge module. Justified against a single avoided $2–10M securities matter or a single avoided disclosure-controls finding.

## Potential business model (software / service / hybrid / platform)
**Hybrid → platform.** Software (consistency engine + memo/8-K drafting + audit trail) wrapped with a thin expert-network/counsel-review layer for the actual filing. Long-run moat = the proprietary corpus of materiality determinations + outcomes (a disclosure-defense dataset no single law firm or CRQ vendor accumulates).

## Evidence (ranked; tagged)
- **Official (SEC):** Rules adopted Jul 2023, Item 1.05 4-day-from-determination clock [FACT — sec.gov 2023-139]. Enforcement vs Unisys/Avaya/Check Point/Mimecast, fines + Unisys controls charge [FACT — sec.gov 2024-174]. 24 Item 1.05 filings by Dec 2024 [FACT — Gerding statement].
- **Law firms / Big-4 (status quo + wedge):** Cooley (contemporaneous record = discoverable risk), PwC/RSM (SAB-99-style materiality memo), Davis Polk (enforcement analysis) [FACT].
- **Policy risk:** DLA Piper "future of the rules"; NAM + ABA/BPI rescission petitions; rule in effect June 2026 [FACT].
- **Competition:** Kovrr (CRQ automates materiality), FAIR Institute FAIR-MAM, cybersectools 817 GRC tools [FACT].

## Contradicting evidence (attempt to disprove)
- The single biggest disconfirmer is **policy momentum to rescind** Item 1.05 under the current SEC — this is the live, near-term risk and the reason this is MONITOR not a promote. (Partially offset: anti-fraud/controls basis persists.)
- **Competition is real**, not a vacuum — Kovrr and FAIR-MAM already occupy the "materiality assessment" phrase; only the *legal-defense-record* sub-wedge is open, and that is a narrower TAM gated by GC trust.
- **Frequency is genuinely low** at the disclosure layer (24 filings/yr) — weak recurring-revenue logic unless repositioned as continuous disclosure-controls tooling.

## SCORE
| Dim | Max | Score | Justification |
|---|---|---|---|
| Pain Severity | 25 | 20 | Existential per-event (class actions, D&O, SEC controls findings); but penalty $ modest and pain is episodic, not bleeding-daily. |
| Buyer Spending Power | 20 | 17 | Public companies; GC+CISO+IR budgets; adjacent GRC/CRQ/disclosure spend already flows. Strong WTP. |
| Frequency | 15 | 9 | Material events episodic (24 filings yr-1). Lifted only by continuous incident-triage + quarterly risk-factor reconciliation framing. Weakest dim. |
| Competitive Weakness | 15 | 9 | Forming, not absent: Kovrr (CRQ) + FAIR-MAM occupy "materiality"; the legal-defense-record/consistency wedge is open but narrow. Better than CBAM, worse than a true vacuum. |
| Defensibility | 15 | 10 | Workflow lock-in + privilege-aware record + accruing proprietary materiality-outcome corpus. GC-trust moat. |
| AI Leverage | 10 | 7 | Real step-change in consistency-checking + memo/8-K drafting; judgment stays human. Not a gimmick, not transformative-alone. |
| **Total** | **100** | **72** | |

**Gate decision:** **72 → MONITOR** (70–79). Not promoted. Capped by (1) active Item-1.05 rescission risk under the current SEC, (2) forming competition (Kovrr/FAIR-MAM) so no clean productization vacuum, (3) episodic frequency.

**Watch-trigger (re-score to validation if):** (a) Item 1.05 *survives* the rescission push intact (forcing-function confirmed durable), AND (b) a wave of post-incident securities class actions makes the *contemporaneous-defense-record* wedge acute; OR (c) primary discovery confirms the **disclosure-controls/consistency sub-wedge** (GC buyer) has no productized owner and a CRQ-vendor cannot credibly extend into legal work-product. Re-frame analog: the OPP-001 → OPP-001b sharpening (broad regime → contested-defense sub-wedge) could lift this, but only with the policy risk resolved.

---
## Screening notes (productization-vacuum screen — why other candidates were rejected pre-deep-dive)
- **EU CBAM embedded-emissions data reconstruction (rejected — crowded).** Definitive period live Jan 2026 (€100/excess-tonne penalty; mandatory third-party verification; 50-tonne de-minimis after the Oct-2025 Omnibus) [FACT]. *But* supplier-emissions data collection — "the single biggest operational challenge" — is already an advertised feature at **10+ vendors** (VERSO, Persefoni, Sweep, Normative, CarbonSmart, Coolset, Greenly, OneClickLCA, Zevero) [FACT]. Same no-vacuum failure mode as OPP-002. Not deep-researched.
- **EU AI Act high-risk conformity / Annex IV technical documentation (rejected — crowded-forming).** Real obligation (Art. 11/Annex IV, conformity assessment) but the AI-governance GRC space (Credo AI, Holistic AI, OneTrust, IBM watsonx.governance, Microsoft Purview) is already productizing it; resembles the broad-OPP-001 framing that capped at 79. Not deep-researched.
- **SEC off-channel-comms recordkeeping (not pursued — entrenched).** Smarsh/Global Relay/Theta Lake own it. Low vacuum.
