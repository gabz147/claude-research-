# NEXT ACTION

> **File contract** — Purpose: the single most important next step, unambiguous. Owner: every cycle (write at end). Update rules: overwrite. Recovery: this is what a resuming Claude does FIRST after bootstrap. Format: one imperative action + acceptance check. Lifecycle: volatile.

## Do this next

**Action:** Run **VALIDATION MODE** for the org's first promoted project, `projects/01-ira-audit-defense/` (OPP-001b, score 83). The funnel has NARROWED — advance this project, do **not** start a new discovery cycle.

**Concretely (TASK-0013):**
1. Produce `projects/01-ira-audit-defense/VALIDATION_REPORT.md` (use `templates/VALIDATION_REPORT.md`) — its explicit goal is to **DISPROVE** the opportunity.
2. Support it with `MARKET_ANALYSIS.md`, `CUSTOMER_ANALYSIS.md`, `COMPETITOR_ANALYSIS.md` (templates exist).
3. Resolve the four kill-tests, evidence > analysis (≥2 independent sources/claim, tag FACT/LIKELY/SPEC/UNKNOWN):
   - **(1) Demand reality** — find hard evidence of actual IRS PWA audit cadence / notice volume. The "penalty wave" is currently single-vendor-sourced (Landgate/KPMG). *If audits aren't happening at scale → ARCHIVE.*
   - **(2) Willingness to pay** vs incumbent Big-4/AmLaw firms — will buyers pay a software-enabled vendor?
   - **(3) Compete vs channel** — direct-to-buyer product, or sell the reconstruction/ratio engine *to* the firms (privilege-safe)? Better CAC + moat?
   - **(4) Terminal value** — does the audit-defense engine generalize to surviving/perennial regimes (45Q/45Z/45X, Davis-Bacon federal-contract audits) before the 2023–2027 vintage decays?
4. Update `PROJECT.md` (artifacts table + gate log), apply the verdict: **HIGH → BUSINESS_MODEL.md**; MED/LOW → HOLD (name the gap) ; killed → ARCHIVE + post-mortem to `#🚨-alerts`.
5. Post the validation verdict to `#🎯-active-work` (or `#✅-completed` if a stage artifact closes).

**Operator-gated (do NOT auto-do):** `automation/install.sh` enables the unattended systemd loop (`claude --dangerously-skip-permissions` on a timer). TASK-0002 holds this; needs explicit operator go-ahead.

**Acceptance check:** `VALIDATION_REPORT.md` exists with a real disconfirming-evidence section and a verdict; the four kill-tests are addressed with sourced evidence; `PROJECT.md` gate log updated; state files refreshed; Discord `#🎯-active-work` shows the verdict; REPORT.md refreshed; committed.
