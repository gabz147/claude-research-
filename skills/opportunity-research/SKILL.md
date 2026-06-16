---
name: opportunity-research
description: Discover, validate, and score a B2B business opportunity end-to-end. Use for every discovery cycle and validation pass. Produces a scored OPPORTUNITY record and routes it through the stage gates.
metadata:
  trigger: "discover opportunity", "research a niche", "validate", "score this market", any TASK in research/OPPORTUNITIES.md
  governed_by: prompts/opportunity-engine.md + MISSION.md
  patterns_from: anthropics/knowledge-work-plugins (SKILL format), affaan-m/ECC deep-research + market-research + verification-loop
---

# Opportunity Research

Turn a sector or hunch into an evidence-backed, scored opportunity — and try to kill it before backing it. Business pain before technology. AI is a tool, never the product.

## Workflow checklist (MUST pass in order)
```
- [ ] Step 1: Frame — one falsifiable question + hypothesis (who hurts, how expensively?)
- [ ] Step 2: Source plan — 3-5 sub-questions; ingest docs via scripts/ingest_doc.sh if PDFs/reports
- [ ] Step 3: Evidence — gather from ranked sources (official > vendor > source code > academic > blogs > community); ≥2 independent per claim; tag FACT/LIKELY/SPECULATION/UNKNOWN
- [ ] Step 4: Disprove — actively hunt disconfirming evidence (REQUIRED, not optional)
- [ ] Step 5: Economics — quantify $/yr the problem costs the buyer; show the math
- [ ] Step 6: Fill templates/OPPORTUNITY.md
- [ ] Step 7: Score 0-100 (Pain25 Spend20 Freq15 CompWk15 Defens15 AI10) with per-dim justification
- [ ] Step 8: Apply stage gate; log to research/OPPORTUNITIES.md; post scored thesis to #🏆-opportunities
- [ ] Step 9: Apply anti-slop skill to the written thesis before posting
```

## Evidence discipline (verification-loop)
A claim without two independent sources is a hypothesis, not a finding. After writing the conclusion, re-derive it from the evidence alone — if the evidence doesn't force the conclusion, downgrade confidence. Record **Supporting evidence**, **Contradicting evidence**, **Final assessment**, **Confidence (HIGH/MED/LOW)**.

## Scoring guidance (ADR-008 authoritative weights)
- **Pain Severity (25):** mission-critical / bleeding money or risk now = high.
- **Buyer Spending Power (20):** can pay $10k+/yr without friction = high.
- **Frequency (15):** continuous/recurring problem = high.
- **Competitive Weakness (15):** incumbents weak, hated, fragmented, or absent = high.
- **Defensibility (15):** durable moat — proprietary data, deep integration, workflow lock-in = high.
- **AI Leverage (10):** AI creates a step-change in cost/accuracy/speed (not a gimmick) = high.

## Gate → action
<70 archive · 70-79 monitor (ledger only) · 80-89 create `projects/<slug>/` + validation artifacts · 90+ execution project. On 80+, STOP broad discovery and drive that one down the funnel (validation → business model → MVP → build plan → acquisition).

## Anti-patterns (auto-deprioritize)
AI wrappers, generic chatbots/content tools, dropshipping, generic agencies, day trading, affiliate/influencer, trend-chasing, consumer-scale plays. Research these only with extraordinary evidence (see MISSION.md).
