---
title: "MemoryCPT: An End-to-End Agent Memory Framework for Cost-Performance Trade-off"
arxiv_id: 2608.04843
source: arXiv:2608.04843
date: 2026-08
domain: memory_cost
core_claim: |
  Agent memory pipelines can optimize quality per inference cost by training
  offline memory construction and online query-conditioned context generation
  together.
evidence_level: medium
code_available: check
license: check
memory_modules:
  - ingest-adapter
  - retriever-reranker
  - evaluator-benchmark
status: seed
last_revised: 2026-08-10
urls:
  - https://arxiv.org/abs/2608.04843
---

# MemoryCPT(arXiv 2608.04843)

## Problem statement

Long-horizon agents need useful evidence without passing excessive context to
the downstream model. Hand-crafted memory pipelines and repeated LLM calls can
create redundant context and high inference cost.

## Core claim

MemoryCPT combines Query-agnostic Distillation for compact memory construction
with Query-aware Retrieval and Summarization for online context generation. The
paper introduces Quality per Cost as a metric for answer quality per inference
cost.

Reported LoCoMo / LongMemEval cost-performance gains are author-reported
paper-origin claims.

## Decision relevance

- `ingest-adapter`:offline memory construction can be distilled rather than
  repeatedly generated with full LLM calls.
- `retriever-reranker`:online retrieval and summarization should be optimized
  for cost-aware rewards, not raw similarity only.
- `evaluator-benchmark`:quality-per-cost is a useful reporting shape for memory
  architecture comparisons.

## Caveats

本地笔记是 seed 质量。Need full read for QPC definition, cost accounting, LoRA/GRPO
training setup, and released artifacts.

## Sources

- arXiv:https://arxiv.org/abs/2608.04843

---

> *Ymem 项目对本笔记决策相关性的具体绑定见
> [`../docs/ymem-binding/relevance-index.md`](../docs/ymem-binding/relevance-index.md)。*
