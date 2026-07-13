---
title: Zep
type: product
source: https://www.getzep.com
date_first_seen: 2024-05
domain: agent-memory-layer
business_model: OSS+SaaS
license: proprietary (hosted) + Apache 2.0 (Graphiti, the OSS core)
memory_modules:
  - retriever-reranker
  - semantic-dedup
  - dream-consolidator
  - memorydiff-generator
status: full
last_revised: 2026-07-13
archive: archives/zep-overview.md
---

# Zep

## 1. 一句话定位

Zep 是一个面向生产 agent 的 **temporal knowledge graph memory layer**,产品把
"对话记录 / 业务 JSON / 文档 / app 事件"统一摄入一张随时间演化的 context
graph,并暴露低延迟检索 API。

## 2. 是什么 / 做什么

Zep 的核心数据模型是一张 temporal context graph(其 OSS 底座叫
[Graphiti](graphiti.md)):节点是 entity(user / product / 自定义类型),边是带
时间窗的 fact triplet。fact 不是被删除而是被**失效**(invalidation),保留
valid-time 与 transaction-time 两条时间轴,所以可以问"现在是真的什么"或
"X 时刻是真的什么"。

API surface 走"开发者最小心智"路线:Python / TypeScript / Go SDK,典型用法是
`client.thread.add_messages(...)` 接受 chat 消息并返回为下一轮准备好的 context
字符串。也支持 JSON 业务数据与文档的直接摄入。

典型用法:作为 agent 的 stateful memory 后端(用户偏好、长期事实、跨 session
对话历史),官方主打"三行代码接入",并提供 sales / support / e-commerce /
healthcare 等行业的预置 entity schema 模板。

## 3. 关键技术选择

- **存储**:Graphiti 作 OSS 内核,可后端 Neo4j 5.26+ / FalkorDB / Kuzu /
  Amazon Neptune;hosted Zep 上托管该栈
- **记忆 unit**:entity node + fact edge(带 valid-time 区间);episode 作为
  ground-truth 原始入口
- **检索**:hybrid — 向量语义 + BM25 + graph traversal 三路融合
- **失效策略**:fact 被新事实覆盖时写入失效时间,而非物理删除;天然提供
  "为什么这条曾经成立"的审计链
- **性能**:产品页声称 P95 < 200ms,LoCoMo 单次检索 80.32%
- **合规**:SOC 2 Type II / HIPAA(hosted 版)
- **ABAC**:2026-07 Zep blog describes attribute-based access control for API
  keys, including action-level policies and source-based graph-artifact access
  based on effective metadata projected from source episodes.

> Benchmark record: [`../benchmarks/locomo.md`](../benchmarks/locomo.md);
> event ledger row: `zep-locomo-2026` in
> [`../benchmarks/claims/claims.yaml`](../benchmarks/claims/claims.yaml)。

## 4. 决策相关性 / Decision relevance

- **对照点**:Zep 占据和 memory kernel 几乎相同的生态位 — host-agnostic 的记忆层。它
  对外的 surface(add / get / search / context)和我们的目标 API 高度同构。
- **借鉴点**:
  - fact 的 **valid-time + transaction-time 双时间轴**,正是我们 audit 路线想
    要的形状,可以直接进 `MemoryRecord` schema 讨论
  - 失效而非删除,与 kernel "diff 优先、不就地 mutate"的原则同源
  - graph + vector + BM25 三路融合,是 retriever-reranker 模块的合理基线
- **互补点**:Zep 不提供 dream-style 离线整理 job(它是在线增量的),kernel 的
  `consolidate` 与 MemoryDiff 是一块差异化空间
- **不重叠 / 竞争点**:hosted Zep 直接面向 production agent 开发者,价值主张
  是"省时间";memory kernel 的目标是 host-app 可拆装的 library,不与 Zep 直接竞争
  end-user,但 GraphitiOSS 是直接可比的对手

## 5. 适用 / 不适用场景

参照 [`products-landscape.md`](../docs/products-landscape.md)(若存在)的
domain × audience 表:

- **适用**:对话型 agent(客服、销售、私人助理)、需要可追溯 fact 演化的
  enterprise 场景、希望"几天上线"而非自建 stack 的团队
- **不适用**:对存储介质 / schema 有强约束的本地优先工作流(PKM、个人 wiki);
  以图谱推理为产品核心的应用(应该直接用 Graphiti 而非 hosted Zep);要求
  数据完全不出境且无图数据库运维能力的小团队

## 6. 注意事项 / 风险

- **vendor lock-in**:hosted Zep 的 entity schema / API surface 与本地
  Graphiti 不完全等价,迁回 OSS 不是零成本
- **数据出境**:hosted 仅有美区,境外团队需要走自建 Graphiti 路线
- **图数据库运维成本**:Neo4j / FalkorDB 等是真正的运行时依赖,不像纯
  vector store 那样无状态
- **benchmark 自报**:LoCoMo 80.32% 是产品页声明,与 Mem0 / LangMem 的可比性
  需要独立复现
- **ABAC 证据类别**:Zep ABAC 是官方产品治理能力,可支持 access-control surface
  判断,但不支持 memory quality 或 benchmark superiority claims。
- **温度计**:Zep 把"知识图谱 + LLM extraction"的复杂度藏在 API 后面,出
  问题时排错路径长

## 7. 进一步阅读

- archive: [`archives/zep-overview.md`](archives/zep-overview.md)
- 配套笔记:[`graphiti.md`](graphiti.md)(OSS 内核)
- 官方:https://www.getzep.com、https://help.getzep.com/(docs 已迁移)
- ABAC blog:https://blog.getzep.com/attribute-based-access-control/

---

> *Ymem 项目对本笔记决策相关性的具体绑定见
> [`../docs/ymem-binding/relevance-index.md`](../docs/ymem-binding/relevance-index.md)。*
