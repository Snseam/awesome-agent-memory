---
title: Microsoft Foundry Agent Service Memory
type: product
source: https://learn.microsoft.com/en-us/azure/foundry/agents/concepts/what-is-memory
date_first_seen: 2026-06
domain: platform-managed-memory
business_model: Azure / Microsoft Foundry managed service
license: Proprietary cloud service
memory_modules:
  - ingest-adapter
  - semantic-dedup
  - dream-consolidator
  - retriever-reranker
  - policy-privacy
status: seed
last_revised: 2026-08-10
archive: archives/microsoft-foundry-memory-overview.md
---

# Microsoft Foundry Agent Service Memory

## 1. 一句话定位

Microsoft Foundry Agent Service Memory 是 Azure Foundry agents 的托管 memory
store,通过 scope、TTL、CRUD 和 memory tools 支持 user profile、chat summaries 与
procedural memory。

## 2. 是什么 / 做什么

Microsoft Learn 的 memory 文档把记忆描述为 public preview capability。开发者可以
让 agent remember/forget,也可以直接管理 memory items。公开概念包括 item store、
scope、default TTL、user profile memory、chat summaries 和 procedural memory。

## 3. 关键技术选择

- **Scoped store**:每次请求/工具调用显式带 scope。
- **Item lifecycle**:记忆项支持 CRUD、默认 TTL 和 forget。
- **Memory types**:profile、summary、procedure 被作为不同用途的 memory。
- **Agent tools**:通过工具让 agent 直接操作记忆。

## 3.1 2026-06 refresh

Build 2026 后,Microsoft 官方博客和 Learn 文档把 Foundry memory 进一步拆成
user memory、session memory 和 procedural memory。how-to 文档显示 memory store
与 memory items 支持 create/update/list/delete/search,且 Python/C#/JavaScript/
Java/REST 均有接口覆盖。当前仍是 public preview。

2026-06-29 复核时,Build 2026 recap 仍把 Foundry Agent Service Memory 标为 public
preview,并明确三类 memory:procedural memory、user memory、session memory。博客中
Tau-bench 成功率提升是 Microsoft vendor claim,本仓只作为 vendor evidence 记录。

## 3.2 2026-08 refresh

2026-08-10 复核 Microsoft Learn memory usage guide 时,页面显示 latest preview
提供 memory item create/read/update/list/delete、store-level default TTL/retention
controls,以及同步 remember / forget command behavior。how-to 页面还把 scope 用作
memory item partition key,并继续给出 Python、C#、JavaScript、Java 和 REST 示例。

这次更新强化的是 developer-visible memory lifecycle 和治理面。它仍是 preview
产品行为证据,不能写成 Microsoft memory 的独立性能或质量结论。

## 4. 决策相关性 / Decision relevance

- **对照点**:Microsoft 路线比纯自动抽取更强调 developer-visible item lifecycle。
- **借鉴点**:scope + TTL + CRUD 是 managed memory 最低治理基线。
- **差异点**:底层提取/merge/conflict 机制仍是平台实现细节。

## 5. 适用 / 不适用场景

- **适用**:Azure Foundry 上的客服、销售、企业流程 agent;需要 Azure 账号、权限和
  生命周期控制的团队。
- **不适用**:本地优先、文件优先、跨平台 agent memory。

## 6. 注意事项 / 风险

- **可用性标签**:官方文档标注 preview/public preview,不能按 GA 稳定能力处理。
- **平台绑定**:与 Azure Foundry Agent Service 强绑定。
- **claim 边界**:本笔记只记录 Microsoft 官方概念,不外推内部算法。

## 7. 进一步阅读

- archive: [`archives/microsoft-foundry-memory-overview.md`](archives/microsoft-foundry-memory-overview.md)
- Docs:https://learn.microsoft.com/en-us/azure/foundry/agents/concepts/what-is-memory
- How-to:https://learn.microsoft.com/en-us/azure/foundry/agents/how-to/memory-usage
- Build 2026:https://devblogs.microsoft.com/foundry/agent-service-build2026/
- Build 2026 recap:https://devblogs.microsoft.com/foundry/whats-new-in-microsoft-foundry-build-2026/

---

> *Ymem 项目对本笔记决策相关性的具体绑定见
> [`../docs/ymem-binding/relevance-index.md`](../docs/ymem-binding/relevance-index.md)。*
