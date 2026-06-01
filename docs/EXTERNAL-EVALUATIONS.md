# EXTERNAL REPO EVALUATIONS

> 31 repos assessed for what claude-research-bot can cannibalize. Verdict per repo + what was actually integrated. Confidence noted (HIGH = read structure/code, MED/LOW = README only). Pass 1 = 19 repos (ADR-007). Pass 2 = +12 repos from the operator's trending list that pass 1 missed (ADR-008) — see bottom section.

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
Real multi-platform plugin (claude/cursor/copilot manifests) that turns a codebase/knowledge-base/docs into an interactive, queryable knowledge graph with token-reduction and an "understandignore" + "business-domain-knowledge" extractor. **Fit:** a *derived* query layer over `research/` + `projects/` once the corpus is large — exactly the role we reserved for a semantic layer (ADR-005, claude-mem). **Caveat:** it's a graph/UI tool aimed at code navigation; our memory is small structured markdown where `grep`/`jq` still wins, and **the repo must stay source of truth** — a graph is an index, never authoritative. **Verdict: PULL some, deferred.** Re-evaluate Understand-Anything vs. claude-mem together when `research/` passes ~100 findings (TASK-0004 scope). **(Pass 2 note:** the lightweight, grep/jq-native version of this is now shipped as `skills/evidence-graph/SKILL.md` — an index over `research/`, never authoritative, honoring the caveat above. The full Understand-Anything plugin stays deferred.)

---

# PASS 2 — 12 additional repos (ADR-008, claude-opus-4-8)

> Pass 1 evaluated 19 repos. The operator's trending list named 31; these 12 were never assessed. Reviewed here, integrated where net-new and on-mission.

## Integrated this pass (✅ in repo now)
| Source | What we took | Where it lives |
|--------|--------------|----------------|
| multica-ai/andrej-karpathy-skills | LLM reasoning-pitfall guardrails (verify > recall; plausible≠verified; smallest defensible claim; re-anchor to question) | `rules/llm-pitfalls.md` |
| Lum1104/Understand-Anything + colbymchenry/codegraph | Knowledge-graph concept, prose-adapted | `skills/evidence-graph/SKILL.md` (also closes the deferred semantic-layer gap, lightweight) |
| (synthesis lesson) | Binding gap-gate: Competitive Weakness <8/15 caps at monitor regardless of total | `skills/opportunity-research` + `templates/OPPORTUNITY.md` |

## Verdicts (all 12)
| Repo | Verdict | Confidence | Note |
|------|---------|-----------|------|
| multica-ai/andrej-karpathy-skills | PULL all | HIGH | Single CLAUDE.md of LLM-pitfall guardrails. Dropped in as `rules/llm-pitfalls.md` — directly hardens research accuracy. |
| Imbad0202/academic-research-skills | PULL one concept | MED | research→write→**review→revise**→finalize pipeline. Our METHODOLOGY has the research+verify+contradiction cycle; the explicit *revise* gate is the only delta — already implicit in anti-slop + self-audit. Concept noted, no new file. |
| rohitg00/agentmemory | PULL concept, defer impl | MED | `remember/recall/forget/session-handoff` verbs. We already have file memory + `COMPRESSED_CONTEXT` + state; their infra (server/MCP/iii workers) is overkill vs ADR-001/005. The recall-before-research discipline is folded into the runtime; a structured recall layer is filed as TASK-0012. |
| mattpocock/skills | NOTHING (style ref) | MED | "Skills for real engineers" — good SKILL authoring conventions, already matched via knowledge-work-plugins format. Reference only. |
| ruvnet/ruflo | PULL concept, defer | LOW | Multi-agent swarm orchestration. Parallel-lane research maps onto the `revfactory/harness` backlog (formalize Researcher/Planner/Builder/Reviewer). Filed into TASK-0012; not adopted whole (swarm infra ≫ single-worker need). |
| anthropics/financial-services | NOTHING now | MED | Official domain pack (financial-services agents/skills). Not a method — a vertical. Mine as *domain reference* IF a finance opportunity scores past the gate; not org infra. |
| decolua/9router | REJECT | HIGH | Free-AI routing through 40+ third-party providers. ToS/quality/provenance risk; sending research context through unknown providers violates evidence integrity + governance (no exfiltration). Off-mission. |
| CloakHQ/CloakBrowser | REJECT (safety) | HIGH | Bot-detection evasion / fingerprint spoofing. **Conflicts with governance** — our ingestion respects robots/ToS and never circumvents access controls. Gated source → cite as access-restricted, don't evade. Rejected on principle. |
| bytedance/UI-TARS-desktop | NOTHING now | MED | GUI/computer-use agent. Possible *building block* if an opportunity needs desktop automation; not org infra (we're headless single-worker). |
| HKUDS/ViMax | NOTHING | HIGH | Agentic video generation — anti-mission (consumer content gen, cf. MoneyPrinterTurbo). |
| AIDC-AI/Pixelle-Video | NOTHING | HIGH | Automated short-video engine — anti-mission. |
| ruvnet/RuView | NOTHING | HIGH | WiFi spatial-sensing / vital-signs. Unrelated to a research org; at most a *sector to research* if it ever scores. |
