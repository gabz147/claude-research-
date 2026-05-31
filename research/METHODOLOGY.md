# RESEARCH METHODOLOGY

Every research task follows this. No shortcuts. The output is a file `research/<TASK-ID>-<slug>.md` using the template below.

## The cycle
1. **Question** — state precisely what is being answered. One question per finding.
2. **Hypothesis** — your prior before evidence.
3. **Evidence collection** — gather from ranked sources:
   1) official docs → 2) vendor docs → 3) source code → 4) academic → 5) reputable technical blogs → 6) community.
   Minimum **two independent sources** for any non-trivial claim.
4. **Verification** — corroborate; reconcile disagreements explicitly.
5. **Contradiction search** — actively hunt disconfirming evidence. A finding with no contradiction search is incomplete.
6. **Risk assessment** — what would make this conclusion wrong? How exposed are we?
7. **Conclusion** — Supporting evidence / Contradicting evidence / Final assessment.
8. **Confidence** — HIGH / MEDIUM / LOW, with justification.

## Claim tagging
Tag every factual statement: **FACT** (verified, sourced) · **LIKELY** (strong but incomplete evidence) · **SPECULATION** (plausible, unverified) · **UNKNOWN** (gap to close).

## Finding template
```markdown
# <TASK-ID> — <Title>
**Date:** YYYY-MM-DD  **Owner:** Researcher  **Confidence:** HIGH|MED|LOW

## Question
## Hypothesis
## Evidence
- [source-rank] claim — URL/path — (FACT/LIKELY/...)
## Verification
## Contradicting evidence
## Risk assessment
## Conclusion / Final assessment
## Sources
```

## After writing
- Add a row to `RESEARCH.md` index.
- Promote durable, reusable knowledge into `knowledge/` (linked).
- Post a 3–5 line summary to `#🔬-research-feed`.
