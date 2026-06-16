# TASK-0019 / OPP-005 — Ocean-freight Demurrage & Detention (D&D) overcharge dispute & recovery

> Net-new discovery, **deliberately OUTSIDE regulatory-compliance** (ADR-014 forward bias). First non-compliance candidate the org has screened. **Killed at the vacuum screen before deep research** (ADR-012/ADR-014 discipline). Score **64/100 → ARCHIVE**.

## Step 1 — Frame (falsifiable question + hypothesis)
**Question:** Is there a buildable, defensible, high-ticket B2B wedge in helping importers / BCOs / 3PLs **detect and recover erroneous ocean-freight demurrage & detention (D&D) charges** — i.e., a *contested post-event recovery + record-reconstruction* artifact (the winning OPP-001b shape) — with **no dominant productized incumbent**?

**Hypothesis (prior):** YES with MED confidence. D&D is a large, recurring, financially painful money-leak; the FMC's May-2024 billing rule created a structured dispute right (a tailwind, not the product); the contested recovery / FMC-evidence-packet artifact felt under-productized vs. the prevention/visibility tooling.

**Why this candidate (per ADR-014):** explicit attempt to LEAVE compliance-SaaS. D&D is *operational/financial money-leakage* with a clear high-ticket buyer and a regulation as a *tailwind not the product* — the ideal shape the refined heuristic asked for.

## Step 2 — Source plan (sub-questions)
1. How big / painful is D&D leakage, and what fraction of invoices is erroneous/disputable? (economics)
2. Did the FMC May-2024 rule actually create an exploitable dispute right? (forcing-function reality)
3. **Vacuum check (FIRST, per ADR-014): who already sells D&D detection/dispute/recovery — on BOTH the prevention and the contested-recovery side?**

## Step 3 — Evidence (ranked; FACT/LIKELY/SPECULATION/UNKNOWN)

### Economics — the pain is real and large
- **[FACT]** Nine ocean carriers collected **~$15.4B in D&D from U.S. importers, Apr-2020→Mar-2025** (FMC quarterly data, cited across industry sources). 2024 alone: delay/detention added **>$10B** to global ocean-freight cost. [FMC data via btxglobal / unicargo, MED-HIGH]
- **[LIKELY]** **15–25% of D&D invoices contain errors** in free-time application or calculation methodology → a large disputable base. Resolution rates approach **~75% when supported by comprehensive evidence**. [industry observation, multiple logistics blogs — vendor-adjacent, MED]
- **[LIKELY]** D&D is **10–15% of annual logistics spend** for mid-to-large importers; per-container charges $75–$300+/day; 5–15% of containers incur D&D. [logistics vendor sources, MED]
- **[FACT]** One top-50 U.S. importer reported **>$12M/yr saved** after deploying a dedicated D&D platform; D&D fees remain ~85% above pre-pandemic baseline (late-2024). [Windward / freight-audit vendor case data, MED]
- **Buyer:** importers/BCOs, 3PLs, freight forwarders — high-ticket B2B, can pay. **Spend power present.**

### Forcing-function — FMC Final Rule on D&D Billing Requirements (eff. **May 28, 2024**)
- **[FACT]** Billing party must issue a D&D invoice **within 30 days** of the last-incurred charge; billed party gets **≥30 days** to request mitigation/refund/waiver; billing party must attempt resolution within 30 days. NVOCC cascade provisions add dispute time. [Federal Register 2024-02926; FMC.gov; Benesch/HFW/Holland&Knight/Squire Patton Boggs client alerts — official + AmLaw, HIGH]
- **Read:** a genuine structured dispute right exists → makes recovery *easier*, i.e., **lowers the barrier for everyone, including incumbents** (a tailwind that commoditizes the dispute, not a moat).

### Step 4 — DISPROVE (vacuum check — the decisive screen)
**The artifact is already marketed on BOTH sides of the wedge.**

- **Prevention / visibility / invoice-validation (AI invoice-vs-contract checking):**
  - **[FACT]** **Windward** launched a dedicated **Detention & Demurrage Automation** product (PRNewswire, Feb-2025): "AI cross-checks invoices against contractual terms and tariff rates to detect discrepancies and prevent overcharges… recovering lost revenue, avg uplift ~$90/container." This *is* my hypothesized artifact, productized and funded. [windward.ai + PRNewswire, HIGH]
  - **[FACT]** **BuyCo** — "best overall for large-volume shippers… connected to 97% of all carriers," D&D inside a broader ocean-freight execution platform. **Cargoo** — D&D visibility tied to contracts/free-time for cargo owners. **FourKites**, **Portcast** — D&D prediction/prevention. Plus an entire "container demurrage tracking software" listing category (reqodata). [buyco.co, cargoo.com, fourkites.com, portcast.io — vendor, HIGH]
