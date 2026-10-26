---
title: "MemCodex: Self-Programming Hierarchical Memory for Language Agents"
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
last_revised: 2026-10-26
urls:
  - https://arxiv.org/abs/2609.39765
---

# MemCodex: Self-Programming Hierarchical Memory for Language Agents

## Summary

MemCodex describes a self-programming hierarchical memory system. Instead of
using one fixed memory pipeline, it evolves executable programs that combine
summary, relation, skill, and latent-memory operations.

## Method / Architecture

The abstract describes rewriting how individual layers are constructed,
indexed, retrieved, and routed, including their cross-layer composition.
Queries inspect the hierarchy from coarse to fine and can reach the original
history when needed. Treating these programs as versioned, inspectable policy
artifacts is a maintainer inference to evaluate, not an established audit or
rollback feature of the paper.

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

## Source Check

Canonical title and abstract rechecked on 2026-10-26; this remains an
abstract-based seed note, not a full-paper or artifact review. The stable
filename and arXiv identity are unchanged.

## Sources

- arXiv: https://arxiv.org/abs/2609.39765
