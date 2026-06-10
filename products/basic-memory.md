---
title: Basic Memory
type: product
source: https://docs.basicmemory.com/
date_first_seen: 2026-06
domain: local-first-memory
business_model: OSS + cloud subscription
license: AGPL-3.0
memory_modules:
  - ingest-adapter
  - semantic-dedup
  - retriever-reranker
  - policy-privacy
status: seed
last_revised: 2026-06-11
archive: archives/basic-memory-overview.md
---

# Basic Memory

## 1. 一句话定位

Basic Memory 是 local-first、Markdown-first 的 AI memory / knowledge graph,
让人和 agent 共同读写同一批可编辑文件,并通过 MCP 接入 Claude、Codex、Cursor、
ChatGPT 等客户端。

## 2. 是什么 / 做什么

官方文档强调 "Every piece of AI context is a file you can read and edit"。Basic
Memory 把知识保存为 plain Markdown,再生成 semantic knowledge graph 与搜索索引。
它提供本地运行和 Basic Memory Cloud 两条路径,云端仍使用同一套 Markdown 文件语义。

## 3. 关键技术选择

- **Markdown source of truth**:记忆不是黑箱数据库记录,而是人类可读/可编辑文件。
- **Knowledge graph**:observations、wikilinks、relations 形成语义图。
- **MCP-native**:面向主流 AI clients/IDEs 暴露搜索、读取、写入工具。
- **Cloud optional**:本地免费/AGPL,云端提供同步、备份和多端访问。

## 4. 决策相关性 / Decision relevance

- **对照点**:Basic Memory 是目前最清晰的 "artifact-first memory" 产品样本。
- **借鉴点**:Markdown + graph + MCP 的组合非常适合解决 inspectability 和 lock-in。
- **差异点**:它更像个人/团队知识库与 agent memory 的交叉,不是低层 memory kernel。

## 5. 适用 / 不适用场景

- **适用**:coding agent 长期项目上下文;希望人类可直接审阅/编辑 memory 的团队;
  Obsidian/Markdown 用户。
- **不适用**:只需要嵌入式 SDK;不希望 AGPL 约束或文件型工作流的商业产品。

## 6. 注意事项 / 风险

- **许可**:AGPL-3.0 对闭源集成有影响。
- **性能边界**:大规模企业多租户能力需要实测云端版本。
- **产品定位**:它既是 memory 又是 PKM/knowledge graph,归类时应标注交叉属性。

## 7. 进一步阅读

- archive: [`archives/basic-memory-overview.md`](archives/basic-memory-overview.md)
- Docs:https://docs.basicmemory.com/
- GitHub:https://github.com/basicmachines-co/basic-memory

---

> *Ymem 项目对本笔记决策相关性的具体绑定见
> [`../docs/ymem-binding/relevance-index.md`](../docs/ymem-binding/relevance-index.md)。*
