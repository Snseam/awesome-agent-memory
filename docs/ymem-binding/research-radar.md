---
title: Ymem-specific Research Radar binding
date: 2026-05-08
revised: 2026-05-19
status: working-spec
language: zh-CN
origin: |
  Originally drafted as part of an internal host-app design note when the Radar
  was scoped as a host-app v1+ feature. On 2026-05-18 the Radar was promoted to
  an independent repository, awesome-agent-memory, so that algorithm iteration
  in Ymem and product iteration in host apps can both consume from a shared,
  public knowledge base.
  On 2026-05-19 the generic Radar workflow moved to the root-level
  `research-radar.md`; this file is the Ymem-specific binding.
---

# Ymem-specific Research Radar binding

通用 Radar 工作流在 [`../research-radar.md`](../research-radar.md);
本页只补充 Ymem 项目本身在跑这套 Radar 时的**额外契约**。

## 0. 在 Ymem 项目里 Radar 的定位

Radar 定位为 Ymem 的**核心进化层**:它不直接修改 kernel 主线,而是产出
ResearchItem、ImpactReport 和实验提案。

具体输出路径:
- ResearchItem → `papers/<slug>.md` 或 `products/<slug>.md`(本仓)
- ImpactReport → [`../../impact-reports/`](../../impact-reports/)(本仓)
- 沙盒实验 → 在 [Ymem](https://github.com/Snseam/Ymem) 仓内,见其
  `experiments/`(暂未公开)
- ADR → 在 Ymem 仓内,见其 `docs/adr/`(暂未公开)

## 1. Ymem 流程

```text
定期获取前沿信息
  → 结构化理解论文/产品更新
  → 映射到 Ymem 模块(见 [taxonomy-modules.md](taxonomy-modules.md))
  → 评估证据强度和适配度
  → 生成 ArchitectureImpactReport
  → Ymem 沙盒实验
  → benchmark / shadow run
  → 人审后进入 Ymem roadmap 或插件 / 否则归档
```

## 2. Ymem-specific ImpactReport 字段约定

通用 ResearchItem schema(见 [`../research-radar.md`](../research-radar.md)
§3)的 `decision_relevance` 字段,在 Ymem 项目中**实际上**映射为
`relevance_to_ymem`(旧名)/ `memory_modules`(新字段名)二元组:

```yaml
memory_modules:
  - retriever-reranker          # 来自 taxonomy-modules.md
  - semantic-dedup
decision_relevance: |
  这篇论文影响 Ymem 的 retrieve 路径,具体见 §5 节。
```

`memory_modules` 字段的值必须出自
[`taxonomy-modules.md`](taxonomy-modules.md);若发现新模块概念,先在那里 PR
增加,再写笔记。

## 3. Ymem 沙盒实验细节

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

EvalCase suite 当前来自:
- LongMemEval([`../../papers/longmemeval.md`](../../papers/longmemeval.md))
- MemoryAgentBench([`../../papers/memoryagentbench.md`](../../papers/memoryagentbench.md))
- LoCoMo([`../../papers/locomo.md`](../../papers/locomo.md))
- 自有的 EvalCase(在 Ymem 仓内维护)

## 4. Ymem ADR 模板

通过实验的候选在 **Ymem 仓内**生成 ADR:

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

## 5. Ymem Radar 演进规划

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

## 6. 本仓与 Ymem 的契约

- 本仓不写 Ymem 代码,只提供决策依据。
- Ymem ADR 必须 cite 至少一份 ImpactReport(或解释为何不需要)。
- 本仓不为已废弃的论文/产品保留 ImpactReport;只保留对 Ymem 决策仍有
  traceability 价值的。

一句话:

> Ymem 不只管理记忆,也管理记忆系统自己的进化 —— 而 awesome-agent-memory
> 是这套进化机制的输入面。

## 7. 与 host app 的契约

- host-side 模块(`context-packer`、`publisher`、`interface`、`audit-ui` ——
  见 [`taxonomy-modules.md`](taxonomy-modules.md))由 host app 负责实现;
  Radar 仍追踪这些模块的研究,但 ImpactReport 应标注 `affected_modules` 是
  kernel-side 还是 host-side,避免把 host 侧改造硬推进 Ymem。
- Host app 不直接消费本仓;它通过 Ymem 的 API 间接获益。
