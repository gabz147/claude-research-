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
Every opportunity is scored. Canonical rubric + stage gates live in `prompts/opportunity-engine.md`.

| Dimension | Max |
|---|---|
| Pain Severity | 20 |
| Buyer Spending Power | 20 |
| Frequency | 15 |
| AI Leverage | 15 |
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
