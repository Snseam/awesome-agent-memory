---
title: Databricks Managed Agent Memory
type: product
source: https://learn.microsoft.com/en-us/azure/databricks/agents/agent-memory/managed-memory
date_first_seen: 2026-07
domain: platform-managed-memory
business_model: Azure Databricks managed service
license: Proprietary cloud service
memory_modules:
  - ingest-adapter
  - retriever-reranker
  - policy-privacy
status: seed
last_revised: 2026-07-27
archive: archives/databricks-managed-agent-memory-overview.md
---

# Databricks Managed Agent Memory

## 1. 一句话定位

Databricks Managed Agent Memory 是 Azure Databricks 为 agents 提供的 beta 托管
长期记忆能力,以 Unity Catalog memory stores 管理跨对话记忆、scope 隔离和治理。

## 2. 是什么 / 做什么

官方文档说明 managed memory gives AI agents long-term memory across conversations。
Memory store 是 Unity Catalog securable;memory entry 用 scope 和 path 标识,可
保存用户偏好、过去决策和累计上下文,并支持跨 agents/projects 共享。

## 3. 关键技术选择

- **Unity Catalog substrate**:memory store 继承 Unity Catalog governance、access
  control 和 lineage。
- **Scope isolation**:每条 memory entry 属于一个 scope;搜索只返回被查询 scope
  下的 entries。
- **Path-shaped entries**:entry 带 path,类似 `/memories/preferences.md`。
- **OpenAI-compatible conversation binding**:Databricks OpenAI client 可把
  conversation 绑定到 memory store 与 scope。
- **Access control**:公开权限包括 `CREATE MEMORY STORE`、`READ MEMORY STORE`、
  `WRITE MEMORY STORE` 和 `MANAGE`。

## 4. 决策相关性 / Decision relevance

- **对照点**:Databricks 把 agent memory 放进数据治理平面,不同于只提供 chat memory
  或黑箱 profile store 的托管产品。
- **借鉴点**:scope 必须由 trusted code 配置,不能让模型决定;这是 enterprise memory
  isolation 的强约束。
- **差异点**:目前是 beta,底层 extraction/ranking/consolidation 机制不公开。

## 5. 适用 / 不适用场景

- **适用**:已经使用 Azure Databricks、Unity Catalog、model serving 或 Lakehouse
  governance 的企业 agent。
- **不适用**:本地优先、跨云 portable memory kernel,或需要直接审计底层 memory
  artifact 的应用。

## 6. 注意事项 / 风险

- **Beta**:官方页面标注 beta,生产稳定性和 API 兼容性需要按 Databricks preview
  条款处理。
- **权限边界**:app service principal 能读所有 scope,必须按最小权限和 credential
  防护设计。
- **证据边界**:本笔记只记录官方产品行为,不记录 accuracy/efficiency 性能结论。

## 7. 进一步阅读

- archive: [`archives/databricks-managed-agent-memory-overview.md`](archives/databricks-managed-agent-memory-overview.md)
- Docs:https://learn.microsoft.com/en-us/azure/databricks/agents/agent-memory/managed-memory

---

> *Ymem 项目对本笔记决策相关性的具体绑定见
> [`../docs/ymem-binding/relevance-index.md`](../docs/ymem-binding/relevance-index.md)。*
