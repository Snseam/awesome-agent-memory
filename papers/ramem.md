---
title: RaMem — Contextual Reinstatement for Long-term Agentic Memory
arxiv_id: 2606.22844
source: arXiv:2606.22844
date: 2026-06
domain: memory
core_claim: |
  Long-term agent memory fails when compressed fragments lose the conditions
  that made them valid. RaMem reinstates episodic context around retrieved
  memories and uses validity-aware retrieval before synthesis.
evidence_level: medium
code_available: check
license: check
memory_modules:
  - retriever-reranker
  - semantic-dedup
  - dream-consolidator
  - policy-privacy
status: seed
last_revised: 2026-06-24
urls:
  - https://arxiv.org/abs/2606.22844
---

# RaMem(arXiv 2606.22844)

## Problem statement

RaMem 把 retrieval-only memory 的一个核心失效模式命名为 **context collapse**:
memory fragment 看起来语义相关,但原始事件时间、会话范围、参与者或提及条件已经不
适用于当前 query。

## Core claim

方法包括四步:

1. evidence anchoring:保留 memory 的原始 episodic conditions。
2. recall condition induction:从 query 推断当前证据条件。
3. validity-aware retrieval:优先检索 context-compatible memories。
4. context-preserved synthesis:让 generator 在结构化 context 下生成答案。

论文报告在 long-term memory benchmarks 上比 strong baselines 有平均 10%+ F1 改进。

## Decision relevance

- `retriever-reranker` 不应只输出相似 memory,还应输出 validity / applicability metadata。
- `semantic-dedup` 合并 memory 时不能丢掉事件时间、session span 和 participant scope。
- `dream-consolidator` 需要保留可追溯的 evidence anchor,否则后续 recall 无法判断适用性。

## Caveats

本地笔记是 seed 质量。reported F1 仍是作者实证,未在本仓 claims ledger 中登记为独立
复现。下一步应检查 benchmark、baseline 和代码可用性。

## Sources

- arXiv:https://arxiv.org/abs/2606.22844

---

> *Ymem 项目对本笔记决策相关性的具体绑定见
> [`../docs/ymem-binding/relevance-index.md`](../docs/ymem-binding/relevance-index.md)。*
