---
title: AWS Bedrock AgentCore Memory
type: product
source: https://docs.aws.amazon.com/bedrock-agentcore/latest/devguide/memory.html
date_first_seen: 2026-06
domain: platform-managed-memory
business_model: AWS managed service
license: Proprietary cloud service
memory_modules:
  - ingest-adapter
  - dream-consolidator
  - retriever-reranker
  - policy-privacy
status: seed
last_revised: 2026-06-29
archive: archives/aws-agentcore-memory-overview.md
---

# AWS Bedrock AgentCore Memory

## 1. 一句话定位

Bedrock AgentCore Memory 是 AWS 为 AgentCore agents 提供的托管短期/长期记忆层,
目标是让 stateless agent 跨 session 保留上下文、偏好、事实和摘要。

## 2. 是什么 / 做什么

官方文档把 memory 拆成 short-term memory 和 long-term memory。Short-term 负责
session events 与当前会话上下文;long-term memory 从 session 中自动抽取 key
insights、user preferences、facts 和 session summaries,并在未来会话中检索。

## 3. 关键技术选择

- **Memory resource**:agent 绑定一个 managed memory resource。
- **Session events**:通过 `sessionId` 等范围保存会话历史。
- **Strategies**:长期记忆由 strategy 决定抽取什么;可用内建、覆盖或自管策略。
- **Managed lifecycle**:云服务负责存储、检索和跨会话召回。

## 3.1 2026-06 refresh

- 2026-03-12 AWS 发布 LTM record streaming:memory record create/update/delete 可
  通过 Kinesis stream 触发事件,减少 polling。What’s New 页面只概述 created/modified,
  record-streaming developer guide 进一步列出 delete event type。
- 2026-05-06 AWS 发布 long-term memory metadata:memory record 可带 structured
  indexed keys,用于 tag/filter/retrieve。
- 2026-06-18 AWS 宣布 Bedrock AgentCore Harness GA。官方博客写明 Harness 会在
  未显式配置 memory 时自动创建 customer-owned AgentCore Memory resource,默认
  `SEMANTIC` + `SUMMARIZATION` strategies、30-day event expiry、AWS-owned
  encryption 和按 `actorId` namespace template 的 multi-tenant isolation;也支持
  BYO memory ARN 或显式关闭 memory。
- 这使 AgentCore Memory 从"托管 LTM"进一步接近 evented memory lifecycle infra,
  对 Ymem 的 `memorydiff-generator` 和审计流水线有对照价值。

## 4. 决策相关性 / Decision relevance

- **对照点**:AWS 把 memory 当成 agent runtime 的可配置云资源,说明 hyperscaler
  正在把长期记忆产品化。
- **借鉴点**:strategy 化抽取很适合对照 kernel 的 policy-driven consolidation。
- **差异点**:内部 store、冲突合并和可审计 diff 没有完全公开。

## 5. 适用 / 不适用场景

- **适用**:已在 Bedrock/AgentCore 上构建 agent 的企业;需要 AWS IAM/合规/托管
  能力的业务 agent。
- **不适用**:跨云或本地优先 memory;需要 portable Markdown/graph artifact 的场景。

## 6. 注意事项 / 风险

- **平台绑定**:memory 与 Bedrock AgentCore 生态深度绑定。
- **透明度**:托管服务便利但降低 schema 和 consolidation 的可见度。
- **成本/权限**:真实生产接入要评估 memory retention、tenant isolation 与 IAM 范围。

## 7. 进一步阅读

- archive: [`archives/aws-agentcore-memory-overview.md`](archives/aws-agentcore-memory-overview.md)
- Docs:https://docs.aws.amazon.com/bedrock-agentcore/latest/devguide/memory.html
- Strategies:https://docs.aws.amazon.com/bedrock-agentcore/latest/devguide/memory-strategies.html
- Streaming announcement:https://aws.amazon.com/about-aws/whats-new/2026/03/agentcore-memory-streaming-ltm/
- Streaming developer guide:https://docs.aws.amazon.com/bedrock-agentcore/latest/devguide/memory-record-streaming.html
- Metadata:https://aws.amazon.com/about-aws/whats-new/2026/05/agentcore-longterm-memory-metadata/
- Harness GA:https://aws.amazon.com/blogs/machine-learning/amazon-bedrock-agentcore-harness-is-now-generally-available-go-from-idea-to-production-grade-agent-in-minutes/
- Release notes:https://docs.aws.amazon.com/bedrock-agentcore/latest/devguide/release-notes.html

---

> *Ymem 项目对本笔记决策相关性的具体绑定见
> [`../docs/ymem-binding/relevance-index.md`](../docs/ymem-binding/relevance-index.md)。*
