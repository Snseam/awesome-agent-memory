---
title: Anuma
type: product
source: https://www.anuma.ai/ai-memory
date_first_seen: 2026-01
domain: personal-portable-memory
business_model: SaaS / consumer AI app
license: proprietary
memory_modules:
  - ingest-adapter
  - semantic-dedup
  - audit-ui
  - security-privacy
status: seed
last_revised: 2026-05-31
archive: archives/anuma-ai-memory-overview.md
---

# Anuma

## 1. 一句话定位

Anuma 是一个主打跨模型、私有、可携带 AI memory 的消费级 AI 平台:同一份
memory 在 ChatGPT、Claude、Gemini、DeepSeek、Kimi 等模型之间复用。

## 2. 是什么 / 做什么

Anuma 把问题定义为"各大 AI 平台的 memory 被锁在各自生态里"。它提供一个
统一 memory layer,让用户只建立一次 context,后续不同模型都能读到。

产品页强调:

- memory 加密在用户设备上
- 服务器只处理路由,不持有可读 plaintext memory
- 用户可以手动添加、编辑、标记 private、删除 memory
- memory 可导出
- 移动端、桌面端和 SMS / iMessage 场景共享同一份加密 memory

## 3. 关键技术选择

- **隐私叙事**:on-device encryption + user-owned memory
- **跨模型**:同一 memory 可跨 closed-source 与 open-source 模型
- **控制粒度**:单条 memory 可编辑、删除、标记 private
- **portable context**:把 memory portability 放在核心卖点

## 4. 决策相关性 / Decision relevance

- **对照点**:Anuma 是"memory ownership"路线的代表,不是 agent developer
  infra。
- **借鉴点**:
  - 单条 memory 的 edit/delete/private 控制是 `audit-ui` 与
    `security-privacy` 的强需求。
  - "跨模型记忆"可以作为 vendor-neutral memory kernel 的 C 端价值表达。
  - device-encrypted memory 提醒我们在 schema 中区分 plaintext、encrypted
    payload 与 source metadata。
- **差异点**:技术实现未开源,不能直接借用底层算法。

## 5. 适用 / 不适用场景

- **适用**:个人用户跨多个 AI 模型复用 context;关注 memory ownership 与
  导出的用户。
- **不适用**:需要 server-side agent SDK、企业 RAG、开源 self-host 的开发者。

## 6. 注意事项 / 风险

- **实现不透明**:加密、同步、导出格式与 open-source routing 的具体机制需
  以官方文档为准。
- **privacy claim 需验证**:官网声明不等于安全审计。
- **C 端定位**:它解决的是用户跨模型 context,不是团队 agent memory 后端。

## 7. 进一步阅读

- archive: [`archives/anuma-ai-memory-overview.md`](archives/anuma-ai-memory-overview.md)
- 官方:https://www.anuma.ai/
- AI memory page:https://www.anuma.ai/ai-memory

---

> *Ymem 项目对本笔记决策相关性的具体绑定见
> [`../docs/ymem-binding/relevance-index.md`](../docs/ymem-binding/relevance-index.md)。*
