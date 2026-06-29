---
title: Redis Agent Memory Server
type: product
source: https://redis.github.io/agent-memory-server/
date_first_seen: 2026-06
domain: memory-api-server
business_model: OSS / Redis ecosystem
license: Apache 2.0
memory_modules:
  - ingest-adapter
  - semantic-dedup
  - retriever-reranker
  - policy-privacy
status: seed
last_revised: 2026-06-29
archive: archives/redis-agent-memory-server-overview.md
---

# Redis Agent Memory Server

## 1. 一句话定位

Redis Agent Memory Server 是 Redis 生态的生产向 agent memory API/MCP server,以
working memory + long-term memory 双层结构管理跨会话上下文。

## 2. 是什么 / 做什么

官方文档将它描述为 production-ready memory system for AI agents。它保存
conversation history、user preferences 与 facts,支持 semantic、keyword、hybrid
search,并通过 REST API、MCP server 和 Python client 暴露。

## 3. 关键技术选择

- **Two-tier memory**:working memory 负责 session-scoped state 和自动摘要;
  long-term memory 保存持久偏好和 facts。
- **Hybrid search**:semantic、keyword、hybrid search 与 topics/entities/time filters。
- **Smart memory management**:automatic extraction、contextual grounding、
  deduplication、memory editing。
- **Ops surface**:authentication、multi-tenancy、background processing、多后端向量库。

## 3.1 2026-06 refresh

Redis 2026-06-17 官方博客继续把 agent memory 定位为 persistence infrastructure,
并用 short-term interaction history + persistent long-term preferences/prior
sessions 解释两层设计。该博客是 vendor positioning,可用于产品架构定位,不能用来
支持独立性能结论。

## 4. 决策相关性 / Decision relevance

- **对照点**:Redis 把 memory server 包装为可运维 API,区别于纯库或纯 SaaS。
- **借鉴点**:working/long-term split 与 REST+MCP 双接口是很实用的部署形态。
- **差异点**:默认与 Redis 生态绑定,人类可读 artifact 不是主路径。

## 5. 适用 / 不适用场景

- **适用**:需要可部署 memory service 的团队;希望用 MCP/REST 快速接入 agent 的
  Redis 用户。
- **不适用**:要求所有记忆以 Markdown/git 形式审计;只做短会话 prototype 的项目。

## 6. 注意事项 / 风险

- **产品边界**:它是 agent memory server,不是通用 Redis vector search 的简单包装。
- **成本与治理**:multi-tenancy、auth、delete/export 实际成熟度需部署验证。
- **claim 边界**:production-ready 等表述来自官方文档。

## 7. 进一步阅读

- archive: [`archives/redis-agent-memory-server-overview.md`](archives/redis-agent-memory-server-overview.md)
- Docs:https://redis.github.io/agent-memory-server/
- MCP:https://redis.github.io/agent-memory-server/mcp/
- GitHub:https://github.com/redis/agent-memory-server
- Blog:https://redis.io/blog/why-bigger-context-window-wont-fix-agent-memory/

---

> *Ymem 项目对本笔记决策相关性的具体绑定见
> [`../docs/ymem-binding/relevance-index.md`](../docs/ymem-binding/relevance-index.md)。*
