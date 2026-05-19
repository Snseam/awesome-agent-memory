---
title: From Storage to Experience — Toward Experiential Memory for LLM Agents
arxiv_id: 2605.06716
source: arXiv:2605.06716
date: 2026-05
domain: survey
core_claim: |
  agent memory 应沿 Storage → Reflection → Experience 三阶段演化:从存储原始
  trace,到对单条 trace 反思生成抽象规则,再到跨多条 trace 沉淀可迁移经验
  (rule set K)。
evidence_level: medium
code_available: 未在 PDF 中明确说明
license: (未在 PDF 中明确说明)
local_pdf: pdfs/from-storage-to-experience.pdf
memory_modules:
  - parser-chunker
  - dream-consolidator
  - memorydiff-generator
  - retriever-reranker
  - evaluator-benchmark
status: full
last_revised: 2026-05-19
---

# From Storage to Experience(arXiv 2605.06716)

## 问题陈述

Luo / Tian / Cao / Luo / Lin / Li / Kong / Yang / Ma(HKBU + SCNU + HKUST +
NUS + USTB)2026 年 5 月放出的 31 页综述,投稿 ICLR 2026 Workshop MemAgents。
PDF 第 1 章提出一个被现有 agent memory 文献忽视的问题:**"记得"≠"会用"**。
绝大多数 RAG-style memory 只解决了第一段 storage,真正决定 agent 长期表现的
是从存储到反思、再到可迁移经验的演化路径。

## 核心 claim

提出形式化框架 `(τ, Mraw, F_ref, F_exp, T_batch, K)`:

- `τ`:trajectories(原始 agent 轨迹,含 obs / action / reward / tool call)。
- `Mraw`:存储后的原始 memory pool。
- `F_ref`:reflection function,**单条 trajectory 内部**的抽象,产出 lesson。
- `F_exp`:experience function,**跨多条 trajectory** 聚合 lesson,产出规则。
- `T_batch`:触发 F_exp 的 batch 调度策略(在线 / 离线 / hybrid)。
- `K`:rule set,可迁移、可参数化、可外置的经验产物。

并把现有方法分到三阶段:

1. **Storage** — Linear(顺序对话日志)、Vector(embedding store)、
   Structured(KG / wiki)。代表:Letta、MemoryBank、Zep。
2. **Reflection** — Introspection(模型自评 trace)、Environment(从环境信号
   蒸馏)、Coordination(多 agent 互评)。代表:Reflexion、ExpeL、Voyager。
3. **Experience** — Explicit(显式 rule、prompt 库)、Implicit(参数化进权重)、
   Hybrid(显式 rule + 软提示)。代表:Generative Agents、AutoManual、ExpeL。

## 方法 / 框架

PDF §3 给出公式化建模(本 radar 已在 problem statement 抄录),§4 是
storage 综述,§5 是 reflection 综述,§6 是 experience 综述。

两个新概念值得注意:

- **Active exploration**(§5.4)— agent 主动设计 trace 以收集后续 reflect 所
  需的数据,而不是被动等用户输入。直接映射到 host app 的 onboarding 与
  intentional question loop。
- **Cross-trajectory abstraction**(§6.3)— 在多条 trace 上做归纳,产出
  rule。与 Mem0 当前架构的 per-message ADD/UPDATE 操作不在一个层级,kernel 的
  `dream-consolidator` 必须容纳这一层。

§7 给出评估视角:作者主张应评估 `K` 的 **transferability**(在新任务上不再
fine-tune 直接用),而非仅看 storage 上的 recall。本 radar 认为这是 memory kernel
evaluator 的下一步要走的方向。

## 评估 / benchmark

本身不提出 benchmark,但 §7 中明确列出 transferability 评估的难点:

- 同任务 vs 跨任务 vs 跨 agent 的迁移层次。
- rule set 的 compactness(规则数 vs 覆盖率)。
- forgetting 与 stale rule 的衰减。

PDF 在 §8 提到 LongMemEval、MemBench 都不足以衡量 experience-level 性能,
属于 storage / reflection 评估。

## 决策相关性 / Decision relevance

- **Storage 阶段**就是 kernel 当前 v0 的全部:`ingest-adapter` →
  `parser-chunker` → `semantic-dedup` → `retriever-reranker`。
- **Reflection 阶段**就是 kernel `dream-consolidator` 的 v1 目标:从 trace 提
  lesson,落到 `memorydiff-generator` 的 new_insight diff 类型。
- **Experience 阶段**对应 kernel v2 路线图的 rule-set / skill.md 产物
  (host 侧 `publisher` 的输出),与 `awesome-agent-memory` 知识库
  本身共享 ontology。
- **Active exploration** 概念是 host 侧创新点,kernel 暂不实现,但
  `ingest-adapter` 的 schema 应预留 `intent` 字段以便 host 标注主动采集动机。

## 优劣 / 注意事项

优势:
- **形式化**(τ, Mraw, F_ref, F_exp, T_batch, K)给了一套可量化的语言,远
  超 Hu 与 Du 两份综述的纯定性归类。这是本 radar 见到的第一篇从 storage 跳到
  experience 的综述。
- 31 页适中,且每节有代表性工作 anchor,可作为 kernel v2 路线图的术语来源。

注意事项 / fabrication 风险:
- 形式化框架是作者**新提**,并非业界共识;在引用 `F_ref / F_exp` 时应
  注明来源,避免造成"这是标准术语"的误印象。
- §6 关于 Implicit experience(参数化经验)的讨论较少,主要引用 LoRA 类工
  作;若需深入,应单独跟进 parametric memory 线。
- ICLR 2026 Workshop 版本(31 页 v1)与最终 conference 版可能有差异,后续
  应跟踪 v2 / v3。

## 待跟进

- 跟踪 ExpeL / AutoManual / Voyager 在 reflection 与 experience 段的实现细节,
  作为 `dream-consolidator` v1 的设计参考。
- §5.4 active exploration 章节列举的论文(本 radar 未一一抄录)值得补 stub。
- 评估 K(rule set)的 transferability 没有现成 benchmark,`evaluator-
  benchmark` 模块可以把这个空白作为 v2 自研方向。

---

> *Ymem 项目对本笔记决策相关性的具体绑定见
> [`../ymem-binding/relevance-index.md`](../ymem-binding/relevance-index.md)。*
