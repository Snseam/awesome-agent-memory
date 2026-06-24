---
title: memU
type: product
source: https://github.com/NevaMind-AI/memU
date_first_seen: 2026-06
domain: workspace-to-agent-memory
business_model: OSS / productizing
license: NOASSERTION
memory_modules:
  - parser-chunker
  - ingest-adapter
  - dream-consolidator
  - retriever-reranker
status: seed
last_revised: 2026-06-24
archive: archives/memu-overview.md
---

# memU

## 1. 一句话定位

memU 是 "workspace to agent memory" 路线的 memory runtime,把 conversations、
documents、code、images、audio 和 tool traces 编译成 agent 可持续使用的 durable
memory layers。

## 2. 是什么 / 做什么

本轮 GitHub API spot-check 显示 `NevaMind-AI/memU` created 2025-07-29,updated
2026-06-24,pushed 2026-06-24,Python 主语言,homepage 为 `memu.pro`。repo topics
覆盖 `agent-memory`、`mcp`、`openclaw`、`sandbox`、`skills`、`proactive-ai`。

## 3. 关键技术选择

- **Workspace runtime**:输入面不止对话,还包括文件、代码、媒体和工具 traces。
- **Multimodal / file-oriented signal**:把 workspace 编译为 durable memory,与
  file/skill memory 方向接近。
- **Agent ecosystem focus**:README 和 topics 都指向 OpenClaw/MCP/skills 生态。

## 4. 决策相关性 / Decision relevance

- **对照点**:workspace-level memory 比 chat memory 更接近 coding/productivity agent 的真实输入。
- **借鉴点**:`parser-chunker` 与 `ingest-adapter` 需要处理 heterogeneous workspace evidence。
- **差异点**:本仓尚未验证其三层 memory 结构、检索质量和 forgetting 行为。

## 5. 注意事项 / 风险

- **License 未清**:GitHub API 返回 `NOASSERTION`;README 徽章与实际 LICENSE 需后续人工核查。
- **成熟度**:活跃度高但本地未跑 demo。
- **证据边界**:只收录产品/架构信号,不采纳未复核的性能 claim。

## 6. 进一步阅读

- archive: [`archives/memu-overview.md`](archives/memu-overview.md)
- GitHub:https://github.com/NevaMind-AI/memU
- Homepage:https://memu.pro

---

> *Ymem 项目对本笔记决策相关性的具体绑定见
> [`../docs/ymem-binding/relevance-index.md`](../docs/ymem-binding/relevance-index.md)。*
