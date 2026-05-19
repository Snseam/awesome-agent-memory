---
title: Letta — stateful agents with long-term memory (formerly MemGPT)
source: https://github.com/letta-ai/letta
date: 2023-2026 (ongoing)
domain: agent
memory_modules:
  - dream-consolidator
  - retriever-reranker
evidence_level: medium
code_available: yes
license: Apache 2.0
status: seed
last_revised: 2026-05-19
---

# Letta(原 MemGPT)

## Core idea

把 OS 的层次化内存隐喻搬到 LLM:有限的"主内存"(context window)+ 大容量
"虚拟内存"(external memory)。Agent 主动调用 `memory_insert` / `memory_search`
等工具决定哪些信息进入 context。原论文 MemGPT 提出 page-in/page-out 模型,
Letta 把它产品化为 stateful agent runtime。

## Architectural takeaways

- Agent 是 stateful 的一等概念(不是一次性请求 + 上下文)
- Memory 操作通过 tool calling 而非框架隐式管理 → 可解释、可审计
- Block-based memory(persona / human / archival)分类管理不同类型的记忆

## Decision relevance

- **Block / persona / human / archival 分类**值得借鉴:memory kernel `MemoryRecord` 可
  以保留一个 `kind` 字段(`profile | session | fact | procedure | trace`),
  让 host 能做相同的能力分类
- **Tool-style memory ops 启发 kernel API 形态**:不要做隐式 memory,做显式
  ingest/retrieve/consolidate
- **Page-in/out 不是 kernel 的关注点**:kernel 假设 host app 负责
  context window 编排;kernel 只产 `MemoryResult`,不参与 token-level packing

## What to deliberately not copy

- Letta 的 agent runtime / orchestration:不是 memory kernel 的领域,host app 决定
- Letta 把 memory 和 agent runtime 绑得很紧;kernel 的目标是 host-agnostic,所
  以 schema 不能反映 Letta 风格的 agent 状态机

## Open questions

- Letta 在公开 memory benchmark 上的表现?
- archival memory 的实际大小和检索成本曲线?

## Notes

(随版本更新追踪)

---

> *Ymem 项目对本笔记决策相关性的具体绑定见
> [`../ymem-binding/relevance-index.md`](../ymem-binding/relevance-index.md)。*