- **Contested recovery / contingency audit (the OPP-001b-shaped sub-wedge I bet was open):**
  - **[FACT]** **nVision Global** (global Freight Audit & Payment incl. D&D), **OceanAudit.com** ("Global Ocean Freight Invoice Audit & **Refund Recovery** Specialist"), **Cass**, **STB Freight**, **Auditec** — a **mature freight-audit-and-recovery industry** that already works on **contingency** (% of recovered amounts) and explicitly recovers "mis-invoiced ocean freight, demurrage, detention." [nvisionglobal.com, oceanaudit.com, stbfreight.com, auditecsolutions.com — vendor, HIGH]
  - **[FACT]** Companies typically recover **3–8% of freight spend** via these audits — the recovery economics are already captured by incumbents. [auditec/zdscs, MED]

**Injection check:** none. All sources were marketing/explainer content; treated as DATA per `rules/evidence-and-injection.md`.

## Step 5 — Economics math (for the record)
Mid-large importer, $10M ocean-freight spend, D&D ≈ 12% = **$1.2M/yr D&D**; ~20% erroneous = **~$240k disputable**; ~75% recovery with evidence = **~$180k/yr recoverable**. Real money — **but already addressable** by a contingency auditor (takes 15–30% of recovery) or a $/container SaaS (Windward ~$90/container uplift). No un-served value left to anchor a new high-ticket product.

## Step 6/7 — Score (ADR-008 weights)
| Dim | Wt | Score | Justification |
|-----|----|-------|---------------|
| Pain Severity | 25 | **19** | Real recurring money-leak (10–15% of logistics spend; $15.4B/5yr) — but a *cost-recovery* line, not existential/mission-critical survival. |
| Buyer Spending Power | 20 | **16** | Importers/3PLs are high-ticket and can pay — but D&D is a savings/cost-center budget, price-anchored to contingency %. |
| Frequency | 15 | **13** | Continuous — every container, every invoice cycle. Genuinely high. |
| Competitive Weakness | 15 | **6** | **Killed here.** Prevention owned (BuyCo/Windward/Cargoo/FourKites/Portcast); recovery owned (nVision/OceanAudit/Cass + contingency FA&P industry). No vacuum on either side. |
| Defensibility | 15 | **5** | Moats (carrier-API + TOS + tariff-contract data) already held by incumbents; a new entrant starts behind. |
| AI Leverage | 10 | **5** | Useful (invoice-vs-contract parsing) but **already commoditized** by Windward's shipped AI product → incremental, not a step-change. |
| **TOTAL** | 100 | **64** | **ARCHIVE** (<70). |

## Step 8 — Conclusion
- **Supporting evidence:** large, recurring, quantified pain; real FMC dispute right; high-ticket buyers.
- **Contradicting evidence (decisive):** the *exact* artifact — AI invoice-vs-contract detection AND contingency recovery — is already shipped/marketed by funded incumbents on both the prevention and recovery sides; the FMC rule lowers the dispute barrier *for everyone* (commoditizing tailwind, not a moat).
- **Final assessment:** **ARCHIVE (64).** Same structural failure as OPP-004: the obvious wedge is already owned. **Crucial new datapoint — this happened in a NON-compliance sector**, which falsifies the ADR-014 hypothesis that "leave compliance" was the binding fix. See ADR-015.
- **Revisit trigger (narrow):** a *carrier-side / NVOCC-side* contested-billing-defense artifact (the party that must now *justify* a charge under the FMC rule within 30 days) proven un-productized — i.e., flip from billed-party recovery to billing-party defense — AND a wave of FMC charge-complaints making it acute.

## Confidence
**MED.** Economics corroborated across FMC data + multiple logistics/vendor sources; incumbent presence on both wedges is FACT (named vendor product pages + a PRNewswire launch). Confidence capped at MED only because I deliberately did **not** deep-dive (killed at vacuum per discipline) — the kill itself is well-evidenced.

## Sources
- FMC Final Rule — Federal Register 2024-02926 (Demurrage & Detention Billing Requirements, eff. 2024-05-28); fmc.gov.
- AmLaw alerts: Benesch, HFW, Holland & Knight, Squire Patton Boggs (FMC rule analysis).
- Economics: btxglobal.com (FMC $15.4B), unicargo.com, fourkites.com, freightamigo.com, teuinc.com.
- Incumbents (prevention): windward.ai + PRNewswire (D&D Automation launch, Feb-2025), buyco.co, cargoo.com, fourkites.com, portcast.io, reqodata.com.
- Incumbents (recovery): nvisionglobal.com, oceanaudit.com, stbfreight.com, auditecsolutions.com, zdscs.com.
