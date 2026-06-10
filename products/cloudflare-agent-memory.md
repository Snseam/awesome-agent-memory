---
title: Cloudflare Agent Memory
type: product
source: https://blog.cloudflare.com/introducing-agent-memory/
date_first_seen: 2026-06
domain: platform-managed-memory
business_model: Cloudflare managed service / Agents SDK
license: Proprietary cloud service; SDK docs public
memory_modules:
  - ingest-adapter
  - retriever-reranker
  - policy-privacy
status: seed
last_revised: 2026-06-11
archive: archives/cloudflare-agent-memory-overview.md
---

# Cloudflare Agent Memory

## 1. 一句话定位

Cloudflare Agent Memory 是 Cloudflare Agents 生态里的 managed memory 能力,把
conversation history、context memory、SQLite-backed Session API 和更 opinionated
的 Agent Memory service 连成平台级记忆层。

## 2. 是什么 / 做什么

Cloudflare docs 把 agent memory 分成 conversation history 与 context memory:
前者保存 messages/tool calls,后者是注入 system prompt 的持久信息块,可读、可写、
可搜索或按 Skills 加载。官方博客另行介绍 Agent Memory,强调让 agents 跨会话记住
用户、任务和历史。

## 3. 关键技术选择

- **Session tree**:conversation history 是树结构,支持 branch/regenerate。
- **Context blocks**:read-only、writable short-form、searchable context、loadable
  Skills 四类公开抽象。
- **Provider abstraction**:默认可用 SQLite / Durable Object,search provider 可替换。
- **平台托管**:Agent Memory 是 Cloudflare 平台服务,与 Workers/Agents 生态绑定。

## 4. 决策相关性 / Decision relevance

- **对照点**:它代表 cloud runtime 把 memory 变成 agent platform primitive,不是
  独立 SDK。
- **借鉴点**:把 context memory 暴露为带能力边界的 block/provider,比普通全局
  prompt 更可管理。
- **差异点**:本仓 kernel 若追求 host-agnostic,不能假设 Cloudflare runtime。

## 5. 适用 / 不适用场景

- **适用**:Cloudflare Workers/Agents 上的生产 agent;需要 Durable Object 与平台
  存储统一管理的团队。
- **不适用**:脱离 Cloudflare 的本地优先 agent;需要完全自主管理 memory schema 的
  研究实验。

## 6. 注意事项 / 风险

- **可用性标签**:Cloudflare docs 的 Session memory API 标为 experimental;Agent
  Memory 博客介绍的服务需按 private beta/早期能力处理。
- **供应商锁定**:强平台集成带来 deploy/ops 便利,也限制可移植性。
- **claim 边界**:所有产品定位和能力描述来自 Cloudflare 官方文档/博客。

## 7. 进一步阅读

- archive: [`archives/cloudflare-agent-memory-overview.md`](archives/cloudflare-agent-memory-overview.md)
- Blog:https://blog.cloudflare.com/introducing-agent-memory/
- Docs:https://developers.cloudflare.com/agents/concepts/conversation-state-and-memory/

---

> *Ymem 项目对本笔记决策相关性的具体绑定见
> [`../docs/ymem-binding/relevance-index.md`](../docs/ymem-binding/relevance-index.md)。*
