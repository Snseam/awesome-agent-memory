---
title: "LeanMem: Simple and Efficient Long-Term Memory for LLM Agents"
arxiv_id: 2608.03463
source: arXiv:2608.03463
date: 2026-08
domain: memory
core_claim: |
  Long-term memory should route dialogue content into profile, event, or
  source-grounded record memory based on compressibility, dynamics, and fidelity
  requirements instead of using one uniform summarization pipeline.
evidence_level: medium
code_available: supplementary
license: check
memory_modules:
  - ingest-adapter
  - memorydiff-generator
  - retriever-reranker
  - evaluator-benchmark
status: seed
last_revised: 2026-08-10
urls:
  - https://arxiv.org/abs/2608.03463
---

# LeanMem(arXiv 2608.03463)

## Problem statement

LeanMem targets a common memory-system overgeneralization: stable profile facts,
dynamic events, and source-grounded records should not all be compressed,
updated, and retrieved through the same path.

## Core claim

The framework filters low-value content, stores useful segments as profile,
event, or source-grounded memory, updates only the dynamic event lane during
maintenance, and allocates retrieval budgets according to the query's evidence
needs.

Reported LoCoMo / LongMemEval-S accuracy, construction-cost, token, and latency
results are author-reported paper-origin claims.

## Decision relevance

- `ingest-adapter`:classify incoming content by stability and fidelity needs.
- `memorydiff-generator`:avoid reconsolidating stable or immutable memories when
  only event memories are evolving.
- `retriever-reranker`:query-specific budgets should be typed by evidence need.

## Caveats

本地笔记是 seed 质量。The arXiv page says code and datasets are in supplementary
materials, but license and reproducibility have not been checked.

## Sources

- arXiv:https://arxiv.org/abs/2608.03463

---

> *Ymem 项目对本笔记决策相关性的具体绑定见
> [`../docs/ymem-binding/relevance-index.md`](../docs/ymem-binding/relevance-index.md)。*
