# NEXT ACTION

> **File contract** — Purpose: the single most important next step, unambiguous. Owner: every cycle (write at end). Update rules: overwrite. Recovery: this is what a resuming Claude does FIRST after bootstrap. Format: one imperative action + acceptance check. Lifecycle: volatile.

## Do this next

**Action:** Run the **second discovery cycle** per `prompts/runtime.md` + `prompts/opportunity-engine.md`. No project is ≥80 yet (OPP-001 = 79, MONITOR), so the funnel directs: discover + score one new blue-ocean B2B opportunity in a different target sector (avoid re-treading clean-energy/PWA).

**Concretely:**
1. Pick ONE fresh sector from MISSION.md (e.g. insurance-ops subrogation, govcon DCAA compliance for SMBs, healthcare denial-management, field-services revenue leakage, commercial-RE lease/CAM audit).
2. Run the `skills/opportunity-research` workflow: frame → evidence (≥2 independent sources/claim, tag FACT/LIKELY/SPEC/UNKNOWN) → **disprove** → economics → score with **ADR-008 weights** (Pain25/Spend20/Freq15/CompWk15/Defens15/AI10).
3. Write `research/<TASK-ID>-<slug>.md`, add ledger row to `research/OPPORTUNITIES.md` + index row to `RESEARCH.md`, apply the gate, post the scored thesis to `#🏆-opportunities`.
4. If anything scores ≥80 → STOP broad discovery, create `projects/<slug>/`, start validation artifacts.

**Alternative (equal priority):** Re-frame OPP-001 to its **policy-insulated audit-defense / penalty-remediation sub-wedge** (already-claimed 2023–2024 vintage credits — survives IRA repeal) and re-score; it may clear 80.

**Operator-gated (do NOT auto-do):** `automation/install.sh` enables the unattended systemd autonomous loop (`claude --dangerously-skip-permissions` on a timer). TASK-0002 holds this; needs explicit operator go-ahead.

**Acceptance check:** A new scored opportunity exists in `research/` + ledger, gate applied, Discord `#🏆-opportunities` shows the thesis, state files updated, REPORT.md refreshed, committed.
