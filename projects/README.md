# PROJECTS — promoted opportunities (score ≥ 80)

Each opportunity that scores ≥80 gets a directory `projects/<NN-slug>/` and progresses through gated modes. One mode advances per cycle; HIGH confidence required to advance to the next.

```
projects/<NN-slug>/
├── PROJECT.md            # status, score, current mode, confidence, next gate (always present)
├── OPPORTUNITY.md        # the original discovery record + score breakdown
├── VALIDATION_REPORT.md  # mode 1 (+ MARKET/CUSTOMER/COMPETITOR analyses)
├── MARKET_ANALYSIS.md
├── CUSTOMER_ANALYSIS.md
├── COMPETITOR_ANALYSIS.md
├── BUSINESS_MODEL.md     # mode 2
├── MVP.md                # mode 3
├── BUILD_PLAN.md         # mode 4
├── ICP.md  OUTREACH.md  SALES_PROCESS.md   # mode 5 (customer acquisition)
```

## Lifecycle (see prompts/opportunity-engine.md)
DISCOVER+SCORE → (≥80) PROJECT → VALIDATION → BUSINESS MODEL → MVP → EXECUTION (BUILD_PLAN) → CUSTOMER ACQUISITION.

A project that fails validation is **archived** (move to `projects/_archived/<slug>/` with a post-mortem in PROJECT.md). Killing a weak opportunity early is success, not failure.

Templates for every artifact live in `templates/`. Numbering: `01-`, `02-`, … in order of promotion.
