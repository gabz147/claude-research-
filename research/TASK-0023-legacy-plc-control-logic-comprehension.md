# TASK-0023 / OPP-007 — Legacy industrial control-system logic comprehension & documentation

> Net-new discovery, **deliberately UN-SEEDED** (ADR-017). Candidate chosen to fit the ADR-017 "blue-ocean" profile: no court-enforceable dispute right, no headline $-stat, pain borne as **specialist labor + outage/safety/cyber risk (not recoverable cash)**, orphaned at the OT/IT seam, embarrassing, high-ticket asset-heavy B2B buyer, in a domain (OT) deliberately walled off from the enterprise-RAG/Glean wave. **Killed at the both-sides vacuum screen before deep research → 54/100 → ARCHIVE.** Fourth Archived row; **7th consecutive cap.**

## Step 1 — Frame (falsifiable question + hypothesis)
**Question:** When an asset-heavy operator (utility, water/wastewater, manufacturer, oil&gas) runs a 10–30-year-old PLC/SCADA/DCS whose original integrator/author is gone and whose control logic is undocumented, is there a *productized* owner of the "comprehend + document + safely modify that logic" workflow — or is it an orphaned vacuum served only by ad-hoc system-integrator labor?

**Hypothesis (prior):** Vacuum. The pain is real and expensive (every modification/troubleshooting event needs costly reverse-engineering; outage, safety, and OT-cyber risk compound), but it is un-priced, embarrassing, and orphaned across the OT/IT split. OT is air-gapped from the enterprise-RAG wave, so I expected no productized "AI comprehends your legacy control logic" owner — only SI services and generic Git.

**This hypothesis was FALSIFIED affirmatively on both sides.**

## Step 2 — Both-sides named-incumbent vacuum check (run FIRST, per ADR-015)

### Comprehension / recovery side — the EXACT artifact I claimed was unowned
- **Copia Automation — Copia AI / Copia Copilot** [FACT]. Marketed verbatim: "automates documentation, **understands legacy code**, and accelerates development." Capabilities: auto-generate "well-structured, clear documentation for PLC and other industrial code"; **code summarization** ("ask the Copilot to explain it"); **Ladder Logic ↔ Structured Text translation**; troubleshoot/format existing code. Oct-2025: embedded GenAI in its **DeviceLink** automated-backup product to translate complex control-code changes into "clear, human-readable summaries." May-2026: launched **Copia Actions**, a workflow engine for code review / compliance reporting / automated testing across "every PLC, HMI, and robotic controller." Funding: ~$16.4M (Series A led by Lux Capital + Construct Capital). [FACT — Copia product pages + PRNewswire Oct-2025 + May-2026 + The Automation Blog]
- **plccopilot.com** — "AI PLC Copilot / Next-Gen Industrial Automation Assistant"; AI-for-PLC positioned as 2026-mature ("moved beyond experimental chatbots"). [LIKELY — vendor site + trade coverage]
- **Specialized SI services bench** — engineering teams that "document existing ladder diagrams, identify dead code and undocumented interlocks, and produce clean structured-text equivalents." [FACT — trade/knowledgebase sources] (Per ADR-017, a profitable services niche = signal that productization is in-flight; Copia IS that productization.)

### Capture / version-control / prevention side
- **Octoplant (AUVESY-MDT / AMDT)** [FACT]. Modular version-control platform that "backs up, versions, and manages every file and device, including PLCs, HMIs, robots, CNCs, SCADA systems, networks, **and documentation**." Priced **per managed device** → proven, scaling spend in this exact buyer. [FACT — AMDT + distributor + review sources]
- **Software Defined Automation (SDA)** — Git-based version control for PLC code (tracks/visualizes PLC code changes; explicitly targets the "changes go undocumented, knowledge disappears when programmers leave" pain). [FACT — SDA site/blog]
- **PLCdoc** (Siemens TIA Portal documentation), plus Git/SVN adapted to PLC files. [FACT — Control Design]

**Verdict:** Both wedges are owned **and** productized. The single most specific artifact in my hypothesis — *"AI that comprehends and documents undocumented legacy control logic when the author is gone"* — is the literal headline feature of Copia AI, and the capture side (Octoplant) already versions code **and** documentation per-device. No affirmative vacuum on either side.

## Step 5 — Economics (for completeness; pain is real)
Buyer cost is borne as: senior controls-engineer reverse-engineering labor (~$150–250/hr loaded, days–weeks per undocumented system), unplanned-downtime risk (process-industry downtime routinely $10k–$100k+/hr), and OT-cyber/safety exposure. Real and high-WTP-capable. But this funded the incumbents — it did not leave a vacuum.

