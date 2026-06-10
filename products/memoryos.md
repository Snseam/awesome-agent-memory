---
title: MemoryOS
type: product
source: https://github.com/BAI-LAB/MemoryOS
date_first_seen: 2025-05
domain: research-agent-memory
business_model: OSS / research
license: Apache 2.0
memory_modules:
  - ingest-adapter
  - semantic-dedup
  - retriever-reranker
  - dream-consolidator
  - evaluator-benchmark
status: seed
last_revised: 2026-05-31
archive: archives/memoryos-overview.md
---

# MemoryOS

## 1. 一句话定位

MemoryOS 是 BAI-LAB 开源的 personalized AI agent memory operating system,
把 OS memory management 的分层思想迁移到 agent long-term memory。

## 2. 是什么 / 做什么

MemoryOS 面向 personalized AI agents,目标是让长期交互更连贯、个性化和
context-aware。它采用 short-term / mid-term / long-term 的层级存储架构,
并围绕 Storage、Updating、Retrieval、Generation 四个核心模块组织。

仓库提供:

- Python library / examples
- MemoryOS-MCP server
- ChromaDB 版本
- Playground / evaluation artifacts

截至 2026-05-31 查询,GitHub metadata 约 1.4k stars / 137 forks,Apache 2.0,
最新 release `V1.2`(2025-07-18),仓库在 2026 年仍有更新。

## 3. 关键技术选择

- **分层**:short-term、mid-term、long-term persona/knowledge memory
- **模块**:storage、updating、retrieval、generation
- **MCP**:`add_memory`、`retrieve_memory`、`get_user_profile`
- **模型**:支持 OpenAI-compatible API、Qwen/BGE embedding 等
- **评测**:LoCoMo 相关自报改进

## 4. 决策相关性 / Decision relevance

- **对照点**:MemoryOS 是 research-to-OSS 的 memory kernel 样本,比商业
  memory API 更接近本仓的架构讨论。
- **借鉴点**:
  - short/mid/long-term 分层适合作为 taxonomy 中 persistence 与 curation
    轴的实例。
  - MCP server 暴露 `add/retrieve/profile` 三类工具,是 agent client 集成的
    最小面。
  - OS analogy 可用于解释 memory capacity、promotion、eviction。
- **差异点**:MemoryOS 更强调 personalized dialogue agent;本仓 kernel 还要覆盖
  工具 agent、代码 agent 和企业业务状态。

## 5. 适用 / 不适用场景

- **适用**:研究 personalized agent memory;需要 MCP 形式接入长期记忆;希望
  复现 LoCoMo 相关结果。
- **不适用**:生产级企业 SLA;非对话型 agent 的复杂 provenance / audit 需求;
  需要成熟商业云服务。

## 6. 注意事项 / 风险

- **研究项目成熟度**:虽有 releases 与 MCP,仍需验证长期维护节奏。
- **benchmark 自报**:论文和 README 数字应以可复现实验为准。
- **benchmark ledger**:LoCoMo row 见
  [`../benchmarks/claims/claims.yaml`](../benchmarks/claims/claims.yaml);
  normalized record 见 [`../benchmarks/locomo.md`](../benchmarks/locomo.md)。
- **OpenAI-compatible 依赖**:本地部署仍可能需要外部 LLM / embedding provider。

## 7. 进一步阅读

- archive: [`archives/memoryos-overview.md`](archives/memoryos-overview.md)
- GitHub:https://github.com/BAI-LAB/MemoryOS
- Paper:https://arxiv.org/abs/2506.06326
- Docs:https://bai-lab.github.io/MemoryOS/docs

---

> *Ymem 项目对本笔记决策相关性的具体绑定见
> [`../docs/ymem-binding/relevance-index.md`](../docs/ymem-binding/relevance-index.md)。*
