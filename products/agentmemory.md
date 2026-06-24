---
title: agentmemory
type: product
source: https://github.com/rohitg00/agentmemory
date_first_seen: 2026-06
domain: coding-agent-memory
business_model: OSS
license: Apache-2.0
memory_modules:
  - ingest-adapter
  - retriever-reranker
  - policy-privacy
status: seed
last_revised: 2026-06-24
archive: archives/agentmemory-overview.md
---

# agentmemory

## 1. 一句话定位

agentmemory 是面向 AI coding agents 的 persistent memory layer,以 MCP/CLI/REST
形态把 Claude Code、Codex、Cursor、OpenClaw、Hermes 等 agent 的项目上下文和决策
跨 session 保存与召回。

## 2. 是什么 / 做什么

GitHub repo 描述为 "persistent memory for AI coding agents"。本轮 GitHub API
spot-check 显示仓库仍活跃:created 2026-02-25,updated 2026-06-24,pushed
2026-06-22,Apache-2.0 license,TypeScript 主语言,并带有 `codex`、`openclaw`、
`memory`、`agentmemory` 等 topics。

## 3. 关键技术选择

- **Coding-agent-first**:把 memory 问题定位在开发 agent 的项目上下文、决策和历史。
- **Multi-client surface**:README/GitHub topics 显示覆盖 Claude Code、Codex、
  Cursor、OpenClaw、GitHub Copilot CLI 等入口。
- **MCP/REST/CLI signal**:适合作为 coding-agent memory server 类产品观察样本。

## 4. 决策相关性 / Decision relevance

- **对照点**:coding-agent memory 正在从插件零散能力走向可共享 memory server。
- **借鉴点**:multi-client namespace、project-scoped recall 和 agent-neutral API
  对 Ymem host integration 有参考价值。
- **差异点**:本仓尚未审计其 retrieval quality、staleness handling 与 schema 设计。

## 5. 适用 / 不适用场景

- **适用**:希望多个 coding agents 共享项目记忆的个人开发者和团队。
- **不适用**:需要经过独立 benchmark 证明的企业 memory kernel;需要完全审计内部算法的场景。

## 6. 注意事项 / 风险

- **成熟度**:虽然 GitHub 活跃度很高,但本笔记只把 stars/activity 当 discovery signal。
- **证据边界**:benchmark claim 需要独立复核后才能进入 `benchmarks/claims/claims.yaml`。
- **范围**:它属于 coding-agent memory 产品,不是通用企业 managed memory。

## 7. 进一步阅读

- archive: [`archives/agentmemory-overview.md`](archives/agentmemory-overview.md)
- GitHub:https://github.com/rohitg00/agentmemory
- Homepage:https://agent-memory.dev

---

> *Ymem 项目对本笔记决策相关性的具体绑定见
> [`../docs/ymem-binding/relevance-index.md`](../docs/ymem-binding/relevance-index.md)。*
