---
title: Agent Memory — Characterization and System Implications of Stateful Long-Horizon Workloads
arxiv_id: 2606.06448
source: arXiv:2606.06448
date: 2026-06
domain: systems
core_claim: |
  Agent memory should be treated as a stateful long-horizon systems workload,
  not just a retrieval algorithm. The paper profiles construction, retrieval,
  and generation phases across representative memory systems and derives system
  recommendations for scheduling, freshness, amortization, and fleet operation.
evidence_level: medium
code_available: check
license: check
memory_modules:
  - ingest-adapter
  - dream-consolidator
  - retriever-reranker
  - evaluator-benchmark
status: seed
last_revised: 2026-06-24
urls:
  - https://arxiv.org/abs/2606.06448
---

# Agent Memory(arXiv 2606.06448)

## Problem statement

这篇 2026-06-04 arXiv 论文把 agent memory 定义为 stateful long-horizon workload。
它关注的不是单个 retrieval 模型,而是 memory construction、retrieval 和 generation
在真实 agent 生命周期里的成本、延迟、freshness 与部署 trade-off。

## Core claim

作者提出一个系统视角 taxonomy,并构建 phase-aware profiling harness,对 10 个代表性
agent memory system 在两个 benchmark suite 上做画像。核心结论是:memory design 会把
成本在写路径、读路径和生成路径之间迁移,所以 memory kernel 的架构选择必须同时看
quality、latency、query volume 和更新频率。

## Decision relevance

- `ingest-adapter`:写入是否 synchronous / asynchronous / batched 会直接改变热路径成本。
- `dream-consolidator`:consolidation 调度不能只看质量,还要看 amortization 和 freshness。
- `retriever-reranker`:retrieval cost 必须和 query volume 一起评估,不能孤立看单次延迟。
- `evaluator-benchmark`:需要把 cost profile 与 quality benchmark 并列记录。

## Caveats

本地笔记是 seed 质量。尚未精读 PDF 与 harness 细节;不能把 paper 中的系统建议当成
本仓已复现结论。下一步应补齐被测系统列表、benchmark 设置和代码可用性。

## Sources

- arXiv:https://arxiv.org/abs/2606.06448

---

> *Ymem 项目对本笔记决策相关性的具体绑定见
> [`../docs/ymem-binding/relevance-index.md`](../docs/ymem-binding/relevance-index.md)。*
