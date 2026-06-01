# OPPORTUNITY LEDGER → moved to the registry

The authoritative record of every opportunity is now **`research/opportunity_registry.json`**
(managed by `scripts/registry.sh`), with the human-readable map generated at **`research/INDEX.md`**.

**Do not hand-maintain a table here.** To record or change an opportunity:

```
scripts/registry.sh search "<terms>"     # dedup checkpoint FIRST (rules/research-dedup.md)
scripts/registry.sh add --name "..." --industry "..." --problem "..." --score N --status DISCOVERED --reasoning "..."
scripts/registry.sh update <OPP-id> --status <STATE> --score N
scripts/registry.sh reindex              # regenerate research/INDEX.md
```

Scoring + gates: `prompts/opportunity-engine.md`. Dedup policy: `rules/research-dedup.md`.
