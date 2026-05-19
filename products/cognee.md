---
title: Cognee
type: product
source: https://www.cognee.ai/
date_first_seen: 2024-09
domain: KG-memory
business_model: OSS+SaaS
license: Apache 2.0 (OSS); 商业云另收费
memory_modules:
  - ingest-adapter
  - parser-chunker
  - semantic-dedup
  - retriever-reranker
  - dream-consolidator
status: full
last_revised: 2026-05-19
archive: archives/cognee-overview.md
---

# Cognee

## 1. 一句话定位

Cognee 把自己定位为"agent 的大脑":一个会把多源数据自动摄入并提取
**ontology** 的记忆与世界模型层,而不是单纯 vector DB。

## 2. 是什么 / 做什么

Cognee 的产品架构是一个三段式 pipeline:

1. **Ingest** — 连 28+ 数据源(数据仓库、vector store、文件、API、Slack
   等),做自动解析与 embedding
2. **Reason** — 在原始数据之上构建 / 维护 ontology,管理 fine-grained 权限,
   提供 recall 调优
3. **Act** — agent 通过兼容的 runtime(Claude Code、LangGraph、CrewAI、
   Cursor、Continue、MCP 等)读取记忆

OSS 部分在 GitHub(`topoteretes/cognee`,约 17.1k stars at fetch time),
本地可跑;cloud 分 Developer($35/mo)/ Team($200/mo)/ Enterprise(on-prem)
三档。

与 Zep / Graphiti 的差异在于 Cognee 强调"自动提取 ontology + 受治理的世界
模型":不仅是 entity-fact 图,而是带有可演化的概念层级和权限模型。

## 3. 关键技术选择

- **存储**:vector store + KG store 双层,具体后端依配置(未在首页完整披露)
- **记忆 unit**:从原始 source 经 cognify pipeline 落成 ontology 节点 +
  关系,而非裸 chunk
- **学习方式**:声称"memory that learns from usage patterns",但首页未给出
  具体反馈回路机制 → **未公开**
- **runtime 接入**:走 MCP / 各 agent 框架适配层,而不是绑定单一 host
- **权限**:fine-grained permission 是产品页明文卖点,适合多租户

## 4. 决策相关性 / Decision relevance

- **对照点**:Cognee 和本仓追踪的 memory kernel 都试图覆盖"记忆 + 知识结构"两件事,而不是
  只做 vector retrieval
- **借鉴点**:
  - **多源 ingest adapter**(28+ source)的清单值得参考,
    `ingest-adapter` 模块可以借用其 source 分类法
  - **ontology 自动提取**的产品形态指出了一个可选演进方向:在
    `MemoryRecord` 之上叠一层 concept hierarchy
  - **权限模型作为一等公民**值得我们提早纳入 `security-privacy` 模块讨论
- **互补点**:Cognee 重在"build & manage world model",memory kernel 重在
  "diff-first audit & consolidate";两者的强项可叠加
- **不重叠 / 竞争点**:在 OSS+SaaS 双轨这个商业形态上 Cognee 是潜在对手,
  但它更靠近"企业知识平台",memory kernel 仍是 library 形态

## 5. 适用 / 不适用场景

- **适用**:多源企业数据(Snowflake、Slack、PDF、API)合并进 agent 记忆的
  场景;需要 ontology + 权限的多租户应用;研究 KG-memory 但不想自建 ETL
- **不适用**:单用户的本地 PKM 工作流(过重);只需要 chat-scope 短期记忆
  的玩具应用;对 ontology 抽取的非确定性敏感的高 audit 场景

## 6. 注意事项 / 风险

- **复杂度**:cognify pipeline 步骤多,debug 路径长
- **披露不完整**:首页对底层存储与"learning from usage patterns"的具体机制
  披露有限,关键技术细节需要看仓库
- **vendor 路线**:OSS 由 Topoteretes 公司主导,商业化路径会牵动 OSS 优先级
- **数据出境**:云版默认非本地,Enterprise 才有 on-prem
- **benchmark 不透明**:没有公开 LoCoMo / LongMemEval 的可对比数字

## 7. 进一步阅读

- archive: [`archives/cognee-overview.md`](archives/cognee-overview.md)
- 仓库:https://github.com/topoteretes/cognee
- 官方:https://www.cognee.ai/

---

> *Ymem 项目对本笔记决策相关性的具体绑定见
> [`../ymem-binding/relevance-index.md`](../ymem-binding/relevance-index.md)。*
