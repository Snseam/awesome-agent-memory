---
title: Supermemory
type: product
source: https://supermemory.ai/
date_first_seen: 2026-05
domain: context-cloud
business_model: OSS+SaaS / API / personal app
license: MIT (open-source repo); commercial cloud terms for hosted service
memory_modules:
  - ingest-adapter
  - parser-chunker
  - semantic-dedup
  - retriever-reranker
  - dream-consolidator
status: seed
last_revised: 2026-05-31
archive: archives/supermemory-overview.md
---

# Supermemory

## 1. 一句话定位

Supermemory 把自己定位为 "context cloud for agents":同时卖 memory、RAG、
profiles、connectors、extractors 和 personal app,试图覆盖 agent 的完整上下文
栈。

## 2. 是什么 / 做什么

产品页把 Supermemory 拆成一组上下文 primitives:

- Memory & continual learning
- SuperRAG retrieval
- Filesystem mount
- User profiles
- Connectors(Slack、Notion、Drive、Gmail、GitHub、S3 等)
- Extractors(PDF、网页、图片、音频、文件)
- Qualitative analysis

它强调"memory, RAG, and profiles live in the same queryable graph",不是孤立
的 vector chunk。面向开发者有 API/SDK,面向最终用户有 Personal Supermemory
和浏览器 / coding-agent 插件。

GitHub `supermemoryai/supermemory` 截至 2026-05-31 约 22.9k stars,MIT
license,仍活跃更新。

## 3. 关键技术选择

- **统一图结构**:memory、RAG、profile 共用可查询 graph
- **connectors**:多源同步,偏实时更新
- **deployment**:hosted、self-host、BYOC、air-gapped/on-prem 都在产品页中
  出现
- **latency claims**:产品页声称 sub-300ms recall
- **MCP / plugins**:产品目录明确列出 MCP 与插件形态

## 4. 决策相关性 / Decision relevance

- **对照点**:Supermemory 是 memory-as-context-infrastructure 的商业化样本,
  比单一 SDK 更像"上下文云"。
- **借鉴点**:
  - 把 connectors、profiles、RAG 和 memory 放进同一产品叙事,说明市场正在
    从"记忆库"转向"完整 context stack"。
  - filesystem mount 是 agent 可直接消费的接口形态,值得 `ingest-adapter`
    和 host integration 参考。
  - personal app + developer API 双入口值得关注。
- **差异点**:Supermemory 目前更偏全栈产品,本仓 kernel 应避免把 connectors
  和 UI 直接塞进 core。

## 5. 适用 / 不适用场景

- **适用**:需要快速接入多源上下文的 AI assistant;希望 memory/RAG/profile
  一体化的 SaaS 团队;需要 on-prem 或 BYOC 的企业。
- **不适用**:只想研究底层 memory schema 的学术实验;必须完全排除商业
  control plane 的本地单机工作流。

## 6. 注意事项 / 风险

- **benchmark 自报**:SOTA 与 latency claim 主要来自产品页,需独立复现。
- **scope 膨胀**:产品覆盖 memory、RAG、connectors、analysis,比较时应拆开
  看,不要把它与单一 agent memory SDK 直接等价。
- **企业能力验证**:SOC2/GDPR/on-prem 由产品页声明,采购前仍需正式合规材料。

## 7. 进一步阅读

- archive: [`archives/supermemory-overview.md`](archives/supermemory-overview.md)
- 官方:https://supermemory.ai/
- GitHub:https://github.com/supermemoryai/supermemory

---

> *Ymem 项目对本笔记决策相关性的具体绑定见
> [`../docs/ymem-binding/relevance-index.md`](../docs/ymem-binding/relevance-index.md)。*
