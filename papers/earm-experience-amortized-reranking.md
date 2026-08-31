---
title: EARM — Experience-Amortized Reranking for Long-Term Agent Memory
arxiv_id: 2608.22767
source: arXiv:2608.22767
date: 2026-08
domain: retrieval
core_claim: |
  Long-lived agents should remember retrieval experience, not only past content.
  EARM stores sparse query-memory relevance scores and uses matrix completion to
  reduce repeated LLM reranking cost as experience accumulates.
evidence_level: medium
code_available: check
license: check
memory_modules:
  - retriever-reranker
  - evaluator-benchmark
status: seed
last_revised: 2026-08-31
urls:
  - https://arxiv.org/abs/2608.22767
---

# EARM(arXiv 2608.22767)

## Problem statement

长期 agent 会积累越来越多 memory,但 retriever 通常不会积累"哪些 memory 对哪些 query
真的有用"的经验。语义检索便宜但不总能反映证据相关性,LLM reranker 更准但每次都要
重复给大量候选打分。

## Core claim

EARM 把历史 LLM relevance score 当作可复用的 retrieval experience:在线保存稀疏
query-memory 相关性矩阵,用 causal matrix completion 学共享结构,再把少量新打分和
估计分结合用于 reranking。论文报告在 long-term conversational memory 上能降低直接
LLM reranking 预算并改善答案准确率。

## Decision relevance

- `retriever-reranker`:检索器本身也需要长期状态,尤其是 query-memory utility history。
- `evaluator-benchmark`:retrieval cost 要随 agent lifetime 计量,不能只看单次 query。
- `semantic-dedup`:低相似但历史上有用的 memory 应被视为可学习信号。

## Caveats

本地笔记是 seed 质量。尚未 full read PDF、验证代码/数据是否发布、复核 matrix-completion
设定或 benchmark split。准确率和预算节省只能作为 paper-origin claim。

## Sources

- arXiv:https://arxiv.org/abs/2608.22767

---

> *Ymem 项目对本笔记决策相关性的具体绑定见
> [`../docs/ymem-binding/relevance-index.md`](../docs/ymem-binding/relevance-index.md)。*
