---
title: AdaMem — Learning What to Remember for Personalized Long-Horizon LLM Agents
arxiv_id: 2606.21144
source: arXiv:2606.21144
date: 2026-06
domain: memory
core_claim: |
  Personalized agents need role-specific write policies. AdaMem learns what to
  store from week-by-week QA feedback, improving useful memory while reducing
  memory volume.
evidence_level: medium
code_available: check
license: check
memory_modules:
  - ingest-adapter
  - dream-consolidator
  - memorydiff-generator
  - evaluator-benchmark
status: seed
last_revised: 2026-06-24
urls:
  - https://arxiv.org/abs/2606.21144
---

# AdaMem(arXiv 2606.21144)

## Problem statement

长期个性化 agent 不是"存得越多越好"。无关琐事会造成 memory bloat,挤占有用偏好、
承诺、情绪和日程信息,最终降低 QA 准确率。

## Core claim

AdaMem 维护 role-specific Memory Policy,并通过 weekly QA feedback 做 lightweight
patch-style self-reflection。论文构造 AdaMem-Bench,模拟多周交互和逐周 QA,并报告在
Mem0 uniform baseline 之上提升 QA,同时减少 memory volume。

## Decision relevance

- `ingest-adapter`:需要显式区分 raw event 与 admission policy,不能默认全量写入。
- `memorydiff-generator`:policy patch 是一种比单条 memory ADD/UPDATE 更高层的 diff。
- `dream-consolidator`:可以把失败 QA 作为反事实反馈,驱动后续写入策略调整。
- `evaluator-benchmark`:需要覆盖 week-by-week personalization,而不是只测单次 recall。

## Caveats

本地笔记是 seed 质量。AdaMem-Bench 的数据生成、反馈强度和 baseline 设置仍需精读后确认。
reported gains 只作为 paper-origin claim。

## Sources

- arXiv:https://arxiv.org/abs/2606.21144

---

> *Ymem 项目对本笔记决策相关性的具体绑定见
> [`../docs/ymem-binding/relevance-index.md`](../docs/ymem-binding/relevance-index.md)。*
