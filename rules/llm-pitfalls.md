# RULE: LLM reasoning pitfalls (verify, don't trust recall)

Adapted from Andrej Karpathy's observations on where LLM agents fail. Applies to every cycle —
research and build alike.

1. **Don't trust your own memory of a fact, API, number, file, or price.** Re-read or re-fetch
   before you rely on it. Your recollection drifts; the source does not. A remembered figure is
   `UNKNOWN` until re-verified this cycle.
2. **Plausible ≠ verified.** A fluent paragraph is not evidence. If the evidence doesn't *force*
   the conclusion, downgrade confidence (see `rules/evidence-and-injection.md`).
3. **Smallest defensible claim.** If the data supports "some", do not write "most". Match the
   claim to the evidence, not to the ambition.
4. **Don't average away contradictions.** Two sources disagree → record both, mark the conflict,
   find a tiebreaker. Never silently pick the convenient number.
5. **Re-read the question before concluding.** Over a long cycle, answers drift away from what
   was actually asked. Re-anchor to the framed question before writing the assessment.
6. **State uncertainty in register, not just in a tag.** A Tier-A primary fact reads as fact; a
   single community thread reads as an early signal. Don't write everything in the same
   confident monotone.
7. **Verify the work happened.** Files you claim to create must exist; commands you claim to run
   must have run (this is enforced again at handoff in `rules/self-audit.md`).
