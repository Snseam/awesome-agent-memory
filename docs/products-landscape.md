---
title: Products landscape — agent memory by domain × audience
date: 2026-06-24
status: working-spec
language: zh-CN
---

# 产品全景:按领域 × 服务对象

回答用户的具体提问:**基于 agent memory 的产品有哪些?分属于哪些领域?为哪些
人或单位服务?**

这页是横切视角:每个产品在 `../products/<slug>.md` 里都有自己的笔记,这里只做
分类与对照。条目可能与 [`related-work.md`](related-work.md) 的论文交叉(产品的
原始论文也在 papers/ 里),不重复。

入库/拒绝理由见 [`product-discovery-log.md`](product-discovery-log.md),跨产品
架构模式见 [`product-memory-architectures.md`](product-memory-architectures.md)。

## 阅读说明

**Domain**(领域)= 这个产品最自然落到的应用场景。
**Audience**(服务对象)= 真实掏钱 / 部署的人。同一产品可对多个 audience。
**Mode**:OSS / OSS+SaaS / SaaS / Big-tech-builtin / Research-only / Plugin。

下表条目的判定标准是:**产品本身把"记忆"作为一等公民设计**;只是顺带做向量
检索或 RAG 的不算。

## 分类标准

### 入库边界

一个产品进入 `products/` 或本页核心表,需要满足三项:

1. 记忆是公开产品能力,不是普通 chat history、日志留存或单次 RAG 检索。
2. 产品公开处理至少两类 memory lifecycle 问题:写入、抽取、整合、召回、遗忘、
   权限、审计、导出、跨会话复用。
3. 有官方页面、官方文档、源码仓库、论文作者仓库或可审计页面快照作为主证据。

只提供向量库、普通知识库、通用 agent 框架、catalog-only MCP 条目或二手营销材料的
候选,不进入核心产品表;最多进入 discovery log 的轻量索引。

### 主分类维度

每个产品只选一个主类,按以下优先级归类:

| 主类 | 判定标准 | 典型问题 |
|---|---|---|
| Agent memory 专门层 | 产品直接销售或开源 memory layer / memory SDK / memory server | 如何写入、更新、检索、治理长期记忆 |
| Agent runtime / 平台内嵌 | memory 是 agent runtime、插件或框架的一等能力,但不是独立产品 | host runtime 如何把 memory 暴露给 agent |
| LLM / cloud 厂商 managed memory | 由模型厂商、云平台或数据库平台托管 memory store 与治理面 | scope、TTL、IAM、黑箱抽取和平台锁定 |
| Coding & Dev agents | 主要服务 IDE、coding agent、多 agent 开发工作流 | 项目上下文、决策、debug episode 如何跨 session 保留 |
| PKM / personal portable memory | 面向个人知识、跨模型上下文或用户拥有的 memory vault | 用户能否编辑、删除、导出和迁移 memory |
| 数字伴侣 / 垂直应用 | memory 是终端体验核心,但底层 memory infra 不公开 | persona 连续性、关系记忆和安全边界 |
| Enterprise workspace / DB-derived memory | 企业知识、数据库或平台能力显式暴露 memory lifecycle | 治理、审计、合规和底层存储边界 |

### 二级标签

主类之外,可叠加这些标签帮助交叉统计:

- **delivery mode**:OSS / OSS+SaaS / SaaS / source-available / cloud platform /
  big-tech-builtin / plugin / research.
- **memory substrate**:vector, keyword, graph, temporal graph, Markdown/files,
  relational DB, managed store, hybrid.
- **control surface**:API, SDK, MCP, CLI, UI, cloud console, local files.
- **evidence class**:official docs, official repo, product page, paper-origin,
  archive snapshot, vendor benchmark claim, independent reproduction.

## A. 按领域分类

### A1. Agent memory 专门层(memory-as-a-product)

