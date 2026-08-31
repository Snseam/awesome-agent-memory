---
title: GraphMemix — Query-Aware Evidence Forests for Long-Term Multimodal Agent Memory
arxiv_id: 2608.26983
source: arXiv:2608.26983
date: 2026-08
domain: graph
core_claim: |
  Multimodal long-term memory should assemble query-aware evidence subgraphs
  instead of relying on question-agnostic summaries or naive embedding matches.
  GraphMemix optimizes an evidence forest under a budget to balance accuracy,
  redundancy, and lifecycle cost.
evidence_level: medium
code_available: yes
license: check
memory_modules:
  - retriever-reranker
  - semantic-dedup
  - evaluator-benchmark
status: seed
last_revised: 2026-08-31
urls:
  - https://arxiv.org/abs/2608.26983
  - https://github.com/ligeng0197/graphmemix
---

# GraphMemix(arXiv 2608.26983)

## Problem statement

多模态长期记忆很容易在两端失效:离线 summary 成本高且忽略查询,embedding 相似检索又会
带来不完整、冗余或冲突的上下文。需要一种能保留图关系、控制证据预算、并按 query 激活的
memory assembly 方法。

## Core claim

GraphMemix 把 memory organization 建模为 query-aware evidence-forest construction。
它先构造 candidate graph,再估计 direct memory support、anchor-conditioned relation
verification 和 activation cost,最后在最大 evidence budget 下选择可靠的 forest-format
memory context。

## Decision relevance

- `retriever-reranker`:应把低相似但互补的证据纳入候选,而不是只靠 embedding top-k。
- `semantic-dedup`:冗余和冲突 suppression 需要显式关系验证,不能只做文本去重。
- `evaluator-benchmark`:多模态 memory 要同时测 accuracy、lifecycle cost 和 context budget。

## Caveats

本地笔记是 seed 质量。尚未 full read PDF、复核项目页、code license、四个 benchmark 的
设置和多模态数据来源。Pareto frontier 只能作为 author-reported paper-origin claim。

## Sources

- arXiv:https://arxiv.org/abs/2608.26983
- Code:https://github.com/ligeng0197/graphmemix

---

> *Ymem 项目对本笔记决策相关性的具体绑定见
> [`../docs/ymem-binding/relevance-index.md`](../docs/ymem-binding/relevance-index.md)。*
