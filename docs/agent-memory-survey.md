---
title: Agent Memory — a living survey
maintainer: yyl
last_revised: 2026-05-19
status: seed
language: zh-CN
---

# Agent Memory:一份持续迭代的综述

> 这是一份**活文档**:每次有新论文或新产品测试,都会回来重写相关章节。
> 不追求覆盖完整,追求对正在落地 memory kernel 的人有用。

## 0. 这份综述的位置

- 它**不是**学术综述,不在意 citation 完备性。
- 它**是**一份决策辅助文档:帮助读者判断"现有方法里哪些值得采纳、哪些可以
  忽略、哪些应该等技术再成熟"。
- 每个章节末尾应当回答一个具体问题:**这对正在做 memory kernel 的人意味着
  什么?**
- 本仓发起者(Ymem 项目)对部分章节有具体立场与 P0/P1/P2 排序,见
  [`ymem-binding/survey-stance.md`](ymem-binding/survey-stance.md)。

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

更结构化的对照见 [`taxonomy.md`](taxonomy.md)。

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

## 4. 关键启发

按主题(不是按个别项目立场)。

### 4.1 Dream / consolidation 不能自动改主线

来源:Claude Dreams([`products/claude-dreams.md`](../products/claude-dreams.md))。
主流共识:offline consolidation 只产 diff 候选,不直接改 canonical store。
host app 审核是边界,这也是当前所有 production memory layer 的硬约束。

### 4.2 时间与版本是核心

每条 memory 必须能回答 `valid_from / valid_to / supersedes /
contradicted_by / last_verified_at`。企业知识最大的风险不是"找不到",而是
"找到旧的但看起来合理"。temporal KG / valid-time(Memory-T1 / Graphiti /
Zep)是这一方向的主流响应。

### 4.3 GraphRAG 不是 default

UniGraphRAG / LinearRAG 等图谱方法值得追踪,但 graph-first 是重投入
路径。多数 v0 落地选择 vector + 应用层结构;graph 作为 enricher plugin 而
非读路径前置依赖更稳。

### 4.4 Agent-first,不是 CRUD-first

David Soria Parra 的 MCP 分享给所有 memory API 设计的启示:不要暴露
`getSemanticUnit / listCanonicalCluster / updateMemoryDiff` 这种 CRUD,
而要面向任务暴露 `ingest / retrieve / consolidate / explain` 这种高层
verbs。

(本节随阅读量增加持续扩展。)

## 5. 待跟进的方向(通用)

不分项目优先级地列出 2026 H1 仍未稳定的方向:

1. **Mnemonic sovereignty / 反污染**:
   [`papers/mnemonic-sovereignty.md`](../papers/mnemonic-sovereignty.md)
   提出 cross-session poisoning / 越权访问 / 状态污染三类威胁。任何认真
   落地的 memory kernel 都需要回应。
2. **Temporal KG / valid-time**:Memory-T1、Graphiti、Zep 都在做
   "时间感知图谱"。
3. **Dream consolidation 的实证**:offline consolidation 还没有公开
   benchmark,需要新 EvalCase。
4. **Graph memory 的边界**:
   [`papers/from-storage-to-experience.md`](../papers/from-storage-to-experience.md)
   主张 Storage → Reflection → Experience 三阶段化。
5. **MemAgent / ReMemR1 / long-context vs memory**:长上下文与 memory
   的边界尚未在产品上分清。
6. **Agentic retrieval**:HiPRAG / MC-Search 等是否进入 default retrieve
   路径,仍未收敛。
7. **Skills over MCP**:影响 host-app 侧,反推 memory result 的形状。

具体论文清单见 [`papers/index.md`](../papers/index.md);本节只跟踪
"已经具备 ImpactReport 潜力"的方向。具体项目优先级(以 Ymem 为例)见
[`ymem-binding/survey-stance.md`](ymem-binding/survey-stance.md)。

## 6. 工作流

每次更新本综述时:

1. 在 `papers/` 或 `products/` 新增/更新对应笔记;
2. 如果对你 kernel 有结构性影响,在 [`../impact-reports/`](../impact-reports/)
   起一份 ImpactReport;
3. 回到本文档,更新相关章节,标记新的 last_revised 日期。

---

最近一次修订:`2026-05-19`(v0.3:从 Ymem 立场综述拆分为通用观察 + 项目
立场)
