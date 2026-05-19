---
title: Memory for Autonomous LLM Agents — A Survey
arxiv_id: 2603.07670
source: arXiv:2603.07670
date: 2026-03
domain: survey
core_claim: |
  把 agent memory 沿 temporal-scope × representational-substrate ×
  control-policy 三轴切分,再套上 write → manage → read 的闭环,五类机制族
  (context-resident compression / retrieval-augmented stores / reflective
  self-improvement / hierarchical virtual context / policy-learned management)
  几乎可以覆盖现有所有实现。
evidence_level: medium-strong
code_available: 未在 PDF 中明确说明
license: (未在 PDF 中明确说明)
local_pdf: pdfs/memory-for-autonomous-llm-agents-survey.pdf
ymem_modules:
  - ingest-adapter
  - parser-chunker
  - semantic-dedup
  - retriever-reranker
  - dream-consolidator
  - memorydiff-generator
  - evaluator-benchmark
status: full
last_revised: 2026-05-19
---

# Memory for Autonomous LLM Agents(arXiv 2603.07670)

## 问题陈述

Pengfei Du(Hong Kong Research Institute of Tech)2026 年 3 月放出的 15 页综述。
PDF 第 1 章把问题定义为:**当 agent 必须自主行动时,memory 不仅要"记得"还要
"管得起"**——前者是 RAG 已经解决的,后者(冲突解决、过期失效、强化采纳)是
agent 时代的新需求。作者明确 distance 这份综述与 2024 年 LongMemEval 类
benchmark-side 综述的差别:本文聚焦 **mechanism**,而非任务覆盖。

## 核心 claim

提出三维 taxonomy 与五机制族,并把它们装进一个统一的 **write–manage–read** 闭环
里。这套术语比 Hu 等(2512.13564)的 Forms / Functions / Dynamics 在"管理"
这一维上更精细,所以 Ymem 的 taxonomy.md 把 `control-policy` 作为命名采纳的来
源(见 `taxonomy.md` §"2603.07670")。

三维 taxonomy:

- **Temporal-scope**:short-term / mid-term / long-term;并细分为 session-bound、
  task-bound、user-bound、persistent。直接对应 Ymem `valid_from / valid_to` 字段
  与 `supersedes` 关系。
- **Representational-substrate**:vector store / knowledge graph / structured
  wiki / hybrid。
- **Control-policy**:append-only / overwrite / supersede / consolidate /
  decay / forget。这是本文相对 Hu 综述最大的 delta:把"如何变"作为一等维度。

五机制族(§4):

1. **Context-resident compression** — MemoryBank、MemGPT 中的 summary 路径。
2. **Retrieval-augmented stores** — Mem0、Letta、A-Mem 这类外挂 vector store。
3. **Reflective self-improvement** — Reflexion、ExpeL,把失败 trace 蒸成策略。
4. **Hierarchical virtual context** — MemGPT 的 main-ctx / external-ctx 分层。
5. **Policy-learned management** — 用 RL 或元学习训练 manage 策略本身。

## 方法 / 框架

PDF §3 给出闭环:

```
trace t  →  write(extract candidates)  →  manage(merge / supersede / forget)
        →  read(retrieve + rerank + pack)  →  agent action  →  new trace
```

§4 用一张大表把约 30 个代表性系统映射到三维 taxonomy × 五机制族的位置。
§5 给出 evaluation landscape:点名四个 benchmark(LoCoMo、MemBench、
MemoryAgentBench、MemoryArena),并指出它们各自只覆盖 manage 闭环里的部分环
节(LoCoMo 重 read,MemBench 重 write,MemoryArena 重 manage 冲突)。

## 评估 / benchmark

本身不提出 benchmark,但其 §5 的横向对比可以直接作为 Ymem `evaluator-benchmark`
模块的 v0 选型矩阵:

- LoCoMo:跨多月的对话场景 read 评测。
- MemBench:write 阶段 candidate 抽取与 dedup 评测。
- MemoryAgentBench:增量交互、test-time learning。
- MemoryArena:多 agent 共享 store 下的冲突解决。

§6 列出 9 个 open challenge,其中与 Ymem 直接相关的 5 个:多模态 memory、long
-horizon consolidation、forgetting under regulation、跨 agent 转移、可审计的
write 路径。

## 与 Ymem 的关系

- **temporal-scope** 维直接命中 `MemoryRecord` 的 `valid_from / valid_to /
  supersedes` 字段;这是 Ymem 当前 schema 与该综述结构对齐的关键。
- **substrate** 维下的 hybrid 路径(vector + KG)正好对应 Mem0g(见
  `papers/mem0-paper.md`),Ymem 的 host(zhione)在 v1 可以借鉴。
- **control-policy** 维直接复用到 Ymem 的 `dream-consolidator` 内部策略命名:
  Ymem 不重新发明术语,采用 append / overwrite / supersede / consolidate /
  forget 五种 op,与 Mem0 的 ADD / UPDATE / DELETE / NOOP 形成一一映射后再扩展
  (consolidate 与 forget 是 Mem0 没有的两个 op)。
- 五机制族当中,Ymem v0 主要落在 **Retrieval-augmented stores +
  Reflective self-improvement** 的交叉处,context compression 留给 host。

## 优劣 / 注意事项

优势:
- 15 页篇幅紧凑,术语清晰;对工程团队比 76 页的 2512.13564 更易消化。
- **control-policy** 这一维是本文相对最大贡献,可以直接命名 Ymem 离线策略层。
- 把 evaluation 与 mechanism 解耦,避免了"benchmark 即 method"的混淆。

注意事项 / fabrication 风险:
- 单作者综述,引用面比 2512.13564 窄,**遗漏了 parametric memory 与多模态
  memory** 两条线,Ymem 不应把本文当成全景。
- §5 对四个 benchmark 的归类有作者主观成分;本 radar 在评测选型前应对照原始
  benchmark 论文复核(尤其 MemoryArena,PDF 给出的描述偏简略)。
- 9 个 open challenge 与 2512.13564 §7 有较大 overlap,但用语不同;Ymem 内部
  讨论时应统一术语。

## 待跟进

- PDF 提到 policy-learned management(§4.5)目前只有少量论文(Self-RAG-tune 系
  列、AgenticMemoryRL)落地,值得单独 stub。
- §6 提到的"forgetting under regulation"与 mnemonic-sovereignty(2604.16548)
  应做一篇横向 ImpactNote,纳入 Ymem `security-privacy` 模块设计。
- MemoryArena 当前未在本 radar 的 pdfs/ 中,需后续下载并写 stub。
