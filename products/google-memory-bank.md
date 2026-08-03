---
title: Google Agent Platform Memory Bank
type: product
source: https://docs.cloud.google.com/gemini-enterprise-agent-platform/scale/memory-bank
date_first_seen: 2026-06
domain: platform-managed-memory
business_model: Google Cloud managed service
license: Proprietary cloud service
memory_modules:
  - ingest-adapter
  - dream-consolidator
  - retriever-reranker
  - policy-privacy
status: seed
last_revised: 2026-08-03
archive: archives/google-memory-bank-overview.md
---

# Google Agent Platform Memory Bank

## 1. 一句话定位

Google Agent Platform Memory Bank 是 Gemini Enterprise Agent Platform 的托管
长期记忆能力,用 scoped identities 从 user-agent conversations 中生成、检索和治理
长期 memories。

## 2. 是什么 / 做什么

官方文档将 Memory Bank 描述为 managed persistent store。它可从 conversations
动态生成 long-term memories,支持 event ingestion、customizable extraction、
multimodal inputs、TTL/configuration、revisions 和 IAM conditions。

## 3. 关键技术选择

- **Scope**:memory 绑定 `agent_name`、`user` 等 identity scope。
- **Async generation**:对话进入后异步生成可检索的 memories。
- **Governance**:TTL、revision、IAM condition 和 memory poisoning 指南是文档重点。
- **ADK integration**:面向 Google ADK/Agent Platform 的开发者入口。

## 3.1 2026-06 refresh

2026-06-23 版本的官方 docs 将 Memory Bank 描述为从 user-agent conversations
动态生成 long-term memories,并强调 scoped identity isolation、event ingestion、
similarity retrieval、TTL、revisions 与 IAM conditions。相较 2025 Vertex AI Memory
Bank preview,当前入口已明确归入 Gemini Enterprise Agent Platform。

2026-06-17 release notes 又把 Memory Bank and Sessions 的 multi-regional/global
endpoint support 标为 GA,并注明 global endpoint 不能使用 CMEK。该更新改变的是
部署位置与企业治理边界,不代表底层 memory extraction / ranking 机制公开。

## 3.2 2026-07 refresh

Google 2026-06-29 Gemini Enterprise Agent Platform release notes 将 Memory Bank
generation 的默认模型从 Gemini 2.5 Flash 改为 Gemini 3.5 Flash。该更新说明托管
memory extraction / generation 仍会随平台模型配置变化;它是产品行为证据,不代表
memory ranking 机制或质量有独立复现。

## 3.3 2026-08 refresh

2026-08-03 周更复核官方 setup / integration docs 时,Memory Bank 继续作为
Gemini Enterprise Agent Platform 的 managed memory instance 暴露。文档强调可用
topics、TTL 等 custom configurations,并可与 Agent Runtime 集成 read / write
memory。该更新只支持"Memory Bank 提供可配置托管 memory 与 runtime 集成"这一
产品行为判断,不支持独立质量或 benchmark 结论。

## 4. 决策相关性 / Decision relevance

- **对照点**:Memory Bank 是 hyperscaler 级 scoped memory store 的典型样本。
- **借鉴点**:memory poisoning 和 prompt-injection 防护被写进官方文档,值得纳入
  kernel 的 security/privacy 设计。
- **差异点**:面向 Google Cloud 平台,不是独立 portable memory kernel。

## 5. 适用 / 不适用场景

- **适用**:Google Cloud / Gemini Enterprise 上的业务 agent;需要 IAM 与托管
  governance 的企业。
- **不适用**:完全本地或跨云部署;需要用户直接编辑底层 memory artifact 的产品。

## 6. 注意事项 / 风险

- **可用性标签**:官方文档标为 Preview / Pre-GA,生产承诺需按 Google Cloud 条款
  再确认。
- **黑箱部分**:抽取、合并和排序逻辑不完全公开。
- **边界**:不要与 Gemini consumer personal context 混为同一产品。

## 7. 进一步阅读

- archive: [`archives/google-memory-bank-overview.md`](archives/google-memory-bank-overview.md)
- Docs:https://docs.cloud.google.com/gemini-enterprise-agent-platform/scale/memory-bank
- Setup:https://docs.cloud.google.com/gemini-enterprise-agent-platform/scale/memory-bank/setup
- Release notes:https://docs.cloud.google.com/gemini-enterprise-agent-platform/release-notes

---

> *Ymem 项目对本笔记决策相关性的具体绑定见
> [`../docs/ymem-binding/relevance-index.md`](../docs/ymem-binding/relevance-index.md)。*
