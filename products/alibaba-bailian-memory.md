---
title: Alibaba Cloud Bailian Memory Library
type: product
source: https://help.aliyun.com/zh/model-studio/memory-library
date_first_seen: 2026-06
domain: platform-managed-memory
business_model: Alibaba Cloud Model Studio managed API
license: Proprietary cloud service
memory_modules:
  - ingest-adapter
  - semantic-dedup
  - retriever-reranker
  - policy-privacy
status: seed
last_revised: 2026-09-07
archive: archives/alibaba-bailian-memory-overview.md
---

# Alibaba Cloud Bailian Memory Library

## 1. 一句话定位

阿里云百炼记忆库 / 长期记忆 API 是 Model Studio 的托管长期记忆能力,用于从历史
对话中自动抽取、结构化存储并检索用户画像和记忆片段。

## 2. 是什么 / 做什么

官方帮助文档描述了 long-term memory API:系统从历史对话自动提取 memory fragments
和 user profile,开发者再通过检索结果注入 prompt。文档还说明 open API 可接入任意
应用,并支持共享记忆库。

## 3. 关键技术选择

- **Memory library**:以 memory library / `memoryId` 管理长期记忆体。
- **Add/Search flow**:`AddMemory` 写入,`SearchMemory` 检索。
- **结构化抽取**:偏好、事实、画像等从对话中自动抽取。
- **跨应用共享**:官方文档强调开放 API 和共享记忆库。

## 3.1 2026-06 refresh

2026-06-24 Alibaba Cloud AgentLoop docs 将 Memory 描述为面向 AI agents 的核心
memory layer,并列出 Facts、Episodic、Summary、Custom 四类 memory policies。
AgentLoop 更像 enterprise agent observability / optimization platform,而不只是
百炼 Memory Library 的改名;本轮先作为同一阿里云 managed-memory 家族更新,不新建
产品条目,避免与 Bailian Memory Library / long-term memory API / OpenClaw memory
plugin 混淆。

## 3.2 2026-09 refresh

2026-09-07 复核长期记忆(新) API 时,官方文档显示重要记忆库从 2026-08-20
10:00 北京时间开始商业化计费;`AddMemory` / `SearchMemory` 区分 Pro / Lite,
Pro 开启 Rerank,Lite 关闭 Rerank;记忆片段与用户画像暂无失效日期;API 明确覆盖
`AddMemory` / `SearchMemory` / `ListMemory` / `UpdateMemory` /
`DeleteMemory`、自定义 metadata、自动去重和用户画像 schema。这是托管 memory API
的 product-behavior / pricing signal,不是独立质量结论。

## 4. 决策相关性 / Decision relevance

- **对照点**:百炼代表国内云平台把 long-term memory API 产品化的路线。
- **借鉴点**:memory fragments + user profile 的双层输出很适合对照 `profile` 与
  atomic memory 的边界。
- **差异点**:平台托管 API,不暴露底层 store 与 consolidation 细节。

## 5. 适用 / 不适用场景

- **适用**:已在阿里云百炼/Model Studio 上开发对话 agent;需要中文生态和云端托管
  memory API 的团队。
- **不适用**:跨云/本地优先 memory;需要 Markdown/git 可审计 artifact 的应用。

## 6. 注意事项 / 风险

- **平台依赖**:与百炼账号、API、限额和地域策略绑定。
- **透明度**:抽取、去重、冲突合并和排序逻辑由平台控制。
- **边界**:与 PolarDB/PolarSearch 的 Memory Container 是相邻但不同的产品线。

## 7. 进一步阅读

- archive: [`archives/alibaba-bailian-memory-overview.md`](archives/alibaba-bailian-memory-overview.md)
- 记忆库:https://help.aliyun.com/zh/model-studio/memory-library
- 长期记忆 API:https://help.aliyun.com/zh/model-studio/long-term-memory-2-0
- AgentLoop:https://help.aliyun.com/en/document_detail/3033860.html
- OpenClaw memory plugin:https://help.aliyun.com/en/model-studio/modelstudio-memory-for-openclaw

---

> *Ymem 项目对本笔记决策相关性的具体绑定见
> [`../docs/ymem-binding/relevance-index.md`](../docs/ymem-binding/relevance-index.md)。*