## Step 7 — Score (ADR-008 weights)
| Dim | Wt | Score | Rationale |
|---|---|---|---|
| Pain | 25 | 18 | Real outage/safety/cyber + expensive specialist labor, but latent risk, not continuous cash bleed. |
| Spend | 20 | 14 | Buyers CAN pay (Octoplant priced per-device proves it), but OT software budgets are slow/conservative and this line is largely un-named today. |
| Freq | 15 | 11 | Recurring — every modification, retirement, incident, audit. |
| CompWk | 15 | 4 | LOW. Octoplant (established) + Copia ($16.4M, AI copilot) + SDA + plccopilot + PLCdoc + SI bench. Both sides occupied. |
| Defens | 15 | 3 | LOW. The only moat would be "AI reads code" — commoditized, and the repository-owner (Copia/Octoplant) bolts it on for ~free. |
| AI | 10 | 4 | AI genuinely helps (comprehension/translation) but is commoditized and incumbent-owned → leverage ≠ advantage. |
| **Total** | **100** | **54** | **ARCHIVE.** |

## Conclusion
- **Supporting evidence (for the pain):** undocumented legacy control logic is a widely-attested, expensive, risk-laden problem in asset-heavy operations.
- **Contradicting evidence (kills the opportunity):** the comprehension artifact is Copia AI's headline feature; the capture artifact is Octoplant's per-device product; a forming "Industrial DevOps" VC category has already deployed capital across the whole domain.
- **Final assessment:** 54 → ARCHIVE. Disprove won decisively at the vacuum screen, before deep research.
- **Confidence:** HIGH (named, productized incumbents on both sides, ≥2 independent sources each).

## THE LOAD-BEARING META-FINDING (→ ADR-018)
This candidate was **engineered to satisfy ADR-017**: no dispute right, no $-stat, orphaned ownership, risk/labor-borne (not recoverable cash, so no contingency-auditor magnet). **It capped anyway (54).** That falsifies the implicit hope in ADR-015/017 that simply removing the "visible money pool" would reveal an open vacuum. A different, deeper magnet was operating — and it unifies **all 7 caps**:

**Every opportunity the org has scored is the same archetype: "use AI to read / assemble / comprehend / document an artifact corpus to produce a defensible record or understanding."**
- OPP-001b IRA audit-defense = assemble the documentary record; OPP-002 PFAS = record-reconstruction; OPP-003 SEC-cyber = disclosure-defense record; OPP-004 EU-PTD = pay-justification record; OPP-005 ocean D&D = audit/reconcile invoices; OPP-006 construction = claim-defense documentation; **OPP-007 = comprehend/document control code.**

This archetype is **structurally undefensible**, for two compounding reasons:
1. **AI comprehension/summarization of an artifact is now a commoditized horizontal capability** (every code/document platform ships it). If the opportunity IS "AI reads the artifact and explains/assembles it," the product has no moat — AI's core competency is itself the anti-moat.
2. **Whoever already owns the artifact's repository bolts the AI on for ~free** (Copia owns the code repo → adds Copia AI; Procore owns the project record → adds AI daily-log/RFI agents; Octoplant owns backups → adds GenAI summaries; the pay-equity/CLM/freight-audit incumbents own their corpora → add "defensible documentation"). The repository owner always wins the comprehension layer.

So the binding constraint is **not** "visible money pool" (ADR-015) and **not** "dispute right + $-stat" (ADR-017) — those were *instances*. The real constraint: **the org keeps selecting documentation/reconstruction/comprehension plays, and those are exactly the plays AI commoditizes and repository-owners absorb.** 0/7 hit rate; even the one 83 (OPP-001b) is the same archetype and is stuck at HOLD.

**New doctrine (ADR-018):** STOP hunting "AI-comprehends/assembles-the-artifact" opportunities entirely. The defensible play is NOT "read/document the artifact better." It is owning a **proprietary workflow, a transaction/network position, a proprietary data asset, or a distribution channel** that AI merely powers — where AI is the tool, not the product (back to MISSION's first principle). The next candidate must be screened with a new FIRST question: **"If I strip out the AI, is there still a business — a workflow I own, a transaction I sit in, data only I have, or a channel only I reach?"** If the answer is "no, the product *is* the AI reading documents," reject it before the vacuum check.

## Injection check
No prompt-injection encountered in sources (vendor pages, trade press, PRNewswire). All treated as DATA.
