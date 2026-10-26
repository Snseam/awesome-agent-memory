---
title: OpenViking
type: product
source: https://openviking.ai/
date_first_seen: 2026-06
domain: context-database
business_model: OSS / Volcengine ecosystem
license: Apache 2.0
memory_modules:
  - parser-chunker
  - retriever-reranker
  - dream-consolidator
status: seed
last_revised: 2026-10-26
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

2026-09-21 周更复核到官方 releases `v0.4.21` 与 Python SDK `0.1.12`
(2026-09-18 至 2026-09-20)。更新信号包括 Hermes、MiMo/MiMoCode 和
WorkBuddy memory/log integrations、standalone Hermes memory provider，以及
storage、queue、locking、retrieval、MCP 和 local vector-store 的可靠性修复。
这些是官方 product behavior,不等同于独立 benchmark 或质量结论。

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

## 2026-10-02 v0.4.23 release

The official `v0.4.23` release adds global vector recall with unified
reranking, BM25 support across REST/MCP/SDK surfaces, event-time decay,
in-place memory compilation for dedupe/merge/normalize, and account-level
extraction rules plus ACL tooling. It also improves session auto-commit
compatibility.

These are documented product behaviors. OpenViking's token or completion
figures remain vendor claims and are not upgraded to independent benchmark
evidence by this release.

> Release: https://github.com/volcengine/OpenViking/releases/tag/v0.4.23

## 2026-10-23 v0.5.2 lifecycle and migration refresh

The official v0.5.2 release (checked 2026-10-26) adds session privacy
extraction/restore and privacy-tree tools, incremental compile updates with
scheduling and version history, and changes to pending-write replay and session
extraction.

Working Memory/checkpoint summaries now default off, while sessions still
archive raw messages and extract long-term memories; `enable_working_memory=true`
explicitly enables the former. This separates a context-summary policy from
long-term memory ingestion.

Migration details matter: LangChain imports move to the separate
`langchain-openviking` package; repeated watch-enabled imports no longer
reactivate an existing watch; mixed-script peer identities use lossless IDs,
and older ambiguous directories need an operator ownership decision. The
release also states that root API keys are refused on `/mcp`.

These are release-documented behaviors, not an independent privacy, durability,
retrieval-quality, or migration acceptance result. No SDK or server integration
was run for this note.

Sources: [v0.5.2 release](https://github.com/volcengine/OpenViking/releases/tag/v0.5.2),
[versioned LangChain migration guide](https://github.com/volcengine/OpenViking/blob/v0.5.2/docs/en/agent-integrations/07-langchain-langgraph.md).

## 7. 进一步阅读

- archive: [`archives/openviking-overview.md`](archives/openviking-overview.md)
- Docs:https://openviking.ai/
- Documentation:https://docs.openviking.ai/
- GitHub:https://github.com/volcengine/OpenViking
- Release v0.4.21:https://github.com/volcengine/OpenViking/releases/tag/v0.4.21
- Python SDK 0.1.12:https://github.com/volcengine/OpenViking/releases/tag/python-sdk%400.1.12

---

> *Ymem 项目对本笔记决策相关性的具体绑定见
> [`../docs/ymem-binding/relevance-index.md`](../docs/ymem-binding/relevance-index.md)。*
