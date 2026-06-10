---
title: A-MEM
type: product
source: https://github.com/agiresearch/A-mem
date_first_seen: 2025-02
domain: research-agent-memory
business_model: OSS / research
license: MIT
memory_modules:
  - ingest-adapter
  - semantic-dedup
  - retriever-reranker
  - dream-consolidator
status: seed
last_revised: 2026-05-31
archive: archives/a-mem-overview.md
---

# A-MEM

## 1. 一句话定位

A-MEM 是面向 LLM agents 的 agentic memory 系统,用 Zettelkasten 式动态组织、
索引和链接记忆,让 memory 在写入时就能自组织和演化。

## 2. 是什么 / 做什么

项目提出的核心问题是:传统 memory system 只做存储/检索,缺少高级组织能力。
A-MEM 让系统在新增、更新、删除 memory 时自动生成 note、tags、keywords、
context,并把相关记忆连接起来。

仓库提供可用于 agent construction 的 memory system;论文复现实验另有
`WujiangXu/AgenticMemory`。

截至 2026-05-31 查询,GitHub metadata 约 1.0k stars / 112 forks,MIT license,
无正式 release。

## 3. 关键技术选择

- **组织原则**:Zettelkasten / interconnected notes
- **存储与检索**:ChromaDB vector storage + semantic search
- **写入时演化**:自动更新 tags、context、semantic links
- **元数据**:custom tags/categories、keyword extraction、timestamps
- **LLM backend**:OpenAI 与 Ollama

## 4. 决策相关性 / Decision relevance

- **对照点**:A-MEM 的重点是 write-time organization,不是 query-time rerank;
  这与 memory kernel 的 consolidate/diff 设计高度相关。
- **借鉴点**:
  - "新增记忆时主动找关系并更新 metadata"可作为 `dream-consolidator` 的
    online 版本参考。
  - Zettelkasten 类 note graph 给出了比裸向量更可解释的用户层结构。
  - OpenAI + Ollama 双后端说明研究系统也在追求本地化。
- **差异点**:A-MEM 的自动 mutation 缺少显式 diff 审批,与本仓强调的
  audit-first 方向不同。

## 5. 适用 / 不适用场景

- **适用**:研究 agentic memory organization;构建个人或研究型 LLM agent;
  想测试 Zettelkasten 式 memory graph。
- **不适用**:企业生产场景;需要 formal release 和稳定 API 的应用;要求
  mutation 全部可人工审批的高审计系统。

## 6. 注意事项 / 风险

- **无 release**:截至抓取时 GitHub 无正式 releases,API 稳定性未知。
- **自动演化风险**:记忆关系和 metadata 自动更新可能引入不可见 drift。
- **复现分离**:系统仓库和论文复现仓库不同,引用实验数字时要指向正确来源。

## 7. 进一步阅读

- archive: [`archives/a-mem-overview.md`](archives/a-mem-overview.md)
- GitHub:https://github.com/agiresearch/A-mem
- Paper:https://arxiv.org/abs/2502.12110
- Reproduction repo:https://github.com/WujiangXu/AgenticMemory

---

> *Ymem 项目对本笔记决策相关性的具体绑定见
> [`../docs/ymem-binding/relevance-index.md`](../docs/ymem-binding/relevance-index.md)。*
