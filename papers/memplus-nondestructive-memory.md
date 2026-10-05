---
title: Mem++: Non-Destructive Memory for Long-Horizon Agents
arxiv_id: 2610.02002
source: arXiv:2610.02002
date: 2026-10
domain: memory
core_claim: |
  Keeping dated source documents intact and selecting evidence at read time can
  reduce irreversible information loss in organizational agent memory.
evidence_level: medium
code_available: check
data_available: check
license: check
memory_modules:
  - ingest-adapter
  - memorydiff-generator
  - retriever-reranker
  - evaluator-benchmark
status: seed
last_revised: 2026-10-05
urls:
  - https://arxiv.org/abs/2610.02002
---

# Mem++

## Summary

Mem++ proposes a non-destructive memory design for organizational and
long-horizon use cases. It keeps whole dated documents available and performs
selection at read time rather than repeatedly replacing the underlying source
with a lossy summary.

## Method / Architecture

The architecture separates source preservation from retrieval-time contextual
selection. That boundary is relevant to systems that need auditability,
historical comparison, and reversible memory updates.

## Evidence Boundary

The paper evaluates on OrgMemBench, LoCoMo, and LongMemEval-S. Results and
comparisons remain paper-origin evidence, and this note does not promote them
to an independent leaderboard.

## Decision Relevance

- `ingest-adapter`: preserve dated source artifacts and provenance through the
  write path.
- `memorydiff-generator`: treat summaries or derived records as replaceable
  artifacts rather than destructive mutations of source memory.
- `retriever-reranker`: make read-time selection explicit and measurable.

## Caveats

This is a seed note. The storage cost, indexing strategy, artifact release,
and exact relationship between whole documents and derived memories need
verification before implementation choices are made.

## Sources

- arXiv: https://arxiv.org/abs/2610.02002
