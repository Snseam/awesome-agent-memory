---
title: Oracle AI Agent Memory
type: product
source: https://docs.oracle.com/en/database/oracle/agent-memory/26.4/agmea/about.html
date_first_seen: 2026-06
domain: enterprise-db-memory
business_model: Oracle AI Database / enterprise platform
license: Proprietary database feature / SDK docs
memory_modules:
  - ingest-adapter
  - retriever-reranker
  - policy-privacy
status: seed
last_revised: 2026-07-13
archive: archives/oracle-ai-agent-memory-overview.md
---

# Oracle AI Agent Memory

## 1. 一句话定位

Oracle AI Agent Memory 是基于 Oracle AI Database 的企业 agent 持久记忆层,把
working memory 与 long-term memory 放进统一的数据库治理边界。

## 2. 是什么 / 做什么

Oracle 文档称 Agent Memory 为 enterprise AI agents 的 persistent memory layer。
它包含 short-term memory(thread context cards、conversation summaries)和 long-term
memory(`add` / `search` workflows),用于保存用户偏好、规则和跨会话 facts。

## 3. 关键技术选择

- **Converged database substrate**:把 vector、graph、JSON、transactional 等能力
  统一到 Oracle AI Database。
- **Short-term memory**:thread context cards 与 summaries 维持当前任务状态。
- **Long-term memory**:`add` 和 `search` workflow 管理偏好、规则和 facts。
- **MCP integration**:文档提到可通过 MCP Server 与 Oracle Private Agent Factory
  或外部框架集成。

## 3.1 2026-06 refresh

2026-06-29 复核时,Oracle 26.4 文档索引可访问,确认 Agent Memory 已作为 26.4
官方文档集存在。Oracle developer blog 的 Claude / Oracle / LangChain 组合文章在
本环境返回 403,因此不把该 blog 的架构定位升级为本仓强证据;后续可人工复核后再补。

## 3.2 2026-07 refresh

Oracle 2026-07-07 developer blog 将 26.6 更新描述为更面向开发者控制面的版本:
background extraction、hybrid vector + text search、custom extraction
instructions、context cards、metadata filtering、update APIs、TTL、OracleDBEmbedder
和 chunked semantic indexing。2026-07-10 database blog 进一步把 26.6 定位为
"memory with receipts"。

这些更新强化了 Oracle 路线的核心特征:memory 不是独立黑箱服务,而是数据库内的
可过滤、可更新、可保留期限管理的 enterprise substrate。本轮只收录产品行为和
治理面变化;博客中的性能评测表述不进入 benchmark claims ledger,后续若要使用需先
按 claims ledger 规范单独归档。

## 4. 决策相关性 / Decision relevance

- **对照点**:Oracle 代表 "enterprise database becomes memory substrate" 路线。
- **借鉴点**:把 memory scoping、authentication、authorization 明确交给集成方和
  数据库治理层,适合企业级 memory 讨论。
- **差异点**:它是数据库/平台能力,不是独立开源 memory SDK。

## 5. 适用 / 不适用场景

- **适用**:Oracle Database 既有客户;强合规、强审计、企业数据边界内的 agent。
- **不适用**:轻量开源 agent;个人 local-first memory;需要快速跨云迁移的产品。

## 6. 注意事项 / 风险

- **实现依赖**:价值建立在 Oracle AI Database 生态之上。
- **安全责任**:官方文档强调 integrating application 负责 end-user auth、authorization
  和正确 memory scoping。
- **成熟度**:需要继续跟踪 26.x 文档与 SDK 变化。

## 7. 进一步阅读

- archive: [`archives/oracle-ai-agent-memory-overview.md`](archives/oracle-ai-agent-memory-overview.md)
- Docs:https://docs.oracle.com/en/database/oracle/agent-memory/26.4/agmea/about.html
- Docs index:https://docs.oracle.com/en/database/oracle/agent-memory/26.4/agmea/index.html
- 26.6 developer blog:https://blogs.oracle.com/developers/whats-new-in-oracle-ai-agent-memory-custom-extraction-hybrid-search-and-more-control
- 26.6 database blog:https://blogs.oracle.com/database/oracle-ai-agent-memory-26-6

---

> *Ymem 项目对本笔记决策相关性的具体绑定见
> [`../docs/ymem-binding/relevance-index.md`](../docs/ymem-binding/relevance-index.md)。*
