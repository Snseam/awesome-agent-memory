---
title: LangMem
type: product
source: https://langchain-ai.github.io/langmem/
date_first_seen: 2025-02
domain: agent-memory-layer
business_model: OSS (LangChain 体系内)
license: 未在首页明示;遵循 LangChain 体系常规(多为 MIT / Apache 2.0,需以仓库为准)
memory_modules:
  - ingest-adapter
  - retriever-reranker
  - dream-consolidator
  - semantic-dedup
status: full
last_revised: 2026-05-19
archive: archives/langmem-overview.md
---

# LangMem

## 1. 一句话定位

LangMem 是 LangChain 团队推出的 **memory primitive 库**,把"hot path 检索 /
后台抽取整理 / 跨 session 长期记忆"三件事打包成可在 LangGraph 应用里直接
插入的工具。

## 2. 是什么 / 做什么

LangMem 提出三类记忆原语:**semantic / episodic / procedural**(官方教程层
面;首页主要展示工具与 store API)。落到代码层是两类东西:

- **Agent 可见的 memory 工具**:
  - `create_manage_memory_tool()` — 给 agent 一个写入记忆的 tool
  - `create_search_memory_tool()` — 给 agent 一个检索记忆的 tool
- **Store 抽象**:`InMemoryStore`(开发用)、`AsyncPostgresStore`(生产),
  与 LangGraph 自带 long-term memory store 原生互通

另有 **background memory manager**:在 agent 不知情的后台异步抽取、合并、
更新记忆,而不是只走 hot path。

## 3. 关键技术选择

- **存储**:存储无关,产品提供 store 抽象;原生集成 LangGraph store
- **记忆 unit**:KV-shaped(namespace + key + value),不强制 fact-extraction
- **检索**:走 store 的 `search`(向量为主,具体语义检索后端取决于 store)
- **consolidation**:有 background manager 做抽取 + 合并 + 更新,但首页未说
  明合并规则与冲突解决策略 → **未公开**(需读源码)
- **runtime 绑定**:与 LangGraph 紧耦合,在 LangChain 生态外使用价值打折

## 4. 决策相关性 / Decision relevance

- **对照点**:LangMem 的 "hot path tools + background manager" 拆分,与本仓追踪的
  memory kernel "retrieve(在线) + consolidate(离线)"的分层几乎同构
- **借鉴点**:
  - **store 抽象**(InMemory → Postgres 平滑切换)是 kernel persistence 层
    的好参考
  - **把 memory ops 暴露为 tool** 而不是隐式中间件,这与 Letta 风格的
    显式 API 哲学一致
  - **背景 manager** 与 kernel `consolidate` 的设计语义重叠;可比较两者对
    "什么时候触发"的处理方式
- **互补点**:LangMem 没有显式的 diff / 审核流;`MemoryDiff` 流可以
  补它的可审计性短板
- **不重叠 / 竞争点**:LangMem 把生态绑死在 LangGraph,memory kernel 必须保持
  host-agnostic;两者直接竞争的可能性低,但功能清单会被用户拿来对比

## 5. 适用 / 不适用场景

- **适用**:已经在 LangGraph 上跑 agent、需要"接近免费"的长期记忆;研究
  hot path vs background memory 分层的设计
- **不适用**:不想引入 LangChain 体系的项目;需要 diff / 审计 / 不就地
  mutate 的高合规场景;希望 memory layer 是 framework-agnostic 的 host

## 6. 注意事项 / 风险

- **生态锁定**:与 LangGraph 紧耦合,迁出成本高
- **license 不在首页**:需要去仓库确认许可证(标记为待核实)
- **稳定性**:在 LangChain 生态里 API 迭代节奏较快,production 升级需关注
  breaking change
- **benchmark 缺失**:首页未给出 LoCoMo / LongMemEval 等公开 benchmark 数字
- **背景 manager 黑盒**:合并 / 更新策略未在首页文档中明示

## 7. 进一步阅读

- archive: [`archives/langmem-overview.md`](archives/langmem-overview.md)
- 官方:https://langchain-ai.github.io/langmem/
- 配套:LangGraph long-term memory store 文档

---

> *Ymem 项目对本笔记决策相关性的具体绑定见
> [`../docs/ymem-binding/relevance-index.md`](../docs/ymem-binding/relevance-index.md)。*
