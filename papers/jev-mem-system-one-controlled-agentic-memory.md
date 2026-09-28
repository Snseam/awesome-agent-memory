---
title: Jev-Mem - System-One-Controlled Agentic Memory for Efficient AI Agents
arxiv_id: 2609.23986
source: arXiv:2609.23986
date: 2026-09
domain: efficient-agentic-memory-control
core_claim: |
  A fast controller can decide memory typing, routing, and budget allocation so
  agents use long-term memory without spending full deliberative reasoning on
  every memory operation.
evidence_level: medium
code_available: check
license: check
memory_modules:
  - retriever-reranker
  - evaluator-benchmark
status: seed
last_revised: 2026-09-28
urls:
  - https://arxiv.org/abs/2609.23986
---

# Jev-Mem(arXiv 2609.23986)

## Problem statement

Long-term memory improves agents only when the read/write path is cheap enough
to use often. Jev-Mem is relevant because it makes memory control itself a fast
routing and budget-allocation problem.

## Core claim

The paper frames memory use as controlled by a lightweight system-one-style
component that routes memory operations and budget. This note records the
efficiency/control design pressure, not an independently reproduced quality or
latency result.

## Decision relevance

- `retriever-reranker`: memory routing can be a separate fast policy before
  expensive retrieval or synthesis.
- `evaluator-benchmark`: memory quality should be reported with cost, latency,
  and route/budget decisions.

## Caveats

本地笔记是 seed 质量。需要 full read 后 confirm the controller design, the exact
method name in the paper, benchmark setup, cost accounting, and code release.

## Sources

- arXiv:https://arxiv.org/abs/2609.23986

---

> *Ymem 项目对本笔记决策相关性的具体绑定见
> [`../docs/ymem-binding/relevance-index.md`](../docs/ymem-binding/relevance-index.md)。*
