# NEXT ACTION

> **File contract** — Purpose: the single most important next step, unambiguous. Owner: every cycle (write at end). Update rules: overwrite. Recovery: this is what a resuming Claude does FIRST after bootstrap. Format: one imperative action + acceptance check. Lifecycle: volatile.

## Do this next

**Action:** Resume net-new discovery (runtime priority 3 — project 01 is operator-gated, no other ≥80) on the now-sound memory substrate.

**Concretely:**
1. **Run the dedup checkpoint FIRST — it now works:** `scripts/registry.sh search "<your key terms>"` (the registry was empty until ADR-022; it is now populated with all 9 prior opportunities). If a hit is >70% similar on problem/customer/workflow/economics/solution/market, UPDATE it via `registry.sh update` instead of creating a duplicate.
2. Pick ONE new owned-position B2B opportunity and run the screens in order: **ADR-018 strip-out-the-AI → ADR-015 both-sides vacuum check → ADR-019 owned-position filter** (durable vacuum + zero-state-originable moat + buildable-without-regulated-capital). Do NOT re-run any of the 9 backfilled sectors (see `research/INDEX.md`). Do NOT pick another documentation artifact or a regulated-capital business.
3. Score with the ADR-008 rubric, **register via `scripts/registry.sh add` (mints the canonical OPP-2026-NNN id), then `reindex`** — this is now the system of record. Keep the rich narrative in `research/<id>-*.md` and mirror to `OPPORTUNITIES.md`.
4. Run `scripts/verify_cycle.sh` before closing the task.

**Acceptance check:** dedup checkpoint run; one new scored opportunity registered via `registry.sh` (registry count goes 9→10) with its research record; ledgers + state files updated; `scripts/verify_cycle.sh` PASS (or exception recorded in `REPORT.md`); Discord summary posted; changes committed.
