---
title: Hindsight
type: product
source: https://github.com/vectorize-io/hindsight
date_first_seen: 2025-12
domain: learning-agent-memory
business_model: OSS + managed cloud
license: MIT
memory_modules:
  - ingest-adapter
  - semantic-dedup
  - retriever-reranker
  - dream-consolidator
  - evaluator-benchmark
status: seed
last_revised: 2026-05-31
archive: archives/hindsight-overview.md
---

# Hindsight

## 1. 一句话定位

Hindsight 是 Vectorize 推出的开源 agent memory system,口号是 "Agent Memory
That Learns":重点不是只 recall conversation history,而是让 agent 随反馈和
长期交互学习。

## 2. 是什么 / 做什么

Hindsight 提供 server、UI、Python/TypeScript clients 和 LLM wrapper。它支持
retain / recall / reflect 三类操作,也可以作为 wrapper 接到现有 LLM client
前,自动存取 memory。

官方 README 强调:

- LongMemEval benchmark 表现
- 可用 Docker 一键跑本地服务
- 支持多 LLM provider(OpenAI、Anthropic、Gemini、Groq、Ollama、LM Studio 等)
- 可用于 conversational agents 与 open-ended autonomous task agents

截至 2026-05-31 查询,GitHub metadata 约 15.2k stars / 857 forks,MIT
license,最新 release 为 `v0.7.1`(2026-05-28)。

## 3. 关键技术选择

- **接口**:HTTP API、SDK、LLM wrapper、embedded Python server
- **操作**:`retain` / `recall` / `reflect`
- **部署**:Docker、本地 PostgreSQL、embedded Python;企业路线提到 Oracle AI
  Database 支持
- **目标场景**:每用户 memory、chat history、AI employee / task agent
- **benchmark**:LongMemEval 自报并声称有外部研究协作者复现

> Benchmark record: [`../benchmarks/longmemeval.md`](../benchmarks/longmemeval.md);
> event ledger row: `hindsight-longmemeval-2026` in
> [`../benchmarks/claims/claims.yaml`](../benchmarks/claims/claims.yaml)。

## 4. 决策相关性 / Decision relevance

- **对照点**:Hindsight 将"learning"放在"remembering"前面,是 memory kernel
  后续是否加入 feedback/reflection loop 的重要竞争样本。
- **借鉴点**:
  - LLM wrapper 是降低接入成本的强产品形态。
  - `reflect` 作为与 `recall` 分离的操作,有利于把 memory retrieval 与
    response shaping 分开。
  - Docker + UI + SDK 的本地体验比纯库更容易被 agent builder 试用。
- **差异点**:Hindsight 更像完整服务;本仓 kernel 仍强调 schema/provenance
  与 host 自治。

## 5. 适用 / 不适用场景

- **适用**:需要本地开源服务快速给 agent 加 memory;希望用 wrapper 接入现有
  LLM client;需要 UI/服务化部署而非只用 library。
- **不适用**:只需要极简 in-process memory;不接受额外 server / database;
  需要完全可解释、diff-first 的 memory mutation。

## 6. 注意事项 / 风险

- **benchmark 比较口径**:官方称部分结果被外部复现,但与其他 vendor 自报分数
  混在同一图表里,引用时应标注来源。
- **服务复杂度**:相对轻量 SDK,引入 server、UI、DB 后运维面更大。
- **managed cloud 边界**:开源仓库与 Vectorize 商业云能力需分别评估。

## 7. 进一步阅读

- archive: [`archives/hindsight-overview.md`](archives/hindsight-overview.md)
- GitHub:https://github.com/vectorize-io/hindsight
- Docs:https://hindsight.vectorize.io/
- Release:https://github.com/vectorize-io/hindsight/releases/tag/v0.7.1

---

> *Ymem 项目对本笔记决策相关性的具体绑定见
> [`../docs/ymem-binding/relevance-index.md`](../docs/ymem-binding/relevance-index.md)。*
