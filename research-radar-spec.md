---
title: Research Radar spec
date: 2026-05-08
revised: 2026-05-18
status: working-spec
language: zh-CN
origin: |
  Originally drafted as §12 of zhione/docs/design/context-evolution-2026-05-08.md
  when the Radar was scoped as a ZhiOne v1+ feature. On 2026-05-18 the Radar
  was promoted to an independent repository, awesome-agent-memory, so that
  algorithm iteration (in Ymem) and product iteration (in zhione) can both
  consume from a shared, public knowledge base.
---

# Research Radar / Architecture Review Loop

## 0. 目的

论文和 AI 产品的进步是不断更新的。Radar 是一套机制,可以定期获取最新的信息,并且评判是否需要对 Ymem 架构进行更新。

Radar 定位为 Ymem 的**核心进化层**:它不直接修改 kernel 主线,而是产出 ResearchItem、ImpactReport 和实验提案。

## 1. 核心流程

```text
定期获取前沿信息
-> 结构化理解论文/产品更新
-> 映射到 Ymem 能力模块
-> 评估证据强度和适配度
-> 生成 ArchitectureImpactReport
-> Ymem 沙盒实验
-> benchmark / shadow run
-> 人审后进入 Ymem roadmap 或插件 / 否则归档
```

## 2. 信息源

详见 [`information-sources.md`](information-sources.md) —— 10 个类别的完整
catalog,中文社区单独成节。该文档是 Radar 信息面的 single source of truth,
此处不再重复。

## 3. ResearchItem schema

每篇论文/产品笔记的最小字段:

```text
ResearchItem
- title
- source            # arXiv ID, conference, URL
- date              # 论文发布或产品更新时间
- domain            # memory | retrieval | graph | agent | eval | compression | UI | security
- core_claim
- method_summary
- required_assumptions
- benchmark_used
- evidence_level    # weak | medium | strong
- code_available    # yes/no + link
- license
- cost_complexity   # 简短:相对实现成本
- relevance_to_ymem # 1-2 句:对 Ymem 哪些模块有启发
```

存放约定:
- 论文 → `papers/<short-slug>.md`
- 产品/工程文章 → `products/<short-slug>.md`
- slug 用 kebab-case,论文以一作姓或工作名为主(`longmemeval`、`memoryagentbench`)

## 4. 模块 taxonomy

详见 [`taxonomy.md`](taxonomy.md)。每条 ResearchItem 必须映射到至少一个 Ymem 模块,以便 impact report 能按模块聚合。

## 5. ArchitectureImpactReport

候选改进进入沙盒实验前,需要写一份 impact report,放在 `impact-reports/<short-slug>.md`:

```text
ImpactReport
- solves_what_problem
- affected_modules            # 引用 taxonomy.md 中的模块名
- expected_gain
- evidence_strength           # weak | medium | strong
- implementation_cost
- runtime_cost
- privacy_risk
- maintenance_risk
- backwards_compatibility
- recommended_action:
  - ignore
  - monitor
  - prototype
  - adopt_as_plugin
  - consider_core_change
```

## 6. 沙盒实验(在 Ymem 仓内执行)

```text
candidate plugin / module
-> run on fixed EvalCase suite
-> run on historical traces (when available from host apps)
-> shadow compare against current baseline
-> measure:
   - retrieval quality
   - duplicate collapse
   - stale/conflict detection
   - context token reduction (host-app metric, optional)
   - latency/cost
   - regression rate
```

## 7. 架构决策

通过实验的候选在 Ymem 仓内生成 ADR:

```text
ADR
- why now
- what changes
- rejected alternatives
- migration path
- rollout flag
- rollback condition
- benchmark evidence (link back to impact-reports/ here)
```

## 8. 演进规划

```text
v0 (当前):
- 手动维护 papers/ 和 products/
- 不做自动 radar,不做自动 ingest

v0.5:
- 把每周/双周阅读整理成 ResearchItem
- 为高优候选写 ImpactReport
- 在 Ymem 沙盒做 1-2 个实验

v1:
- 定期 radar:每周/每月扫描论文和产品更新
- 自动归类到 taxonomy
- 半自动生成 ImpactReport 草稿

v2:
- 自动 benchmark / shadow run
- 通过阈值后自动生成 Ymem ADR 草稿
```

## 9. 与 Ymem 的契约

- 本仓不写 Ymem 代码,只提供决策依据。
- Ymem ADR 必须 cite 至少一份 ImpactReport(或解释为何不需要)。
- 本仓不为已废弃的论文/产品保留 ImpactReport;只保留对 Ymem 决策仍有 traceability 价值的。

一句话:

> Ymem 不只管理记忆,也管理记忆系统自己的进化 —— 而 awesome-agent-memory 是这套进化机制的输入面。
