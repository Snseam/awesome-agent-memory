---
title: MOSAIC — Accurate and Efficient Long-Term Memory for LLM Agents
arxiv_id: 2607.16211
source: arXiv:2607.16211
date: 2026-05
first_seen: 2026-07
date_note: "arXiv page dateline says submitted 2026-05-15; identifier is 2607.*"
domain: memory
core_claim: |
  Long-term agent memory can combine entity-typed graph storage, hash-accelerated
  retrieval, and save-time conflict detection to preserve relational context
  while reducing retrieval latency.
evidence_level: medium
code_available: check
license: check
memory_modules:
  - semantic-dedup
  - retriever-reranker
  - memorydiff-generator
  - evaluator-benchmark
status: seed
last_revised: 2026-07-27
urls:
  - https://arxiv.org/abs/2607.16211
---

# MOSAIC(arXiv 2607.16211)

## Problem statement

Flat memory stores can lose relational context, and expensive LLM-based
classification can make retrieval impractical for latency-sensitive agents.
Contradiction handling is also often postponed until answer time.

## Core claim

MOSAIC combines entity-typed graph storage, locality-sensitive-hash retrieval,
and active conflict detection at save time. Reported LoCoMo, HaluMem, clinical
guideline, and latency results are paper-origin claims only.

## Decision relevance

- `semantic-dedup`:save-time conflict detection should compare new facts against
  neighboring graph context, not only exact duplicates.
- `retriever-reranker`:hash-accelerated routing is a practical alternative to
  repeated LLM classification in hot retrieval paths.
- `memorydiff-generator`:conflict detection should produce update/delete
  candidates with evidence.

## Caveats

This is a seed note. Full read should verify code availability, graph schema,
conflict-injection setup, and whether latency measurements include all storage
operations.
The note date follows the arXiv page dateline; this was first added to the local
radar in 2026-07 despite the May submission date.

## Sources

- arXiv:https://arxiv.org/abs/2607.16211

---

> *Ymem 项目对本笔记决策相关性的具体绑定见
> [`../docs/ymem-binding/relevance-index.md`](../docs/ymem-binding/relevance-index.md)。*
