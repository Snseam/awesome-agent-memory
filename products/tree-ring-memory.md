---
title: Tree Ring Memory
type: product
source: https://github.com/TerminallyLazy/Tree-Ring-Memory
date_first_seen: 2026-07
domain: local-first-coding-agent-memory
business_model: OSS
license: MIT
memory_modules:
  - ingest-adapter
  - retriever-reranker
  - dream-consolidator
  - policy-privacy
status: seed
last_revised: 2026-07-07
archive: archives/tree-ring-memory-overview.md
---

# Tree Ring Memory

## 1. 一句话定位

Tree Ring Memory 是 framework-agnostic、local-first 的 AI agent memory
lifecycle layer,用 Rust CLI + SQLite/FTS 管理项目级记忆的写入、召回、遗忘、
审计、整合和可视化查看。

## 2. 是什么 / 做什么

官方 README 把 Tree Ring Memory 定位为面向 AI agents 的 memory lifecycle layer,
避免把长期记忆变成 transcript dump。公开运行时是 Rust-native CLI 与 crates:
`tree-ring-memory-core` 负责模型、校验、敏感性检查和 recall scoring,
`tree-ring-memory-sqlite` 负责 SQLite/FTS 存储与过滤,
`tree-ring-memory-cli` 暴露 `remember`、`recall`、`forget`、`evidence`、
`audit`、`consolidate`、`maintain`、`dox sync`、`revolve sync`、
`integrations scan` 和 Ratatui TUI。

GitHub API spot-check on 2026-07-07 显示仓库 created 2026-07-04,pushed
2026-07-07,MIT license,topics 包含 `agent-memory`、`local-first`、`rust`、
`sqlite`、`cli`、`ratatui`、`dox`、`revolve`。项目处于 protocol-preview 状态。

## 3. 关键技术选择

- **Lifecycle rings**:把记忆分为 fresh rings、scars、heartwood、seeds 等生命周期
  状态,强调老化、保留、遗忘和证据提升,而不是无差别保留全部对话。
- **Rust-native local store**:durable memory 默认存在项目 `.tree-ring/` 下的
  SQLite/FTS store,无必需云服务。
- **Explicit write / delete surfaces**:`remember`、`evidence`、`forget`、
  `audit`、`maintain` 把写入、证据、删除/重写、质量检查和维护分开。
- **Agent-mediated integration**:生成 `.tree-ring/AGENTS.md`、`.tree-ring/SKILL.md`
  和 `.tree-ring/CLI.md`,并通过 bridge instructions 接入 Codex/Gemini-style
  skills、Claude Code、OpenCode/AGENTS.md、DOX 和 Revolve 工作流。
- **No hidden recorder**:README 明确说明 memory updates 是 agent-mediated;TUI
  event stream 不会在没有显式写入命令时变成 durable memory。

## 4. 决策相关性 / Decision relevance

- **对照点**:Tree Ring Memory 是 local-first coding-agent memory 的一个轻量样本,
  重点不是最大化自动抽取,而是让 memory lifecycle、audit、forget 和 evidence
  成为可见操作面。
- **借鉴点**:rings/scars/heartwood 这种生命周期语言适合启发 memory kernel 的
  retention、promotion、supersession 和 review UX。
- **差异点**:它目前不是 MCP server 或 cloud memory API,而是 CLI/crate + bridge
  guidance;host integration 仍由 agent 或项目文件承担。

## 5. 适用 / 不适用场景

- **适用**:需要本地优先、可审计、可删除的 coding-agent/project memory;希望把
  decisions、warnings、evidence 和 lessons 变成可维护记忆的个人开发者和团队。
- **不适用**:需要托管多租户 memory service、MCP server、向量云、独立 benchmark
  证明或自动 transcript capture 的场景。

## 6. 注意事项 / 风险

- **早期状态**:项目公开标注为 protocol-preview,GitHub adoption signal 还很早。
- **无独立 benchmark**:本笔记不记录性能或准确率 claim;需要后续 benchmark 才能进入
  `benchmarks/claims/claims.yaml`。
- **集成边界**:agent-framework bridge 目前主要是文件/skill 指针和 CLI guidance,
  不是内建 MCP server。

## 7. 进一步阅读

- archive: [`archives/tree-ring-memory-overview.md`](archives/tree-ring-memory-overview.md)
- GitHub:https://github.com/TerminallyLazy/Tree-Ring-Memory
- Site:https://terminallylazy.github.io/Tree-Ring-Memory/
- Press kit:https://terminallylazy.github.io/Tree-Ring-Memory/press-kit.md

---

> *Ymem 项目对本笔记决策相关性的具体绑定见
> [`../docs/ymem-binding/relevance-index.md`](../docs/ymem-binding/relevance-index.md)。*
