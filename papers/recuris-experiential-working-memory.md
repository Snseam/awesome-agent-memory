---
title: Recuris — Recursive Experiential-Working Memory Evolution for Long-Horizon Agent Harnesses
arxiv_id: 2608.24876
source: arXiv:2608.24876
date: 2026-08
domain: memory
core_claim: |
  Long-horizon harnesses can connect Working Memory, Experiential Memory, and
  Skill Memory so execution evidence localizes failures and validation-gated
  updates reshape later behavior.
evidence_level: medium
code_available: yes
license: check
memory_modules:
  - ingest-adapter
  - dream-consolidator
  - memorydiff-generator
  - evaluator-benchmark
status: seed
last_revised: 2026-08-31
urls:
  - https://arxiv.org/abs/2608.24876
---

# Recuris(arXiv 2608.24876)

## Problem statement

Recursive self-improvement 在长任务里容易被膨胀历史、失焦 working state 和错误 skill
调用拖垮。需要把当前任务状态、历史经验和 skill 更新分层管理,并让执行证据定位到具体
memory component。

## Core claim

Recuris 使用 Working Memory 跟踪任务进展并从 Experiential Memory 引导 skill selection。
固定 Meta-Agent 将执行证据转成 localized、validation-gated Skill Memory updates,形成
bounded recursive memory-evolution loop。论文报告跨多个长任务 benchmark 和模型提升成功率。

## Decision relevance

- `ingest-adapter`:执行过程要保留为可定位失败原因的结构化证据。
- `memorydiff-generator`:skill memory 更新应是验证门控的 patch,不是自动覆写。
- `dream-consolidator`:working / experiential / skill memory 的分层可作为 consolidation 边界。
- `evaluator-benchmark`:需要按 horizon length 分层报告收益和失败类型变化。

## Caveats

本地笔记是 seed 质量。尚未 full read PDF、复核代码仓库、license、benchmark 套件和
SOTA 对比设置。性能数字只能作为 author-reported paper-origin claim。

## Sources

- arXiv:https://arxiv.org/abs/2608.24876

---

> *Ymem 项目对本笔记决策相关性的具体绑定见
> [`../docs/ymem-binding/relevance-index.md`](../docs/ymem-binding/relevance-index.md)。*
