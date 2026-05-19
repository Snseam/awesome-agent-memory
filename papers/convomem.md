---
title: ConvoMem Benchmark — Why Your First 150 Conversations Don't Need RAG
arxiv_id: 2511.10523
source: arXiv:2511.10523
date: 2025-11
domain: eval
core_claim: |
  在 1–150 对话窗口内,naive long-context 在 ConvoMem 75,336 QA 上达到 70–82%
  的准确率,而以 Mem0 为代表的 RAG-式 memory 系统仅 30–45%;agent memory 与
  RAG 在小语料阶段不是同一个问题,应专门为此小语料阶段做架构。
evidence_level: strong
code_available: yes (https://github.com/SalesforceAIResearch/ConvoMem,数据集
  https://huggingface.co/datasets/Salesforce/ConvoMem)
license: 未在 PDF 中明确说明(check)
local_pdf: pdfs/convomem.pdf
ymem_modules:
  - evaluator-benchmark
  - retriever-reranker
  - dream-consolidator
  - context-packer
status: full
last_revised: 2026-05-19
---

# ConvoMem Benchmark(arXiv 2511.10523)

## 问题陈述

Egor Pakhomov / Erik Nijkamp / Caiming Xiong(Salesforce AI Research)2025
年 11 月放出的 30 页 preprint。PDF §2.1 直接挑明前辈 benchmark 的缺陷:

- **LongMemEval** 只有 500 题,Preferences 类 30 题(±18% 误差),且 filler
  对话来自外部 benchmark,存在风格泄漏。
- **LoCoMo** 只有 10 对话,样本不足。
- **PerLTQA / DialSim** 缺少交互式 dialogue。
- **MemoryAgentBench / ImplexConv** 覆盖维度窄。

作者要做一个**统计上可靠、覆盖全面、可量化"什么时候该上 RAG"**的 benchmark。

## 核心 claim

提出 ConvoMem,包含:

- **75,336 个 QA**(LongMemEval 的 150×),6 类 evidence categories:user
  facts / assistant facts / abstention / preferences / changing facts /
  implicit connections;每类再按 evidence 跨 1–6 message 分层(Table 2)。
- 配套配置:可变 conversation 长度 2–300,context token 范围 1k–3M。
- 用同一个 pipeline 生成 evidence-containing 与 filler 对话,避免风格泄漏。

关键实证结论(§3.4):

- 在 1–150 conversation 区间,**long-context 在多数能力上 70–82% accuracy**,
  Mem0(RAG-style)仅 30–45%——particularly 在 preferences / implicit
  connections 上掉得最厉害。
- 经济维度:Mem0 在 300 conversation 时 cost 仅为 long-context 的 1/95,
  但准确率掉到 25–60%。
- 提出**架构演化拐点**:≈30 / ≈150 / ≈300 conversation 三档,分别建议
  long-context → block-based extraction → RAG / hybrid。
- 模型维度:Gemini Flash 与 Pro 差距仅 2–6 个百分点,Flash 比 Pro 便宜 3.7×;
  Flash Lite 则掉 15–31 个百分点,**mid-tier 是 sweet spot**。

## 方法 / 框架

PDF §2.3 给出三阶段合成数据生成:

1. **Persona generation** — IT admin、财务分析师、客服等企业 persona。
2. **Use case generation** — 每 persona 批量生成 50–100 个 scenario,确保
   主题覆盖。
3. **Evidence core generation** — 单 scenario 提炼 QA + evidence message,
   严格校验:多 message evidence 时,删任一条则不可答(确保所有条都必要)。
4. **Conversation generation** — 把 evidence 自然嵌入 80–120 message 对话,
   evidence 与 filler 用同一生成器,避免风格差。

验证:三阶段、4 类校验,< 5% 通过率;rubric-based 评估给 preferences /
implicit 用,exact match 给 facts 用,"I don't know" 视为正确给 abstention。

§3 给出 hybrid block-based extraction(把对话切 10 条一块,先 extract 再
answer),在某些场景下甚至**比 long-context 还高**(70.8% vs 63.5%),且
30× 延迟降低(通过并行 block 处理)。

## 评估 / benchmark

本文即 benchmark 的提出方;评测协议:

- 6 类 × 1–6 evidence message 共 36 cell,每 cell 在 12 个 conversation-
  length 档位评测。
- 多模型 judging(Gemini、GPT、Anthropic),要求多 model 连续回答正确。
- 早停机制:cost 节约 40–60% 而保持统计有效性。
- 评测 protocol 完全开源,且声称已经把 LongMemEval 与 LoCoMo 也都迁入此框
  架(可统一回归)。

## 与 Ymem 的关系

- **直接进入 `evaluator-benchmark` v0 的金牌评测三件套**:LongMemEval +
  ConvoMem + (LOCOMO 来自 Mem0 论文)。统计有效性问题:LongMemEval 提供
  能力分类、ConvoMem 提供大样本与 multi-evidence 维度,二者互补。
- **30 / 150 / 300 conversation 拐点**直接影响 Ymem `context-packer` 的
  设计:host(zhione)在用户对话历史 < 30 时应优先 full-context;30–150 时
  转 hybrid;> 150 时上 Mem0-style retrieval。Ymem kernel 应让 host 容易切
  换。
- **mid-tier model 是 sweet spot**这一发现对 Ymem 选型很重要:`retriever-
  reranker` 与 `dream-consolidator` 不应默认 Pro tier。
- **Preferences 与 implicit connections 是 RAG 的弱项**——这两类对应 Ymem
  的 `dream-consolidator` 需要做 lesson 抽象(对应 from-storage-to-experience
  的 F_ref / F_exp),不能靠纯 retrieval 解决。
- 同一篇 ConvoMem 用 Mem0 作 baseline,与 Mem0 论文(papers/mem0-paper.md)
  在 LOCOMO 上的高分形成对比,说明 benchmark 之间不可简单比较。

## 优劣 / 注意事项

优势:
- 样本量最大(75,336),六类能力 + multi-evidence 维度覆盖最广。
- 数据集与代码都公开(HF Salesforce/ConvoMem、GitHub
  SalesforceAIResearch/ConvoMem),Ymem 可直接 fork。
- 给出**经济与精度的联合曲线**(Figure 2/13),工程团队选型可立刻参照。
- 把 long-context、Mem0、block-based hybrid 三种范式横向跑同一套题,结论统
  一可比。

注意事项 / fabrication 风险:
- **全 synthetic data**,真实用户对话上未验证;企业 persona 偏向 IT / 金融
  / 客服,对消费向场景代表性未知。
- baseline 只测了 Mem0 一家 RAG;其他系统(Letta、Zep、LangMem)未在 §3.4
  覆盖,作者承认 ConvoMem 的"Mem0 表现差"不能推广到所有 RAG memory。
- "First 150 don't need RAG"是 catchy 的结论,但**强依赖 long-context model
  的 needle-in-haystack 能力**;后续模型若退化此能力,结论会反向。
- license 未在论文中明确(HF 通常 CC-BY-4.0,但需到 HF 卡上复核)。

## 待跟进

- 在 Ymem `evaluator-benchmark` 中实现 ConvoMem 子集回归,优先 user-facts
  与 changing-facts 两类(直接对应 `memorydiff-generator` 的 ADD/UPDATE/
  DELETE)。
- §3.4.5 block-based two-phase extraction 与 Ymem 的 host-side 解耦设计
  天然契合(Phase-1 在 kernel,Phase-2 在 host context-packer),值得做一篇
  ImpactNote。
- 与 mnemonic-sovereignty(2604.16548)的 abstention / changing-facts 攻击
  面对比:ConvoMem 给出了 abstention 测试,但没有从安全角度评估(对抗注入下
  abstention 是否仍保持)。
