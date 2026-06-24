---
title: Memori
type: product
source: https://github.com/MemoriLabs/Memori
date_first_seen: 2026-06
domain: agent-native-memory-infrastructure
business_model: OSS / productizing
license: NOASSERTION
memory_modules:
  - ingest-adapter
  - dream-consolidator
  - retriever-reranker
status: seed
last_revised: 2026-06-24
archive: archives/memori-overview.md
---

# Memori

## 1. 一句话定位

Memori 是 agent-native memory infrastructure,主张把 agent execution 与 conversation
转成 structured persistent state,服务 production agent systems。

## 2. 是什么 / 做什么

本轮 GitHub API spot-check 显示 `MemoriLabs/Memori` created 2025-07-24,updated
2026-06-23,pushed 2026-06-15,Python 主语言,homepage 为 `memorilabs.ai`。repo
description 明确写到 LLM-agnostic memory layer、structured persistent state 和
production systems。

## 3. 关键技术选择

- **Trace-aware memory**:定位不只存 conversation,也关注 agent execution state。
- **LLM-agnostic**:公开描述强调跨模型层,不是单一 vendor memory。
- **Production framing**:更像面向团队/平台的 memory infra,而非单用户插件。

## 4. 决策相关性 / Decision relevance

- **对照点**:把 tool/result/workflow outcome 纳入 memory,补足纯 chat memory 的盲区。
- **借鉴点**:`ingest-adapter` 应能接 agent trace,而非只接 user/assistant message。
- **风险点**:GitHub license API 返回 `NOASSERTION`,需要人工确认 license 后再推荐集成。

## 5. 注意事项 / 风险

- **License 未清**:本轮只记录 GitHub API 的 `NOASSERTION`;商业或二次分发需单独审查。
- **证据边界**:官方站/README claim 不能替代独立 benchmark。
- **成熟度**:活跃度强,但本仓尚未读源码或运行 demo。

## 6. 进一步阅读

- archive: [`archives/memori-overview.md`](archives/memori-overview.md)
- GitHub:https://github.com/MemoriLabs/Memori
- Homepage:https://memorilabs.ai

---

> *Ymem 项目对本笔记决策相关性的具体绑定见
> [`../docs/ymem-binding/relevance-index.md`](../docs/ymem-binding/relevance-index.md)。*
