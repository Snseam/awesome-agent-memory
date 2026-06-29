---
title: 2026-06 Memory Radar refresh
date: 2026-06-24
status: current-source-refresh
language: zh-CN
---

# 2026-06 Memory Radar refresh

本页记录 2026-06-24 的并行 radar 刷新结果。主 agent 负责整合,子 agent 分别检索
论文/会议、官方产品文档、GitHub 项目和仓库落点;验证与评审阶段按来源质量、记忆
系统相关性、Ymem/AgentMemory 决策价值和重复风险分流。

## 执行模型

| Lane | 角色 | 输出 |
|---|---|---|
| papers/conferences | `researcher` | arXiv / OpenReview / ACL Anthology 2026 候选 |
| products/platforms | `researcher` | 官方产品文档、release notes、preview/beta 状态 |
| GitHub/OSS | `researcher` + GitHub API spot-check | 活跃 repo、license、stars、更新时间、README claim |
| repo-map | `explore` | 现有条目、重复风险、落地文件 |
| source/relevance review | `verifier` / `critic` | must-add / update-existing / watchlist / reject |

## Must-add / update-existing

### Papers and benchmarks

| Action | Item | Why it matters | Local anchor |
|---|---|---|---|
| must-add | Agent Memory: Characterization and System Implications of Stateful Long-Horizon Workloads | 把 agent memory 从算法主题推进到 systems workload:taxonomy、write/read/generation profiling、fleet-scale 管理建议 | [`../papers/agent-memory-systems-characterization.md`](../papers/agent-memory-systems-characterization.md) |
| must-add | Are We Ready For An Agent-Native Memory System? | 从 data-management 视角拆解 representation/storage、extraction、retrieval/routing、maintenance,补上 agent memory 模块级评测压力 | [`../papers/agent-native-memory-readiness.md`](../papers/agent-native-memory-readiness.md) |
| must-add | DynamicMem | 用 15-month multi-app histories 测 evolving user profile memory,把 profile reconstruction 与 service-task accuracy 分开 | [`../benchmarks/dynamicmem.md`](../benchmarks/dynamicmem.md) |
| must-add | MEMPROBE | 把 memory artifact 本身作为 hidden user-state recovery 对象,补上 full-store vs top-k audit 视角 | [`../benchmarks/memprobe.md`](../benchmarks/memprobe.md) |
| must-add | TrustMem | 把 memory write/revise/delete 看成 transition quality 问题,关注 omission、corruption、hallucination | [`../papers/trustmem-memory-consolidation.md`](../papers/trustmem-memory-consolidation.md) |
| must-add | Securing LLM-Agent Long-Term Memory Against Poisoning | 把 persistent memory poisoning 从 content/lineage trust 推进到 origin-bound authority 问题 | [`../papers/securing-llm-agent-long-term-memory-poisoning.md`](../papers/securing-llm-agent-long-term-memory-poisoning.md) |
| must-add | Infini Memory | topic-structured documents 把 evidence aggregation、revision、iterative retrieval 做成可维护记忆形态 | [`../papers/infini-memory-topic-documents.md`](../papers/infini-memory-topic-documents.md) |
| must-add | What Deserves Memory | ACL 2026 adaptive memory distillation 入口,补 selective retention / admission policy 方向 | [`../papers/what-deserves-memory-adaptive-memory-distillation.md`](../papers/what-deserves-memory-adaptive-memory-distillation.md) |
| must-add | RaMem | 把 retrieval 之后的"证据是否仍适用"显式化,提出 context collapse 和 validity-aware retrieval | [`../papers/ramem.md`](../papers/ramem.md) |
| must-add | AdaMem | 把 memory write policy 学成 role-specific policy,直接对应 personalization memory bloat 与 selective retention | [`../papers/adamem-learning-what-to-remember.md`](../papers/adamem-learning-what-to-remember.md) |
| must-add | GateMem | 从单用户 recall 转向多主体 shared-memory governance:utility、access control、active forgetting 同测 | [`../benchmarks/gatemem.md`](../benchmarks/gatemem.md) |
| must-add | LightMem | SLM 驱动 retrieval/write/consolidation,强调 bounded online cost 与离线 consolidation | [`../papers/lightmem-agent-memory.md`](../papers/lightmem-agent-memory.md) |
| update-existing | MemoryAgentBench | ICLR 2026 接收后继续作为能力 taxonomy anchor:retrieval、test-time learning、long-range、selective forgetting | [`../papers/memoryagentbench.md`](../papers/memoryagentbench.md) |
| update-existing | MemGen | ICLR 2026 Poster;已有 stub,本轮只补 venue/status 信号 | [`../papers/stubs/memgen-weaving-generative-latent-memory-for-self-evolving.md`](../papers/stubs/memgen-weaving-generative-latent-memory-for-self-evolving.md) |
| update-existing / disambiguate | AtomMem | 2026-06 `AtomMem: ... via Atomic Facts` 与 2026-01 `AtomMem : ... Atomic Memory Operation` 不是同一条 | [`../papers/atommem-atomic-facts.md`](../papers/atommem-atomic-facts.md) |

