---
title: LongMemEval — Benchmarking Chat Assistants on Long-Term Interactive Memory
arxiv_id: 2410.10813
source: arXiv:2410.10813
date: 2024-10
domain: eval
core_claim: |
  现有聊天助手在长程多 session 对话中,5 类核心 memory 能力(IE / MR / KU /
  TR / ABS)上的表现远未达生产标准;500 个人工标注 QA 提供首个面向 chat
  assistant 的统一长程评测。
evidence_level: strong
code_available: yes (https://github.com/xiaowu0162/LongMemEval)
license: MIT (check)
local_pdf: pdfs/longmemeval.pdf
ymem_modules:
  - evaluator-benchmark
  - retriever-reranker
  - dream-consolidator
status: full
last_revised: 2026-05-19
---

# LongMemEval(arXiv 2410.10813,ICLR 2025)

## 问题陈述

Di Wu / Hongwei Wang / Wenhao Yu / Yunsheng Zhang / Kai-Wei Chang / Dong Yu
(UCLA + Tencent AI Lab Seattle + UCSD)2024 年 10 月、ICLR 2025 接收。PDF 第
1 章把问题定义为:LLM-based chat assistant 在跨 session、跨月的对话中频繁忘
事、误更新、误临时编造,但现有 benchmark 几乎都聚焦于"单 session 长文档检
索",对真正的"chat memory"几乎没有评测。

## 核心 claim

提出 LongMemEval,500 个人工标注 QA,沿两个轴正交:

- **5 core memory abilities**:
  - **IE — Information Extraction**:从对话中抽取并保留事实。
  - **MR — Multi-session Reasoning**:跨多个 session 整合证据。
  - **KU — Knowledge Update**:能识别新陈述覆盖旧陈述。
  - **TR — Temporal Reasoning**:跨时间窗推理("两个月前我说过…")。
  - **ABS — Abstention**:在没有证据时拒绝回答,而非编造。
- **7 question types**:single-session-user / single-session-assistant /
  single-session-preference / two-session / knowledge-update /
  temporal-reasoning / abstention(详见 PDF Table 2)。

并给出两个 context scale:
- LongMemEval_S — 单条 session,~115k tokens。
- LongMemEval_M — 500 sessions / 月级,~1.5M tokens。

## 方法 / 框架

PDF §3 提出 3-stage memory framework × 4 control point,把"对话助手如何记
忆"拆成可单独评测的子模块:

- 3 stages:**indexing → retrieval → reading**。
- 4 control points:**value(memory 存什么) / key(用什么 key 索引) /
  query(检索时怎么 reformulate) / reading(怎么把检索到的 chunk 喂给生成
  模型)**。

§4 给出 baseline:在 GPT-4o / Claude / open-source 上跑全 context、RAG
(BM25 / dense)、agent-style memory 等组合。结论是:即使最强配置,在 KU 与
TR 两类上仍显著落后于人类(差距 20+ 点),其中 ABS 几乎全员 50% 以下。

## 评估 / benchmark

本文即为 benchmark 的提出方;评测协议:

- 人工标注 ground truth + LLM-as-Judge(用 GPT-4 turbo)。
- 按能力分层报告,而非单一 overall。
- 给出 stratified subset 以便快速回归(适合 CI)。

但 ConvoMem(papers/convomem.md)在 2025 年 11 月发文挑战 LongMemEval 的统计
学有效性:Preferences 类别只有 30 题,误差棒接近 ±18%;且 filler conversations
来自其他 benchmark,可能引入风格泄漏。Ymem `evaluator-benchmark` 在采用
LongMemEval 时应同时叠加 ConvoMem 的更大样本评测以互证。

## 与 Ymem 的关系

- **直接驱动 `evaluator-benchmark` 模块的 v0**:5 类能力 × 7 题型构成 Ymem
  回归套件的最小子集。
- **KU 与 ABS** 两类对 `dream-consolidator` 与 retrieve 时的 confidence 阈值
  直接施压:KU 测试要求 supersede 语义实现得对,ABS 测试要求 retrieval 在低
  evidence 下返回空。
- **TR**(temporal reasoning)反推 `MemoryRecord` 必须显式保留 `valid_from /
  valid_to` 字段;光靠 created_at 不够。
- **3-stage × 4 control point 框架**与 Ymem 内部 read 路径设计高度同构,Ymem
  的 `retriever-reranker` 输出 schema 应给 host 暴露 value / key / query 三个
  维度的元信息。

## 优劣 / 注意事项

优势:
- 是首个把 chat-assistant memory 拆到"能力 × 题型"两维的 benchmark,概念
  分类清晰,对 Ymem 的 schema 设计有立即指导价值。
- 提供两个 context scale(115k / 1.5M),既能测短期 reasoning 也能测长期
  scaling。
- 论文经 ICLR 2025 同行评审,结论可信度高。

注意事项 / fabrication 风险:
- **统计学有效性问题**:正如 ConvoMem 所批评,500 题分到 7 类后,每类样本量
  在 30–150 之间,某些 sub-group 接近 ±40% 误差。Ymem 回归时不应过度信任单
  类小数差异。
- LLM-as-Judge 评分有偏差,尤其在 KU / TR 类;PDF §4.3 也承认这点。Ymem 实
  现 evaluator 时应保留人工抽检通道。
- benchmark 数据可能已被部分商用模型训练时见过(2025 年发布,2026 已经一年),
  Ymem 评测时应监控对照组 vs LongMemEval-fresh 子集的差异。

## 待跟进

- 与 ConvoMem(2511.10523)做能力维度的并集对比表;ConvoMem 的 6 类能力 +
  multi-message 维度能补 LongMemEval 在 multi-evidence 上的不足。
- LongMemEval_M 的 1.5M token 子集对 host 侧 long-context model 的 latency /
  cost profile 影响,需在 zhione 集成时实测。
- 中文 / 多语种扩展:Ymem 在 host 侧的 zh-CN 场景需自行构造 LongMemEval-zh
  子集,目前 PDF 未提供。
