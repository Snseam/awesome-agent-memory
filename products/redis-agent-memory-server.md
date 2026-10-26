---
title: Redis Agent Memory
type: product
source: https://redis.io/docs/latest/develop/ai/context-engine/agent-memory/
date_first_seen: 2026-06
domain: platform-managed-memory
business_model: Redis Cloud managed service; OSS research foundation
license: Proprietary managed service; Apache 2.0 OSS reference
memory_modules:
  - ingest-adapter
  - semantic-dedup
  - retriever-reranker
  - policy-privacy
status: seed
last_revised: 2026-09-28
archive: archives/redis-agent-memory-server-overview.md
---

# Redis Agent Memory

## 1. 一句话定位

Redis Agent Memory 是 Redis Iris 下受支持的 agent memory 服务,以 session
memory + long-term memory 双层结构管理跨会话上下文。原开源 Agent Memory
Server 仍可作为研究参考实现,但官方不再把它作为受支持的生产路径。

## 2. 是什么 / 做什么

当前官方文档描述了 Redis Cloud 托管服务的有序 session events、自动摘要、
后台长期记忆抽取、按 owner/session/namespace/topic/type 过滤,以及 semantic、
keyword、hybrid retrieval。公开接口包括 REST、Python/TypeScript SDK;
Redis 产品页另列 MCP。Redis Software 自管部署仍为 private preview。

## 3. 关键技术选择

- **Two-tier memory**:working memory 负责 session-scoped state 和自动摘要;
  long-term memory 保存持久偏好和 facts。
- **Hybrid search**:semantic、keyword、hybrid search 与 topics/entities/time filters。
- **Smart memory management**:automatic extraction、contextual grounding、
  deduplication、memory editing。
- **Ops surface**:authentication、multi-tenancy、background processing、多后端向量库。

以上旧 server 能力来自 2026-06 的 OSS 快照;不能直接推定托管服务与旧 server
的每个接口或后端选项完全相同。

## 3.1 2026-06 refresh

Redis 2026-06-17 官方博客继续把 agent memory 定位为 persistence infrastructure,
并用 short-term interaction history + persistent long-term preferences/prior
sessions 解释两层设计。该博客是 vendor positioning,可用于产品架构定位,不能用来
支持独立性能结论。

## 3.2 2026-07 refresh

Redis 2026-07-01 官方博客继续以 short-term state + long-term vector memory 解释
agent memory,并把 semantic retrieval、TTL / decay、RedisVL / vector search 等能力
放进统一实践指南。该来源更新产品定位和实现建议;它不是 Redis Agent Memory Server
的新独立 benchmark,也不能支持质量优于其他 memory server 的结论。

## 3.3 2026-09 product-boundary correction

Redis 当前 docs 将 Agent Memory 定位为 Redis Iris 的受支持服务,可在 Redis
Cloud 创建;Redis Software 部署仍是 private preview。独立的旧 OSS server
被官方明确称为 research foundation / reference implementation。托管服务
公开 custom memory types、敏感数据抽取排除、session 与 long-term 各自 TTL、
REST 与 Python/TypeScript SDK。此处是官方产品行为与支持边界的更正,不是
独立性能或运行成熟度证明。

## 4. 决策相关性 / Decision relevance

- **对照点**:Redis 将托管 memory 服务和开源参考 server 分开;采购、部署与
  可修改底层代码的边界不同。
- **借鉴点**:working/long-term split 与 REST+MCP 双接口是很实用的部署形态。
- **差异点**:默认与 Redis 生态绑定,人类可读 artifact 不是主路径。

## 5. 适用 / 不适用场景

- **适用**:使用 Redis Cloud 且需要托管 memory service 的团队;研究旧 server
  实现或自行部署参考代码的团队应明确其非受支持生产路径。
- **不适用**:要求所有记忆以 Markdown/git 形式审计;只做短会话 prototype 的项目。

## 6. 注意事项 / 风险

- **产品边界**:当前 Redis Agent Memory 是托管服务;旧 Agent Memory Server
  是 OSS 研究参考实现,两者不可视为同一支持承诺。
- **成本与治理**:multi-tenancy、auth、delete/export 实际成熟度需部署验证。
- **claim 边界**:可用性、性能和规模表述来自 Redis,没有独立验证。

## 7. 进一步阅读

- archive: [`archives/redis-agent-memory-server-overview.md`](archives/redis-agent-memory-server-overview.md) (2026-06 OSS snapshot)
- Current docs:https://redis.io/docs/latest/develop/ai/context-engine/agent-memory/
- Product:https://redis.io/agent-memory/
- OSS boundary:https://redis.github.io/agent-memory-server/
- MCP:https://redis.github.io/agent-memory-server/mcp/
- GitHub:https://github.com/redis/agent-memory-server
- Blog:https://redis.io/blog/why-bigger-context-window-wont-fix-agent-memory/
- July guide:https://redis.io/blog/build-smarter-ai-agents-manage-short-term-and-long-term-memory-with-redis/

---

> *Ymem 项目对本笔记决策相关性的具体绑定见
> [`../docs/ymem-binding/relevance-index.md`](../docs/ymem-binding/relevance-index.md)。*
