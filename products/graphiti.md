---
title: Graphiti
type: product
source: https://github.com/getzep/graphiti
date_first_seen: 2024-08
domain: KG-memory
business_model: OSS
license: Apache 2.0
memory_modules:
  - retriever-reranker
  - semantic-dedup
  - parser-chunker
  - memorydiff-generator
status: full
last_revised: 2026-05-19
archive: archives/graphiti-overview.md
---

# Graphiti

## 1. 一句话定位

Graphiti 是 Zep 团队开源的 **temporal knowledge graph 框架**,定位是"为 AI
agent 构建可增量更新、可时间旅行的事实图谱",作为 Zep 托管产品的 OSS 内核
独立可用。

## 2. 是什么 / 做什么

Graphiti 的核心抽象是把 fact 看作"在某段时间内成立的陈述",而不是永久三元
组。它围绕四个一等概念:

- **Entities (nodes)**:人 / 产品 / 概念,带可演化的 summary
- **Facts/Relationships (edges)**:三元组,带 valid-time 窗口
- **Episodes**:原始摄入数据,作为 ground truth
- **Custom Types**:开发者用 Pydantic 模型自定义实体 / 边类型

每条 fact 同时保留 **valid-time**(在世界中真的成立的时间段)和
**transaction-time**(进入系统的时间),允许"现在是真的什么"与"某 X
时刻是真的什么"两种查询。

API 是 Python 库(`pip install graphiti-core`),后端可插:Neo4j 5.26+,
FalkorDB 1.1.2+,Kuzu 0.11.2+,Amazon Neptune(配合 OpenSearch Serverless)。

## 3. 关键技术选择

- **存储**:图数据库后端,非 vector store-only
- **记忆 unit**:entity node + 时间窗 fact edge + 原始 episode
- **检索**:hybrid — embedding 语义 + BM25 关键词 + graph traversal,**三路
  并行**而不是 vector-first 串接
- **更新模式**:**增量**,新 episode 不重算全图;新 fact 触发旧 fact 的
  valid-time 关闭而非删除
- **provenance**:每条 derived fact 可回溯到生成它的 episode
- **LLM provider**:支持 OpenAI / Anthropic / Groq 等,通过 extras 装

## 4. 决策相关性 / Decision relevance

- **对照点**:Graphiti 是目前最直接可比的"开源 memory kernel"。它和本仓
  跟踪的 memory kernel 都试图把记忆做成一个独立 library,而不是绑定到 agent runtime
- **借鉴点**:
  - **双时间轴**(valid-time / transaction-time)的 schema 设计可以直接进
    `MemoryRecord` 的讨论稿
  - **三路并行检索**(语义 + BM25 + 图遍历)的工程取舍值得抄
  - 把 **episode** 作为 ground truth 一等概念,与 `ProvenanceRef`
    思路完全对齐
- **互补点**:
  - Graphiti 没有 dream-style 离线整理产物;`MemoryDiff` 与
    consolidate 流程是补充
  - Graphiti 要求图数据库后端;memory kernel 不假设特定存储介质,host 可选
- **不重叠 / 竞争点**:在"开源 memory 内核"这条线上 Graphiti 是直接对手。
  本仓视角下的差异化必须落在 audit / diff / host-agnostic 这几个轴上

## 5. 适用 / 不适用场景

- **适用**:已经决定走 KG 路线、能运维图数据库、需要时间维度查询的团队;
  研究 temporal KG memory 的人
- **不适用**:不想引入图数据库的本地优先 / PKM 场景;只需要 vector + scope
  filter 的简单 chat agent(Mem0 更轻);需要"读取后必须能解释每条结果
  来自哪条原始日志"的极高 audit 要求(provenance 已有,但 diff 流不在内)

## 6. 注意事项 / 风险

- **运行时依赖重**:Neo4j / FalkorDB 等图数据库不是无状态组件,会增加部署
  与运维复杂度
- **LLM 抽取成本**:entity / fact 抽取走 LLM,大流量摄入有可观 token 成本
- **小心 schema 漂移**:custom entity type 用 Pydantic,迭代时易发生
  schema 不兼容
- **生态绑定**:虽然 Apache 2.0,但路线由 Zep 公司主导,长期方向取决于其
  商业化策略
- **benchmark**:作为 Zep 80.32% LoCoMo 数字的底座出现,但 Graphiti 单独的
  公开 benchmark 数据相对稀疏

## 7. 进一步阅读

- archive: [`archives/graphiti-overview.md`](archives/graphiti-overview.md)
- 配套笔记:[`zep.md`](zep.md)(hosted 产品)
- 仓库:https://github.com/getzep/graphiti

---

> *Ymem 项目对本笔记决策相关性的具体绑定见
> [`../ymem-binding/relevance-index.md`](../ymem-binding/relevance-index.md)。*
