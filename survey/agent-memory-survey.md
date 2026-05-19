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

主要 benchmark(经典 + 2025 H2 / 2026 H1 新增):

| Benchmark | 笔记 | 覆盖能力 | 备注 |
|---|---|---|---|
| LongMemEval | [`papers/longmemeval.md`](../papers/longmemeval.md) | accurate retrieval / long-range | 经典基线 |
| MemoryAgentBench | [`papers/memoryagentbench.md`](../papers/memoryagentbench.md) | 四种能力划分的来源 | 同上 |
| LoCoMo | [`papers/locomo.md`](../papers/locomo.md) | 长对话记忆 | Mem0 ECAI 2025 横评的主要 benchmark |
| ConvoMem | (papers/index)| 对话记忆 | 2025-12 新增 |
| CloneMem | (papers/index)| AI clone / 长程一致性 | 2025-12 |
| KnowMe-Bench | (papers/index)| digital companion | 2025-12 |
| RealMem | (papers/index)| real-world 多模态交互 | 2025-12,arXiv 2601.06966 |
| PersonaMem-v2 | (papers/index)| 隐式 persona | 2025-12 |
| LoCoBench-Agent | (papers/index)| SE / coding agent | 2025-12 |
| MemoryArena | (papers/index)| 综合 | 待 ResearchItem 升级 |

未在表里的 stub 见 [`papers/index.md`](../papers/index.md);该索引按 9 仓
跨引用度排序,基线移动信号优先看 top-10。

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

1. **Mnemonic sovereignty / 反污染**:[`papers/mnemonic-sovereignty.md`](../papers/mnemonic-sovereignty.md)
   提出 cross-session poisoning / 越权访问 / 状态污染三类威胁,直接驱动
   Ymem `security-privacy` 模块的最小可行设计。**P0**。
2. **Temporal KG / valid-time**:Memory-T1、Graphiti、Zep 三者都在做"时间感知图谱",
   对 Ymem `valid_from/valid_to/supersedes` 字段是直接对照。
3. **Dream consolidation 的实证**:从 [`products/claude-dreams.md`](../products/claude-dreams.md)
   到 MemoryT1,off-line consolidation 还没有公开 benchmark。Ymem 的
   `dream-consolidator` 实验需要自己造 EvalCase。
4. **Graph memory 的边界**:[`papers/from-storage-to-experience.md`](../papers/from-storage-to-experience.md)
   主张 Storage → Reflection → Experience 三阶段化;Ymem 不绑死图谱,但要
   能从 Storage 平滑过渡到 Reflection。
5. **MemAgent / ReMemR1 / long-context vs memory**:长上下文与 memory 的边界
   尚未在产品上分清,Ymem 的产品边界陈述需要持续锐化。
6. **Agentic retrieval**:HiPRAG / MC-Search 等是否进入 Ymem `retrieve` 的
   默认实现路径;还是作为 plugin。
7. **Skills over MCP**:影响 host-app 侧,反推 Ymem `MemoryResult` 的形状。

待跟进的具体论文清单见 [`papers/index.md`](../papers/index.md);本节只跟踪
"已经具备 ImpactReport 潜力"的方向。

## 6. 工作流

每次更新本综述时:
1. 在 `papers/` 或 `products/` 新增/更新对应笔记
2. 如果对 Ymem 有结构性影响,起一份 `impact-reports/<slug>.md`
3. 回到本文档,更新相关章节,标记新的 last_revised 日期

---

最近一次修订:`2026-05-18`(从 zhione 拆分后,作为 seed 建立)
