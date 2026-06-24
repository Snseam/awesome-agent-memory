---
title: Lightweight LLM Agent Memory with Small Language Models
arxiv_id: 2604.07798
source: ACL 2026 / arXiv:2604.07798
date: 2026-04
domain: memory
core_claim: |
  A memory system can reduce online cost by using Small Language Models for
  retrieval, writing, and offline consolidation, while keeping long-horizon
  agent memory useful under bounded compute.
evidence_level: medium
code_available: check
license: check
memory_modules:
  - ingest-adapter
  - retriever-reranker
  - dream-consolidator
  - evaluator-benchmark
status: seed
last_revised: 2026-06-24
urls:
  - https://aclanthology.org/2026.acl-long.588/
  - https://arxiv.org/abs/2604.07798
---

# LightMem agent memory(ACL 2026)

## Problem statement

很多 agent memory system 在在线路径反复调用大模型,准确率提升但长期交互延迟和成本会
累积。LightMem 把 memory retrieval、writing 与 long-term consolidation 模块化,并用
Small Language Models 降低在线成本。

## Core claim

LightMem 使用 STM / MTM / LTM 三层组织,线上固定 retrieval budget,先 vector coarse
retrieval 再 semantic consistency reranking;离线从交互证据中抽象 reusable knowledge,
增量整合进 LTM。ACL Anthology 页面与 arXiv 摘要都强调 bounded compute 与低延迟路径。

## Decision relevance

- `retriever-reranker`:固定 retrieval budget + rerank 是生产 memory kernel 的基本约束。
- `dream-consolidator`:offline consolidation 可以用小模型承担部分整理工作。
- `evaluator-benchmark`:报告质量时必须同时写 latency/cost,否则无法评估生产可行性。

## Caveats

本地笔记是 seed 质量。需要精读 ACL PDF 才能确认 SLM 选择、LoCoMo 设置和 code/license。

## Sources

- ACL Anthology:https://aclanthology.org/2026.acl-long.588/
- arXiv:https://arxiv.org/abs/2604.07798

---

> *Ymem 项目对本笔记决策相关性的具体绑定见
> [`../docs/ymem-binding/relevance-index.md`](../docs/ymem-binding/relevance-index.md)。*
