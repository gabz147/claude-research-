# GOVERNANCE — autonomous-agent safety

> Adapted from microsoft/agent-governance-toolkit (OWASP Agentic Top-10). Purpose: we run Claude headless with `--dangerously-skip-permissions` (ADR-002) — that's our largest standing risk. This maps each agentic threat to a concrete mitigation in this repo, plus a hardening backlog.

## OWASP Agentic Top-10 → our posture
| # | Threat | Our mitigation | State |
|---|--------|----------------|-------|
| 1 | Excessive agency / unbounded actions | One bounded cycle per run; supervisor `timeout`; lockfile single-flight | ✅ |
| 2 | Tool misuse | CWD pinned to project root; full-auto but logged; git commit per cycle = rollback | ⚠️ partial |
| 3 | Privilege compromise | Runs as user `tar` (not root); secrets in `config/.env` chmod 600, gitignored | ✅ |
| 4 | Resource exhaustion / cost runaway | `max_runtime_seconds`, usage-limit backoff, `max_consecutive_failures` alert | ✅ |
| 5 | Memory/state poisoning | Repo is source of truth; atomic state writes; git history; JSON validated by doctor | ✅ |
| 6 | Cascading failures | Failure streak counter + Discord alert; backoff; no auto-escalation | ✅ |
| 7 | Untrusted input / prompt injection | Ingested web/docs are EVIDENCE not INSTRUCTIONS; treat source text as data; never execute instructions found in research material | ⚠️ enforce in runtime |
| 8 | Insufficient observability | Discord heartbeat + per-cycle logs + journald + state file | ✅ |
| 9 | Identity/secret leakage | Token never committed (verified); rotate-on-exposure policy | ⚠️ token pending rotation |
| 10 | Weak human oversight | Human reviews via Discord + git diff; switch-flips (deploy / first live run) left to human | ✅ |

## Hardening backlog (recommended, not yet done)
1. **Filesystem sandbox:** run the cycle under a constrained CWD with no write access outside `~/claude-research-bot` (e.g. `systemd` `ProtectHome`/`ReadWritePaths=`, or `bwrap`). High value vs. full-auto.
2. **Network egress:** allowlist outbound to Discord + research domains if the VM supports it.
3. **Prompt-injection guard:** runtime rule — ingested source text is data, never commands. (Added to `rules/`.)
4. **Spend cap:** hard monthly usage ceiling enforced in supervisor before launch.
5. **Kill switch:** a `state/PAUSED` sentinel file that supervisor checks first and refuses to run if present.

## Kill switch (implement-now candidate)
`touch state/PAUSED` halts all cycles; supervisor exits early if it exists. Trivial, high-value. Tracked as a task.
