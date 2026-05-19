---
title: Memory in the Age of AI Agents
arxiv_id: 2512.13564
source: arXiv:2512.13564
date: 2026-01
domain: survey
core_claim: |
  agent memory 应被同时沿三条正交轴刻画:Forms(记忆"长什么样")、Functions
  (记忆"做什么")、Dynamics(记忆"如何变),并以此统一现有零散工作。
evidence_level: strong
code_available: yes (项目:Shichun-Liu/Agent-Memory-Paper-List)
license: (未在 PDF 中明确说明)
local_pdf: pdfs/memory-in-the-age-of-ai-agents.pdf
ymem_modules:
  - parser-chunker
  - retriever-reranker
  - dream-consolidator
  - memorydiff-generator
  - evaluator-benchmark
status: full
last_revised: 2026-05-19
---

# Memory in the Age of AI Agents(arXiv 2512.13564)

## 问题陈述

agent memory 在 2024–2026 出现了爆炸式增长,但术语极不统一:同一个 "episodic
memory" 在不同论文里指代 dialogue history、tool trace、experience buffer 三种
完全不同的东西。Hu/Liu/Yue/Zhang 等 47 位作者(横跨清华、HKUST、CMU、Stanford、
MIT、Microsoft、DeepMind 等)在 2026 年 1 月放出 v2 的 76 页综述,试图给出一
个"领域统一框架":既能容纳 retrieval-augmented memory(MemGPT、Mem0)和
parametric memory(LoRA-as-memory)两种实现路径,又能覆盖 single-agent 与
multi-agent 场景。

PDF 第 1 章明确把"agent memory ≠ context window"作为出发点:context 是被动的,
memory 是被主动**写入、更新、遗忘**的;这是 LLM 与 agent 范式分野的关键。

## 核心 claim

提出 **Forms × Functions × Dynamics** 三轴框架:

- **Forms**(本体)— 记忆的表征形态。Token-level(文本片段、对话片段)、
  Parametric(进入权重的 LoRA / adapter / soft prompt)、Latent / Sub-symbolic
  (隐状态、KV cache 蒸馏)。三种形态对应不同的成本、可解释性、迁移性 trade-off。
- **Functions**(用法)— 记忆"做什么"。Recall(显式问答)、Personalization
  (口味建模)、Planning(经验复用、subgoal 缓存)、Self-improvement(从失败
  trace 中提炼策略)、Coordination(多 agent 间共享上下文)。
- **Dynamics**(动态)— 记忆"如何变"。Write(从 trace 抽取候选)、Update / Merge
  (合并冗余)、Forget(主动删除以防污染或满足合规)、Consolidate(把短期记忆
  压成长期)、Transfer(跨 task / 跨 agent 传递)。

作者声称:**主流 agent memory 系统几乎都可以用这三轴的某个子立方体来定位**,且
"空白单元格"正是研究 frontier。

## 方法 / 框架

PDF §3–§7 把 100+ 篇近期论文按三轴铺成大表:

- §3 Forms:逐一对照 Token-level(MemoryBank、MemGPT、Letta、Mem0)、Parametric
  (Generative Agents 部分、Reflexion 的策略权重写回、LoRA-as-Memory 系列)、
  Latent(隐状态压缩、Sleep-time learning、KV-cache 蒸馏)的优缺点。
- §4 Functions:把 5 类用法逐条配 reference paper,例如 Planning 一栏给出
  Voyager、Reflexion、ExpeL 等代表性工作的位置。
- §5 Dynamics:重点讨论 forgetting & consolidation 这两个被早期工作忽视的方向,
  指出 mnemonic-sovereignty 系列论文是相关 frontier(本 radar 单独追踪)。
- §6 Multi-agent memory:把 shared memory、共有 world-model、social memory 三
  类工作纳入,并强调 access control 的紧迫性。
- §7 Open challenges:9 条,包括 evaluation gap、long-horizon consolidation、
  forgetting under regulation、parametric ↔ token-level 互转、安全。

## 评估 / benchmark

本文是综述,**不提出新 benchmark**。但 §8 章节横向对比了:

- LongMemEval(arXiv 2410.10813)
- LoCoMo(Maharana et al. 2024)
- MemoryAgentBench
- A-Mem benchmark
- 多个 multi-agent / coordination benchmark

并指出现有 benchmark **几乎全部偏向 Recall function、Token-level form**,对
Parametric form 与 Forget dynamic 几乎零覆盖。这与 Ymem 自己的 evaluator 设计
直接相关。

## 与 Ymem 的关系

- **Forms 轴**直接对应 Ymem `MemoryRecord` schema 设计:Ymem v0 只承认
  Token-level form;Parametric form 是 host-app 的训练侧问题,kernel 暂不管。
- **Functions 轴**与 Ymem 读路径 / 写路径设计紧贴:`retriever-reranker` 服务
  Recall + Personalization,`context-packer`(host 侧)服务 Planning。
- **Dynamics 轴**几乎一一对应 Ymem 离线 path:`dream-consolidator` 负责
  Consolidate + Forget,`memorydiff-generator` 负责 Update / Merge 的可审核
  落地。
- §8 关于 evaluation gap 的批评直接对 `evaluator-benchmark` 提需求:Ymem 必须
  覆盖 forgetting 与 consolidation,而不能只测 retrieval accuracy。

## 优劣 / 注意事项

优势:
- 47 作者大组背书,引用面广,几乎是 2024–2025 年的"agent memory 字典"。
- 三轴划分清晰,正交性好,对新论文归类有立即可用的脚手架。
- 把 Parametric / Latent form 明确列为一等公民,纠正了"agent memory = RAG"
  的窄化理解。

注意事项 / fabrication 风险:
- PDF 在多个对比点(Parametric form 的可解释性、Latent form 的迁移成本)上给
  出的判断带有作者倾向,而非实证;复用其结论时应注意源材料。
- §8 的 9 个 open challenges 是定性列举,缺乏量化判据。
- 本 radar 在抽取 §7 multi-agent 内容时只读了 1 遍,如要在 Ymem 内引用 multi-
  agent 部分需复读原文。

## 待跟进

- PDF 中提到的 "Sleep-time learning" 与 Ymem `dream-consolidator` 设计直接相关,
  需单独追踪此线下论文(可能是 2025 新工作)。
- §6 multi-agent memory 章节列举的 access-control 工作 vs mnemonic-sovereignty
  (papers/mnemonic-sovereignty.md)的 share-phase 对比,值得做一篇 ImpactNote。
- 该综述未覆盖中文场景与多模态 memory,Ymem 在 host(zhione)落地时需补 delta。
