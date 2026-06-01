---
name: evidence-graph
description: Build a lightweight claim↔source↔contradiction index over research/ and OPPORTUNITIES so you can answer "if this source is wrong, what conclusions fall?" and find single points of failure. Use before promoting an opportunity past a stage gate, or when an evaluation rests on a thin source base.
metadata:
  trigger: "single point of failure", "what depends on this source", "blast radius", "evidence graph", before any 80+ stage-gate promotion
  governed_by: rules/evidence-and-injection.md + research/METHODOLOGY.md
  patterns_from: Lum1104/Understand-Anything + colbymchenry/codegraph (knowledge-graph concept, adapted to prose evidence)
---

# Evidence Graph

As the corpus grows, the dangerous question becomes: **if one source is wrong, which findings
collapse?** A flat ledger can't answer that. This builds a small dependency graph *derived* from
the artifacts you already keep — it is an index, never authoritative (per ADR-001/ADR-005: the
repo stays source of truth, a graph is only a query layer).

This adapts the code-knowledge-graph idea (Understand-Anything, codegraph) to **prose research**:
nodes are claims and sources, edges are `supports` / `contradicts` / `depends-on`.

## When to use
- Before promoting any opportunity to 80+ (validation/execution) — confirm it isn't propped up
  by one weak source.
- When a finding's confidence is HIGH but you suspect a thin evidence base.
- Periodically over `research/` once it passes ~30 findings.

## Build it (grep/jq-native, no new infra)
1. Parse `research/*.md` findings, `research/OPPORTUNITIES.md`, and stage artifacts in
   `projects/`. Every source is already a ranked, tagged line; every claim is already tagged
   FACT/LIKELY/SPECULATION/UNKNOWN.
2. For each source reference under a claim, add a `supports` (or, under "Contradicting evidence",
   a `contradicts`) edge: source → claim. Add `depends-on` edges where a conclusion is built on
   a sub-claim.
3. Write `state/evidence-graph.json` as `{nodes:[...], edges:[...]}`, regenerated on demand.
   Keep raw parsing in a temp file; never hand-edit the JSON (regenerate from the artifacts).

## Questions it answers
- **Single point of failure:** which source supports the most FACT-tagged or high-score claims?
  If one community-tier source props up an 80+ opportunity, that's the weakest link — surface it
  in the OPPORTUNITY's Risk section and consider downgrading confidence.
- **Orphans:** claims with no supporting source (unsupported assertion) or sources cited nowhere
  (dead weight). These are exactly the self-audit failures, seen structurally.
- **Contradiction clusters:** claims carrying both `supports` and `contradicts` edges — the open
  disagreements that must be resolved before a stage-gate promotion.
- **Blast radius:** if source S were retracted, list every claim that loses support (follow
  `supports`, then `depends-on`). This is the "what falls" answer for a risk assessment.

## Discipline
- The graph **describes** the artifacts; regenerate it, don't curate it.
- A claim's confidence may not exceed what its strongest independent support path allows. If the
  graph shows a HIGH-confidence claim resting on a single weak node, downgrade it and log why.
- This satisfies the two-source rule structurally: a claim with <2 independent `supports` edges
  is a hypothesis, not a finding.
