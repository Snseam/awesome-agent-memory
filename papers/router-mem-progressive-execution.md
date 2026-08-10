---
title: "Stop When Memory Suffices: Evidence-Conditioned Progressive Execution for LLM Agents"
arxiv_id: 2608.01285
source: arXiv:2608.01285
date: 2026-08
domain: memory
core_claim: |
  Long-horizon agent memory can reduce online latency by routing between
  low-cost retrieved evidence and deeper memory execution only when the evidence
  is insufficient.
evidence_level: medium
code_available: check
license: check
memory_modules:
  - retriever-reranker
  - evaluator-benchmark
  - dream-consolidator
status: seed
last_revised: 2026-08-10
urls:
  - https://arxiv.org/abs/2608.01285
---

# Router-Mem(arXiv 2608.01285)

## Problem statement

Many long-term memory systems trade off cheap compressed recall against deeper
trajectory analysis. Router-Mem frames this as an online routing problem: decide
whether retrieved evidence is already sufficient before spending more latency on
expanded memory execution.

## Core claim

The paper introduces evidence-conditioned progressive execution. A shared
retrieval prefix gathers evidence, a sufficiency router predicts whether the
agent can stop early, and harder queries reuse the same hits for deeper memory
block expansion and aggregation.

Reported AMA-Bench / BEAM scores and latency reductions are author-reported
paper-origin claims. This seed note records the routing pattern and cost/quality
pressure, not independent reproduction evidence.

## Decision relevance

- `retriever-reranker`:retrieval output should carry enough evidence metadata
  for a router to decide whether escalation is needed.
- `evaluator-benchmark`:memory evaluation should report latency alongside
  answer quality, especially when comparing full memory execution to early exit.
- `dream-consolidator`:deep analysis can be a fallback path rather than the
  default online behavior for every query.

## Caveats

本地笔记是 seed 质量。需要 full read 后确认 router supervision, failure cases,
benchmark splits, and whether code/data are available.

## Sources

- arXiv:https://arxiv.org/abs/2608.01285

---

> *Ymem 项目对本笔记决策相关性的具体绑定见
> [`../docs/ymem-binding/relevance-index.md`](../docs/ymem-binding/relevance-index.md)。*
