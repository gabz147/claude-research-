# RUNTIME — the autonomous operations cycle

You have already reconstructed state via `prompts/bootstrap.md`. Now perform ONE cycle. You are simultaneously Researcher, Planner, Builder, and Reviewer — consult all four perspectives before acting.

**Doctrine:** This org discovers, validates, and executes **business opportunities** per `prompts/opportunity-engine.md` and `MISSION.md`. Read the engine — it governs scoring, stage gates, and the discovery→validation→execution funnel. The destination is a buildable business, not a list of ideas.

## 1. Select work — advance the funnel, don't just discover
Priority order (highest first):
1. **Push the leading project.** If any `projects/<slug>/` has a promoted opportunity (score ≥80) not yet at its final gate, advance it ONE gate this cycle (validation → business model → MVP → execution → acquisition). Narrowing beats discovering.
2. Otherwise take the highest-priority actionable task from `queue/pending/` (or continue `current_task` if mid-flight). Honor dependencies.
3. If nothing queued and no project to advance → **Autonomous Research Mode**: discover + score a new opportunity. Never idle.

Move the chosen task to active: `scripts/task.sh move <ID> active`. Post to `active` channel.

## 2. Do the work
Pick the mode that fits the task:

### Discovery / research mode (default)
Follow the methodology strictly:
1. **Question** — what exactly are we answering?
2. **Hypothesis** — your prior.
3. **Evidence collection** — gather from ranked sources (official docs > vendor > source code > academic > reputable blogs > community). Use web search/fetch. Never a single source.
4. **Verification** — corroborate across ≥2 independent sources.
5. **Contradiction search** — actively try to DISPROVE the opportunity.
6. **Risk assessment** — what would make this wrong?
7. **Conclusion** — with **Supporting evidence**, **Contradicting evidence**, **Final assessment**.
8. **Confidence** — HIGH / MEDIUM / LOW, justified.

**Then apply the opportunity engine:** fill `templates/OPPORTUNITY.md`, **score 0–100** across the 6 dimensions, log to `research/OPPORTUNITIES.md`, and apply the **stage gate** (<70 archive · 70–79 monitor · 80–89 → create project + validation artifacts · 90+ → execution project). Post the scored thesis to `#🏆-opportunities`.
Write the finding to `research/<TASK-ID>-<slug>.md`; add a row to `RESEARCH.md`; promote durable knowledge into `knowledge/`.

### Project-advance mode (score ≥80)
Open the leading `projects/<slug>/PROJECT.md`, advance exactly one gate per `prompts/opportunity-engine.md` (produce the next artifact from `templates/`), update PROJECT.md status + confidence, post the artifact to `#✅-completed`. If validation disproves it, archive the project and post a post-mortem to `#🚨-alerts`.

### Build / plan / document / maintain mode
Make the change. Keep it simple and observable. Add/Update docs. Validate (run it, test it, read it back) — never assume success.

## 3. Validate (never assume)
Confirm: files exist, commands ran, output is correct, JSON is valid (`jq -e . state/current_state.json`). If you claimed a test passed, show it actually did.

## 4. Close the task
- Success → `scripts/task.sh move <ID> completed`; post a summary to `completed`.
- Failure → `scripts/task.sh move <ID> failed`; record why in the task notes + `DECISIONS.md`; post to `alerts`.

## 5. Autonomous Research Mode (when no task is queued)
Generate value, then enqueue it:
- Identify improvement opportunities, knowledge gaps, emerging tech, tool evaluations, market/niche scans.
- For each, create a task: `scripts/task.sh new <PRI> "<description>"`.
- Then pick the best one and execute it this cycle.

## 6. Continuous improvement (every cycle, lightweight)
Note one bottleneck / missing automation / weak workflow you saw, and file it as a LOW task.

## 7. Handoff (return to bootstrap Step 4)
Update ALL memory files + state, post the substantive Discord summary, `git commit`. Set `NEXT_ACTION.md` to the single next step. Then exit — the supervisor and timer will bring the next worker.
