---
title: "Accept Changes, Reject Attacks: Robust Memory Management for LLM Agents"
arxiv_id: 2610.41056
source: arXiv:2610.41056
date: 2026-10-29
domain: security-privacy
core_claim: |
  Robust memory management must handle outdated facts and planted attacks
  together; the paper evaluates this with evidence-conditioned accuracy.
evidence_level: medium
code_available: check
data_available: check
license: check
memory_modules:
  - memorydiff-generator
  - policy-privacy
  - evaluator-benchmark
status: seed
last_revised: 2026-11-16
urls:
  - https://arxiv.org/abs/2610.41056
---

# Accept Changes, Reject Attacks: Robust Memory Management for LLM Agents

## Summary

The paper frames two opposing memory-management failures: retaining facts that
have become stale and storing planted passages or instructions. It proposes
evidence-conditioned accuracy (ECA), which checks whether selected records are
complete, current, and free of attacks alongside answer correctness.

## Evidence Boundary

The method and ECA definition are primary-paper claims. The abstract reports
that existing systems are not more robust than an untuned manager on the test
sets; this note preserves that result as paper-origin evidence only.

## Decision Relevance

- `memorydiff-generator`: stale-fact replacement and attack rejection are
  competing write decisions that need explicit state transitions.
- `policy-privacy`: memory content must be treated as data with provenance,
  not as authority to change the agent policy.
- `evaluator-benchmark`: ECA is a useful companion to answer-only scoring.

## Caveats

No independent reproduction, artifact audit, or full setup normalization was
performed.

## Sources

- arXiv: https://arxiv.org/abs/2610.41056
