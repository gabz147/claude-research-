# DECISIONS — Architecture Decision Log

> **File contract** — Purpose: institutional memory of *why*. Owner: any role making a non-trivial choice. Update rules: append-only; never edit past entries (add a superseding entry instead). Recovery: read to avoid re-litigating settled choices. Format: dated ADR blocks. Lifecycle: permanent.

---
### ADR-001 — Repository is the source of truth (2026-05-31)
**Decision:** All durable state lives in markdown + JSON in this repo. Discord and any vector store are mirrors/observability only.
**Reasoning:** Claude sessions are ephemeral; conversation history is lost. Files survive resets, crashes, reboots.
**Alternatives:** Vector-DB-as-memory (claude-mem) — rejected as *authoritative* store (opaque, lossy, hard to audit). Discord-as-memory — rejected (not queryable/durable enough, rate-limited).
**Tradeoffs:** Files need disciplined updates each cycle. Accepted.
**Consequences:** Every cycle MUST update memory before exit. Bootstrap reads files, nothing else.

---
### ADR-002 — Headless full-auto via `claude -p --dangerously-skip-permissions` (2026-05-31)
**Decision:** Unattended cycles run Claude in print mode with permissions bypassed.
**Reasoning:** True 24/7 operation can't pause for human approval. User explicitly chose full-auto.
**Alternatives:** Scoped allowlist (stalls on unlisted actions); manual trigger (not autonomous).
**Tradeoffs:** Claude can run any tool. Mitigations: project-scoped CWD, lockfile, full logging, Discord alerts, git history for rollback.
**Consequences:** Supervisor must constrain CWD and log everything; human reviews via Discord + git.

---
### ADR-003 — systemd timer as scheduler (2026-05-31)
**Decision:** systemd service + timer drives the loop. Cron provided as fallback.
**Reasoning:** Survives reboot, restart-on-failure semantics, journald logging. `systemctl` present.
**Alternatives:** cron (no crash-restart); long-running daemon (more failure surface).
**Consequences:** Deployment installs a user/system unit; supervisor stays scheduler-agnostic.

---
### ADR-004 — Discord outbound via bot-token REST, not a gateway (2026-05-31)
**Decision:** Notifications are `curl` POSTs to the channels API with the bot token. No persistent gateway for observability.
**Reasoning:** Outbound-only needs no live socket; zero extra processes; trivially reliable across reboots.
**Alternatives:** Webhooks (need per-channel URLs; user supplied a token instead); full discord.py gateway (heavier — deferred to TASK-0006 for slash commands).
**Consequences:** A dedicated 🔬 RESEARCH ORG category with 6 channels was provisioned to isolate this project's output.

---
### ADR-005 — claude-mem deferred, not adopted (2026-05-31)
**Decision:** Do not install claude-mem now; evaluate as an *optional* semantic search layer over `research/` later (TASK-0004).
**Reasoning:** Not installed; vector memory must never be authoritative (ADR-001). File-grep + structured docs cover current needs.
**Consequences:** Recorded in docs/CLAUDE-MEM-EVALUATION.md; revisit when corpus is large enough that grep stops scaling.

---
### ADR-006 — Mission set to Blue-Ocean opportunity discovery + stage-gated execution (2026-05-31)
**Decision:** The org's mission is to discover, validate, and execute a *small number of exceptional B2B business opportunities* (not generate idea lists). Adopted a 0–100 scoring rubric (Pain 20 / Spend 20 / Frequency 15 / AI-Leverage 15 / Competitive-Weakness 15 / Defensibility 15) with stage gates: <70 archive · 70–79 monitor · 80–89 validation project · 90+ execution project. Funnel: discover → validate → business model → MVP → build plan → customer acquisition.
**Reasoning:** Operator wants economic value, not research volume. Codifying the gate forces the org to *stop researching and start building* when confidence is high, avoiding perpetual-research failure mode.
**Alternatives:** Open-ended research (rejected — no destination); pure idea generation (rejected — explicitly a failure mode per MISSION).
**Tradeoffs:** Heavier doctrine + templates; narrower focus. Accepted — focus is the point.
**Consequences:** `prompts/opportunity-engine.md` is canonical doctrine; `runtime.md` advances the funnel (project-advance beats new discovery); `projects/` holds promoted opportunities; `research/OPPORTUNITIES.md` is the scored ledger; `templates/` holds stage artifacts; `#🏆-opportunities` Discord channel added. AI is a capability, never the product — score AI Leverage, don't chase AI.
