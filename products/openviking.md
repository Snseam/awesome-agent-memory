---
title: OpenViking
type: product
source: https://volcengine-openviking.mintlify.app/
date_first_seen: 2026-06
domain: context-database
business_model: OSS / Volcengine ecosystem
license: Apache 2.0
memory_modules:
  - parser-chunker
  - retriever-reranker
  - dream-consolidator
status: seed
last_revised: 2026-06-11
archive: archives/openviking-overview.md
---

# OpenViking

## 1. 一句话定位

OpenViking 是火山引擎开源的 AI Agent context database,用 filesystem paradigm 统一
memory、resources 和 skills,并通过 L0/L1/L2 层级加载降低长期任务上下文成本。

## 2. 是什么 / 做什么

官方文档把 OpenViking 定位为 "The Context Database for AI Agents"。它不是纯
memory layer,而是 context substrate:memory、resources、skills 都以 `viking://`
文件系统式 URI 管理,支持 hierarchical loading、semantic retrieval、session
management 和 MCP/OpenClaw/Claude Desktop 等集成。

## 3. 关键技术选择

- **Filesystem paradigm**:用目录、URI、`ls/find/grep` 等心智模型管理上下文。
- **L0/L1/L2 context**:abstract、overview、full detail 按需加载。
- **Directory recursive retrieval**:从 intent analysis 到 directory positioning 再递归检索。
- **Self-evolving memory**:sessions 自动抽取 profile、preferences、entities、
  events、cases、patterns 六类 memory。

## 4. 决策相关性 / Decision relevance

- **对照点**:OpenViking 把 memory 放进更广义的 context DB,是本仓需要区分的相邻
  但核心相关路线。
- **借鉴点**:层级上下文加载和可视化 retrieval trajectory 很适合解决 context opacity。
- **差异点**:它不只是 memory;归类时应写成 context database with first-class memory。

## 5. 适用 / 不适用场景

- **适用**:OpenClaw/coding agent 长任务;需要统一 memory/resources/skills 的 agent;
  追求上下文层级加载的本地/开源工作流。
- **不适用**:只需要用户偏好存储;不希望引入新的 context filesystem 抽象的轻量应用。

## 6. 注意事项 / 风险

- **benchmark 自报**:OpenClaw completion/token 数字来自官方文档,按 vendor-claimed 处理。
- **边界**:不可把它简化成 vector DB 或普通 RAG。
- **生态依赖**:OpenClaw 集成是亮点,但跨 runtime 的成熟度仍需验证。

## 7. 进一步阅读

- archive: [`archives/openviking-overview.md`](archives/openviking-overview.md)
- Docs:https://volcengine-openviking.mintlify.app/
- GitHub:https://github.com/volcengine/OpenViking

---

> *Ymem 项目对本笔记决策相关性的具体绑定见
> [`../docs/ymem-binding/relevance-index.md`](../docs/ymem-binding/relevance-index.md)。*
