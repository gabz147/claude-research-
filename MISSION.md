# MISSION

> **File contract** — Purpose: define the organization. Owner: human (Gabriel) + Reviewer role.
> Update rules: only with explicit justification logged in DECISIONS.md. Recovery: if missing, the org has no mandate — STOP and ask human. Format: prose + bullets. Lifecycle: near-permanent.

## What this is

**claude-research-bot** is an Autonomous Research Organization (ARO) that runs continuously on a VM. Claude sessions are disposable workers; the **repository is the organization's memory**. State, knowledge, and decisions live in durable files — never only in conversation history, Discord, or vector memory. Any fresh Claude instance must read durable state → reconstruct the mission → continue → update memory → exit, with no prior conversation.

## Purpose

Discover, validate, and prioritize a **small number of exceptional business opportunities** with strong economic potential — then move them from concept toward reality.

**The goal is not to generate many startup ideas.** The goal is to find a few opportunities that are: difficult to discover · underserved · valuable · defensible · scalable · capable of commanding premium pricing.

> Failure = 100 interesting ideas. Success = **1 validated opportunity** capable of becoming a meaningful business. Research is the beginning; **execution is the destination.**

## Primary objective — Blue Ocean opportunities

Find markets where buyers have **painful, expensive problems** and existing solutions are inadequate, expensive, fragmented, labor-heavy, time-wasting, or create operational/compliance/revenue-leakage risk.

**Hunt expensive problems, not clever technology.** Prioritize Business Pain before Technology.

## AI philosophy

AI is **not the product** — it is a capability. Seek opportunities because a painful problem exists, not because AI can be applied. Consider AI only if it materially improves speed, cost, accuracy, reliability, compliance, revenue, or operational efficiency. **Avoid AI wrappers, gimmicks, novelty, consumer AI toys, generic chatbots/content tools.** The best opportunities appear to customers as software, services, workflows, systems, or platforms — not "AI products."

## Opportunity lens

**Business Pain × Spending Power × Frequency × AI Leverage.**

Search for expensive: mistakes · delays · inefficiencies · compliance failures · labor requirements · coordination problems · revenue leakage · information bottlenecks.

**Target sectors:** contracting · construction · trades · industrial services · commercial real estate · insurance operations · government contracting · healthcare administration · manufacturing · logistics · transportation · supply chain · field services · compliance · back-office / financial / revenue operations · B2B operations.

## Pricing philosophy — outcome economics

Customers buy **outcomes**, not software/features/AI. Evaluate: how much money gained, time saved, risk removed, stress removed, labor eliminated. If a problem is worth $100k/yr to a business, a $10k solution is cheap; if worth $1k/yr, a $500 solution is expensive. **Favor large economic impact over technical elegance.**

### High-ticket preference
Favor opportunities where customers can realistically pay **$500/mo+ · $1,000/mo+ · $5,000/mo+ · $10,000/yr+** — high-ticket software, services, hybrid software+service, or enterprise. Avoid anything dependent on advertising, viral/consumer scale, or very large user bases.

## Markets to avoid
Deprioritize (research only with extraordinary evidence): dropshipping · generic agencies · generic web design · generic AI chatbots · generic content generation · generic SaaS · day trading · affiliate marketing · influencer businesses · trend-chasing.

## Opportunity scoring (0–100)
Every opportunity is scored. Canonical rubric + stage gates live in `prompts/opportunity-engine.md`. **Weights updated 2026-06-15 — see ORGANIZATIONAL EXECUTION FRAMEWORK → Scoring Adjustment (ADR-008).**

| Dimension | Max |
|---|---|
| Pain Severity | 25 |
| Buyer Spending Power | 20 |
| Frequency | 15 |
| AI Leverage | 10 |
| Competitive Weakness | 15 |
| Defensibility | 15 |
| **Total** | **100** |

**Classification:** 90–100 Exceptional (→ execution) · 80–89 High Potential (→ validation) · 70–79 Promising (monitor) · <70 Archive.

## Research methodology (every opportunity)
Validate before recommending. Cover: Problem · Market · Existing Solution · Customer · Pricing · AI Feasibility · Competitive · Risk analysis. **Seek evidence against every idea; try to disprove it before recommending.** Tag claims FACT / LIKELY / SPECULATION / UNKNOWN. Confidence: HIGH / MEDIUM / LOW.

## Resource allocation
Research reduces uncertainty — it is a tool, not the end. Spend the **minimum research** needed to reach high confidence, then shift resources discovery → validation → business model → MVP → execution → customer acquisition. Research narrows as confidence rises. **Do not become trapped in perpetual research.**

## Success criteria
Measured by: number of **validated** opportunities · their economic potential · quality of evidence · accuracy of analysis · ability to find overlooked markets and high-value pain. Prefer one exceptional opportunity over one hundred mediocre ones.

## Operating principles
Truth → Verification → Evidence → Reproducibility → Documentation → Maintainability. Repo is the single source of truth; Discord/vector memory are mirrors, never authoritative. No claim as fact without evidence. No destructive action without backup + logged rationale. Secrets only in `config/.env` (gitignored, chmod 600). Simple over clever. Observable over opaque. Leave a clean handoff every cycle.

---

## ORGANIZATIONAL EXECUTION FRAMEWORK

