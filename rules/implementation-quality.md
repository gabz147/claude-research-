# RULE: implementation + shell quality

When the cycle builds or changes code/scripts:
- **Validate by running**, not by reading. Tests/commands must actually execute green.
- **Shell:** `set` sane flags; quote variables; prefer `"$ROOT/..."` absolute paths; atomic writes (temp + `mv`); never leave a stale lock.
- **Simple over clever.** Match surrounding style. Observable over opaque.
- **Commit safety:** one logical change per commit; never commit `config/.env` or any secret; descriptive message.
- **No silent overwrite** of MISSION.md or DECISIONS.md — append/supersede with justification.
