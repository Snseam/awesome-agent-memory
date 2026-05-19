---
title: Products landscape — agent memory by domain × audience
date: 2026-05-19
status: working-spec
language: zh-CN
---

# 产品全景:按领域 × 服务对象

回答用户的具体提问:**基于 agent memory 的产品有哪些?分属于哪些领域?为哪些
人或单位服务?**

这页是横切视角:每个产品在 `products/<slug>.md` 里都有自己的笔记,这里只做
分类与对照。条目可能与 [`related-work.md`](related-work.md) 的论文交叉(产品的
原始论文也在 papers/ 里),不重复。

## 阅读说明

**Domain**(领域)= 这个产品最自然落到的应用场景。
**Audience**(服务对象)= 真实掏钱 / 部署的人。同一产品可对多个 audience。
**Mode**:OSS / OSS+SaaS / SaaS / Big-tech-builtin / Research-only。

下表条目的判定标准是:**产品本身把"记忆"作为一等公民设计**;只是顺带做向量
检索或 RAG 的不算。

## A. 按领域分类

### A1. Agent memory 专门层(memory-as-a-product)

| 名称 | 笔记 | Mode | Audience | 一句话 |
|---|---|---|---|---|
| Mem0 | [`products/mem0.md`](products/mem0.md) | OSS+SaaS | 个人开发者 / SaaS 团队 / 企业 | 业内被引最多的 memory layer;2026-04 出 v2 算法 |
| Zep | [`products/zep.md`](products/zep.md) | OSS+SaaS | SaaS 团队 / 企业 | 时间感知 KG;hosted 与 self-host 并存 |
| Graphiti | [`products/graphiti.md`](products/graphiti.md) | OSS | 个人开发者 / 研究者 | Zep 的开源底座,纯库形态 |
| Cognee | [`products/cognee.md`](products/cognee.md) | OSS+SaaS | 个人开发者 / 中小团队 | 记忆 + ontology + KG;偏 PKM/研究方向 |
| Letta(原 MemGPT)| [`products/letta.md`](products/letta.md) | OSS+SaaS | 研究者 / 个人开发者 | agent runtime 内置分层记忆 |
| LangMem | [`products/langmem.md`](products/langmem.md) | OSS | LangChain 用户 | LangChain/LangGraph 系的 memory primitive |

### A2. Agent runtime / 平台(memory 内嵌)

| 名称 | 笔记 | Mode | Audience |
|---|---|---|---|
| LangGraph + LangMem | [`products/langmem.md`](products/langmem.md) | OSS | 框架用户 |
| LlamaIndex memory | — | OSS | 框架用户 |
| AutoGen / CrewAI | — | OSS | 框架用户 |
| MemGPT(论文)| [`products/memgpt.md`](products/memgpt.md) | OSS(已演化为 Letta)| 研究者 |

### A3. LLM 厂商内建 memory

| 名称 | 笔记 | Mode | Audience |
|---|---|---|---|
| ChatGPT memory + Assistants memory | [`products/openai-memory.md`](products/openai-memory.md) | Big-tech-builtin | C 端 + SaaS 团队 |
| Claude memory / Claude Dreams | [`products/claude-dreams.md`](products/claude-dreams.md) | Big-tech-builtin | C 端 + 企业 |
| Gemini personal context | — | Big-tech-builtin | C 端(Google 账号生态)|

### A4. Coding & Dev agents(memory 用于代码上下文)

| 名称 | Mode | Audience | 备注 |
|---|---|---|---|
| Cursor / Windsurf | SaaS | 个人开发者 / 团队 | memory 实现未公开,但产品体验把会话上下文跨 session 保留 |
| Replit Agent | SaaS | 个人 / 小团队 | 项目级 memory |
| Cognition Devin | SaaS | 企业 | 自治 agent 的工作 memory |
| GitHub Copilot Workspace | SaaS | 团队 / 企业 | repository-level context;memory 形态较弱但在演进 |
| Claude Code | SaaS | 个人开发者 / 团队 | CLAUDE.md + memory hooks |

### A5. 个人知识管理(PKM)与记忆增强

| 名称 | Mode | Audience |
|---|---|---|
| Mem.ai | SaaS | 个人 |
| Reflect | SaaS | 个人 |
| Mymind | SaaS | 个人 |
| Notion AI memory | SaaS | 团队 |
| Obsidian + 插件 | OSS + 插件市场 | 个人 / 研究者 |

