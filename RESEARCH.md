# RESEARCH — Knowledge Index

> **File contract** — Purpose: index of research findings (detail lives in `research/<id>.md` and `knowledge/`). Owner: Researcher role. Update rules: append a row per finding; never delete (supersede). Recovery: this is the map into the knowledge corpus. Format: index table + methodology reminder. Lifecycle: permanent, grows.

## Methodology (every finding follows this)
Question → Hypothesis → Evidence collection → Verification → **Contradiction search** → Risk assessment → Conclusion → Confidence(HIGH/MED/LOW).

Every finding records: **Supporting evidence**, **Contradicting evidence**, **Final assessment**, **Sources** (ranked: official docs > vendor > source code > academic > blogs > community). Never rely on a single source.

## Findings index
| ID | Date | Question | Confidence | File |
|----|------|----------|-----------|------|
| TASK-0003 / OPP-001 | 2026-06-15 | Is IRA prevailing-wage & apprenticeship (PWA) compliance a buildable, defensible high-ticket B2B opportunity? | MED | `research/TASK-0003-ira-pwa-compliance.md` |
| TASK-0003b / OPP-001b | 2026-06-15 | Is IRA PWA **audit-defense** for already-claimed 2023–2025 vintage credits a buildable, *policy-insulated* high-ticket B2B opportunity? **→ 83/100, promoted to project 01-ira-audit-defense** | MED | `research/TASK-0003b-ira-audit-defense.md` |
| TASK-0013 | 2026-06-16 | Validation of project 01: can we DISPROVE IRA PWA audit-defense on demand/WTP/channel/terminal-value? **→ HOLD (not disproved, not HIGH); IRS Forms 7220+4255 confirm demand infra; WTP unresolved by desk research** | MED | `research/TASK-0013-validation-ira-audit-defense.md` |
| TASK-0015 / OPP-002 | 2026-06-16 | Net-new: is PFAS liability record-reconstruction (CERCLA + TSCA §8(a)(7)) a blue-ocean B2B wedge? **→ 71/100 MONITOR; disprove pass capped it — entrenched forensic incumbents (Exponent/ERM/WSP/Battelle) already sell the capability; reporting forcing-function slipped to 2027** | MED | `research/TASK-0015-pfas-liability-reconstruction.md` |
| TASK-0016 / OPP-003 | 2026-06-16 | Net-new (vacuum-screened across 4 sectors): is SEC cyber-incident materiality-determination & disclosure-defense a blue-ocean B2B wedge? **→ 72/100 MONITOR; better vacuum than CBAM/EU-AI-Act but capped — active Item-1.05 rescission risk + forming competition (Kovrr/FAIR-MAM) + episodic frequency** | MED | `research/TASK-0016-sec-cyber-materiality.md` |
| TASK-0018 / OPP-004 | 2026-06-16 | Net-new (TASK-0017 heuristic): does the EU Pay Transparency Directive's Art. 18 burden-of-proof reversal open a defensive per-decision pay-justification-record wedge incumbents can't serve? **→ 63/100 ARCHIVE; killed at vacuum screen — Syndio/beqom/Trusaic already own "defensible documentation" + explicitly EU-PTD-positioned; HRIS owns the workflow; staggered enforcement; directive telegraphed since 2023** | MED | `research/TASK-0018-eu-pay-transparency.md` |
| TASK-0019 / OPP-005 | 2026-06-16 | Net-new (ADR-014: LEFT compliance): does ocean-freight D&D overcharge dispute/recovery (FMC May-2024 rule tailwind) open a contested-recovery wedge with no dominant incumbent? **→ 64/100 ARCHIVE; killed at vacuum screen — BOTH wedges owned (prevention Windward/BuyCo/Cargoo/FourKites/Portcast; recovery nVision/OceanAudit/Cass + contingency FA&P). Capping a non-compliance pick falsifies "leave compliance" → real anti-pattern is visible money pools (ADR-015)** | MED | `research/TASK-0019-demurrage-detention-recovery.md` |
| TASK-0022 / OPP-006 | 2026-06-16 | Net-new (SEEDED, ADR-015): does construction delay/change-order claim-defense documentation (services-only claims consultants hypothesized) open an un-productized record-reconstruction wedge on both sides? **→ 58/100 ARCHIVE; killed at vacuum screen — BOTH sides owned & productized (capture Procore Change-Orders + Groundbreak-2025 AI Daily-Log/RFI agents + P6; recovery SmartPM "court-ready in minutes" >50% Top ENR GCs + WeBuild/Flexbase/Opteam + forensic bench). 6th cap; "served only by consultants ≠ un-productized" → ADR-017** | MED | `research/TASK-0022-construction-delay-claim-defense.md` |

## Open questions
- **(ADR-017, sharpens ADR-015) Where is the HIDDEN/fragmented pain with NO existing services industry?** Construction claims (OPP-006) capped too — confirming that *court-enforceable dispute + headline $-pool = double incumbent-magnet* (funds prevention SaaS AND a forensic-services industry) and that "served only by consultants" ≠ "un-productized" (SmartPM = a forensic expert who productized). **New filter:** before seeding, ask "is there already a profitable *services* industry around this pain?" — if yes, assume productization is in-flight. Hunt **un-priced / embarrassing / orphaned-ownership pain with NO services industry yet** and NO headline $-stat. Do NOT re-seed dispute/$-stat candidates. Next candidate is currently UN-SEEDED (deliberately — the seeding heuristic itself is what kept failing).
- Which B2B contracting niches combine low competition + clear buyer + recurring need?
- Does claude-mem add retrieval value over structured grep at our corpus size?
- Which GSD agent patterns measurably improve research quality?
