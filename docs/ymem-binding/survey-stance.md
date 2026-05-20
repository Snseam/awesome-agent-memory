---
title: Ymem-specific survey stance and follow-ups
date: 2026-05-19
status: working-spec
language: zh-CN
---

# Ymem 立场与待跟进方向

通用观察与 benchmark 选择见 [`../agent-memory-survey.md`](../agent-memory-survey.md)。
本页是 awesome-agent-memory 发起者 Ymem 项目的**具体立场**与**优先级**,
与通用综述分开维护。

## 1. 关键启发与 Ymem 立场

### 1.1 Dream / consolidation 不能自动改主线

来源:Claude Dreams([`../../products/claude-dreams.md`](../../products/claude-dreams.md))

立场:Ymem 的 `consolidate` 只产 `MemoryDiff` 候选,绝不直接 mutate canonical
store。这是 host app 审核的边界,也是 Ymem 设计的硬约束。

### 1.2 时间与版本是核心

每条 memory 必须能回答:`valid_from / valid_to / supersedes /
contradicted_by / last_verified_at`。企业知识最大的风险不是"找不到",而是
"找到旧的但看起来合理"。

### 1.3 GraphRAG 不在 v0 主路径

UniGraphRAG / LinearRAG 等图谱方法值得追踪,但 v0 Ymem 不重度依赖图谱。
关系抽取作为 enricher plugin 而非核心读路径前置依赖。

### 1.4 Agent-first,不是 CRUD-first

David Soria Parra 的 MCP 分享对 Ymem API 的启示:不要暴露
`getSemanticUnit / listCanonicalCluster / updateMemoryDiff` 这种 CRUD,而要
面向任务暴露 `ingest / retrieve / consolidate / explain` 这种高层 verbs。

(本节随阅读量增加持续扩展。)

## 2. 待跟进方向(P0 → P2)

按优先级:

1. **Mnemonic sovereignty / 反污染**:
   [`../../papers/mnemonic-sovereignty.md`](../../papers/mnemonic-sovereignty.md)
   提出 cross-session poisoning / 越权访问 / 状态污染三类威胁,直接驱动
   Ymem `security-privacy` 模块的最小可行设计。**P0**。
2. **Temporal KG / valid-time**:Memory-T1、Graphiti、Zep 三者都在做
   "时间感知图谱",对 Ymem `valid_from/valid_to/supersedes` 字段是直接
   对照。**P0**。
3. **Dream consolidation 的实证**:从
   [`../../products/claude-dreams.md`](../../products/claude-dreams.md)
   到 MemoryT1,off-line consolidation 还没有公开 benchmark。Ymem 的
   `dream-consolidator` 实验需要自己造 EvalCase。**P1**。
4. **Graph memory 的边界**:
   [`../../papers/from-storage-to-experience.md`](../../papers/from-storage-to-experience.md)
   主张 Storage → Reflection → Experience 三阶段化;Ymem 不绑死图谱,但要
   能从 Storage 平滑过渡到 Reflection。**P1**。
5. **MemAgent / ReMemR1 / long-context vs memory**:长上下文与 memory 的
   边界尚未在产品上分清,Ymem 的产品边界陈述需要持续锐化。**P1**。
6. **Agentic retrieval**:HiPRAG / MC-Search 等是否进入 Ymem `retrieve` 的
   默认实现路径;还是作为 plugin。**P2**。
7. **Skills over MCP**:影响 host-app 侧,反推 Ymem `MemoryResult` 的形状。
   **P2**。

待跟进的具体论文清单见 [`../../papers/index.md`](../../papers/index.md);本节
只跟踪 "已经具备 ImpactReport 潜力"的方向。

## 3. Ymem 的产品边界(必要时锐化)

为了避免范围漂移,Ymem 反复声明**不做**什么:

- **不是 RAG 中间件**:RAG 是查检索,Ymem 多了 write path 与 state
  lifecycle。
- **不是 long-context inference 加速**:Ymem 假设 LLM 上下文有限;长上下文
  是另一条产品线。
- **不是 agent runtime**:Ymem 只管记忆,不管 agent loop。host app
  (ZhiOne)负责。
- **不是 vector DB**:vector store 是 substrate;Ymem 复用它们而不取代。
- **不是 persona / 个性化 prompt 框架**:persona ≠ memory。

这些边界与 [`../products-landscape.md`](../products-landscape.md) §D 一致。
