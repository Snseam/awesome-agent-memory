---
title: KOPE — Experience Graph Memory for Self-Evolving Kernel-Optimization Agents
arxiv_id: 2608.25570
source: arXiv:2608.25570
date: 2026-08
domain: memory
core_claim: |
  Repeated coding/optimization agents need to preserve decisions, execution
  feedback, and branch outcomes across runs. KOPE stores optimization
  trajectories in Experience Graph Memory and retrieves relevant experience
  under a fixed token budget.
evidence_level: medium
code_available: check
license: check
memory_modules:
  - ingest-adapter
  - dream-consolidator
  - retriever-reranker
  - evaluator-benchmark
status: seed
last_revised: 2026-08-31
urls:
  - https://arxiv.org/abs/2608.25570
---

# KOPE(arXiv 2608.25570)

## Problem statement

硬件 kernel 优化 agent 会反复编译、测试、profile 和修改代码。只靠更强模型、更长上下文
或更长执行轨迹,不能让 agent 从已完成的优化 episode 中稳定学习;全量保留历史又会挤占
当前任务上下文。

## Core claim

KOPE 将正确性、性能反馈、决策顺序和替代分支写入 Experience Graph Memory,再通过
Active Context Management and Injection 在固定 token budget 下检索相关经验。论文报告
相对 CANNBot 和消融 baseline 有 pass rate、token consumption 和 speedup 改善。

## Decision relevance

- `ingest-adapter`:执行证据、失败分支和性能反馈要作为一等 memory event。
- `dream-consolidator`:跨任务经验图比简单 summary 更适合保留因果顺序和替代路径。
- `retriever-reranker`:预算约束下的经验注入适合作为 coding-agent memory 对照。
- `evaluator-benchmark`:成本结论需要同时绑定硬件、operator suite、pass rate 和 valid timing。

## Caveats

本地笔记是 seed 质量。尚未 full read PDF、验证代码可用性、license 或实验可复现性。
速度和 token 节省只能作为 author-reported paper-origin claim,不能外推到通用 coding agent。

## Sources

- arXiv:https://arxiv.org/abs/2608.25570

---

> *Ymem 项目对本笔记决策相关性的具体绑定见
> [`../docs/ymem-binding/relevance-index.md`](../docs/ymem-binding/relevance-index.md)。*
