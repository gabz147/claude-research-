# EXTERNAL REPO EVALUATIONS

> 19 repos assessed for what claude-research-bot can cannibalize. Verdict per repo + what was actually integrated. Confidence noted (HIGH = read structure/code, MED/LOW = README only).

## Integrated this pass (✅ in repo now)
| Source | What we took | Where it lives |
|--------|--------------|----------------|
| hardikpandya/stop-slop | Anti-slop prose rules (phrases/structures to cut) | `skills/anti-slop/SKILL.md` |
| microsoft/markitdown | Doc→markdown ingestion (installed v0.1.6) | `scripts/ingest_doc.sh` + `research/sources/` |
| anthropics/knowledge-work-plugins | SKILL.md packaging format (frontmatter + MUST-pass checklist) | `skills/opportunity-research/SKILL.md` |
| affaan-m/ECC | `deep-research` + `market-research` + `verification-loop` patterns | folded into `skills/opportunity-research` |
| microsoft/agent-governance-toolkit | OWASP Agentic Top-10 checklist + kill switch + sandbox backlog | `docs/GOVERNANCE.md` + `state/PAUSED` switch in supervisor |
| Chachamaru127/claude-code-harness | `.claude/rules/*` governance pattern (self-audit, impl-quality, commit-safety) | `rules/` |

## Verdicts (all 19)
| Repo | Verdict | Confidence | Note |
|------|---------|-----------|------|
| anthropics/knowledge-work-plugins | PULL some (HIGH value) | HIGH | Official. 18 role plugins (finance, sales, operations, enterprise-search, small-business…) — mine for B2B research skills + MCP connectors. SKILL format adopted. |
| affaan-m/ECC | PULL some | MED→HIGH | Real skills library (`.agents/skills/`): deep-research, market-research, investor-materials, investor-outreach, verification-loop, strategic-compact, product-capability. Star count looks inflated; **content is genuinely useful**. Mine more skills next (investor-outreach → customer-acquisition mode). |
| Chachamaru127/claude-code-harness | PULL some | HIGH | Mature Plan→Work→Review loop + dated memory-archive + 22 `.claude/rules/`. Borrowed the rules pattern; consider their review-gate next. |
| microsoft/agent-governance-toolkit | PULL some | HIGH | Enterprise Python framework — too heavy to adopt whole. Took the OWASP Agentic Top-10 checklist + sandboxing ideas (the real win for our full-auto risk). |
| hardikpandya/stop-slop | PULL all | HIGH | Tiny skill, dropped in. |
| microsoft/markitdown | PULL (tool) | HIGH | Installed; powers ingestion. |
| run-llama/liteparse | PULL (tool, alt) | MED | Faster PDF/OCR than markitdown. Not installed — swap in if markitdown struggles on scanned PDFs. Backlog. |
| revfactory/harness | PULL some | HIGH | `skills/harness/references/{agent-design-patterns,orchestrator-template,team-examples}` — use when we formalize Researcher/Planner/Builder/Reviewer as real sub-agents. Backlog. |
| Lum1104/Understand-Anything | PULL some (optional) | MED | Knowledge-graph plugin over codebases/docs. See deep-dive below. Defer until corpus grows. |
| cursor/plugins | PULL one concept | MED | `continual-learning` plugin = transcript→memory-bullet distillation. Informs COMPRESSED_CONTEXT. Concept only. |
| colbymchenry/codegraph | NOTHING now | MED | Code KG; codebase too small. Revisit in execution mode. |
| Leonxlnx/taste-skill | NOTHING now | MED | Frontend taste/anti-slop. No frontend yet; useful for MVP UIs later. |
| dograh-hq/dograh | NOTHING (infra) | HIGH | Voice-AI platform — a potential *building block* IF a voice opportunity scores ≥80, not org infra. |
| ogulcancelik/herdr | NOTHING | MED | Terminal agent multiplexer; we use systemd single-worker. Optional manual-obs only. |
| mukul975/Anthropic-Cybersecurity-Skills | NOTHING | MED | Tangential; at most VM-hardening reference. |
| iii-hq/iii | NOTHING | LOW | Service-integration runtime; overkill vs files+Discord. |
| rohitg00/ai-engineering-from-scratch | NOTHING | HIGH | A course (473 lessons). Reference reading only. |
| harry0703/MoneyPrinterTurbo | NOTHING | HIGH | AI short-video gen — explicitly anti-mission. |
| p-e-w/heretic | NOTHING | HIGH | LLM censorship removal — off-mission, risky. |

## Deep-dive: affaan-m/ECC (caveat resolved → upgraded)
Initial doubt was the absurd star count (~200k → likely inflated/botted). **But the substance is real:** `.agents/skills/` holds ~35 well-structured skills with SKILL.md + per-provider `agents/openai.yaml`. Several map directly onto our funnel: `deep-research` (multi-source cited research via firecrawl/exa), `market-research`, `verification-loop` (re-derive conclusion from evidence), `investor-materials`/`investor-outreach` (our business-model + acquisition modes), `strategic-compact` (context compression — relevant to COMPRESSED_CONTEXT). **Verdict: PULL some, ignore the vanity metrics.** Don't adopt the harness wholesale; lift individual skill patterns. Next: study `investor-outreach` + `strategic-compact` for our acquisition + handoff layers.

## Deep-dive: Lum1104/Understand-Anything (caveat resolved → defer)
Real multi-platform plugin (claude/cursor/copilot manifests) that turns a codebase/knowledge-base/docs into an interactive, queryable knowledge graph with token-reduction and an "understandignore" + "business-domain-knowledge" extractor. **Fit:** a *derived* query layer over `research/` + `projects/` once the corpus is large — exactly the role we reserved for a semantic layer (ADR-005, claude-mem). **Caveat:** it's a graph/UI tool aimed at code navigation; our memory is small structured markdown where `grep`/`jq` still wins, and **the repo must stay source of truth** — a graph is an index, never authoritative. **Verdict: PULL some, deferred.** Re-evaluate Understand-Anything vs. claude-mem together when `research/` passes ~100 findings (TASK-0004 scope).
