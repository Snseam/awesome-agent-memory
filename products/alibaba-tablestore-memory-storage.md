---
title: Alibaba Cloud Tablestore Memory Storage Service
type: product
source: https://www.alibabacloud.com/help/en/tablestore/memory-storage-service-sub-product-test/memory-storage-overview
date_first_seen: 2026-09
domain: platform-managed-memory
business_model: Alibaba Cloud Tablestore pay-as-you-go service
license: Proprietary cloud service
memory_modules:
  - ingest-adapter
  - dream-consolidator
  - retriever-reranker
  - policy-privacy
status: seed
last_revised: 2026-09-28
archive: archives/alibaba-tablestore-memory-storage-overview.md
---

# Alibaba Cloud Tablestore Memory Storage Service

## 1. 一句话定位

Tablestore Memory Storage Service 是 AgentStorage 下的托管 agent memory
服务:写入对话或文本,异步抽取长期记忆,按 scope 检索,并提供结构化记忆、文件记忆和
后台整合任务。官方文档在 2026-09-24 更新了这一产品面。

## 2. 是什么 / 做什么

- `MemoryStore` 是顶层容器;`inputType=messages` 可输出 `structured`、`file`
  或两者,`inputType=file` 可由应用直接管理文件。输入/输出类型有创建时约束。
- `AddMemories` 保存原始消息并异步抽取长期记忆;`SearchMemories` 用语义与文本
  检索,可选 rerank,并可返回原始消息 evidence。长期记忆可 list/get/update/delete。
- 四级 scope 为 `appId/tenantId/agentId/runId`;写入不能用通配符,跨 session/
  agent 召回需要应用明确指定检索范围。`appId` 在检索时必填。
- 文件记忆支持 Markdown 等 UTF-8 文本的路径、版本和并发写入前提条件;由对话
  生成的文件是只读视图,应用直接管理的文件是另一种 store 模式。

## 3. 关键技术选择

- **Dream 整合**:结构化记忆任务提出合并、改写、去重或删除动作;
  `proposal` 要求调用方应用,`safe_auto` 按阈值应用,`plan` 要求批准计划。
  `skill`/`profile` 任务只发出事件,不会写入 store。
- **文件整合**:可把多个输入 scope 的文本文件整合到一个确定的输出 scope;
  这一路径自动写入,不提供结构化记忆的 proposal 确认流程。
- **可审计性**:官方接口列出请求审计、异步任务状态、原始消息 evidence 和文件
  历史版本;这些是公开 API 行为,不是对抽取质量的独立验证。

## 4. 产品边界与决策相关性

这是 Tablestore / AgentStorage 的 memory service,并非百炼 Model Studio 的
[`Memory Library`](alibaba-bailian-memory.md)。AgentLoop 和 Agent Run 也使用
"Memory Store" 名称,但官方文档描述的资源归属与集成方式不同;这里不把它们
计作同一 API 或额外产品条目。

对 Ymem 的直接对照是:结构化记忆与可写文件记忆的双轨输出、跨 scope 整合时的
授权边界、以及 proposal/auto/plan 三种写回策略。文件 Dream 自动写入且失败
不保证回滚,需要读取输出文件和版本后才能判断实际结果。

## 5. 注意事项 / 风险

- **文档参数冲突**:总览一处称 `SearchMemories` 只要求 `appId`,另一处要求
  `appId` 和 `tenantId`;结构化记忆页也只明确 `appId` 必填。`tenantId` 省略时
  的行为应以 API schema 或实测确认,应用侧先明确传入具体 tenant。
- **检索边界**:直接管理的文件不在 `SearchMemories` 的搜索范围内,需按路径读取
  或另行编译 Wiki。
- **厂商证据**:官方性能、规模和 token 节省数字均为厂商宣称;本笔记不据此判断
  相对质量。抽取/整合是异步过程,底层模型和误差分布尚未独立核验。

## 6. 进一步阅读

- archive: [`archives/alibaba-tablestore-memory-storage-overview.md`](archives/alibaba-tablestore-memory-storage-overview.md)
- [Memory Storage Service](https://www.alibabacloud.com/help/en/tablestore/memory-storage-service-sub-product-test/memory-storage-overview)
- [Memory store management](https://www.alibabacloud.com/help/en/tablestore/memory-storage-service-sub-product-test/manage-memory-stores)
- [Structured memory](https://www.alibabacloud.com/help/en/tablestore/memory-storage-service-sub-product-test/structured-memory)
- [File memory](https://www.alibabacloud.com/help/en/tablestore/memory-storage-service-sub-product-test/file-memory-1)
- [Memory Dream](https://www.alibabacloud.com/help/en/tablestore/memory-storage-service-sub-product-test/memory-consolidation-dream)

---

> *Ymem 项目对本笔记决策相关性的具体绑定见
> [`../docs/ymem-binding/relevance-index.md`](../docs/ymem-binding/relevance-index.md)。*
