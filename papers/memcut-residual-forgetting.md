---
title: MemCut: Every Secret Leaves a Trail in the Long-Term Memory of LLM Agents
arxiv_id: 2610.21405
source: arXiv:2610.21405
date: 2026-10
domain: memory-security
core_claim: |
  Forgetting requests require testing residual disclosure trails as well as
  normal retrieval, because removing a direct memory need not remove evidence
  from which a secret can be recovered.
evidence_level: medium
code_available: check
data_available: check
license: check
memory_modules:
  - security-privacy
  - memorydiff-generator
  - evaluator-benchmark
status: seed
last_revised: 2026-10-19
urls:
  - https://arxiv.org/abs/2610.21405
---

# MemCut: Every Secret Leaves a Trail in the Long-Term Memory of LLM Agents

## Summary

MemCut introduces a user-requested-forgetting benchmark with annotated evidence
trails. It distinguishes native recovery through the normal memory system from
residual recovery when a reader receives surviving, traceable objects directly.

## Evidence Boundary

The reported deletion baselines, recovery rates, and system comparisons are
author-run primary-paper evidence. The benchmark protocol is separately indexed
as [`MemCut`](../benchmarks/memcut.md); no independent reproduction is claimed.

## Decision Relevance

- `security-privacy`: deletion assurance must include derived and indirect
  disclosures, not only a removed record identifier.
- `memorydiff-generator`: a forget diff needs traceable fan-out and auditable
  completion state.
- `evaluator-benchmark`: recovery tests should distinguish system retrieval
  failure from sensitive evidence that remains in the store.

## Caveats

This seed note does not establish the benchmark's external validity, licensing,
or implementation cost. Full review should inspect its trail annotation and
deletion baseline assumptions.

## Sources

- arXiv: https://arxiv.org/abs/2610.21405
