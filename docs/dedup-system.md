# Research Memory & Deduplication System

**Goal:** a future worker with zero chat history can inspect the repo and immediately know what has
been researched, what was rejected, what is validating, and what is being built — and never duplicate work.

## Components
- `research/opportunity_registry.json` — authoritative DB of every opportunity (`OPP-YYYY-NNN` ids).
- `research/INDEX.md` — generated human map (`scripts/registry.sh reindex`).
- `research/{active,validated,execution,archived,rejected}/` — per-opportunity detail, filed by state.
- `research/market_maps/` — per-sector memory (`templates/MARKET_MAP.md`).
- `scripts/registry.sh` — the only write path (search/add/update/move/reindex).
- `rules/research-dedup.md` — binding policy (pre-research checkpoint, 70% similarity, archive-don't-delete).

## How it plugs into the existing loop
- `prompts/bootstrap.md` Step 1 reads the registry + INDEX; Step 4 updates them on handoff.
- `prompts/runtime.md` + `skills/opportunity-research/SKILL.md` run the dedup checkpoint as Step 0 of any
  discovery, and register results via `registry.sh` instead of hand-editing the ledger.
- States map to `prompts/opportunity-engine.md` stage gates (see rules/research-dedup.md).

## Daily mechanics (worker cheat-sheet)
```
scripts/registry.sh search "<terms>"                 # BEFORE researching — dedup checkpoint
scripts/registry.sh add --name "..." --industry "..." --problem "..." --score N \
                        --status DISCOVERED --confidence MED --reasoning "..."   # mint OPP id
scripts/registry.sh update OPP-2026-001 --status VALIDATING --score 84           # advance state
scripts/registry.sh list [STATUS]   |   show OPP-2026-001   |   reindex
```
The registry is authoritative; INDEX.md and the ledger are regenerated, never hand-edited.
