---
title: Ymem module taxonomy for research mapping
date: 2026-05-08
revised: 2026-05-18
status: working-spec
language: zh-CN
---

# Ymem 模块 taxonomy

每条 `ResearchItem`(`papers/*.md`、`products/*.md`)在写完后,应该至少标注一个
所影响的 Ymem 模块。这份文档列出当前承认的模块名,便于 ImpactReport 聚合与
后续 radar 自动归类。

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

在论文/产品笔记的 frontmatter 或 body 顶部:

```yaml
ymem_modules:
  - retriever-reranker
  - semantic-dedup
```

或在 body 中:

```markdown
**Ymem modules affected**: `retriever-reranker`, `semantic-dedup`
```

ImpactReport 必须使用本文档列出的模块名;若发现新模块概念,先在此文档 PR 增加,
再写 ImpactReport。

## host-side vs kernel-side

并非所有模块都属于 Ymem。`context-packer` / `publisher` / `interface` /
`audit-ui` 都是 host-app(目前是 ZhiOne)的责任。但 radar 仍然追踪这些模块的
研究,因为:

1. host 侧的需求会反推 Ymem 输出的形状(例如 `MemoryResult` 需要带 omitted /
   conflicts 字段以支持 ContextPack);
2. host 侧的真实 trace 是 Ymem benchmark 的重要补充。

ImpactReport 应明确标注 `affected_modules` 是 kernel-side 还是 host-side,
避免把 host 侧改造硬推进 Ymem。

## 与其他 taxonomy 的对照

agent memory 领域 2026 H1 同时出现了三套主流分类轴。本节给出它们到 Ymem
模块的映射表,以便我们在阅读外部 survey 时能快速反向定位影响的 Ymem 模块。

详细 survey 见 [`surveys.md`](surveys.md);此处只做结构对照。

### "Memory in the Age of AI Agents"(arXiv 2512.13564)

切入轴:`Forms × Functions × Dynamics`。

| 该轴 | 子分类(节选) | 对应 Ymem 模块 |
|---|---|---|
| **Forms**(记忆"长什么样")| episodic / semantic / procedural / workspace | `parser-chunker`、`semantic-dedup`(语义单元形状) |
| **Functions**(记忆"做什么")| recall / personalization / planning | `retriever-reranker`、`context-packer`(读路径) |
| **Dynamics**(记忆"如何变")| write / update / forget / consolidate | `dream-consolidator`、`memorydiff-generator`(写路径) |

**对齐最干净的一套,首推**。Ymem 的"读 / 写 / 离线"三路径几乎和 Functions /
Dynamics 一一对应。

### "Memory for Autonomous LLM Agents"(arXiv 2603.07670)

切入轴:`temporal-scope × substrate × control-policy`,套在
`write → manage → read` 循环里。

| 该轴 | 含义 | 对应 Ymem |
|---|---|---|
| **temporal-scope** | short-term / mid / long-term;valid period | 与 Ymem 的 `valid_from / valid_to / supersedes` 字段直接对应 |
| **substrate** | vector / KG / wiki / hybrid 等存储介质 | 底层 store 选型(host-side 决策,但 Ymem 的 `MemoryRecord` schema 必须兼容) |
| **control-policy** | append / overwrite / supersede / consolidate | `dream-consolidator` 的策略选择 + `memorydiff-generator` 的 diff 种类 |
| **write–manage–read 循环** | 三阶段闭环 | `ingest-adapter` → `dream-consolidator` → `retriever-reranker` |

特别有用的一点:**control-policy** 这个名字明确把"记忆怎么变"作为独立维度,
比 2512.13564 的 Dynamics 更细致,可以直接借用为 Ymem 策略层的术语。

### TsinghuaC3I/Awesome-Memory-for-Agents

切入轴:`Persistence × Curation`。

| 该轴 | 含义 | 对应 Ymem |
|---|---|---|
| **Persistence** | 短期 vs 长期 vs 跨 session | 与 `temporal-scope`(2603.07670)等价 |
| **Curation** | 怎么挑、怎么合并、怎么丢 | `semantic-dedup` + `dream-consolidator` + `memorydiff-generator` |

最简的一套。**适合用作 stub 笔记的快速归类**:任何新论文先回答它是
Persistence 类还是 Curation 类,再决定深读优先级。

### Ymem 模块 × 三套 taxonomy 的反查

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
| `security-privacy` | (未覆盖)| (未覆盖)| (未覆盖)— 由 [`papers/mnemonic-sovereignty.md`](papers/mnemonic-sovereignty.md) 单独覆盖 |

最后一行解释了为什么我们必须**独立追踪 `mnemonic-sovereignty`**:主流三套
taxonomy 都不把"安全 / 隐私 / 反污染"作为一等公民,但 Ymem 把它列为 kernel
模块。这是 Ymem 与外部综述的一个显式 delta。
