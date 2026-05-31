# NEXT ACTION

> **File contract** — Purpose: the single most important next step, unambiguous. Owner: every cycle (write at end). Update rules: overwrite. Recovery: this is what a resuming Claude does FIRST after bootstrap. Format: one imperative action + acceptance check. Lifecycle: volatile.

## Do this next

**Action:** Verify the platform end-to-end, then pick the highest-priority task from `queue/pending/` and run one research cycle per `prompts/runtime.md`.

**Concretely:**
1. Run `scripts/doctor.sh` — confirm token, channels, claude CLI, jq all OK.
2. Run `scripts/supervisor.sh --once` manually once and confirm a Discord post lands in #📊-status.
3. Move `queue/pending/TASK-0003*` (first real research task) → active, execute one research cycle.

**Acceptance check:** A research note exists in `research/`, REPORT.md updated, Discord #🔬-research-feed shows a summary, state files updated, lock released.