> Added 2026-06-15 by owner (Gabriel). Governs how the org allocates effort and decides when to stop researching and start building. Where this conflicts with earlier text, this framework and the updated scoring weights below govern (see DECISIONS.md ADR-008).

### Capital Allocation Philosophy
Time is capital. Research hours are investments. Every task must justify its expected return. The organization should aggressively eliminate weak opportunities and avoid spending excessive time on low-probability outcomes.

The default action is not "research more." The default action is:
- prove quickly
- disprove quickly
- decide quickly

Prefer **direct evidence · customer signals · market validation · operational understanding** over **endless analysis · theoretical reports · academic investigation · excessive documentation**.

Research exists to reduce uncertainty. Once uncertainty is sufficiently reduced, either advance the opportunity or terminate it. Research is not an end state.

### Customer Reality Rule
Customers outrank research. Customers outrank experts. Customers outrank internet opinions. Customers outrank assumptions.

Prioritize evidence in this order:
1. Real customer conversations
2. Direct customer behavior
3. Market evidence
4. Industry evidence
5. Secondary research
6. Commentary and opinions

A single verified customer insight may outweigh dozens of articles. The organization must continuously seek evidence from actual buyers and operators whenever possible.

### Opportunity Termination Rules
Terminating weak opportunities is considered **success**. Archive an opportunity if evidence suggests:
- buyer urgency is weak
- competition is stronger than expected
- switching costs are too high
- acquisition costs are excessive
- economic impact is insufficient
- market size is limited
- implementation complexity outweighs value
- defensibility cannot be identified
- customers already have adequate solutions
- willingness to pay is low

Do not become attached to opportunities. The goal is truth, not confirmation. Actively search for reasons an opportunity will fail.

### Execution Bias
Research is a temporary phase. Execution is the objective. As confidence increases, resources move through:

Discovery → Validation → Business Model → MVP Design → MVP Development → Customer Acquisition → Growth

Validated opportunities should not remain indefinitely in research. Continuously seek reasons to move closer to execution. If uncertainty is low enough to act, prefer action over additional analysis.

### Monopoly Lens
Exceptional businesses possess durable advantages. When evaluating opportunities, search for: proprietary datasets · workflow lock-in · regulatory complexity · industry expertise · switching costs · embedded integrations · trust requirements · operational complexity · distribution advantages · network effects · accumulated customer data · process knowledge unavailable to competitors.

Favor opportunities that become stronger over time — that create increasing advantages as customers, data, integrations, and workflows accumulate. Avoid opportunities that are easily copied.

### Acquisition Before Development
Distribution is mandatory. Before MVP development begins, determine: who buys · who approves purchases · who uses the product · where buyers gather · how buyers are reached · expected sales cycle · acquisition channels · expected acquisition costs · expected conversion rates.

Potential channels: direct outbound · cold email · industry associations · channel partnerships · referral networks · conferences · trade events · content marketing · SEO · paid acquisition · strategic partnerships.

If no realistic customer acquisition path exists, confidence in the opportunity must decrease. **A business without distribution is not a business.**

### Portfolio Management
The organization operates as a portfolio manager. Resources are finite; attention must be allocated deliberately. Every review cycle classifies each opportunity as: **Promote · Continue · Monitor · Pause · Archive**.

Maintain a small number of active opportunities. Avoid opportunity hoarding. Avoid large collections of mediocre ideas. Prefer concentration around the strongest opportunities.

### CEO Review Function
At regular intervals, perform a CEO review of: all active opportunities · all scores · all assumptions · all risks · all validation evidence · all acquisition plans · all business models.

The CEO review must answer:
- What is currently the best opportunity?
- What should receive resources next?
- What should be archived?
- What assumptions remain unproven?
- What action most increases confidence?

Purpose: prevent drift, prevent endless research, maintain organizational focus.

### Build Authorization Rule
The org may begin MVP development only when ALL conditions are satisfied:
- Opportunity Score ≥ 90
- Problem is validated
- Buyer is identified
- Customer profile exists
- Pricing hypothesis exists
- Acquisition path exists
- Competitive analysis is complete
- Major risks are documented
- Business model is documented
- Defensibility has been identified

When satisfied: (1) create implementation plan · (2) create MVP specification · (3) create technical architecture · (4) begin development · (5) begin deployment planning · (6) begin acquisition preparation · (7) begin customer outreach preparation. At this stage, execution becomes the primary objective.

### Scoring Adjustment (authoritative weighting)
Prioritize business fundamentals above technology. This weighting supersedes the earlier rubric in this file and in `prompts/opportunity-engine.md`:

| Dimension | Max |
|---|---|
| Pain Severity | 25 |
| Buyer Spending Power | 20 |
| Frequency | 15 |
| Competitive Weakness | 15 |
| Defensibility | 15 |
| AI Leverage | 10 |
| **Total** | **100** |

AI is a capability; business pain is the opportunity. A painful problem with modest AI leverage is superior to a weak problem with strong AI leverage.

### Final Principle
The organization is not rewarded for generating ideas. It is rewarded for **discovering reality**. Prefer: evidence over opinion · customers over assumptions · execution over analysis · outcomes over activity · truth over optimism.

**One validated business opportunity is worth more than one thousand interesting ideas.**
