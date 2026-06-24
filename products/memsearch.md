---
title: memsearch
type: product
source: https://github.com/zilliztech/memsearch
date_first_seen: 2026-06
domain: coding-agent-memory
business_model: OSS
license: MIT
memory_modules:
  - ingest-adapter
  - semantic-dedup
  - retriever-reranker
status: seed
last_revised: 2026-06-24
archive: archives/memsearch-overview.md
---

# memsearch

## 1. 一句话定位

memsearch 是 Zilliz 开源的 cross-platform semantic memory layer,面向 Claude Code、
Codex、OpenCode、OpenClaw 等 coding agents,以 Markdown + Milvus/Hybrid Search 保存
和召回跨 session 项目记忆。

## 2. 是什么 / 做什么

本轮 GitHub API spot-check 显示 `zilliztech/memsearch` created 2026-02-09,updated
2026-06-23,pushed 2026-06-22,MIT license,Python 主语言,homepage 为
`zilliztech.github.io/memsearch/`。公开 docs 描述其为 cross-platform semantic
memory for AI coding agents。

## 3. 关键技术选择

- **Markdown + vector backend**:human-readable artifact 与 Milvus/hybrid search 结合。
- **Coding-agent plugins**:面向 Claude Code、Codex CLI、OpenCode/OpenClaw 等入口。
- **Automatic capture / recall**:产品定位强调用户安装后无需手动保存命令。

## 4. 决策相关性 / Decision relevance

- **对照点**:Zilliz/Milvus 路线代表 vector DB 厂商把 agent memory 上移到插件层。
- **借鉴点**:Markdown source + semantic index 是兼顾可审计与检索性能的折中形态。
- **差异点**:底层仍强依赖 Milvus/embedding stack,不等同于完整 memory governance layer。

## 5. 注意事项 / 风险

- **范围**:主要是 coding-agent 项目记忆,不是 enterprise user-profile memory。
- **claim 边界**:本笔记只记录官方 repo/docs 可验证能力,不写独立性能结论。

## 6. 进一步阅读

- archive: [`archives/memsearch-overview.md`](archives/memsearch-overview.md)
- GitHub:https://github.com/zilliztech/memsearch
- Docs:https://zilliztech.github.io/memsearch/

---

> *Ymem 项目对本笔记决策相关性的具体绑定见
> [`../docs/ymem-binding/relevance-index.md`](../docs/ymem-binding/relevance-index.md)。*
