# RULE: self-audit (before every handoff)

Before updating memory and exiting, verify — do not assume:
- [ ] `jq -e . state/current_state.json` passes (valid JSON).
- [ ] Every claim written this cycle is tagged FACT/LIKELY/SPECULATION/UNKNOWN and sourced.
- [ ] Any opportunity touched is scored and logged in `research/OPPORTUNITIES.md`.
- [ ] Files I claimed to create actually exist; commands I claimed ran actually ran.
- [ ] `NEXT_ACTION.md` names ONE unambiguous next step.
- [ ] No secret written to a tracked file (`git grep -i token` returns nothing in the diff).
If any check fails, fix it before exiting. A clean handoff is the deliverable.
