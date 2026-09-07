---
title: Agent Zero Memory — Provenance-Aware Long-Term Memory for LLM Agents
arxiv_id: 2608.29606
source: arXiv:2608.29606
date: 2026-08
domain: provenance-memory
core_claim: |
  Long-term agent memory should preserve source provenance across parallel
  episodic, graph, and documentary memory systems, and answers should cite only
  evidence actually opened by the reader.
evidence_level: medium
code_available: check
license: check
memory_modules:
  - ingest-adapter
  - retriever-reranker
  - policy-privacy
  - evaluator-benchmark
status: seed
last_revised: 2026-09-07
urls:
  - https://arxiv.org/abs/2608.29606
---

# Agent Zero Memory(arXiv 2608.29606)

## Problem statement

Most memory systems choose one main representation, such as a fact store, vector
index, or knowledge graph. Agent Zero Memory argues that this creates blind
spots when an agent must remember conversations, files, and connected sources
with durable provenance.

## Core claim

The paper presents three parallel memory systems: episodic Memory Events,
associative entity-event knowledge graph, and citation-locked Hierarchical
Documentary Memory. Retrieval uses an intent gate, source routing, and concurrent
agentic searches over the three systems. The abstract emphasizes a reading
discipline where learned items carry origin, timestamp, and evidence pointers.

Reported LongMemEval/LoCoMo numbers and cost-latency comparisons are
author-reported paper results and should not be treated as independent
benchmark evidence.

## Decision relevance

- `ingest-adapter`: source type and evidence pointer should survive ingestion.
- `retriever-reranker`: parallel memory substrates can return complementary
  evidence under one answer-time confidence.
- `policy-privacy`: citation locks and abstention are governance mechanisms for
  source-bound recall.

## Caveats

本地笔记是 seed 质量。需要 full read 后 confirm source-router behavior, benchmark
setup, provenance model, and whether code/data are available.

## Sources

- arXiv:https://arxiv.org/abs/2608.29606

---

> *Ymem 项目对本笔记决策相关性的具体绑定见
> [`../docs/ymem-binding/relevance-index.md`](../docs/ymem-binding/relevance-index.md)。*
