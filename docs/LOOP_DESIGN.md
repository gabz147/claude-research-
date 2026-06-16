# LOOP DESIGN

## Fit verdict

The loop concept fits this repo directly. `claude-research-bot` is already structured as a bounded autonomous loop: a scheduler starts `scripts/supervisor.sh`, the supervisor launches a disposable Claude worker, the worker reads repo memory, performs one cycle, updates durable state, commits, posts to Discord, and exits.

The useful upgrade is not a new framework. It is making the existing loop more explicit and adding a separate evaluator gate before tasks are marked complete.

## Current loop mapping

| Loop concept | Current implementation |
| --- | --- |
| Goal | `MISSION.md`, `NEXT_ACTION.md`, `state/current_state.json.current_objective` |
| Agent acts | `claude -p prompts/bootstrap.md` then `prompts/runtime.md` |
| Result checked | `prompts/runtime.md` validation step, `rules/self-audit.md`, `scripts/doctor.sh` preflight |
| State updated | `STATUS.md`, `NEXT_ACTION.md`, `COMPRESSED_CONTEXT.md`, `REPORT.md`, `state/current_state.json` |
| Repeat trigger | AFK window runner, systemd timer, or cron via `automation/` |
| Stop condition | one bounded cycle, supervisor timeout, task completion/failure, usage-limit backoff |
| Memory | repo-backed Markdown + JSON; Discord is observability only |
| Connectors | Discord REST, web/source ingestion, git, jq, shell scripts |
| Skills | `skills/` and `rules/` |
| Sub-agents | currently logical roles inside one worker |
| Worktrees | not active yet; useful only when real parallel workers are introduced |

## What should change

The repo should keep the single-worker loop as the default. It is simple, debuggable, and aligned with the current architecture.

Add an evaluator loop for task closure:

```text
Generate / research / build
  -> verify with objective gates
  -> critique against task acceptance criteria
  -> fix if needed
  -> close only when gates pass or fail with notes
```

The evaluator should not rely on "looks good." It should inspect artifacts and commands:

- `jq -e . state/current_state.json`
- required files exist
- task acceptance criteria are satisfied
- opportunity records are registered and indexed when research is produced
- claimed tests, builds, or scripts actually ran
- no tracked secret appears in the diff
- `NEXT_ACTION.md` names exactly one next action

## Minimal implementation path

1. Add an `acceptance` field to new task JSON records.
2. Add `scripts/verify_cycle.sh` to run objective repo gates.
3. Update `prompts/runtime.md` so task completion requires running the verifier or explaining why no verifier applies.
4. Optionally add an `evaluation` section to `REPORT.md` per cycle.
5. Later, if cycle quality is still weak, split verifier into a separate Claude invocation or real sub-agent.

## Autonomy levels

Use staged autonomy rather than jumping straight to full-auto changes:

| Level | Meaning | Fit here |
| --- | --- | --- |
| L1 Suggest | Agent proposes next actions | Already possible through reports |
| L2 Draft | Agent writes artifacts but does not act externally | Good for research and plans |
| L3 Act with approval | Agent runs cycles; human reviews Discord/git | Current AFK/deployment target |
| L4 Fully autonomous | Agent executes and closes work unattended | Only after evaluator gates are reliable |

## Non-goals

- Do not replace repo memory with vector memory.
- Do not add multi-agent orchestration before the single-worker loop proves insufficient.
- Do not use Discord as authoritative state.
- Do not close tasks because the worker says they are complete; close tasks because objective gates passed.