### A6. 数字伴侣 / 情感陪伴

| 名称 | Mode | Audience |
|---|---|---|
| Character.AI | SaaS | C 端 |
| Replika | SaaS | C 端 |
| Nomi | SaaS | C 端 |

这一类对**长程一致性**与**身份持久**要求高,与 Ymem 的 `dream-consolidator` /
`memorydiff-generator` 设计有间接借鉴价值;但其 ethical/safety 模型与
[`papers/mnemonic-sovereignty.md`](papers/mnemonic-sovereignty.md) 的关注点冲突,
不作为 Ymem 主要参考对象。

### A7. 客服 / 销售 / 业务对话 agent

| 名称 | Mode | Audience |
|---|---|---|
| Intercom AI / Fin | SaaS | 中小企业 / 企业 |
| Decagon | SaaS | 企业 |
| Sierra | SaaS | 企业 |

业务对话场景对**事实 grounding + 客户档案持久**双重要求,记忆系统通常与 CRM 集成。

### A8. 企业知识库 + AI

| 名称 | Mode | Audience |
|---|---|---|
| Glean | SaaS | 大企业 |
| Notion Enterprise AI | SaaS | 大企业 |
| Slack AI | SaaS | 大企业 |
| Mem0 Enterprise | SaaS / 内部部署 | 大企业 |

### A9. DB / Vector store 衍生的 memory API

| 名称 | Mode | Audience |
|---|---|---|
| Pinecone Assistant Memory | SaaS | 个人 / 团队 |
| Weaviate memory features | OSS+SaaS | 个人 / 团队 |
| Qdrant memory APIs | OSS+SaaS | 个人 / 团队 |
| pgvector + 应用层 | OSS | 个人 / 团队 |

这类"伪 memory"提供存储但不提供更新 / 过期 / 冲突解决,严格意义上不是 memory layer。
Ymem 与之的关系是:Ymem **复用**它们做底层 vector store,**不取代**它们。

## B. 按 audience 分类(快速反查表)

### B1. 个人开发者(self-host 主导)
Letta self-host / Mem0 self-host / Zep self-host / Graphiti / Cognee /
Obsidian + 插件 / LangMem。

### B2. 中小团队 / SaaS startup
Mem0 cloud / Zep cloud / OpenAI Assistants / Pinecone / Cursor for Teams。

### B3. 大企业
Glean / Mem0 Enterprise / Notion / Slack AI / Anthropic for Enterprise /
Cognition Devin / Sierra / Decagon。

### B4. C 端最终用户
ChatGPT memory / Claude memory / Gemini personal context /
Character.AI / Replika / Mem.ai / Mymind。

### B5. 研究者 / 学术
Letta(LeStar 学界出身) / MemGPT 论文复现 / Mem0 OSS / Graphiti OSS。
学术用户主要消费 OSS 框架而非 SaaS。

## C. Ymem 在这张图里的位置

Ymem **不是产品**,是给 host-app(如 ZhiOne)用的 memory kernel。它最直接对照
A1 中的 **Mem0 OSS / Letta / Graphiti** —— 这三者也都把自己定位为"被 host 嵌入"。

差异:
- **比 Mem0 多一层**:Mem0 直接处理 raw conversation;Ymem 假设 host 已经做了
  conversation → MemoryRecord 的转换。这让 Ymem 更纯,host 更重。
- **比 Letta 少一层**:Letta 是 agent runtime + memory;Ymem 只是 memory,不
  管 agent loop。host 要自己跑 agent。
- **比 Graphiti 更 schema-driven**:Graphiti 提供 KG primitives;Ymem 提供
  `MemoryRecord` + `MemoryDiff` + `MemoryResult` 三件套,KG 是可选 enricher 而
  非核心数据模型。

## D. 不进入这张图的相邻范畴

为了不让本页失焦,**有意排除**:

- 纯 vector DB / 纯 RAG 中间件(Weaviate / Pinecone 的核心产品)
- 纯 long-context inference 加速(Together AI / Anthropic prompt cache 等)
- 通用 agent 框架(AutoGen / CrewAI 的非 memory 部分)
- 数据集 / 评测平台(已在 [`signals.md`](signals.md))

这些都和 agent memory 有交集,但**不是把 memory 当一等公民**。把它们排除让
"memory product" 的定义保持锐利。
