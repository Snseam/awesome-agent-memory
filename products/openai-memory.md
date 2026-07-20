---
title: OpenAI ChatGPT Memory & Assistants API
type: product
source: https://help.openai.com/en/articles/8983136-what-is-the-memory-feature
date_first_seen: 2024-02
domain: LLM-builtin
business_model: big-tech-builtin
license: proprietary
memory_modules:
  - ingest-adapter
  - retriever-reranker
status: full
last_revised: 2026-07-20
archive: archives/openai-memory-overview.md
---

# OpenAI ChatGPT Memory & Assistants API

## 1. 一句话定位

OpenAI 在两个层面提供"记忆"能力:面向终端用户的 **ChatGPT memory** 与
面向开发者的 **Assistants API thread**;两者都是 vendor-managed、不开放
schema、不开放整理流程的黑盒。

## 2. 是什么 / 做什么

**ChatGPT memory(消费者侧)**:首次发布 2024-02,2025-04 扩展"reference
chat history"。ChatGPT 会自动 / 在用户要求下记下跨对话的事实(偏好、姓名、
项目背景),并在后续对话中调用。用户可在 Settings → Personalization →
Memory 中查看 / 编辑 / 删除任意一条,或整体关闭;"Temporary Chat" 模式既
不写入也不读取 memory。各 Plan(Free / Plus / Pro / Team / Enterprise / EDU)
可用范围与控制粒度略有差异。

**Assistants API(开发者侧)**:平台层提供 `Thread` 抽象,跨 run 持久化
消息,再加 `file_search` / `code_interpreter` 内置工具。它本身不是真正的
"long-term memory layer",更像 stateful conversation store;跨 thread 的
语义记忆需要开发者自己在 vector store + retrieval 上搭。

> 注:OpenAI 帮助中心对 shell `curl` 抓取有 403 访问限制;2026-07-20 browser
> fetch 可访问当前 ChatGPT release notes。platform docs 仍可能随登录/网络策略变化。
> 详见 archive 文件中的限制说明。

## 3. 关键技术选择

- **存储介质**:不公开,**未公开**
- **记忆 unit**:ChatGPT memory 是"自然语言事实条目";Assistants 是
  message-shaped object
- **检索策略**:不公开;ChatGPT 端疑似"全量注入 + 模型自筛"或带 retrieval
  的混合;Assistants `file_search` 是向量 + reranker
- **consolidation**:用户侧是"自动写 + 手工编辑",没有可见的离线整理
  job;开发者侧完全没有
- **可审计性**:ChatGPT 用户可看条目列表,但条目之间的依赖关系与生成依据
  不开放
- **runtime**:与 OpenAI 模型强绑定

## 3.1 2026-06 refresh

OpenAI 2026-06 公布 ChatGPT Memory Dreaming,把 memory 改进描述为后台综合过去
对话、memory source/summary、减少 stale 或 contradictory memory 的能力。ChatGPT
release notes 同期写到 memory 会更及时地保持更新。对本仓而言,这属于已有
vendor-managed memory 的 UX/治理升级,不是新的开放 memory kernel。

2026-06-25 ChatGPT Business / Enterprise / Edu release notes 又把改进版 memory
扩展到组织计划:可使用相关历史对话上下文,并提供 memory summary、source、纠错、
删除、标记 not relevant 以及 legacy saved memories 控制。OpenAI 同时说明 Codex
memory 不受该 ChatGPT 产品 memory 变更影响。该更新继续归类为 vendor-managed
product behavior,不作为开放 agent-memory API 或独立质量证据。

2026-07-20 复核时,当前 ChatGPT release notes / Help Center 继续暴露 memory
summary 的用户控制面:用户可从 summary 页面删除显示的 memories,也可用 "Delete
and turn off memory" 关闭 memory;summary 支持文本框编辑和高亮纠错,但关闭 memory
不会删除既有历史聊天。该更新只按当前官方帮助中心产品行为记录,不代表底层 schema、
检索或 consolidation 机制公开。

## 4. 决策相关性 / Decision relevance

- **对照点**:它定义了 "vendor-managed memory" 的对照基线 — 用户/开发者
  把记忆形态、保留策略、隐私边界完全交给一个供应商
- **借鉴点**:
  - **memory 条目可被用户直接编辑** 的产品形态值得抄(对应 host-app 的
    `audit-ui` 模块,而不是 memory kernel)
  - 区分"自动写"与"用户显式 remember 指令" 两条入口,对应
    `ingest-adapter` 的两类 source
- **互补点**:memory kernel 提供"vendor-neutral 的 schema + diff",正是 OpenAI
  memory 的反面 — 后者数据出境且 lock-in,前者 host 自治
- **不重叠 / 竞争点**:面向 host-app 开发者时 memory kernel 与 OpenAI memory **不在
  同一层**;但企业用户决策"是不是直接用 ChatGPT enterprise"时,kernel 的
  价值主张需要明确回答 vs vendor-builtin 的差异

## 5. 适用 / 不适用场景

- **适用**:个人 ChatGPT 用户、希望"零运维 + 跟着 OpenAI 模型升级"的小
  团队、需要 thread 持久化的简单 agent 原型
- **不适用**:数据不能出境的企业场景;需要可移植到其他模型供应商的
  multi-LLM 系统;需要 diff / 审计 / on-prem 部署的合规场景;需要在
  thread 之间共享长期语义记忆的复杂 agent

## 6. 注意事项 / 风险

- **数据出境**:ChatGPT memory / Assistants thread 均存于 OpenAI;企业合规
  与本地法规可能直接否决
- **vendor lock-in**:迁出到自建 stack 没有官方导出 schema
- **不透明**:写入策略、保留时长、整理逻辑均未公开,出问题难调试
- **行为变更风险**:产品 / 政策迭代会改变默认行为(2024 → 2025 已经发生
  过一次扩展),依赖方需要持续跟踪
- **抓取限制**:OpenAI 帮助中心对 shell `curl` 可能返回 403;本轮用 browser fetch
  复核 release notes,但事实仍需要以官方页面为准

## 7. 进一步阅读

- archive: [`archives/openai-memory-overview.md`](archives/openai-memory-overview.md)
- 帮助中心:https://help.openai.com/en/articles/8983136-what-is-the-memory-feature
- Memory FAQ:https://help.openai.com/articles/8590148-memory-faq
- Assistants API:https://platform.openai.com/docs/assistants/how-it-works
- 公告:https://openai.com/index/memory-and-new-controls-for-chatgpt/
- Dreaming:https://openai.com/index/chatgpt-memory-dreaming/
- Business release notes:https://help.openai.com/en/articles/11391654-chatgpt-business-release-notes
- Enterprise/Edu release notes:https://help.openai.com/en/articles/10128477-chatgpt-enterprise-edu-release-notes

---

> *Ymem 项目对本笔记决策相关性的具体绑定见
> [`../docs/ymem-binding/relevance-index.md`](../docs/ymem-binding/relevance-index.md)。*
