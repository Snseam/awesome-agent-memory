---
title: APDMem: Adaptive Progressive Disclosure Memory for Long-Horizon Agents
arxiv_id: 2610.02472
source: arXiv:2610.02472
date: 2026-10
domain: memory
core_claim: |
  Progressive disclosure can expose hierarchical memory detail only when a
  long-horizon agent needs it, reducing routine context access.
evidence_level: medium
code_available: check
data_available: check
license: check
memory_modules:
  - retriever-reranker
  - dream-consolidator
  - evaluator-benchmark
status: seed
last_revised: 2026-10-05
urls:
  - https://arxiv.org/abs/2610.02472
---

# APDMem

## Summary

APDMem proposes adaptive progressive disclosure for hierarchical long-term
memory. A controller decides when to stay at a compact representation and when
to drill into more detailed memory.

## Method / Architecture

The paper frames memory access as a cost-fidelity decision: coarse summaries
are the default, while deeper retrieval is activated for questions that need
it. This is related to, but distinct from, ordinary top-k retrieval because
the hierarchy controls how much memory detail is opened.

## Evidence Boundary

The paper reports LongMemEval-based evaluation and states that it was accepted
to the EMNLP 2026 Industry Track. The reported access-rate and quality results
are author-reported paper evidence, not independent reproduction.

## Decision Relevance

- `retriever-reranker`: progressive disclosure is a candidate retrieval policy.
- `dream-consolidator`: hierarchy design should preserve drill-down paths and
  provenance rather than only storing flattened summaries.
- `evaluator-benchmark`: access cost should be recorded alongside answer
  quality when testing hierarchical memory.

## Caveats

This seed note overlaps with other hierarchical and just-in-time memory work.
Exact controller training, release artifacts, and score comparability need a
full read before treating it as a distinct implementation baseline.

## Sources

- arXiv: https://arxiv.org/abs/2610.02472
