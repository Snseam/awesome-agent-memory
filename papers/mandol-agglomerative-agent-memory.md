---
title: Mandol — Agglomerative Agent Memory for Long-Term Conversations
arxiv_id: 2606.29778
source: arXiv:2606.29778
date: 2026-06
domain: memory
core_claim: |
  Long-term conversational memory can reduce cross-database fragmentation by
  representing raw and abstract memories as structured semantic graphs inside a
  unified memory-native storage and retrieval architecture.
evidence_level: medium
code_available: check
license: check
memory_modules:
  - semantic-dedup
  - retriever-reranker
  - dream-consolidator
status: seed
last_revised: 2026-07-06
urls:
  - https://arxiv.org/abs/2606.29778
---

# Mandol(arXiv 2606.29778)

## Problem statement

Mandol targets an engineering problem in long-term conversational agents:
systems often split memory across vector stores, graph databases, and key-value
records, which adds cross-store I/O and makes correlated clues hard to retrieve
under a token budget.

## Core claim

The paper proposes a unified agglomerative memory architecture with two memory
layers: a basic layer for raw information and an abstract layer that aggregates
basic memories into traceable abstract memories. Both are represented as
structured semantic graphs. Retrieval combines SemanticMap / SemanticGraph
operators, query-adaptive routing, denoising, conflict resolution, and
token-constrained context generation without LLM calls during retrieval.

Reported LoCoMo / LongMemEval accuracy and insertion/retrieval speedups are
paper-origin claims and are not logged as independent reproduction evidence.

## Decision relevance

- `semantic-dedup`:abstract memories need traceability back to raw evidence.
- `retriever-reranker`:hybrid retrieval can be implemented below the LLM layer
  when the memory substrate carries enough structure.
- `dream-consolidator`:agglomeration gives one concrete shape for offline
  consolidation output beyond flat facts.

## Caveats

本地笔记是 seed 质量。需要 full read 后确认 code/data availability, graph schema,
benchmark setup, and whether reported latency includes all storage operations.

## Sources

- arXiv:https://arxiv.org/abs/2606.29778

---

> *Ymem 项目对本笔记决策相关性的具体绑定见
> [`../docs/ymem-binding/relevance-index.md`](../docs/ymem-binding/relevance-index.md)。*
