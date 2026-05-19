---
title: Agent Memory — a living survey
maintainer: yyl
last_revised: 2026-05-18
status: seed
language: zh-CN
---

# Agent Memory:一份持续迭代的综述

> 这是一份**活文档**:每次我读完新论文或测试新产品,都会回来重写相关章节。
> 不追求覆盖完整,追求对 Ymem 算法决策有用。

## 0. 这份综述的位置

- 它**不是**学术综述,不在意 citation 完备性。
- 它**是**一份决策辅助文档:帮助我和读者判断"现有方法里哪些是 Ymem 应该采纳、
  哪些应该忽略、哪些应该等技术再成熟"。
- 每个章节末尾应该回答一个具体问题:`这对 Ymem 意味着什么?`

## 1. 问题陈述:为什么 agent 需要 memory

(占位 — 待写)

要点:
- 长上下文不是答案(MemAgent / ReMemR1 / RoT)
- 多轮对话会让 agent 迷路(`LLMs Get Lost in Multi-Turn Conversation`)
- raw conversation history ≠ long-term memory
- memory 必须有更新、过期、冲突、遗忘的生命周期

## 2. 现有方法分类

(占位 — 待写)

初步划分维度:

```text
按存储:
  vector-only | hybrid | graph | hierarchical | LLM-maintained wiki

按更新策略:
  append-only | overwrite | supersede + history | dream-style consolidation

按读取策略:
  top-k chunk | agentic search | code-mode retrieval | progressive disclosure

按治理强度:
  no review | post-hoc audit | human-in-the-loop diff | full provenance + valid-time
```

## 3. 评测体系

(占位 — 待写)

四类能力(借用 MemoryAgentBench 的划分):

- accurate retrieval
- test-time learning
- long-range understanding
- selective forgetting

主要 benchmark:
- LongMemEval([papers/longmemeval.md](../papers/longmemeval.md))
- MemoryAgentBench([papers/memoryagentbench.md](../papers/memoryagentbench.md))
- LoCoMo([papers/locomo.md](../papers/locomo.md))
- MemoryArena(待加)

## 4. 关键启发与 Ymem 立场

### 4.1 Dream / consolidation 不能自动改主线

来源:Claude Dreams([products/claude-dreams.md](../products/claude-dreams.md))

立场:Ymem 的 `consolidate` 只产 `MemoryDiff` 候选,绝不直接 mutate canonical
store。这是 host app 审核的边界,也是 Ymem 设计的硬约束。

### 4.2 时间与版本是核心

每条 memory 必须能回答:`valid_from / valid_to / supersedes / contradicted_by /
last_verified_at`。企业知识最大的风险不是"找不到",而是"找到旧的但看起来合理"。

### 4.3 GraphRAG 不在 v0 主路径

UniGraphRAG / LinearRAG 等图谱方法值得追踪,但 v0 Ymem 不重度依赖图谱。关系抽
取作为 enricher plugin 而非核心读路径前置依赖。

### 4.4 Agent-first,不是 CRUD-first

David Soria Parra 的 MCP 分享对 Ymem API 的启示:不要暴露
`getSemanticUnit / listCanonicalCluster / updateMemoryDiff` 这种 CRUD,而要面向
任务暴露 `ingest / retrieve / consolidate / explain` 这种高层 verbs。

(本节随阅读量增加持续扩展。)

## 5. 待跟进的方向

按优先级:

1. **Memory-T1** / 时间版本化:对 Ymem `valid_from/valid_to` 的设计影响
2. **MemAgent / ReMemR1** / 长上下文与 memory 的边界
3. **Skills over MCP** / 影响 host-app 侧但反推 Ymem 输出形状
4. **HiPRAG / MC-Search** / agentic retrieval 是否进入 Ymem `retrieve` 的默认实现

## 6. 工作流

每次更新本综述时:
1. 在 `papers/` 或 `products/` 新增/更新对应笔记
2. 如果对 Ymem 有结构性影响,起一份 `impact-reports/<slug>.md`
3. 回到本文档,更新相关章节,标记新的 last_revised 日期

---

最近一次修订:`2026-05-18`(从 zhione 拆分后,作为 seed 建立)
