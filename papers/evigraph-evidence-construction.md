---
title: EviGraph — Verifiable Evidence Construction for Information-Seeking Agents
arxiv_id: 2608.24667
source: arXiv:2608.24667
date: 2026-08
domain: retrieval
core_claim: |
  Search agents need a structured evidence memory, not only a linear trace.
  EviGraph separates search execution from evidence recording and validates
  support graph updates before using the graph as persistent working memory and
  process-reward substrate.
evidence_level: medium
code_available: check
license: check
memory_modules:
  - ingest-adapter
  - retriever-reranker
  - evaluator-benchmark
status: seed
last_revised: 2026-08-31
urls:
  - https://arxiv.org/abs/2608.24667
---

# EviGraph(arXiv 2608.24667)

## Problem statement

信息检索 agent 可以找到相关网页,但未必证明最终回答中的 claim 被检索内容支持。普通
线性 trace 对中间 grounding 的监督很弱,也不利于后续复用证据。

## Core claim

EviGraph 将 search executor 与 evidence verifier 分离。Verifier 产出带 polarity 的
verbatim evidence item,策略再生成 add/support graph request,并由确定性结构校验器检查。
该 graph 同时作为 persistent working memory 和 RL process reward 来源。论文报告在
BrowseComp-Plus、BrowseComp、GAIA 和 XBench 上有一致收益。

## Decision relevance

- `ingest-adapter`:外部证据应以 polarity、support relation 和 source span 入库。
- `retriever-reranker`:answer-time 检索需要区分"相关"和"支持 claim"。
- `evaluator-benchmark`:可把 evidence graph validity 作为过程指标,而不只看最终答案。

## Caveats

本地笔记是 seed 质量。尚未 full read PDF、验证代码/数据、许可或是否有独立复现。
它更偏 information-seeking agent,但 evidence memory 形态对 memory provenance 很直接。

## Sources

- arXiv:https://arxiv.org/abs/2608.24667

---

> *Ymem 项目对本笔记决策相关性的具体绑定见
> [`../docs/ymem-binding/relevance-index.md`](../docs/ymem-binding/relevance-index.md)。*