| 名称 | 笔记 | Mode | Audience | 一句话 |
|---|---|---|---|---|
| Mem0 | [`../products/mem0.md`](../products/mem0.md) | OSS+SaaS | 个人开发者 / SaaS 团队 / 企业 | 业内被引最多的 memory layer;2026-04 出 v2 算法 |
| Zep | [`../products/zep.md`](../products/zep.md) | OSS+SaaS | SaaS 团队 / 企业 | 时间感知 KG;hosted 与 self-host 并存 |
| Graphiti | [`../products/graphiti.md`](../products/graphiti.md) | OSS | 个人开发者 / 研究者 | Zep 的开源底座,纯库形态 |
| Cognee | [`../products/cognee.md`](../products/cognee.md) | OSS+SaaS | 个人开发者 / 中小团队 | 记忆 + ontology + KG;偏 PKM/研究方向 |
| Letta(原 MemGPT)| [`../products/letta.md`](../products/letta.md) | OSS+SaaS | 研究者 / 个人开发者 | agent runtime 内置分层记忆 |
| LangMem | [`../products/langmem.md`](../products/langmem.md) | OSS | LangChain 用户 | LangChain/LangGraph 系的 memory primitive |
| Supermemory | [`../products/supermemory.md`](../products/supermemory.md) | OSS+SaaS | SaaS 团队 / 企业 / 个人 | context cloud:memory、RAG、profiles、connectors 一体化 |
| Hindsight | [`../products/hindsight.md`](../products/hindsight.md) | OSS+SaaS | agent builder / 企业 | "learns over time" 的服务化开源 agent memory |
| TencentDB Agent Memory | [`../products/tencentdb-agent-memory.md`](../products/tencentdb-agent-memory.md) | OSS+SaaS | OpenClaw 用户 / 企业 / 腾讯云客户 | 腾讯云 + 本地 OSS 的 L0-L3 分层 agent memory |
| EverOS | [`../products/everos.md`](../products/everos.md) | OSS+SaaS | coding agent 用户 / agent builder / 企业 | EverMind/EverMemOS 产品族;Profile/Episodic/Skill + self-evolving skills |
| MemOS | [`../products/memos.md`](../products/memos.md) | OSS | 研究者 / agent builder | MemTensor 的 self-evolving memory OS;注意与 MemoryOS 区分 |
| Redis Agent Memory Server | [`../products/redis-agent-memory-server.md`](../products/redis-agent-memory-server.md) | OSS | Redis 用户 / agent builder | working + long-term 双层 memory API server,提供 REST 与 MCP |
| PowerMem | [`../products/powermem.md`](../products/powermem.md) | OSS | coding agent 用户 / agent builder / OceanBase 生态 | Experience + Skill distillation,多接口 memory plugin/API server |
| Basic Memory | [`../products/basic-memory.md`](../products/basic-memory.md) | OSS+SaaS | 个人开发者 / 团队 / Markdown 用户 | local-first Markdown memory + knowledge graph + MCP |
| Tree Ring Memory | [`../products/tree-ring-memory.md`](../products/tree-ring-memory.md) | OSS | coding agent 用户 / 本地优先开发者 | Rust CLI + SQLite/FTS 的 memory lifecycle layer,强调 recall/forget/audit/consolidation |
| ByteRover(原 Cipher) | [`../products/byterover.md`](../products/byterover.md) | Source-available | coding agent 用户 / 团队 | autonomous coding agents 的 portable memory layer |
| Honcho | [`../products/honcho.md`](../products/honcho.md) | OSS+SaaS | agent builder / multi-agent 产品 | peer-centric stateful agent memory infrastructure |
| agentmemory | [`../products/agentmemory.md`](../products/agentmemory.md) | OSS | coding agent 用户 | multi-client persistent memory for Claude Code / Codex / Cursor / OpenClaw |
| Memori | [`../products/memori.md`](../products/memori.md) | OSS / productizing | agent builder / production agent 团队 | agent execution + conversation -> structured persistent state |
| memU | [`../products/memu.md`](../products/memu.md) | OSS / productizing | workspace agent / OpenClaw / MCP 用户 | workspace context -> durable agent memory layers |
| memsearch | [`../products/memsearch.md`](../products/memsearch.md) | OSS | coding agent 用户 / Zilliz-Milvus 生态 | Markdown + Milvus 的 cross-agent coding memory |
| OpenViking | [`../products/openviking.md`](../products/openviking.md) | OSS | coding agent 用户 / OpenClaw 用户 / agent builder | context database:filesystem 管理 memory、resources、skills |
| MemoryOS | [`../products/memoryos.md`](../products/memoryos.md) | OSS / Research | 研究者 / 个人开发者 | personalized agent 的 memory operating system |
| A-MEM | [`../products/a-mem.md`](../products/a-mem.md) | OSS / Research | 研究者 | Zettelkasten 式 agentic memory organization |
| MemX | [`../products/memx.md`](../products/memx.md) | OSS | 本地优先个人开发者 | 单文件 local-first memory,早期观察项 |

