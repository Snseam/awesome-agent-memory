---
title: Research Radar — agent memory knowledge → kernel decisions workflow
date: 2026-05-08
revised: 2026-06-24
status: working-spec
language: zh-CN
---

# Research Radar / Architecture Review Loop

agent memory 领域的论文和产品在不断更新。**Radar** 是一套机制,把"外部新东西"
有节奏地转成"对你自己 memory kernel 的架构判断"。

本页是 awesome-agent-memory 的**通用 Radar 工作流**:与任何 memory kernel
项目都不绑定。如果你想看本仓发起者(Ymem)的具体绑定,见
[`ymem-binding/research-radar.md`](ymem-binding/research-radar.md)。

## 1. 核心流程

```text
定期获取前沿信息
  → 结构化理解论文/产品/benchmark 更新
  → 映射到 memory kernel 能力模块
  → 评估证据强度和适配度
  → 生成 ArchitectureImpactReport
  → 沙盒实验
  → benchmark / shadow run
  → 人审后进入 roadmap 或插件 / 否则归档
```

Radar 的设计原则:**不直接修改 kernel 主线**,只产出 ResearchItem、
ImpactReport 和实验提案。kernel 主线的变更走 ADR 流程,由 Radar 输出作为
证据。

## 2. 信息源

详见 [`information-sources.md`](information-sources.md) —— 10 个类别的完整
catalog,中文社区单独成节。该文档是 Radar 信息面的 single source of truth。

当前来源刷新记录见 [`memory-radar-2026-06.md`](memory-radar-2026-06.md)。它保留
并行子 agent 搜索、主 agent 整合、source/relevance review 后的 must-add /
update-existing / watchlist / reject 决策,避免把快照判断散落到单条笔记里。

如果问题聚焦 token reduction、runtime cost、budgeted retrieval、SLM/offline
consolidation 或产品化 context offloading,先看成本专题入口
[`cost-savings-landscape.md`](cost-savings-landscape.md),再决定是否升级单篇
ResearchItem、BenchmarkItem 或 ImpactReport。

## 3. ResearchItem schema

每篇论文/产品笔记的最小字段:

```text
ResearchItem
- title
- source              # arXiv ID, conference, URL
- date                # 论文发布或产品更新时间
- domain              # memory | retrieval | graph | agent | eval | compression | UI | security
- core_claim
- method_summary
- required_assumptions
- benchmark_used
- evidence_level      # weak | medium | strong
- code_available      # yes/no + link
- license
- cost_complexity     # 简短:相对实现成本
- memory_modules      # 影响的 kernel 模块,见 taxonomy.md
- decision_relevance  # 1-2 段:对你自己 kernel 决策的启发
```

存放约定:

- 论文 → `../papers/<short-slug>.md`
- 产品/工程文章 → `../products/<short-slug>.md`
- benchmark 协议 → `../benchmarks/<short-slug>.md`
- benchmark 使用事件 → `../benchmarks/claims/claims.yaml`
- slug 用 kebab-case,论文以一作姓或工作名为主(`longmemeval`、
  `memoryagentbench`)

## 3.1 BenchmarkItem schema

Benchmark 不是论文 note 的附属字段,而是一等实体。每个 benchmark note 至少记录:

```text
BenchmarkItem
- benchmark_id
- name
- aliases
- status              # candidate | seed | full
- origin_type         # paper_origin | product_origin | community_origin | unknown
- origin_source
- first_public_date
- domain
- modality
- task_grain
- capability_axes
- dataset_size
- data_nature
- metrics
- judge_type
- code_available
- data_available
- license
- known_limitations
- canonical_sources
- confidence
```

任何带分数、排名或"最强"判断的 benchmark 使用,都必须进入
`../benchmarks/claims/claims.yaml`,并拆分 `usage_type`、`reproduction_status`
和 `independence_class`。厂商博客和产品页只能支持 `vendor_claim`;独立复现
必须来自非关联第三方并给出足够实验设置。

## 4. 模块 taxonomy

通用 axes 见 [`taxonomy.md`](taxonomy.md)。每条 ResearchItem 必须映射到至少
一个 kernel 模块,以便 ImpactReport 能按模块聚合。

具名模块清单需要你自己维护(每个项目的模块切分不同)。本仓发起者使用的清单
作为参考,见 [`ymem-binding/taxonomy-modules.md`](ymem-binding/taxonomy-modules.md)。

## 5. ArchitectureImpactReport

候选改进进入沙盒实验前,需要写一份 impact report,放在
[`../impact-reports/`](../impact-reports/) 目录下:

```text
ImpactReport
- solves_what_problem
- affected_modules            # 引用模块清单中的名字
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

## 6. 沙盒实验(在你自己 kernel 仓内执行)

```text
candidate plugin / module
  → run on fixed EvalCase suite
  → run on historical traces (when available from host apps)
  → shadow compare against current baseline
  → measure:
     - retrieval quality
     - duplicate collapse
     - stale/conflict detection
     - context token reduction (host-app metric, optional)
     - latency/cost
     - regression rate
```

成本驱动实验要回链到 [`cost-savings-landscape.md`](cost-savings-landscape.md) 中的
成本维度和证据边界,避免只报告"省 token"而不报告质量、延迟、写路径成本或 vendor
self-report 边界。

## 7. 架构决策(ADR)

通过实验的候选在 kernel 仓内生成 ADR:

```text
ADR
- why now
- what changes
- rejected alternatives
- migration path
- rollout flag
- rollback condition
- benchmark evidence (link back to impact-reports/ and benchmarks/claims here)
```

## 8. 演进规划

本仓 Radar 自动化的路径:

```text
v0 (当前):
- 手动维护 papers/、products/ 和 benchmarks/
- 不做自动 radar,不做自动 ingest

v0.5:
- 把每周/双周阅读整理成 ResearchItem
- 为高优候选写 ImpactReport
- 在 sandbox 做 1-2 个实验

v1:
- 定期 radar:每周/每月扫描论文和产品更新
- 自动归类到 taxonomy
- 半自动生成 ImpactReport 草稿
- 每周 Codex 执行契约见 [`weekly-memory-refresh-runbook.md`](weekly-memory-refresh-runbook.md)

v2:
- 自动 benchmark / shadow run
- 通过阈值后自动生成 ADR 草稿
```

## 9. 与你 kernel 仓的契约(建议模板)

- 本仓不写 kernel 代码,只提供决策依据。
- kernel ADR 必须 cite 至少一份 ImpactReport(或解释为何不需要)。
- 本仓不为已废弃的论文/产品保留 ImpactReport;只保留对 kernel 决策仍有
  traceability 价值的。

一句话:

> 一个 memory kernel 项目要长寿,不只要管理记忆,还要管理"记忆系统自己的
> 进化" —— 而 awesome-agent-memory 是这套进化机制的输入面。
