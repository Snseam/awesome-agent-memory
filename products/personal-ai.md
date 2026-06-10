---
title: Personal AI
type: product
source: https://www.personal.ai/products
date_first_seen: 2023-04
domain: personal-ai-memory
business_model: SaaS / platform
license: proprietary
memory_modules:
  - ingest-adapter
  - semantic-dedup
  - retriever-reranker
  - audit-ui
status: seed
last_revised: 2026-05-31
archive: archives/personal-ai-overview.md
---

# Personal AI

## 1. 一句话定位

Personal AI 是一个以"persistent, evolving memory"为底座的个人 AI 平台,同时
提供终端 assistant、persona builder 和 Memory Core 基础设施。

## 2. 是什么 / 做什么

产品页把平台拆成三层:

- **My AI**:面向普通用户的长期关系 assistant,记住对话并学习偏好
- **Persona Studio**:无代码配置和部署 AI persona,定义 personality、knowledge
  domains、memory behavior 和 guardrails
- **Memory Core**:面向开发者的统一 context/memory service,负责 encode、
  stabilize、recall、evolve persistent memory

它是 C 端个人 AI 与 B 端 memory infrastructure 混合形态,不是单纯开源框架。

## 3. 关键技术选择

- **记忆形态**:长期、持续演化的个人 memory
- **产品分层**:consumer app / persona builder / infrastructure
- **控制面**:guardrails 与 memory behavior 在 Persona Studio 中配置
- **开发者入口**:developer docs 与 Memory Core

## 4. 决策相关性 / Decision relevance

- **对照点**:Personal AI 表明"memory creates identity"是个人 AI 产品的核心
  叙事,不仅是 agent SDK 功能。
- **借鉴点**:
  - 把 memory behavior 变成 persona builder 的显式配置项,值得 host app
    的 admin UI 参考。
  - Memory Core 作为 infrastructure 层,说明 personal AI 公司也在把 C 端
    能力向开发者平台拆分。
- **差异点**:schema、更新逻辑和底层模型未公开,不适合作为 kernel 技术
  细节来源。

## 5. 适用 / 不适用场景

- **适用**:个人 assistant、creator persona、企业定制 AI persona。
- **不适用**:需要开源代码、本地部署或可审计 memory diff 的 agent kernel。

## 6. 注意事项 / 风险

- **黑盒**:Memory Core 具体 schema、检索、consolidation 未公开。
- **隐私与合规**:个人长期 memory 是高敏数据,需要单独看隐私、导出、删除
  与训练使用政策。
- **产品边界变化**:Personal AI 同时做 C 端与平台,比较时要区分 My AI、
  Persona Studio 和 Memory Core。

## 7. 进一步阅读

- archive: [`archives/personal-ai-overview.md`](archives/personal-ai-overview.md)
- 官方产品页:https://www.personal.ai/products
- Developer docs:https://docs.personal.ai/

---

> *Ymem 项目对本笔记决策相关性的具体绑定见
> [`../docs/ymem-binding/relevance-index.md`](../docs/ymem-binding/relevance-index.md)。*
