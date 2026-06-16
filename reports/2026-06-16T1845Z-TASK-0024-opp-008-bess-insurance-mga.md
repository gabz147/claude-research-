# REPORT — Latest Cycle Output

> **File contract** — Purpose: human-facing report of the most recent cycle. Owner: every cycle. Update rules: overwrite each cycle (history is in `reports/<timestamp>.md` + git). Recovery: shows what last happened. Format: fixed sections. Lifecycle: volatile (archived copies in reports/).

## CYCLE — 2026-06-16 (TASK-0024 / OPP-008 — net-new discovery, first owned-position play)

**Cycle type:** Net-new discovery (runtime priority 3). Project 01 operator-gated (TASK-0014); no other ≥80. Per ADR-018, deliberately chose the org's **first OWNED-POSITION candidate** rather than another documentation artifact.

## What I did
Selected funnel priority 3 and, per the ADR-018 doctrine, picked a candidate engineered to **pass the strip-out-the-AI screen**: a **specialty-insurance MGA/program for emerging hard-to-place lithium-ion / battery-energy-storage (BESS) commercial fire risk.** Thesis: an MGA owns *distribution* + sits in the *underwriting transaction* (commission/profit-share) + accumulates *proprietary loss data*, with **AI as the underwriting tool, not the product** — strip out the AI and an MGA is still a real business. Ran disprove-first research (WebSearch across placement-side, MGA-side, adjacent sub-niches, and the AI-underwriting/data-moat side).

## Verdict: 58/100 → ARCHIVE (fifth Archived row; 8th consecutive cap)
**The candidate PASSED the ADR-018 strip-out-the-AI lead screen** (first candidate to do so — a genuine owned position, not the documentation archetype) — then **capped at the second-stage both-sides vacuum check**, plus two further gates:
- **Placement wedge already owned:** **NARDAC (Amwins Underwriting MGA)** secured BESS binding authority **Mar-2024 — $50M capacity from 8 A-rated Lloyd's syndicates**; **Amwins** runs a dedicated BESS product line; **Travelers** writes the class; **BikeInsure** owns the adjacent micromobility-fleet sub-niche.
- **The vacuum is a transient hard-market cycle, not structural:** energy insurance "enters 2026 with **renewed competition**… underwriters now see enough data to price with confidence" (pv-magazine-USA Nov-2025; Resource Recycling Feb-2026) → capacity flooding back.
- **The moat fails twice:** AI underwriting is a **commoditized purchasable platform** (hyperexponential/Earnix/Federato; McKinsey/Earnix: table stakes, 14%→70% adoption by 2028); the loss-data moat is a **cold-start** that accrues only after years of bound risk (NARDAC 2yr; Federato 20yr datasets), so a new entrant has none. Plus an MGA needs delegated binding authority + licensing + carrier capacity = **heavy regulated capital**, not buildable by a small org.

Score: Pain 18 · Spend 16 · Freq 12 · CompWk 4 · Defens 3 · AI 5 = **58**.

## Meta-learning (ADR-019 — refines ADR-018, does NOT supersede it)
The **first owned-position play passed the ADR-018 strip-out-the-AI screen and still capped** → **passing that screen is NECESSARY but NOT SUFFICIENT.** The screen *works* (it correctly separated this from the 7 documentation-archetype caps) — but it exposed the *next* gate. Three new failure modes, distinct from the documentation archetype, generalize into a **third-stage owned-position filter** (applied after strip-out-the-AI, after the vacuum check):
1. **Durable vacuum** — is the gap *structural*, or a transient cycle (hard-market, temporary capacity withdrawal, a one-off regulatory deadline) that incumbents refill in 12–24 months? Specialty-insurance "vacuums" are cycles, not Blue Oceans.
2. **Zero-state moat** — can YOU originate the moat from nothing (network effect / workflow lock-in that compounds from the FIRST customers), or does it only accrue to whoever is already the incumbent (**cold-start data trap**)?
3. **Buildable without heavy regulated capital** — can a small team stand it up, or does it require a charter / licensing / underwriting capacity / balance sheet?

→ **Screening order going forward: ADR-018 strip-out-the-AI → ADR-015 both-sides vacuum check → ADR-019 owned-position filter.** Next-candidate profile: an owned-position play whose moat is **originable from zero** (compounds with the first customers — e.g., a two-sided workflow/network) in a **structurally unserved** niche, **buildable without a regulated charter or carrier capacity.**

## Artifacts written / updated
- `research/TASK-0024-bess-specialty-insurance-mga.md` (new finding, full disprove + scoring + ADR-019 meta)
- `queue/completed/TASK-0024.json` (status DONE)
- `research/OPPORTUNITIES.md` (OPP-008 table row + Archived entry)
- `RESEARCH.md` (findings-index row + ADR-019 open-question)
- `DECISIONS.md` (ADR-019)
- `TODO.md` (TASK-0024 DONE row; TASK-0017 refined in-place with the ADR-019 third-stage filter)
- state/current_state.json, STATUS.md, NEXT_ACTION.md, COMPRESSED_CONTEXT.md refreshed

## Infra note
No ownership landmine this cycle. TASK-0021 root cause (run-as-user / chown-on-start) still persists; operator should fix it. TASK-0020 (handoff self-audit of ALL volatile pointer files) honored this cycle — all pointer files + ledger + state refreshed together before commit.

## Next action
Continue net-new discovery, applying the **doctrine stack in sequence** (ADR-018 → ADR-015 → ADR-019; see NEXT_ACTION.md). Next candidate must be an owned-position play with a zero-state-originable moat in a structurally unserved niche, buildable without a regulated charter. Do NOT re-run any scored sector; do NOT pick another documentation artifact or a regulated-capital business; do NOT re-desk-validate project 01.
