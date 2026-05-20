---
title: Mem0 — Building Production-Ready AI Agents with Scalable Long-Term Memory
arxiv_id: 2504.19413
source: arXiv:2504.19413
date: 2025-04
domain: system
core_claim: |
  在 LOCOMO benchmark 上,基于 ADD/UPDATE/DELETE/NOOP 的 LLM-tool-call 式
  memory 管理(Mem0)在 LLM-as-Judge 指标上比 OpenAI 内置 memory 相对提升
  26%,且 p95 latency 比 full-context 低 91%、token 成本低 90% 以上;graph
  变体(Mem0g)在 temporal reasoning 上再提升约 2 点。
evidence_level: strong
code_available: yes (https://mem0.ai/research)
license: 未在 PDF 中明确说明(GitHub: Apache-2.0 历史上,需复核)
local_pdf: pdfs/mem0-building-production-ready-ai-agents-with-scalable-long.pdf
memory_modules:
  - dream-consolidator
  - memorydiff-generator
  - retriever-reranker
  - parser-chunker
  - semantic-dedup
status: full
last_revised: 2026-05-19
---

# Mem0(arXiv 2504.19413)

## 问题陈述

Prateek Chhikara / Dev Khant / Saket Aryan / Taranjeet Singh / Deshraj Yadav
(mem0.ai)2025 年 4 月发布、17 页正文。PDF 第 1 章给出问题:LLM 固定 context
window 在跨 session 长程对话中要么遗忘要么用 full-context 烧钱烧延迟;现有
memory 方案(MemGPT、MemoryBank、A-Mem、Zep)在 LOCOMO 上要么精度不够、要
么 graph 构建过慢(Zep 异步构建数小时)。Mem0 目标:**production-ready**——
即可在 sub-second 延迟、可接受 token 预算下达到接近 full-context 的 accuracy。

## 核心 claim

- 基础架构 **Mem0**:**Extraction phase + Update phase** 的增量管线;每对
  message 入库时,LLM 看 conversation summary + 最近 m 条消息(m=10)抽取候
  选 fact,再用 LLM tool-call 在 ADD / UPDATE / DELETE / NOOP 四种 op 中选择,
  对比 top-s 相似 memory(s=10)。
- **Mem0g**:在基础架构之上,把 fact 转成 (entity, relation, entity) 三元组
  写入 Neo4j;extraction 拆成 entity extractor + relations generator,update
  路径加 conflict detector + update resolver。
- 在 LOCOMO benchmark 上(Table 1)四类问题(single-hop / multi-hop /
  open-domain / temporal):Mem0 拿到 single-hop 与 multi-hop 的 SOTA,Mem0g
  拿到 temporal 与 open-domain 的最佳或接近最佳。
- 在 token / latency(Table 2)上:Mem0 平均 1.7k token / conversation,
  Mem0g 3.6k;full-context 26k(20× 差距)。Zep 反例:600k token / conv,
  且需要数小时背景构建。

## 方法 / 框架

PDF §2 给出两份伪代码:Algorithm 1(update routing,见 Appendix B)与
extraction 流程图。关键设计:

- **Asynchronous summary generator**:不阻塞主路径,保证 extraction 始终看
  到较新 conversation summary;这是 Mem0 在 production 工程上的一处妙手。
- **LLM as op classifier**:不训练独立 classifier,直接用 LLM tool-call 决
  策 op type;trade-off 是把 quality 完全押在 prompt 与底模上,带来一定的
  非确定性(论文用 temp=0、10 次 J-score 平均缓解)。
- **Graph 变体的 conflict detection**:不物理删除旧 relation,而是 mark
  invalid,为 temporal reasoning 保留可回放历史。
- 底模:全部用 GPT-4o-mini(extraction、update、judge 都是它);LOCOMO 共
  10 conversations × ~600 dialogues × ~26k token。

## 评估 / benchmark

- benchmark:LOCOMO(Maharana et al. 2024)。
- 指标:F1、BLEU-1、LLM-as-Judge(J);后者 10 次平均报告 ±1σ。J 在 Table 1
  中:Mem0 single-hop 67.13、multi-hop 51.15、open 72.93、temporal 55.51;
  Mem0g 同栏分别 65.71 / 47.19 / 75.71 / 58.13。
- 对照组:LoCoMo / ReadAgent / MemoryBank / MemGPT / A-Mem / LangMem / Zep
  / OpenAI ChatGPT memory / RAG(7 chunk size × 2 k 值)/ full-context。
- 关键洞察:**graph 在 multi-hop 上不必然更好**(Mem0 反而高 4 点),作者
  归因为"在 multi-hop 上 graph traversal 引入了多余 step,反而稀释 signal"。
- 局限:Full-context 仍是 J 最高(72.90),Mem0 / Mem0g 都没追平,只能在
  cost / latency 上赢。

## 决策相关性 / Decision relevance

- **ADD / UPDATE / DELETE / NOOP 四 op** 是 memory kernel `memorydiff-generator` 的
  最小基底;kernel 在此基础上扩展两个 op:`consolidate`(把多个旧 memory 压成
  一条 lesson,来自 storage-to-experience 综述)与 `forget`(verifiable
  forgetting,来自 mnemonic-sovereignty)。
- **Async summary generator** 思想直接映射到 `dream-consolidator` 的离
  线 worker 模型:不阻塞读路径,在 batch 内异步更新 summary / lesson。
- **Mem0g 的 entity + relation 两 stage extraction** 对 host app 的
  knowledge view 有借鉴价值,但 memory kernel 不强行 commit graph 形态,留给
  host 决定 substrate(对应 2603.07670 的 substrate 维)。
- LOCOMO 是 `evaluator-benchmark` 的 v0 评测目标之一,与 LongMemEval、
  ConvoMem 三套并行。
- ConvoMem(papers/convomem.md)用同一个 Mem0 作为 RAG baseline,发现
  Mem0 在 user-facts 上达到 60–77%,在 preferences/implicit 上掉到 30–45%;
  与本文 LOCOMO 上的高分形成对比 —— 暗示 LOCOMO 与 ConvoMem 评的不是同一
  能力维度。

## 优劣 / 注意事项

优势:
- 工业实测:p95 ≈ 1.44 s(Mem0)/ 2.59 s(Mem0g),96% 用户场景可接受。
- LLM-as-Judge 跑 10 次平均、报标准差,可信度强于多数同类 paper。
- 显式给出 cost 与 latency 数字,便于做选型对照。
- 论文公开 prompt 与 algorithm,工程复现路径清晰。

注意事项 / fabrication 风险:
- 所有数字都基于 LOCOMO 10 个 conversation,**样本量极小**(LOCOMO 整套也才
  ~1.7k QA);ConvoMem 论文已批评 LOCOMO 的统计有效性。引用 Mem0 的"
  26% 提升"时应注明 benchmark 局限。
- baseline 不完全可比:OpenAI ChatGPT memory 是被作者手工 ingest 的;Zep 的
  低分可能与构建延迟有关(论文承认隔几小时再查会显著好,但仍按"实时"评)。
- graph 变体在 multi-hop 上**不如非 graph 版**,作者解释为 graph overhead;
  这说明 kernel 在引入 graph 时应有可关闭开关,而非默认开启。
- Open-source license 在论文正文未明确说明(GitHub 历史是 Apache-2.0),发
  布 stub 时此条留 "check"。

## 待跟进

- 跟踪 Mem0 在 LongMemEval、ConvoMem 上的横向数字,做一篇 ImpactNote。
- Mem0 的 4-op 框架是否能扩展到 consolidate / forget,是
  `memorydiff-generator` v1 的关键设计问题;PDF 未给出答案。
- Mem0g 的 Neo4j 选型对 host app 有参考价值,但 kernel 不绑定;
  应单独追踪 graph substrate 替代品(LanceDB-graph 等)。

---

> *Ymem 项目对本笔记决策相关性的具体绑定见
> [`../docs/ymem-binding/relevance-index.md`](../docs/ymem-binding/relevance-index.md)。*
