---
title: Signals — agent memory news, releases, comparisons (reverse chrono)
date: 2026-05-19
status: living-log
language: zh-CN
---

# Signals

行业信号反时序日志。比"survey"更轻、比"twitter feed"更结构化。
每条:**日期 / 来源 URL / 类型 / 一句话摘要 / Radar 动作**。

类型 enum:`release` `comparison` `blog` `paper` `talk` `incident` `funding`

Radar 动作 enum:`stub` `deep-note` `impact-report` `archive-only`
(`archive-only` 表示有趣但不进入 ResearchItem 流程)

## 2026 Q2

| 日期 | 来源 | 类型 | 一句话 | Radar 动作 |
|---|---|---|---|---|
| 2026-05 | mem0.ai/blog "State of AI Agent Memory 2026" | comparison | 6 大主流 memory layer 横评,Mem0 自家算法在 LoCoMo / LongMemEval 都报 SOTA | `archive-only`(自评,需交叉验证) |
| 2026-05 | arXiv 2605.06716 "From Storage to Experience" | paper | Storage → Reflection → Experience 三阶段记忆演进框架 | `deep-note` ✅ |
| 2026-04 | mem0.ai blog | release | Mem0 算法 v2:single-pass hierarchical extraction + multi-signal retrieval,声称 temporal +29.6 / multi-hop +23.1 | `deep-note` ✅(更新 [`../products/mem0.md`](../products/mem0.md))|
| 2026-04 | arXiv 2604.16548 "Toward Mnemonic Sovereignty" | paper | cross-session poisoning / 越权访问 / 状态污染的威胁模型 | `deep-note` ✅(驱动 `security-privacy` 模块设计)|
| 2026-04 | atlan.com / blog.devgenius.io / explore.n1n.ai 多篇 | comparison | 同一周内多个产品横评,把 Letta / Mem0 / Zep / Cognee 摆在一起评 | `archive-only` |
| 2026-04 | fountaincity.tech blog | comparison | "agent memory in 2026":偏 PKM 视角的横评,讨论隐私与本地化 | `archive-only` |
| 2026-04 | evermind.ai blog | blog | personal-AI 视角的"为什么记忆比模型重要"长文 | `archive-only` |

## 2026 Q1

| 日期 | 来源 | 类型 | 一句话 | Radar 动作 |
|---|---|---|---|---|
| 2026-03 | arXiv 2603.07670 "Memory for Autonomous LLM Agents" | paper | write-manage-read loop + temporal-scope × substrate × control-policy 三维 taxonomy | `deep-note` ✅ |
| 2026-02 | arXiv (多篇 2602.* 综述) | paper | "Rethinking Memory Mechanisms of Foundation Agents" 等多篇 2026-02 综述爆发 | `stub`(纳入 papers/index)|
| 2026-01 | arXiv 2512.13564 v2 "Memory in the Age of AI Agents" | paper | Forms × Functions × Dynamics 三轴 taxonomy(Shichun Liu 等)| `deep-note` ✅ |
| 2026-01 | arXiv 2601.03236 MAGMA | paper | Multi-Graph based Agentic Memory(9 仓中 6 个引用,最热 top1)| `stub` (候选升级 deep-note)|

## 2025 H2

| 日期 | 来源 | 类型 | 一句话 | Radar 动作 |
|---|---|---|---|---|
| 2025-12 | arXiv 2512.13564 v1 "Memory in the Age of AI Agents" | paper | 同上 v2 的初版 | 见上 |
| 2025-12 | 多篇 benchmark 上线 | paper | CloneMem / KnowMe-Bench / RealMem / PersonaMem-v2 / LoCoBench-Agent / ConvoMem / MemoryArena | 部分 `deep-note`,其他 `stub` |
| 2025-09 | ECAI 2025 | paper | Mem0 LoCoMo 上 10 方法头对头比较 | `deep-note` ✅ |

## 跟踪中(待定型)

- **Anthropic Claude Dreams 公开度**:目前来源仍是早期 docs + 二手讨论,等
  Anthropic 出官方技术博客后升级 [`../products/claude-dreams.md`](../products/claude-dreams.md)
- **OpenAI Memory 形态演进**:从 ChatGPT memory(2024)→ Agents SDK + memory hooks
  (2025)→ ???(2026 H2 预期),目前只有产品页面快照,等更深技术披露
- **Cursor / Windsurf 等 IDE agent 的 memory 形态**:无官方技术资料,
  靠用户使用反推
- **LangMem 与 LangGraph checkpoint 的关系**:LangChain 的 memory 故事 2026
  又重写了一遍,等 LangGraph v1 稳定后建笔记

## 维护说明

这份日志的目的是**新条目快速分流**:看到一个东西先在这里登记,再决定走
ResearchItem 流程还是 archive-only。**不**追求穷尽。
"我看到了 N 个产品横评"对决策没用,"这个横评提供了某个我们没有的对比维度"
才有用 —— 后者升级到 ResearchItem,前者只留链接。
