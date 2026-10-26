---
title: MACE: Memory-Agent Co-Evolution with Adaptive Memory Graphs for Multi-Agent Systems
arxiv_id: 2609.21533
source: arXiv:2609.21533
date: 2026-09
domain: memory
core_claim: |
  Multi-agent procedures can be retained and improved by organizing functional
  memory units and adapting retrieval and presentation from execution feedback.
evidence_level: medium
code_available: check
data_available: check
license: check
memory_modules:
  - semantic-dedup
  - retriever-reranker
  - memorydiff-generator
  - evaluator-benchmark
status: seed
last_revised: 2026-09-21
urls:
  - https://arxiv.org/abs/2609.21533
---

# MACE

## Problem statement

Multi-agent systems produce procedures whose prerequisites, actions, outputs,
and repair paths must remain connected if later agents are to reuse them.

## Core claim

MACE organizes procedural experience as functional memory units in a graph with
support, conflict, and repair relations. Its loop selects units and relations
under a memory budget, chooses an instruction or checklist presentation, and
updates unit and relation scores from task outcomes.

The abstract reports results across eight benchmarks. Those numbers remain
paper-origin evidence and are not an independent reproduction.

## Decision relevance

- `semantic-dedup`: support, conflict, and repair relations provide explicit
  structure for merging and invalidating procedural memories.
- `retriever-reranker`: retrieval can select a connected subgraph rather than
  isolated top-k records.
- `memorydiff-generator`: execution feedback can explain why a memory unit or
  relation changed.

## Caveats

This is a seed note. The full paper, benchmark identities, implementation, and
artifact license still need review.

## Sources

- arXiv: https://arxiv.org/abs/2609.21533