### A2. Agent runtime / 平台(memory 内嵌)

| 名称 | 笔记 | Mode | Audience |
|---|---|---|---|
| LangGraph + LangMem | [`../products/langmem.md`](../products/langmem.md) | OSS | 框架用户 |
| LlamaIndex memory | — | OSS | 框架用户 |
| AutoGen / CrewAI | — | OSS | 框架用户 |
| MemGPT(论文)| [`../products/memgpt.md`](../products/memgpt.md) | OSS(已演化为 Letta)| 研究者 |
| Hy-Memory | [`../products/hy-memory.md`](../products/hy-memory.md) | Plugin | OpenClaw 用户 / 混元生态 |
| OpenViking | [`../products/openviking.md`](../products/openviking.md) | OSS | OpenClaw / OpenCode / Claude Desktop 用户 |
| Cloudflare Agents Session Memory | [`../products/cloudflare-agent-memory.md`](../products/cloudflare-agent-memory.md) | Big-tech-builtin | Cloudflare Workers/Agents 用户 |

### A3. LLM / cloud 厂商内建 managed memory

| 名称 | 笔记 | Mode | Audience |
|---|---|---|---|
| ChatGPT memory + Assistants memory | [`../products/openai-memory.md`](../products/openai-memory.md) | Big-tech-builtin | C 端 + SaaS 团队 |
| Claude memory / Claude Dreams | [`../products/claude-dreams.md`](../products/claude-dreams.md) | Big-tech-builtin | C 端 + 企业 |
| Gemini personal context | — | Big-tech-builtin | C 端(Google 账号生态)|
| Google Agent Platform Memory Bank | [`../products/google-memory-bank.md`](../products/google-memory-bank.md) | Big-tech-builtin / Preview | Google Cloud / Gemini Enterprise agent builder |
| AWS Bedrock AgentCore Memory | [`../products/aws-agentcore-memory.md`](../products/aws-agentcore-memory.md) | Big-tech-builtin | AWS Bedrock AgentCore 用户 |
| Microsoft Foundry Agent Service Memory | [`../products/microsoft-foundry-memory.md`](../products/microsoft-foundry-memory.md) | Big-tech-builtin / Preview | Azure Foundry agent builder |
| Cloudflare Agent Memory | [`../products/cloudflare-agent-memory.md`](../products/cloudflare-agent-memory.md) | Big-tech-builtin / Private beta | Cloudflare Agents 用户 |
| Oracle AI Agent Memory | [`../products/oracle-ai-agent-memory.md`](../products/oracle-ai-agent-memory.md) | Enterprise platform | Oracle AI Database 客户 |
| Alibaba Cloud Bailian Memory Library | [`../products/alibaba-bailian-memory.md`](../products/alibaba-bailian-memory.md) | Cloud platform | 百炼 / Model Studio 开发者 |

### A4. Coding & Dev agents(memory 用于代码上下文)

