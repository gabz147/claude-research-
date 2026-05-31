# CLAUDE-MEM EVALUATION (first pass)

> Confidence: LOW-MEDIUM (not installed; based on prior/general knowledge of github.com/thedotmack/claude-mem). Full live review = TASK-0004. Do not treat specifics below as FACT until verified.

## What it is (LIKELY)
A Claude Code memory plugin that hooks session lifecycle (Stop/SessionStart), summarizes/compresses transcripts, stores them in a local DB with embeddings, and injects relevant memories into new sessions for continuity.

## Evaluation axes
| Axis | Assessment | Confidence |
|------|------------|-----------|
| Memory model | Transcript summaries + semantic index | LIKELY |
| Retrieval | Embedding similarity over past sessions | LIKELY |
| Storage | Local (SQLite / vector store) | LIKELY |
| Context reconstruction | Auto-injects memories at session start | LIKELY |
| Operational complexity | Extra hooks + DB + indexing process | LIKELY |
| Failure modes | Opaque recall, drift, stale memories, silent loss | SPECULATION |

## Decision (ADR-005)
**Defer. Do not adopt as authoritative memory.** Reasons:
1. ARO's invariant (ADR-001): repo files are the *only* source of truth. A vector store must never become authoritative — it's lossy and hard to audit.
2. At current corpus size, structured markdown + `grep`/`jq` over `research/` and `knowledge/` is sufficient, transparent, and diffable.
3. Adding indexing hooks increases the failure surface of unattended runs.

## When to revisit (TASK-0004)
- Corpus grows past the point where grep/scan stops scaling (hundreds of findings).
- Then evaluate claude-mem (or a plain embeddings index) strictly as a **read-only semantic search layer** over `research/`/`knowledge/`, with files remaining canonical.

## Test plan for TASK-0004
1. Install in a throwaway dir; inspect its DB schema + hooks.
2. Measure: does retrieval surface the *right* prior finding for a query? False-positive rate?
3. Confirm it can be made read-only / non-authoritative.
4. Update this doc with FACT-level findings + a final keep/drop verdict.
