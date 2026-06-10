---
title: Honcho
type: product
source: https://github.com/plastic-labs/honcho
date_first_seen: 2026-06
domain: memory-infrastructure
business_model: OSS + managed API
license: AGPL-3.0
memory_modules:
  - ingest-adapter
  - semantic-dedup
  - retriever-reranker
  - dream-consolidator
status: seed
last_revised: 2026-06-11
archive: archives/honcho-overview.md
---

# Honcho

## 1. 一句话定位

Honcho 是用于构建 stateful agents 的 memory infrastructure,把 people、agents、
groups、projects 和 ideas 都建模为随时间变化的 peers / representations。

## 2. 是什么 / 做什么

Honcho 让应用保存 conversations、events、documents 和 tool traces,后台异步 reason,
再让开发者查询 peer representations、session context、search results 或自然语言
insights。它提供 managed API 和 self-host FastAPI server,并有 SDK、MCP 与 agent
integrations。

## 3. 关键技术选择

- **Peer-centric model**:human/user/agent/group/project 都可以是 peer。
- **Async reasoning loop**:store -> reason -> query -> inject。
- **Representations**:低延迟 snapshot 与 session context 同时存在。
- **Hybrid search**:README 提到 BM25 + vector search。
- **Integrations**:Claude Code、OpenCode、OpenClaw、Hermes、Cursor-compatible MCP。

## 4. 决策相关性 / Decision relevance

- **对照点**:Honcho 的独特性在于 "who knows what about whom" 的 peer modeling,
  比普通 user memory 更适合 multi-agent/social agent。
- **借鉴点**:background reasoning 与 representation endpoint 可作为热路径/冷路径
  分离参考。
- **差异点**:marketing/eval claims 需独立复现。

## 5. 适用 / 不适用场景

- **适用**:教育、陪伴、社区、多 agent 协作等需要长期建模参与者关系的产品;希望
  self-host 或托管 API 二选一的开发者。
- **不适用**:只需要简单 session summary;需要 permissive license 的商业内嵌库。

## 6. 注意事项 / 风险

- **许可**:AGPL-3.0 对闭源产品内嵌有影响。
- **benchmark 自报**:"Pareto Frontier" 等 eval/性能定位来自 Honcho 官方材料。
- **隐私边界**:peer-to-peer representation 需要清晰的 consent、scope 和 deletion 策略。

## 7. 进一步阅读

- archive: [`archives/honcho-overview.md`](archives/honcho-overview.md)
- GitHub:https://github.com/plastic-labs/honcho
- Docs:https://docs.honcho.dev/

---

> *Ymem 项目对本笔记决策相关性的具体绑定见
> [`../docs/ymem-binding/relevance-index.md`](../docs/ymem-binding/relevance-index.md)。*
