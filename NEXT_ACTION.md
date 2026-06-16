# NEXT ACTION

> **File contract** — Purpose: the single most important next step, unambiguous. Owner: every cycle (write at end). Update rules: overwrite. Recovery: this is what a resuming Claude does FIRST after bootstrap. Format: one imperative action + acceptance check. Lifecycle: volatile.

## Do this next

**Action:** Execute `TASK-0025` before another discovery cycle: implement evaluator-loop gates so autonomous tasks close only after objective checks pass.

**Context:** The live bot is already running under the AFK window and has produced multiple discovery cycles. The loop design is now documented in `docs/LOOP_DESIGN.md` and recorded as ADR-020. The missing operational step is to turn that design into gates the runtime can actually use.

**Concretely:**
1. Open `queue/pending/TASK-0025.json` and follow its acceptance criteria.
2. Add task acceptance support without breaking `scripts/task.sh list/move/show`.
3. Add `scripts/verify_cycle.sh` with shell/jq-native checks for JSON validity, handoff files, queue consistency, and obvious tracked-secret leakage in the current diff.
4. Update `prompts/runtime.md` so a task can move to completed only after running the verifier or explicitly recording why no verifier applies.
5. Update `docs/LOOP_DESIGN.md` if implementation details differ from the design note.

**Acceptance check:** `jq -e . state/current_state.json` and `jq -e . queue/pending/TASK-0025.json` pass; `scripts/verify_cycle.sh` exists and runs; `prompts/runtime.md` requires the verifier before completion; TASK-0025 is moved to completed only after those gates are satisfied; Discord summary posted; changes committed.
