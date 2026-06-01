# RULE: Research deduplication & knowledge preservation (BINDING)

Research time, context, and API spend are scarce. **Duplicate research is waste.** Knowledge must
compound: every cycle permanently increases organizational memory. The repository is memory —
conversation history is disposable. Nothing important may exist only in a session.

## Authoritative records (precedence)
1. `research/opportunity_registry.json` — the master DB of EVERY opportunity ever investigated. Authoritative.
2. `research/INDEX.md` — human map, **generated** from the registry (`scripts/registry.sh reindex`). Never hand-edit.
3. `research/{active,validated,execution,archived,rejected}/<OPP-id>-<slug>.md` — per-opportunity detail.
4. `research/market_maps/<sector>.md` — per-market memory.

`scripts/registry.sh` is the **only** supported write path to the registry (keeps IDs unique + state consistent).

## Identifiers
Every opportunity gets a permanent `OPP-YYYY-NNN` id (`registry.sh next-id`). All reports, analyses,
validations, business models, and projects reference that SAME id. Never reuse or duplicate an id.

## States (one at a time)
`DISCOVERED → MONITORING → VALIDATING → VALIDATED → EXECUTION_CANDIDATE → BUILDING → DEPLOYED`,
plus terminal `ARCHIVED` (shelved, kept) and `REJECTED` (actively disproven, kept). Map to engine gates:
<70 ARCHIVED · 70–79 MONITORING · 80–89 VALIDATING/VALIDATED · 90+ EXECUTION_CANDIDATE.

## PRE-RESEARCH CHECKPOINT (mandatory — no new research may begin until this passes)
Before discovering/scoring ANY new opportunity:
1. `scripts/registry.sh search "<key terms>"` — searches the registry + all per-opportunity files + market maps.
2. Also scan related industries, customer groups, workflows, and problem statements (vary the search terms).
3. If a semantic memory system (Claude-Mem etc.) exists, query it too — it supplements, never replaces, the registry.
4. Read the relevant `research/market_maps/<sector>.md` if it exists.

## SIMILARITY TEST (70% rule)
Different wording ≠ different opportunity. "Construction Estimation AI", "Contractor Bid Intelligence",
and "Proposal Generation Platform" may be ONE opportunity. Before creating a new record, judge similarity
across six facets: **Problem · Customer · Workflow · Economics · Solution · Market**.
- **Similarity > 70% → UPDATE the existing record** (`registry.sh update <id> ...`), do not create a duplicate.
- Only create a new `OPP-` id when the opportunity is genuinely distinct on these facets.

## ARCHIVE / REJECT POLICY (never delete)
Rejected and archived opportunities are kept forever with: reason, research performed, evidence, date,
confidence. The org must learn from failures and never rediscover a killed idea. Move via
`registry.sh update <id> --status REJECTED|ARCHIVED --reasoning "<why>"`.

## EFFICIENCY (do not redo)
Do not repeat completed investigations, recreate archived reports, rediscover rejected opportunities, or
regenerate existing market maps. Instead: **update · refine · expand · validate · challenge · improve**.

## Session boundaries
- **Start:** read `research/INDEX.md` + `research/opportunity_registry.json` (in addition to the bootstrap docs).
- **End:** every new/changed opportunity is reflected via `registry.sh add|update`, then `registry.sh reindex`.
  The next worker must be able to arrive with zero chat history and know what exists, what was rejected,
  what is validating, and what is being built — from files alone.
