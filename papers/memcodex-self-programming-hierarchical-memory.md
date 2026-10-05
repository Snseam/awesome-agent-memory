---
title: MemCodex: Self-Programming Hierarchical Memory for Agents
arxiv_id: 2609.39765
source: arXiv:2609.39765
date: 2026-09
domain: memory
core_claim: |
  An agent can evolve executable memory programs that coordinate hierarchical
  summaries, relations, skills, and latent memory for changing workloads.
evidence_level: medium
code_available: check
data_available: check
license: check
memory_modules:
  - dream-consolidator
  - retriever-reranker
  - evaluator-benchmark
status: seed
last_revised: 2026-10-05
urls:
  - https://arxiv.org/abs/2609.39765
---

# MemCodex

## Summary

MemCodex describes a self-programming hierarchical memory system. Instead of
using one fixed memory pipeline, it evolves executable programs that combine
summary, relation, skill, and latent-memory operations.

## Method / Architecture

The proposed memory program acts as a workload-adaptive controller over
multiple memory forms. This makes the policy itself a potentially persistent
artifact that can be inspected, versioned, and evaluated.

## Evidence Boundary

The paper introduces MemArena and reports paper-origin experiments. The work is
marked as in progress on the source page; results, code, data, and training
costs are not independently verified.

## Decision Relevance

- `dream-consolidator`: consolidation may produce executable policy artifacts,
  not only text summaries.
- `retriever-reranker`: memory selection policy is part of the evaluated
  system.
- `evaluator-benchmark`: adaptive memory programs need workload transfer and
  regression tests, not only one static benchmark score.

## Caveats

This is an early seed note with overlap with programmatic and hierarchical
memory lines. Treat it as a design signal until artifacts and a full protocol
read are available.

## Sources

- arXiv: https://arxiv.org/abs/2609.39765