### Products

| Action | Product | Why it matters | Local anchor |
|---|---|---|---|
| update-existing | AWS Bedrock AgentCore Memory | 2026-03 streaming、2026-05 metadata filtering 和 2026-06-18 Harness GA 使 AgentCore Memory 更接近 evented / managed / BYO memory lifecycle infra | [`../products/aws-agentcore-memory.md`](../products/aws-agentcore-memory.md) |
| update-existing | Google Agent Platform Memory Bank | 2026-06-17 release notes 将 Memory Bank / Sessions multi-regional 与 global endpoints 标为 GA,global endpoint 有 CMEK 限制 | [`../products/google-memory-bank.md`](../products/google-memory-bank.md) |
| update-existing | Microsoft Foundry Agent Service Memory | Build 2026 recap 继续标 public preview,并明确 procedural/user/session memory;Tau-bench gain 只作 vendor claim | [`../products/microsoft-foundry-memory.md`](../products/microsoft-foundry-memory.md) |
| update-existing | Cloudflare Agent Memory | 2026-06 docs 仍标 beta,但公开了 remember/recall、profile/namespace、fact/event/instruction/task memory 类型 | [`../products/cloudflare-agent-memory.md`](../products/cloudflare-agent-memory.md) |
| update-existing | OpenAI ChatGPT Memory / Dreaming | 2026-06 memory dreaming 与 release notes 显示 memory summary/source/staleness 方向升级 | [`../products/openai-memory.md`](../products/openai-memory.md) |
| update-existing | Oracle AI Agent Memory | 26.4 docs index 可访问;Claude/Oracle/LangChain blog 本环境 403,不升级为强证据 | [`../products/oracle-ai-agent-memory.md`](../products/oracle-ai-agent-memory.md) |
| update-existing | TencentDB Agent Memory | canonical GitHub repo 复核为 `TencentCloud/TencentDB-Agent-Memory`;旧 `Tencent/` URL 作为历史别名 | [`../products/tencentdb-agent-memory.md`](../products/tencentdb-agent-memory.md) |
| update-existing | Alibaba Bailian / AgentLoop Memory | AgentLoop docs 把 Facts/Episodic/Summary/Custom memory policies 作为 enterprise agent platform memory layer;本轮不拆新产品 | [`../products/alibaba-bailian-memory.md`](../products/alibaba-bailian-memory.md) |
| update-existing | Redis Agent Memory Server | Redis 2026-06 blog 强化 short-term interaction history + persistent long-term memory 的 product positioning | [`../products/redis-agent-memory-server.md`](../products/redis-agent-memory-server.md) |
| update-existing | Claude Code / Claude app memory | Claude Code v2.1.59+ auto memory 与 `CLAUDE.md`/`MEMORY.md` 文档化;chat-app memory 仍作相邻信号 | [`../products/claude-dreams.md`](../products/claude-dreams.md) |
| must-add | agentmemory | 高活跃 coding-agent persistent memory server,覆盖 Claude Code/Codex/Cursor/OpenClaw/MCP | [`../products/agentmemory.md`](../products/agentmemory.md) |
| must-add | Memori | agent-native memory infrastructure,从 agent execution/conversation 生成 structured persistent state | [`../products/memori.md`](../products/memori.md) |
| must-add | memU | workspace runtime -> agent memory,把 conversations/docs/code/media/tool traces 编译为 durable memory layers | [`../products/memu.md`](../products/memu.md) |
| must-add | memsearch | Markdown + Milvus 的 cross-agent coding memory layer,有 Zilliz 官方 repo/docs 支撑 | [`../products/memsearch.md`](../products/memsearch.md) |

## Watchlist / reject