| 名称 | Mode | Audience | 备注 |
|---|---|---|---|
| Cursor / Windsurf | SaaS | 个人开发者 / 团队 | memory 实现未公开,但产品体验把会话上下文跨 session 保留 |
| Replit Agent | SaaS | 个人 / 小团队 | 项目级 memory |
| Cognition Devin | SaaS | 企业 | 自治 agent 的工作 memory |
| GitHub Copilot Workspace | SaaS | 团队 / 企业 | repository-level context;memory 形态较弱但在演进 |
| Claude Code | SaaS | 个人开发者 / 团队 | CLAUDE.md + memory hooks |
| Supermemory plugins / MCP | OSS+SaaS | 个人开发者 / 团队 | Claude、Cursor、Codex、OpenCode 等 agent 插件入口 |
| TencentDB Agent Memory OpenClaw plugin | OSS+SaaS | OpenClaw 用户 | 自动 capture / recall,并保留 Mermaid task canvas |
| Hy-Memory OpenClaw plugin | Plugin | OpenClaw 用户 | 多 agent 共享 userId namespace 的长期记忆 |
| Basic Memory | OSS+SaaS | Claude / Codex / Cursor / VS Code 用户 | Markdown files + MCP,人和 agent 共用 memory |
| Tree Ring Memory | OSS | Claude Code / Codex / OpenCode / DOX/Revolve 用户 | Rust CLI + `.tree-ring` guidance,项目级 recall/forget/audit/consolidation |
| ByteRover | Source-available | autonomous coding agent 用户 | CLI/MCP/context tree 跨 agent 共享项目 memory |
| PowerMem | OSS | Claude Code / Codex / Cursor / OpenClaw 用户 | CLI/HTTP/MCP/插件共用后端 memory |
| Redis Agent Memory Server | OSS | 任意 MCP/REST agent | Redis-backed memory server,支持 working/long-term memory |
| Honcho | OSS+SaaS | Claude Code / OpenCode / OpenClaw / Hermes 用户 | peer-centric memory + MCP/SDK |
| agentmemory | OSS | Claude Code / Codex / Cursor / OpenClaw / MCP 用户 | coding-agent persistent memory server |
| memU | OSS / productizing | workspace agents / OpenClaw / MCP 用户 | workspace runtime 编译多模态 context 为 memory |
| memsearch | OSS | Claude Code / Codex / OpenCode / OpenClaw 用户 | Markdown + Milvus semantic memory |
| OpenViking | OSS | OpenClaw / OpenCode / Claude Desktop 用户 | context DB + MCP,统一 memory/resources/skills |

### A5. 个人知识管理(PKM)与记忆增强

| 名称 | 笔记 | Mode | Audience |
|---|---|---|---|
| Mem.ai | — | SaaS | 个人 |
| Reflect | — | SaaS | 个人 |
| Mymind | — | SaaS | 个人 |
| Notion AI memory | — | SaaS | 团队 |
| Obsidian + 插件 | — | OSS + 插件市场 | 个人 / 研究者 |
| Personal AI | [`../products/personal-ai.md`](../products/personal-ai.md) | SaaS | 个人 / creator / 开发者 |
| Anuma | [`../products/anuma.md`](../products/anuma.md) | SaaS | 个人 |
| Kinic | [`../products/kinic.md`](../products/kinic.md) | SaaS / tokenized datastore | 个人 / creator |

### A6. 数字伴侣 / 情感陪伴

| 名称 | Mode | Audience |
|---|---|---|
| Character.AI | SaaS | C 端 |
| Replika | SaaS | C 端 |
| Nomi | SaaS | C 端 |

这一类对**长程一致性**与**身份持久**要求高,与 `dream-consolidator` /
`memorydiff-generator` 类模块的设计有间接借鉴价值;但其 ethical/safety
模型与 [`../papers/mnemonic-sovereignty.md`](../papers/mnemonic-sovereignty.md)
的关注点冲突,落地需要谨慎对待。

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
| Supermemory Enterprise | OSS+SaaS / on-prem | 大企业 |
| Tencent Cloud Agent Memory | SaaS | 大企业 / 腾讯云客户 |
| Personal AI Memory Core | SaaS | AI builder / 企业 |
| AWS Bedrock AgentCore Memory | SaaS | AWS 企业客户 |
| Google Agent Platform Memory Bank | SaaS / Preview | Google Cloud / Gemini Enterprise 客户 |
| Microsoft Foundry Agent Service Memory | SaaS / Preview | Azure / Microsoft Foundry 客户 |
| Cloudflare Agent Memory | SaaS / Private beta | Cloudflare Workers/Agents 客户 |
| Oracle AI Agent Memory | Enterprise platform | Oracle AI Database 客户 |
| Alibaba Bailian Memory Library | SaaS | 阿里云百炼客户 |
| Redis Agent Memory Server | OSS / self-host | Redis 用户 / 企业平台团队 |

