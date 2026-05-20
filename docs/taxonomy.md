---
title: Agent memory taxonomy — cross-walk of three external frameworks
date: 2026-05-19
status: working-spec
language: zh-CN
---

# Agent memory taxonomy

agent memory 领域 2026 H1 同时出现了**三套**主流分类轴。它们不互斥 ——
描述的是同一个空间的不同切面。任何想给一篇新论文归位、或者给自己 memory
系统的模块命名的人,都会反复在这三套之间跳。

这页是一份**对照速查表**,让三套术语能彼此翻译,并把"记忆怎么变"这个核心
难题在三套里的位置标清楚。每套 taxonomy 的完整介绍见
[`meta-surveys.md`](meta-surveys.md);相关的活综述见
[`agent-memory-survey.md`](agent-memory-survey.md)。

> **想给自己的 memory kernel 起模块名?** 本页给的是分类**轴**,不是具名
> 模块清单。如果你需要一份具体到 `ingest-adapter` / `retriever-reranker` /
> `dream-consolidator` 的模块切分参考,见
> [`ymem-binding/taxonomy-modules.md`](ymem-binding/taxonomy-modules.md)。

## 三套主流 taxonomy

### A. "Memory in the Age of AI Agents"(arXiv 2512.13564)

切入轴:`Forms × Functions × Dynamics`。

| 维度 | 关注 | 子分类(节选)|
|---|---|---|
| **Forms** | 记忆"长什么样" | episodic / semantic / procedural / workspace |
| **Functions** | 记忆"做什么" | recall / personalization / planning |
| **Dynamics** | 记忆"如何变" | write / update / forget / consolidate |

**最干净的一套**。"做什么 / 长什么样 / 如何变"三问对照鲜明,适合做读者
入口。

### B. "Memory for Autonomous LLM Agents"(arXiv 2603.07670)

切入轴:`temporal-scope × substrate × control-policy`,套在
`write → manage → read` 循环里。

| 维度 | 关注 | 子分类 |
|---|---|---|
| **temporal-scope** | 记忆的"有效时间" | short / mid / long-term;valid period;supersession |
| **substrate** | 记忆的"底层存储" | vector / KG / wiki / hybrid |
| **control-policy** | 记忆的"更新策略" | append / overwrite / supersede / consolidate |

**control-policy** 这个名字最先把"记忆怎么变"作为独立维度命名,比 A 套的
`Dynamics` 更细致 —— 适合做工程切分。

### C. TsinghuaC3I/Awesome-Memory-for-Agents

切入轴:`Persistence × Curation`。

| 维度 | 关注 | 子分类 |
|---|---|---|
| **Persistence** | 记忆"留多久" | session / cross-session / persistent |
| **Curation** | 记忆"怎么管" | select / merge / drop / supersede |

**最简的一套**。两个维度就能把新论文快速归位;适合做 stub 笔记的批量分类
前置。

## 三套对照速查

| 概念 | A: 2512.13564 | B: 2603.07670 | C: TsinghuaC3I |
|---|---|---|---|
| "长什么样" | Forms | substrate | (隐含)|
| "做什么"(读路径)| Functions | read 阶段 | (跨两轴)|
| "如何变"(写路径)| Dynamics | manage + control-policy | Curation |
| "留多久" | Forms 的 workspace 等 | temporal-scope | Persistence |
| "记忆 vs 上下文" | (Forms 的 workspace 边界)| (substrate + scope)| (Persistence 边界)|

## 通用 memory kernel 的常见模块切分

任何想做 memory kernel 的人,都会自然产生类似这样的模块名(命名细节可能不同,
角色基本一致):

| 通用角色 | 在三套 taxonomy 里 | 典型工作 |
|---|---|---|
| **ingest** | 写路径起点 | host → record 转换 |
| **parse / chunk** | A.Forms / B.substrate 决定 | 切分语义单元、保留 provenance |
| **dedup** | A.Dynamics / B.control-policy / C.Curation | 语义聚合 / canonical 选择 |
| **retrieve / rerank** | A.Functions / B.read | 在线读路径 |
| **pack / present** | A.Functions 边界(host 侧)| 在预算内组装结果 |
| **consolidate** | A.Dynamics / B.manage / C.Curation 离线 | 离线生成更新候选(merge / supersede / archive) |
| **diff / audit** | A.Dynamics / B.control-policy | 把检测结果落成可审 diff |
| **eval / benchmark** | (元层)| 回归套件 |
| **security / privacy** | (各家都未覆盖)| provenance、tool-poisoning 防护 |

最后一行是个**显著空洞**:三套主流 taxonomy 都没把"安全 / 隐私 / 反污染"
当作一等公民。但 [`../papers/mnemonic-sovereignty.md`](../papers/mnemonic-sovereignty.md)
说明这是个真问题。任何想真正落地的 memory kernel 都应当把它作为独立模块
对待。

## 不在本页讨论的边界

- **纯 RAG**:RAG 不是 memory —— RAG 是查检索;memory 多了 write path 与
  state lifecycle。
- **纯 long-context inference**:长上下文不是 memory —— 它不解决 selective
  forgetting、versioning、conflict resolution。
- **纯 vector DB**:vector store 是 substrate(B 套术语),不是 memory
  kernel 本身。

这些边界本身也是 agent memory 产品边界的常见误区。
[`products-landscape.md`](products-landscape.md) §D 重复了这条立场。
