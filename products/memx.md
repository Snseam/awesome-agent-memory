---
title: MemX
type: product
source: https://memx.me/
date_first_seen: 2026-03
domain: local-first-memory
business_model: OSS
license: Apache 2.0 (GitHub metadata); site claims MIT at fetch time
memory_modules:
  - ingest-adapter
  - retriever-reranker
  - security-privacy
status: seed
last_revised: 2026-05-31
archive: archives/memx-overview.md
---

# MemX

## 1. 一句话定位

MemX 是一个 Rust 编写的 local-first long-term memory system,主张"整个记忆就是
本机一个文件",面向重视隐私、可复制和低复杂度的个人 AI assistant。

## 2. 是什么 / 做什么

官网给出的体验是命令行式 add/search:

- `memx add "..."`
- `memx search "..."`

核心卖点:

- 单文件 libSQL 存储
- 无账号、无同步服务器、无云
- 低置信查询返回空结果,避免硬塞错误 memory
- vector + keyword hybrid retrieval,使用 RRF fusion
- rerank 时考虑 semantic similarity、recency、retrieval frequency、
  explicit importance
- 检索结果可解释,统计写回数据库

截至 2026-05-31 查询,GitHub `memxlab/memx` metadata 只有约 2 stars,Apache
2.0;官网则写 v0.1.0 / open source / MIT。成熟度很低,但作为 local-first
memory 设计样本有观察价值。

## 3. 关键技术选择

- **存储**:single libSQL file
- **检索**:vector + keyword parallel recall, RRF fusion
- **拒答门槛**:低于阈值返回 empty result
- **ranking**:相似度、recency decay、使用频率、显式重要性
- **embedding**:支持任意 OpenAI-compatible API,包括 Ollama / LM Studio

## 4. 决策相关性 / Decision relevance

- **对照点**:MemX 是"极简、本地、可复制"路线,与 Supermemory/Zep 这类云
  context platform 正好相反。
- **借鉴点**:
  - refusal gate 是 memory retrieval 里经常缺失但很实用的安全阀。
  - 单文件 memory.db 很适合个人 agent 迁移和备份。
  - RRF + explicit importance + recency 是简单但可解释的 baseline。
- **差异点**:它更像 early-stage CLI/database,不是完整 agent memory platform。

## 5. 适用 / 不适用场景

- **适用**:个人本地 assistant;需要可拷贝 memory file;研究低复杂度 recall
  baseline。
- **不适用**:多人协作、企业治理、跨设备同步、复杂 provenance 和审计。

## 6. 注意事项 / 风险

- **license 不一致**:官网写 MIT,GitHub metadata 显示 Apache 2.0,需以仓库
  `LICENSE` 为准。
- **成熟度低**:星标和生态很小,只应作为观察项或 baseline,不要当作成熟框架。
- **benchmark 小**:官网 benchmark 样本很小,不可与 LoCoMo / LongMemEval 直接
  比较。

## 7. 进一步阅读

- archive: [`archives/memx-overview.md`](archives/memx-overview.md)
- 官方:https://memx.me/
- GitHub:https://github.com/memxlab/memx
- Paper:https://arxiv.org/abs/2603.16171

---

> *Ymem 项目对本笔记决策相关性的具体绑定见
> [`../docs/ymem-binding/relevance-index.md`](../docs/ymem-binding/relevance-index.md)。*