| Decision | Item | Reason |
|---|---|---|
| watchlist | EvoArena / EvoMem | 很适合 tracking memory evolution,但本轮先进入 radar watchlist,等代码/benchmark 证据补齐后再建 benchmark note |
| watchlist | SubtleMemory | fine-grained relational discrimination 对 evaluator 有价值,但需先读数据协议 |
| watchlist | Control-Plane Placement Shapes Forgetting / ForgetEval | 对 forgetting architecture 有压强,但需验证 benchmark 是否可公开复现 |
| watchlist | memforks | "Git for AI agent memory" 信号清晰,但 2026-06 新项目、license 不明确、stars/生态弱于 Tier A |
| watchlist | remnic | scoped memory/provenance/correction/MCP/HTTP 方向相关,但当前信号量低,先保留 discovery |
| watchlist | LongMemEval-V2 / AMemGym | GitHub discovery signal 清晰,但需要 primary paper/protocol 和 license/data 复核后再建或拆分 benchmark note |
| watchlist | OpenAI Business / Enterprise / Edu Memory release notes | 产品 lane 发现 2026-06-25 rollout,但 OpenAI help pages 在本环境 403,先不升级产品笔记强证据 |
| reject as core | pure vector DB / generic RAG / catalog-only MCP memory entries | 只提供存储/检索或目录信号,未处理 memory lifecycle |
| reject as core | ordinary chat history / generic agent frameworks | 缺少独立 memory 产品边界或可审计 lifecycle |
| reject as source mismatch | arXiv IDs `2606.25599` / `2605.16677` as MEMPROBE/DimMem candidates | canonical arXiv pages resolve to unrelated titles,不得导入错误 title/link pairing |

## Evidence gaps / next verification

| Item | Gap | Why not blocking |
|---|---|---|
| GateMem | 代码、dataset、leaderboard 已公开,但 dataset license、split details、reported scores 还需 full read 后再升级 | 本轮只登记 paper-origin benchmark event,不登记 score claim |
| DynamicMem / MEMPROBE | arXiv abstract 支撑 benchmark seed,但 protocol、code/data/license、score normalization 需 full read | 本轮只登记 paper-origin benchmark event,不登记 score claim |
| TrustMem / poisoning / Infini / What Deserves Memory | primary source 支撑 seed note,但 PDF/code/license 与 benchmark setup 未精读 | 本轮只登记 seed note,不作为 full note |
| LightMem | ACL 页面与 arXiv 支撑 seed note,但 PDF/code/license 与 LoCoMo 设置还需精读 | 本轮 `evidence_level` 仅为 medium,不作为 full note |
| AWS AgentCore Memory streaming | What’s New 页面只概述 created/modified,delete event 由 developer guide 支撑 | 产品笔记已同时引用 announcement 与 record-streaming guide |
| GitHub Tier A projects | stars/update/license 仅作 discovery signal;custom license 项需要后续复核 | 产品笔记只写产品定位、activity 和 caveat,不写质量结论 |
| ACL / ICLR 2026 venues | 页面已上线,但会议日期晚于 2026-06-24 | 只写为 accepted/poster/source status,不推断现场发布后的变化 |

## Trend synthesis

- **Memory lifecycle is now first-class**:write control、retention/deletion、active forgetting、procedural memory 和 control-plane placement 成为论文/产品共同主题。
- **Evaluation moved from recall to governance and audit**:MemoryAgentBench、GateMem、DynamicMem、MEMPROBE、SubtleMemory、ForgetEval 等把选择性遗忘、访问控制、关系辨析、profile dynamics 和 memory-artifact audit 纳入测试。
- **Systems cost is becoming a research object**:Agent Memory characterization 和 LightMem 都把 construction/retrieval/generation cost、bounded online latency 放进核心 claim。
- **Cloud platforms are converging on managed memory stores**:AWS/Google/Microsoft/Cloudflare 都在把 scope、TTL、CRUD/search、eventing、profiles/namespaces 做成 agent platform primitive。
- **Coding-agent memory is becoming a product category**:agentmemory、memsearch、memU、Basic Memory、ByteRover、PowerMem、Honcho 等都围绕 Claude Code/Codex/Cursor/OpenClaw/MCP 打通项目记忆。

## Review notes

- 收录项均要求 primary source:论文用 arXiv/OpenReview/ACL Anthology,产品用官方 docs/blog/GitHub repo。
- GitHub stars 只作 discovery signal;产品笔记必须写明 license、activity date 和 maturity caveat。
- Vendor benchmark / performance claim 不升级为 independent evidence;只可写为 vendor-claimed。
- `AtomMem` 必须带 arXiv ID disambiguation:2601.08323 是 January atomic-operation paper,2606.19847 是 June atomic-facts memory system。
