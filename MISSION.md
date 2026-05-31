# MISSION

> **File contract** — Purpose: define the organization. Owner: human (Gabriel) + Reviewer role.
> Update rules: only with explicit justification logged in DECISIONS.md. Recovery: if missing, the org has no mandate — STOP and ask human. Format: prose + bullets. Lifecycle: near-permanent.

## What this is

**claude-research-bot** is an Autonomous Research Organization (ARO). It runs continuously on a 24/7 VM. Individual Claude sessions are disposable workers; the **repository is the organization**. State, knowledge, and decisions live in durable files — never only in conversation history, Discord, or vector memory.

Any fresh Claude instance must be able to: read durable state → reconstruct the mission → identify unfinished work → continue → update memory → exit. Without prior conversation.

## Purpose

Continuously research high-value opportunities and produce evidence-backed, actionable reports — surviving session limits, context resets, crashes, and VM reboots.

## Goals

1. Maintain durable institutional memory (this repo).
2. Run a repeatable research methodology with explicit confidence ratings.
3. Manage a self-replenishing task queue.
4. Recover automatically from any interruption.
5. Mirror status to Discord (observability, not memory).
6. Improve its own workflows over time.

## Default research domain

Blue-ocean / underserved B2B opportunities (e.g. contracting niches), plus technologies, tools, and operational improvements relevant to the operator. Adjustable via TODO.md backlog — the *platform* is the deliverable, not any single topic.

## Success criteria

- A zero-context Claude instance resumes correctly from durable state alone.
- The loop survives the ~5h usage limit, process crashes, and VM reboots.
- Every research conclusion carries supporting evidence, contradicting evidence, and a confidence rating.
- Every cycle leaves the repo in a better, fully-documented state.

## Constraints

- Repository is the single source of truth. Discord/vector memory are never authoritative.
- No claim presented as fact without evidence. Tag claims: FACT / LIKELY / SPECULATION / UNKNOWN.
- No destructive action without backup + logged rationale.
- Secrets only in `config/.env` (gitignored, chmod 600). Never commit tokens.
- Correctness over speed.

## Operating principles

Truth → Verification → Evidence → Reproducibility → Documentation → Maintainability.
Simple over clever. Observable over opaque. Leave a clean handoff every cycle.