### A9. DB / Vector store 衍生的 memory API

| 名称 | Mode | Audience |
|---|---|---|
| Pinecone Assistant Memory | SaaS | 个人 / 团队 |
| Weaviate memory features | OSS+SaaS | 个人 / 团队 |
| Qdrant memory APIs | OSS+SaaS | 个人 / 团队 |
| pgvector + 应用层 | OSS | 个人 / 团队 |
| Oracle AI Agent Memory | Enterprise platform | Oracle AI Database 客户 |
| Redis Agent Memory Server | OSS | Redis 用户 / agent 平台团队 |
| OpenViking | OSS | agent builder / coding agent 用户 |
| PowerMem | OSS | OceanBase / 本地后端用户 |

这类"伪 memory"提供存储但不提供更新 / 过期 / 冲突解决,严格意义上不是 memory layer。
memory kernel 通常的关系是:**复用**它们做底层 vector store,**不取代**它们。

## B. 按 audience 分类(快速反查表)

### B1. 个人开发者(self-host 主导)
Letta self-host / Mem0 self-host / Zep self-host / Graphiti / Cognee /
Obsidian + 插件 / LangMem / Hindsight / TencentDB Agent Memory /
EverOS / MemOS / Redis Agent Memory Server / PowerMem / Basic Memory /
Tree Ring Memory / ByteRover / Honcho / agentmemory / Memori / memU / memsearch /
OpenViking / MemoryOS / A-MEM / MemX /
Supermemory self-host。

### B2. 中小团队 / SaaS startup
Mem0 cloud / Zep cloud / Supermemory API / Hindsight cloud / Basic Memory
Cloud / Honcho API / Redis Agent Memory Server / Tree Ring Memory / agentmemory / Memori / memU /
memsearch / OpenAI Assistants / Pinecone / Cursor for Teams。

### B3. 大企业
Glean / Mem0 Enterprise / Notion / Slack AI / Anthropic for Enterprise /
Cognition Devin / Sierra / Decagon / Supermemory Enterprise /
Tencent Cloud Agent Memory / AWS Bedrock AgentCore Memory /
Google Agent Platform Memory Bank / Microsoft Foundry Agent Service Memory /
Cloudflare Agent Memory / Oracle AI Agent Memory / Alibaba Bailian Memory /
Personal AI Memory Core。

### B4. C 端最终用户
ChatGPT memory / Claude memory / Gemini personal context /
Character.AI / Replika / Mem.ai / Mymind / Personal AI / Anuma / Kinic /
Personal Supermemory / Gemini personal context。

### B5. 研究者 / 学术
Letta(LeStar 学界出身) / MemGPT 论文复现 / Mem0 OSS / Graphiti OSS /
MemoryOS / A-MEM / MemOS / EverMemOS / TencentDB Agent Memory /
Hy-Memory / MIRIX。
学术用户主要消费 OSS 框架而非 SaaS。

## C. 不进入这张图的相邻范畴

为了不让本页失焦,**有意排除**:

- 纯 vector DB / 纯 RAG 中间件(Weaviate / Pinecone 的核心产品)
- 纯 long-context inference 加速(Together AI / Anthropic prompt cache 等)
- 通用 agent 框架(AutoGen / CrewAI 的非 memory 部分)
- 数据集 / 评测平台(进入 [`../benchmarks/`](../benchmarks/) 和
  [`benchmarks-landscape.md`](benchmarks-landscape.md),不混入产品图)

这些都和 agent memory 有交集,但**不是把 memory 当一等公民**。把它们排除让
"memory product" 的定义保持锐利。

> 本仓发起方 Ymem 在这张图里的位置(对照 A1 的 Mem0 / Letta / Graphiti),
> 见 [`ymem-binding/relevance-index.md`](ymem-binding/relevance-index.md) §"Ymem 在产品全景里的位置"。
