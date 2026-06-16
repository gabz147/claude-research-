# ARCHITECTURE

## Layered design

| Layer | Implementation |
|-------|----------------|
| 1. Repository memory | Markdown files (MISSION, STATUS, TODO, DECISIONS, RESEARCH, REPORT, NEXT_ACTION, COMPRESSED_CONTEXT) |
| 2. State management | `state/current_state.json` — atomic jq read/write via `scripts/lib.sh` |
| 3. Task queue | `queue/{pending,active,completed,failed}/*.json` + `scripts/task.sh` |
| 4. Research engine | `prompts/runtime.md` methodology + `research/METHODOLOGY.md` |
| 5. Knowledge base | `research/` (findings) → `knowledge/` (durable, linkable) |
| 6. Discord observability | `scripts/notify_discord.sh` (bot-token REST) → 🔬 RESEARCH ORG channels |
| 7. Recovery & restart | `scripts/supervisor.sh` (lock/backoff) + systemd + `recovery/RECOVERY.md` |
| 8. Autonomous planning | runtime.md Autonomous Research Mode (self-fills the queue) |
| 9. Continuous improvement | runtime.md step 6 (file one improvement task per cycle) |
| 10. Loop design | `docs/LOOP_DESIGN.md` maps goal -> act -> verify -> update -> repeat and defines the evaluator-loop upgrade |

## Why this shape
- **Files as memory** → reconstructable, auditable, diffable, survives everything. (ADR-001)
- **One cycle = one bounded unit** → fits inside session/usage limits; many small cycles compound.
- **Supervisor is dumb and durable** → the intelligence is in Claude + the prompts; the supervisor only guarantees *single-flight, backoff, logging, heartbeat*.
- **Two-prompt split** → `bootstrap.md` reconstructs (cheap, deterministic), `runtime.md` works (open-ended). A fresh instance is productive without prior chat.
- **Evaluator gates before closure** → the worker may generate work, but tasks should close only after objective checks pass or fail with recorded notes.

## State machine (a cycle)
```
IDLE ──timer──▶ LOCK ──▶ PREFLIGHT(doctor) ──fail──▶ ALERT ──▶ UNLOCK
                  │            │ok
                  │            ▼
                  │        LAUNCH claude -p bootstrap
                  │            │
                  │   ┌────────┼─────────┬──────────────┐
                  │ success  timeout  usage-limit     crash
                  │   │        │          │             │
                  │   ▼        ▼          ▼             ▼
                  │ COMMIT  partial   set backoff   streak++/alert
                  │   │     +continue   +alert         │
                  └───┴────────┴──────────┴────────────┘
                               ▼
                            UNLOCK ──▶ IDLE
```

## Subagent (role) model
Logical roles a single worker rotates through each cycle: **Researcher, Planner, Builder, Reviewer, Archivist, Recovery Coordinator**. Before non-trivial decisions, consult all relevant perspectives. (No separate processes — roles are a thinking discipline encoded in `runtime.md`.)

## Concurrency & safety
- `flock` on `state/aro.lock` → exactly one cycle at a time; auto-released on process death (no stale locks).
- All state writes are atomic (temp + `mv`).
- CWD pinned to project root; git commit per cycle gives rollback.
