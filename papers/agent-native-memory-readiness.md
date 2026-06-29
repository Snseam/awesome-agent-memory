---
title: Are We Ready For An Agent-Native Memory System?
arxiv_id: 2606.24775
source: arXiv:2606.24775
date: 2026-06
domain: systems
core_claim: |
  Agent memory should be evaluated as a decomposable data-management system,
  not only as a black-box end-to-end task-success component. The paper frames
  memory representation/storage, extraction, retrieval/routing, and maintenance
  as separable modules with distinct cost, robustness, and update trade-offs.
evidence_level: medium
code_available: check
license: check
memory_modules:
  - ingest-adapter
  - parser-chunker
  - retriever-reranker
  - dream-consolidator
  - evaluator-benchmark
status: seed
last_revised: 2026-06-29
urls:
  - https://arxiv.org/abs/2606.24775
---

# Are We Ready For An Agent-Native Memory System?(arXiv 2606.24775)

## Problem statement

这篇 2026-06-23 arXiv 论文把 agent memory 看作数据管理系统,而不是端到端
agent 分数里的黑箱模块。作者认为现有评测常用 F1、BLEU 或任务成功率衡量
整体效果,但没有充分拆开 representation/storage、extraction、retrieval/routing
和 maintenance 的系统性代价与鲁棒性。

## Core claim

论文提出一个四模块分析框架,并报告对 12 个代表性 memory systems 与两个
reference baselines 的系统实验。作者结论是没有单一 memory architecture 在所有
场景中占优;系统效果取决于 memory 结构是否匹配 workload bottleneck。文中还强调
localized maintenance 相比 global reorganization 可能更具成本效率。

## Decision relevance

- `ingest-adapter` / `parser-chunker`:抽取策略和 memory unit 会直接影响后续
  retrieval fidelity 与 update correctness。
- `retriever-reranker`:retrieval/routing 应按 workload bottleneck 评估,不能只看
  单次相似度检索。
- `dream-consolidator`:maintenance 策略需要区分 local update、global reorganization
  和 long-horizon stability。
- `evaluator-benchmark`:适合推动本仓把 memory 系统拆成模块级测量,而不是只记录
  agent-level success scores。

## Caveats

本地笔记是 seed 质量。尚未精读 PDF、完整被测系统列表、benchmark workload 细节
和代码可用性;任何 reported result 都应视为 paper-origin claim,不能当作本仓复现。

## Sources

- arXiv:https://arxiv.org/abs/2606.24775

---

> *Ymem 项目对本笔记决策相关性的具体绑定见
> [`../docs/ymem-binding/relevance-index.md`](../docs/ymem-binding/relevance-index.md)。*
