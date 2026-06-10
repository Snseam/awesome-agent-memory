---
title: MemOS (MemTensor)
type: product
source: https://github.com/MemTensor/MemOS
date_first_seen: 2026-06
domain: memory-os
business_model: OSS + docs/community
license: Apache 2.0
memory_modules:
  - ingest-adapter
  - semantic-dedup
  - retriever-reranker
  - dream-consolidator
status: seed
last_revised: 2026-06-11
archive: archives/memos-overview.md
---

# MemOS

## 1. 一句话定位

MemTensor MemOS 是面向 LLM 和 AI agents 的 self-evolving memory OS,强调 ultra-
persistent memory、hybrid retrieval、跨任务 skill reuse 和 token savings。

## 2. 是什么 / 做什么

MemOS 把 memory 作为操作系统式资源管理问题:agent 产生的交互、知识和技能需要
被抽取、组织、检索和复用,而不是只保存在 chat history 或 vector chunks 中。

本仓将 **MemTensor MemOS** 与已有 [`memoryos.md`](memoryos.md) 区分:后者是
BAI-LAB MemoryOS / personal agent 的三层记忆系统;MemOS 是另一个产品/OSS 路线。

## 3. 关键技术选择

- **Memory OS framing**:以 OS/资源管理视角组织长期记忆。
- **Hybrid retrieval**:公开仓库标题和文档强调混合检索。
- **Cross-task skill reuse**:把可迁移经验/技能作为长期记忆产物。
- **Self-evolving memory**:强调随任务迭代自动沉淀。

## 4. 决策相关性 / Decision relevance

- **对照点**:与 EverOS、MemoryOS、TencentDB Agent Memory 一起形成 "memory OS"
  分支,但各自抽象层不同。
- **借鉴点**:skill reuse 和 token savings 的产品叙事说明市场不再满足于偏好/事实
  记忆,开始追求任务经验迁移。
- **差异点**:需要后续阅读代码与 paper 才能确认 schema 和 consolidation 机制。

## 5. 适用 / 不适用场景

- **适用**:研究 self-evolving agent memory;对比 OS-style memory 产品;
  构建需要跨任务经验复用的 agent。
- **不适用**:只需要轻量 user preference store;需要稳定托管 SLA 的企业采购。

## 6. 注意事项 / 风险

- **命名风险**:MemOS、MemoryOS、EverMemOS 很容易混淆,引用时必须写全前缀。
- **benchmark 自报**:仓库标题中的 token saving 数字按 vendor/self-reported 处理。
- **成熟度**:当前先作为 seed note,后续应补代码路径和 release health。

## 7. 进一步阅读

- archive: [`archives/memos-overview.md`](archives/memos-overview.md)
- GitHub:https://github.com/MemTensor/MemOS
- Docs:https://memos.openmem.net/

---

> *Ymem 项目对本笔记决策相关性的具体绑定见
> [`../docs/ymem-binding/relevance-index.md`](../docs/ymem-binding/relevance-index.md)。*
