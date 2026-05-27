---
title: Ymem 模块清单与跨外部 taxonomy 对照
date: 2026-05-08
revised: 2026-05-19
status: working-spec
language: zh-CN
---

# Ymem 模块 taxonomy

这份文档是 awesome-agent-memory 中 deep notes(`papers/*.md`、`products/*.md`)
frontmatter `memory_modules:` 字段所引用的**具名模块清单**。每条 ResearchItem
写完后应当至少标注一个所影响的 Ymem 模块,便于 ImpactReport 聚合与后续
radar 归类。

如果你不维护 Ymem,可以把这份清单当作"一种合理的 memory kernel 模块切分参考"。
模块名本身是通用的(`ingest-adapter` / `retriever-reranker` /
`dream-consolidator` 等),命名上没有 Ymem 私有特征。

通用版的 taxonomy(外部三套 taxonomy 对照)见根目录
[`../taxonomy.md`](../taxonomy.md);本页是其 **Ymem 绑定补充**。

## 模块列表

| 模块 | 责任 | 典型研究/产品 |
|---|---|---|
| `ingest-adapter` | 把外部源(对话、文件、API 输出)转成 `MemoryRecord` | host-app 侧,但 schema 由 Ymem 定义 |
| `parser-chunker` | 把原始内容切分成语义单元,记录 provenance | LongChunker 类工作 |
| `semantic-dedup` | 检测语义重复并合并 / 选择 canonical 表述 | clustering, MinHash, embedding sim |
| `retriever-reranker` | 在线读路径:候选检索 + 重排 | BM25/FTS + dense + LLM rerank,Agentic RAG |
| `context-packer` | 在预算内组装结果,标注 why-used、omitted、conflicts(host-app 边界对象,kernel 只产出原料) | host 侧概念,但 kernel 提供 `MemoryResult` |
| `dream-consolidator` | 离线生成 `MemoryDiff` 候选(merge / supersede / archive / new_insight) | Claude Dreams, MemoryT1 |
| `memorydiff-generator` | 把检测结果落成可审核 diff | — |
| `evaluator-benchmark` | EvalCase 数据格式与回归套件 | LongMemEval, MemoryAgentBench, LoCoMo |
| `publisher` | host 侧概念:llms.txt / skill.md / wiki view | host 侧,不在 Ymem |
| `interface` | host 侧概念:CLI / MCP / SDK | host 侧,不在 Ymem |
| `audit-ui` | host 侧概念:why-used / diff review UI | host 侧,不在 Ymem |
| `security-privacy` | provenance、tool-poisoning 防护、敏感字段策略 | — |

## 使用方式

在论文/产品笔记的 frontmatter:

```yaml
memory_modules:
  - retriever-reranker
  - semantic-dedup
```

或在 body 中:

```markdown
**Memory modules affected**: `retriever-reranker`, `semantic-dedup`
```

ImpactReport 必须使用本文档列出的模块名;若发现新模块概念,先在此文档 PR
增加,再写 ImpactReport。

## host-side vs kernel-side

并非所有模块都属于 Ymem kernel。`context-packer` / `publisher` / `interface` /
`audit-ui` 都是 host-app 的责任。但 radar 仍然追踪这些模块的
研究,因为:

1. host 侧的需求会反推 Ymem 输出的形状(例如 `MemoryResult` 需要带 omitted /
   conflicts 字段以支持 ContextPack);
2. host 侧的真实 trace 是 Ymem benchmark 的重要补充。

ImpactReport 应明确标注 `affected_modules` 是 kernel-side 还是 host-side,
避免把 host 侧改造硬推进 Ymem。

## 与三套外部 taxonomy 的对照

agent memory 领域 2026 H1 同时出现了三套主流分类轴。根目录
[`../taxonomy.md`](../taxonomy.md) 介绍了这三套 taxonomy;本节给出它们到
**Ymem 模块**的映射表,以便我们在阅读外部 survey 时能快速反向定位影响的
Ymem 模块。

### "Memory in the Age of AI Agents"(arXiv 2512.13564)— Forms × Functions × Dynamics

| 该轴 | 子分类(节选) | 对应 Ymem 模块 |
|---|---|---|
| **Forms** | episodic / semantic / procedural / workspace | `parser-chunker`、`semantic-dedup` |
| **Functions** | recall / personalization / planning | `retriever-reranker`、`context-packer` |
| **Dynamics** | write / update / forget / consolidate | `dream-consolidator`、`memorydiff-generator` |

**对齐最干净的一套,首推**。Ymem 的"读 / 写 / 离线"三路径几乎和 Functions /
Dynamics 一一对应。

### "Memory for Autonomous LLM Agents"(arXiv 2603.07670)— temporal-scope × substrate × control-policy

| 该轴 | 含义 | 对应 Ymem |
|---|---|---|
| **temporal-scope** | short-term / mid / long-term;valid period | 与 Ymem 的 `valid_from / valid_to / supersedes` 字段直接对应 |
| **substrate** | vector / KG / wiki / hybrid 等存储介质 | 底层 store 选型(host-side 决策,但 Ymem 的 `MemoryRecord` schema 必须兼容) |
| **control-policy** | append / overwrite / supersede / consolidate | `dream-consolidator` 的策略选择 + `memorydiff-generator` 的 diff 种类 |
| **write–manage–read 循环** | 三阶段闭环 | `ingest-adapter` → `dream-consolidator` → `retriever-reranker` |

**control-policy** 这个名字明确把"记忆怎么变"作为独立维度,比 2512.13564
的 Dynamics 更细致,可以直接借用为 Ymem 策略层的术语。

### TsinghuaC3I/Awesome-Memory-for-Agents — Persistence × Curation

| 该轴 | 含义 | 对应 Ymem |
|---|---|---|
| **Persistence** | 短期 vs 长期 vs 跨 session | 与 `temporal-scope`(2603.07670)等价 |
| **Curation** | 怎么挑、怎么合并、怎么丢 | `semantic-dedup` + `dream-consolidator` + `memorydiff-generator` |

最简的一套。**适合用作 stub 笔记的快速归类**:任何新论文先回答它是
Persistence 类还是 Curation 类,再决定深读优先级。

## Ymem 模块 × 三套 taxonomy 反查

| Ymem 模块 | 2512.13564 | 2603.07670 | TsinghuaC3I |
|---|---|---|---|
| `ingest-adapter` | (host 侧)Forms 边界 | write 阶段 | Persistence 入口 |
| `parser-chunker` | Forms | substrate(语义单元粒度)| Curation 前置 |
| `semantic-dedup` | Forms / Dynamics | control-policy | Curation 核心 |
| `retriever-reranker` | Functions | read 阶段 | (跨两轴) |
| `context-packer` | Functions(host 侧)| read 阶段 | — |
| `dream-consolidator` | Dynamics | manage 阶段 + control-policy | Curation 离线 |
| `memorydiff-generator` | Dynamics | control-policy | Curation 产物 |
| `evaluator-benchmark` | (元层)| (元层)| (元层)|
| `security-privacy` | (未覆盖)| (未覆盖)| (未覆盖)— 由 [`../../papers/mnemonic-sovereignty.md`](../../papers/mnemonic-sovereignty.md) 单独覆盖 |

最后一行解释了为什么我们必须**独立追踪 `mnemonic-sovereignty`**:主流三套
taxonomy 都不把"安全 / 隐私 / 反污染"作为一等公民,但 Ymem 把它列为 kernel
模块。这是 Ymem 与外部综述的一个显式 delta。
