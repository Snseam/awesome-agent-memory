---
title: When Does Execution Provenance Help Agent Memory Retrieval?
arxiv_id: 2609.25913
source: arXiv:2609.25913
date: 2026-09
domain: execution-provenance-memory
core_claim: |
  Execution histories can help memory retrieval when provenance is represented
  and budgeted carefully, but provenance evidence should be evaluated against
  retrieval cost and completion quality.
evidence_level: medium
code_available: check
license: check
memory_modules:
  - retriever-reranker
  - evaluator-benchmark
status: seed
last_revised: 2026-09-28
urls:
  - https://arxiv.org/abs/2609.25913
---

# When Does Execution Provenance Help Agent Memory Retrieval?(arXiv 2609.25913)

## Problem statement

Agents accumulate execution traces, tool calls, and intermediate artifacts, but
it is not always clear when that provenance improves later memory retrieval
enough to justify the added context and search cost.

## Core claim

The paper is relevant as a retrieval/evaluation pressure: execution provenance
should be treated as evidence with a budget, not as unlimited context. This seed
note records the question and source, while leaving reported results for a full
read.

## Decision relevance

- `retriever-reranker`: execution traces need selection and completion metrics,
  not blind replay.
- `evaluator-benchmark`: provenance benefit should be measured against token,
  latency, and task-completion budgets.

## Caveats

本地笔记是 seed 质量。需要 full read 后 confirm task domain, provenance
representation, metrics, and whether the agent-memory framing is central rather
than adjacent.

## Sources

- arXiv:https://arxiv.org/abs/2609.25913

---

> *Ymem 项目对本笔记决策相关性的具体绑定见
> [`../docs/ymem-binding/relevance-index.md`](../docs/ymem-binding/relevance-index.md)。*
