# NEXT ACTION

> **File contract** — Purpose: the single most important next step, unambiguous. Owner: every cycle (write at end). Update rules: overwrite. Recovery: this is what a resuming Claude does FIRST after bootstrap. Format: one imperative action + acceptance check. Lifecycle: volatile.

## Do this next

**Action:** Continue net-new discovery under the current doctrine stack now that `TASK-0025` evaluator gates are implemented.

**Concretely:** pick one new owned-position B2B opportunity and run the screens in order: ADR-018 strip-out-the-AI, ADR-015 both-sides vacuum check, ADR-019 owned-position filter. Do not re-run already-scored sectors. Use `scripts/verify_cycle.sh` before closing the task.

**Acceptance check:** one new scored research record exists, ledgers and state files are updated, `scripts/verify_cycle.sh` passes or any exception is recorded in `REPORT.md`, Discord summary posted, changes committed.
