---
date: 2026-10-26
title: Product discovery log — agent memory products
status: working-log
language: zh-CN
---

# Product discovery log

本日志记录 2026-06-11 与 2026-06-24 的多子 agent 产品搜索、证据审查和最终入库决定。它不是
产品介绍页,而是解释**为什么某个候选被深度入库、只进入轻量索引、或被拒绝**。

## 1. 执行模型

| Wave | 角色 | 并发 | 产出 |
|---|---:|---:|---|
| Wave 0 | Coordinator | 1 | 候选池、去重、Tier 判定、最终写入 |
| Wave 1 | Discovery researchers | 6 | vendor / OSS / MCP / academic / domestic / adjacent lanes |
| Wave 2 | Evidence reviewers | 3 | Tier A、source quality、inclusion boundary review |
| Wave 3 | Architecture writers | 4 | 架构模式草稿,不直接改共享文件 |
| Wave 4 | Integration writer | 1 | 本次仓库写入与验证 |

并发上限控制在 6 个 native subagents。子 agent 只负责搜索、评审和草稿;最终文件写入
由主 agent 单点完成,避免多个 agent 修改同一文件。

## 2. 搜索范围与查询主题

| Lane | 子 agent 范围 | 查询主题 |
|---|---|---|
| Official/vendor | EverMind/EverOS、Mem0、Zep、Supermemory、Hindsight、LangMem、Letta、Cognee、hyperscaler memory docs | 官方站、docs、release、GitHub README、pricing/status |
| GitHub/OSS | MemOS、agentmemory、SimpleMem、PowerMem、OpenViking、Redis AMS、Dakera、SuperLocalMemory 等 | GitHub topics/trending、stars、license、release、README |
| MCP/catalog | Glama、MCP Market、LobeHub、mcpservers、Claude/Cursor/Codex memory server lists | MCP server catalog、canonical repo/docs、tool surface |
| Academic-to-product | `papers/index.md` 中已有论文和 arXiv/OpenReview 新线索 | EverMemOS、MemOS、MemoryOS、HiMeS、HippoRAG、Memory-T1 |
| China/domestic | 腾讯云、混元、OceanBase、火山、阿里百炼、百度千帆、智谱/Kimi/豆包 | 官方云文档、国内产品页、GitHub、中文报道 |
| Adjacent products | PKM、企业知识库、数字伴侣、客服/销售、coding agents | 是否显式暴露 durable/editable memory |

## 3. 最终 Tier 规则

| Tier | 标准 | 写入动作 |
|---|---|---|
| Tier A core | memory 是一等产品能力;有官方/源码证据;能映射到 memory 架构;不是纯 RAG/vector DB | 产品笔记 + archive snapshot + landscape 行 + 架构归类 |
| Tier B adjacent | 暴露 memory 能力但不是独立 memory 产品,或证据/成熟度不足 | 轻量索引 + discovery log;后续跟踪 |
| Reject | 只是普通知识库、纯向量库、普通 chat history、二手无证据营销项 | 记录拒绝原因,不入产品笔记 |

## 4. 本次新增 Tier A core

| name | canonical_url | repo/docs | category | evidence | suggested_tier | why_include | why_not_core | sources_checked |
|---|---|---|---|---|---|---|---|---|
| Screenpipe | https://screenpipe.com/ | https://github.com/screenpipe/screenpipe | personal/workflow memory with captured-history ingest | affiliated primary docs + pinned source | Tier A / seed | persistent capture, editable memory CRUD and cross-session retrieval | commercial source-available terms; transport, retention and cloud-data boundaries; no independent validation | Public source and official docs |
| EverOS (EverMind / EverMemOS) | https://evermind.ai/everos | https://github.com/EverMind-AI/EverOS | memory OS / skill memory | official product page + repo | Tier A | Profile/Episodic/Skill、self-evolving skills、Markdown export、MCP/agent integrations | benchmark/latency 是 vendor-claimed | Official/vendor, academic |
| MemOS (MemTensor) | https://github.com/MemTensor/MemOS | https://memos.openmem.net/ | memory OS | GitHub repo + docs | Tier A | self-evolving memory OS、hybrid retrieval、cross-task skill reuse | 与 MemoryOS/EverMemOS 易混淆;需后续读代码 | OSS, academic |
| Cloudflare Agent Memory | https://blog.cloudflare.com/introducing-agent-memory/ | https://developers.cloudflare.com/agents/concepts/conversation-state-and-memory/ | platform-managed memory | official blog + docs | Tier A | platform memory primitive、Session/context memory、SQLite/provider model | private beta / experimental | Official/vendor, adjacent |
| AWS Bedrock AgentCore Memory | https://docs.aws.amazon.com/bedrock-agentcore/latest/devguide/memory.html | https://docs.aws.amazon.com/bedrock-agentcore/latest/devguide/memory-strategies.html | platform-managed memory | official docs | Tier A | short-term + long-term managed memory, extraction strategies | AWS-only managed service | Official/vendor, adjacent |
| Google Agent Platform Memory Bank | https://docs.cloud.google.com/gemini-enterprise-agent-platform/scale/memory-bank | https://docs.cloud.google.com/gemini-enterprise-agent-platform/release-notes | platform-managed memory | official docs + release notes | Tier A | scoped long-term memories, TTL, revisions, poisoning guidance;multi-regional/global endpoints GA | docs still carry Preview/Pre-GA caveats; global endpoint has CMEK caveat | Official/vendor, adjacent |
| Microsoft Foundry Agent Service Memory | https://learn.microsoft.com/en-us/azure/foundry/agents/concepts/what-is-memory | https://devblogs.microsoft.com/foundry/whats-new-in-microsoft-foundry-build-2026/ | platform-managed memory | official docs + Build recap | Tier A | scoped store, CRUD/TTL, profile/session/procedural memory | public preview;Tau-bench gains are vendor claims | Official/vendor, adjacent |
| Oracle AI Agent Memory | https://docs.oracle.com/en/database/oracle/agent-memory/26.4/agmea/about.html | same | enterprise DB memory | official docs | Tier A | Oracle AI Database as governed memory substrate | Oracle platform-bound | Adjacent, reviewer |
| Redis Agent Memory Server | https://redis.github.io/agent-memory-server/ | https://github.com/redis/agent-memory-server | memory API server | official docs + repo | Tier A | two-tier memory, REST+MCP, hybrid search, extraction/dedup/edit | human-readable artifact not primary path | OSS, MCP |
| OpenViking | https://volcengine-openviking.mintlify.app/ | https://github.com/volcengine/OpenViking | context DB with memory | docs + repo | Tier A | memory/resources/skills filesystem, L0/L1/L2, session memory extraction | not pure memory layer; benchmark self-reported | OSS, domestic |
| PowerMem | https://github.com/oceanbase/powermem | https://www.powermem.ai/ | memory API/plugin | repo + site | Tier A | Experience + Skill distillation, hybrid retrieval, MCP/HTTP/CLI/plugins | benchmark self-reported | OSS, domestic |
| Alibaba Bailian Memory Library | https://help.aliyun.com/zh/model-studio/memory-library | https://help.aliyun.com/en/document_detail/3033860.html | platform-managed memory | official docs | Tier A | automatic extraction, memory fragments, user profile, Add/Search APIs;AgentLoop memory policies(Facts/Episodic/Summary/Custom) | cloud black box;AgentLoop split/merge needs later review | Domestic, personal/platform |
| Basic Memory | https://docs.basicmemory.com/ | https://github.com/basicmachines-co/basic-memory | local-first memory | docs + repo | Tier A | Markdown source of truth, knowledge graph, MCP-native, cloud/local | PKM crossover and AGPL | MCP, OSS |
| ByteRover (Cipher) | https://www.byterover.dev/ | https://github.com/campfirein/byterover-cli | coding-agent memory | site + repo + docs | Tier A | portable memory layer for autonomous coding agents, CLI/MCP/context tree | ELv2/source-available; maturity needs follow-up | MCP, OSS |
| Honcho | https://github.com/plastic-labs/honcho | https://docs.honcho.dev/ | memory infrastructure | repo + docs | Tier A | peer-centric memory, async reasoning, representations, MCP/SDK/self-host | eval claims vendor-side, AGPL | OSS, MCP |
| agentmemory | https://github.com/rohitg00/agentmemory | https://agent-memory.dev | coding-agent memory | repo + GitHub API spot-check | Tier A | persistent memory for Claude Code/Codex/Cursor/OpenClaw/MCP; Apache-2.0; active 2026-06 | benchmark claims need independent review | OSS, GitHub |
| Memori | https://github.com/MemoriLabs/Memori | https://memorilabs.ai | agent-native memory infrastructure | repo + product site | Tier A | LLM-agnostic layer for agent execution/conversation -> structured persistent state | license API returned NOASSERTION | OSS, GitHub |
| memU | https://github.com/NevaMind-AI/memU | https://memu.pro | workspace-to-agent memory | repo + product site | Tier A | workspace runtime compiles conversations/docs/code/media/tool traces into memory | license API returned NOASSERTION; fast-changing | OSS, GitHub |
| memsearch | https://github.com/zilliztech/memsearch | https://zilliztech.github.io/memsearch/ | coding-agent memory | repo + docs | Tier A | Markdown + Milvus memory layer for Claude Code/Codex/OpenClaw; MIT; vendor-backed | coding-agent/project memory, not generic governance layer | OSS, GitHub |

## 5. Tier B / lightweight index

| name | canonical_url | category | evidence | suggested_tier | why_include | why_not_core | sources_checked |
|---|---|---|---|---|---|---|---|
| TANCO Chuandeng / Lianzhu | https://skillhub.cn/skills/tanco/tanco-chuandeng-handoff-payskill / https://skillhub.cn/skills/tanco/tanco-lianzhu-devchain-payskill | handoff / execution-checkpoint workflows | publisher docs and readable source previews, accessed 2026-10-26 | adjacent workflow discovery | structured handoff, agent-maintained state, artifact hashes and resumable checkpoints | not a core memory product; implementation previews are not independent runtime or quality validation | pinned publisher index and versioned platform file previews |
| Hyperconsciousness (HC) | https://github.com/louis030195/hyperconsciousness | scoped agent knowledge store | affiliated primary docs + static interface inspection at 5748f891 | Tier B | encrypted append-only records and grant-scoped MCP/HTTP capture/recall on one trusted node | developer alpha; central-only contract replaces proposal peer sync; runtime/security/recall not independently validated | README, MISSION, CONSTRAINTS, migration guide, MIT license |
| Volcengine AgentKit Memory | https://www.volcengine.com/ | platform memory | domestic lane official/product signals | Tier B | platform memory capability signal | evidence less direct than OpenViking | Domestic |
| Alibaba PolarSearch Memory Container | https://www.aliyun.com/ | database memory | domestic lane official/product signals | Tier B | memory container signal | canary / product boundary distinct from Bailian | Domestic |
| Baidu Qianfan AppBuilder memory | https://cloud.baidu.com/product/AppBuilder | platform memory | domestic lane | Tier B | AppBuilder memory capability | not standalone memory infra | Domestic |
| MIRIX | https://github.com/Mirix-AI/MIRIX | personal assistant memory | repo + paper/product signal | Tier B | screen/activity memory assistant is relevant | app/product scope broader than memory infra | Academic, adjacent |
| Pieces LTM MCP | https://docs.pieces.app/products/mcp | local workflow memory | official docs | Tier B | coding workflow LTM surfaced through MCP | product is broader PiecesOS stack | MCP |
| MemMachine | n/a | coding-agent memory | OSS lane signal | Tier B | memory-focused OSS candidate | source/license/release not verified enough | OSS |
| mem9 | n/a | memory SDK | OSS lane signal | Tier B | memory-focused candidate | source quality incomplete | OSS |
| Memstate AI | n/a | memory server | MCP lane signal | Tier B | memory-focused candidate | canonical evidence incomplete | MCP |
| ClawMem | https://github.com/yoloshii/ClawMem | local memory vault | repo | Tier B | on-device coding-agent memory | release/license maturity not reviewed | MCP |
| memforks | https://github.com/memforks-dev/memforks | versioned memory | repo | Tier B | "Git for AI agent memory" concept | early project, custom/unclear license | OSS |
| remnic | https://github.com/joshuaswarren/remnic | scoped memory/context | repo | Tier B | provenance, correction, evals, MCP/HTTP surface | small ecosystem signal; implementation depth not reviewed | OSS |
| nram | https://github.com/nram-ai/nram | self-hosted memory | repo | Tier B | MCP/REST continuity, graph, consolidation signal | extremely new/low activity signal | OSS |
| Universal Memory Protocol | https://github.com/edihasaj/universal-memory-protocol | protocol proposal | repo | Tier B | interop idea adjacent to MCP/A2A | not established as standard | OSS |
| memanto | https://github.com/moorcheh-ai/memanto | coding-agent memory | repo | Tier B | local memory agent for Claude Code/Cursor/Codex | needs source/eval review before core note | OSS |
| LycheeMem | https://github.com/LycheeMem/LycheeMem | long-term memory framework | repo | Tier B | MCP/plugin/Python integration signal | release/activity maturity unclear | OSS |
| Parcle Memory | https://github.com/Parcle-AI/parcle-memory | per-user agent memory | repo | Tier B | conversations/files with cited answers | product/API boundary and self-host story need review | OSS |
| Neo4j Agent Memory | https://github.com/neo4j-labs/agent-memory | graph-native agent memory | repo | Tier B | graph-backed memory/context graph | labs project; API stability unclear | OSS |
| SimpleMem | n/a | coding-agent memory | OSS lane signal | Tier B | memory candidate | evidence/maturity weaker than Tier A set | OSS |
| SuperLocalMemory | arXiv | research architecture | paper | Tier B | local-first architecture pressure | not productized enough | Academic |
| Decagon / Sierra | vendor sites | customer-service memory | product signals | Tier B | embedded user/customer memory in vertical agents | not standalone memory infrastructure | Adjacent |
| Cursor / Windsurf / Devin | vendor sites | coding-agent embedded memory | product signals | Tier B | visible durable context/memory UX | implementation and memory API not public | Adjacent |
| Mem.ai / Reflect / mymind / Notion AI | vendor sites | PKM / workspace AI | product signals | Tier B | adjacent personal/workspace memory | memory not first-class agent infra | Adjacent |
| Character.AI / Replika / Nomi | vendor sites | companion memory | product signals | Tier B | long-term persona consistency pressure | ethical/safety scope differs; infra not exposed | Adjacent |

`n/a` 表示本轮子 agent 找到候选名,但主 agent 没有足够官方/源码证据支持深度入库。

### 2026-09-28 verified product addition

| name | canonical_url | category | evidence | decision | why_include | boundary |
|---|---|---|---|---|---|---|
| Alibaba Cloud Tablestore Memory Storage Service | https://www.alibabacloud.com/help/en/tablestore/memory-storage-service-sub-product-test/memory-storage-overview | Tablestore / AgentStorage managed memory | official overview, store/API, file, Dream docs dated 2026-09-24 | Tier A core | message extraction, structured/file memory, scoped retrieval, versioned files, consolidation | distinct from Bailian `memoryId` API, AgentLoop agent-space store, and Agent Run runtime binding; vendor performance claims not independent |

The official pages disagree on whether `tenantId` is required for
`SearchMemories`; this is an API verification gap, not evidence that omitting a
tenant is safe. See [`../products/alibaba-tablestore-memory-storage.md`](../products/alibaba-tablestore-memory-storage.md).

### 2026-09-28 verified existing-entry updates

| entry | primary source | decision | bounded change |
|---|---|---|---|
| Redis Agent Memory | https://redis.github.io/agent-memory-server/ and https://redis.io/docs/latest/develop/ai/context-engine/agent-memory/ | update-existing | Redis Iris/Cloud is now the supported service; original OSS server is an unsupported research reference, not the production product |
| Letta / Letta Code | https://github.com/letta-ai/letta-code/releases/tag/v0.33.0 and https://github.com/letta-ai/letta-code/releases/tag/v0.33.3 | update-existing | background memory upkeep/conflict repair and fresh-agent MemFS, limited to coding-agent release behavior |
| Hindsight | https://github.com/vectorize-io/hindsight/releases/tag/v0.10.1 | update-existing | bank transfer, recall-budget enforcement, tenant file scoping, and coding-agent injection option; release claims only |
| Alibaba Bailian Memory Library | https://help.aliyun.com/zh/model-studio/memory-library and https://help.aliyun.com/zh/model-studio/managed-agents-memory-store | update-existing / watchlist boundary | related Model Studio Managed Agents file-store API recorded separately from Bailian extraction/search; no extra product count pending family review |

### 2026-09-28 discovery-only follow-up

This weekly run did not promote new OSS/MCP memory products into the core
product count. The following sources are recorded as follow-up candidates only;
GitHub activity, MCP catalog placement, and self-reported benchmark tables are
not product-quality or performance evidence.

| name | canonical_url | category | evidence | suggested_tier | why_include | why_not_core | sources_checked |
|---|---|---|---|---|---|---|---|
| xChuCx agent-memory | https://github.com/xChuCx/agent-memory | local/git-native MCP memory | repo + Glama schema signal | Tier B watchlist | MCP read/write/status tools for project memory | early OSS project; no independent quality evidence | GitHub, Glama |
| mcp-memory-service | https://github.com/doobidoo/mcp-memory-service | shared memory backend | repo README | Tier B watchlist | REST + MCP + graph/consolidation surface | README claims are self-reported | GitHub |
| Palinode | https://github.com/phasespace-labs/palinode | git-versioned Markdown memory | repo + MCP registry signal | Tier B watchlist | correction, rollback, and audit-friendly memory surface | release state and maturity need verification | GitHub, MCP registry |
| m3-memory | https://github.com/skynetcmd/m3-memory | local-first multi-agent memory | repo + MCP registry signal | Tier B watchlist | local CLI core with optional MCP; multi-agent memory backend | LongMemEval-style numbers are self-reported | GitHub, MCP registry |
| agent-memory leaderboard Cycle 2 | https://github.com/AML-memory/agent-memory-leaderboard | benchmark program | repo + official docs | benchmark watchlist | Cycle 2 opened 2026-09-20; useful evaluation-contract signal | private data/corpora and leaderboard claims need versioned protocol review | GitHub, official docs |
| bradAGI awesome CLI coding agents | https://github.com/bradAGI/awesome-cli-coding-agents | discovery list | curated list | discovery only | surfaces Mnemoverse / pi-mem / pond / Nex style memory tools | list placement is not evidence | GitHub |

## 6. Reject / boundary decisions

| pattern | decision | reason |
|---|---|---|
| Pure vector DB / pure RAG | reject as core product | 提供存储/检索但不处理记忆生命周期、更新、遗忘、冲突 |
| MCP reference memory server | reject as product | 是协议示例/参考实现,不是面向市场的一等产品 |
| Generic agent frameworks | reject unless memory is first-class | AutoGen/CrewAI/LlamaIndex 等不能因为有 memory feature 就计入核心产品 |
| Ordinary chat history | reject | 缺少 extraction/consolidation/retrieval/governance lifecycle |
| Catalog-only MCP servers | reject or Tier B | 没有 canonical repo/docs 时不写产品笔记 |
| Inaccessible benchmark repos | reject | Search snippets without reachable canonical repository or source page are not enough for catalog rows |

## 7. Reviewer synthesis

| Reviewer focus | Key output | Coordinator decision |
|---|---|---|
| Tier A reviewer | 批准 hyperscaler/platform memory、EverOS、MemOS、Redis AMS、OpenViking、PowerMem、Basic Memory、ByteRover、Honcho 等 | 采纳,但把证据弱的小型 OSS/MCP 候选降到 Tier B |
| Source-quality reviewer | 标记 Cloudflare private beta、Microsoft preview、OpenViking context DB 边界、vendor benchmark 风险 | 采纳并写入产品笔记风险段 |
| Inclusion-boundary reviewer | 防止纯 RAG、纯 vector DB、普通框架误入核心 | 采纳;保留二层结构 |

## 8. Evidence index for Tier A products

| Product | Product note | Archive | Source attributes |
|---|---|---|---|
| EverOS | [`../products/everos.md`](../products/everos.md) | [`../products/archives/everos-overview.md`](../products/archives/everos-overview.md) | official page + GitHub; vendor benchmark claims labeled |
| MemOS | [`../products/memos.md`](../products/memos.md) | [`../products/archives/memos-overview.md`](../products/archives/memos-overview.md) | GitHub/docs; token-saving claims labeled |
| Screenpipe | [`../products/screenpipe.md`](../products/screenpipe.md) | [`../products/archives/screenpipe-overview.md`](../products/archives/screenpipe-overview.md) | pinned source + official data-flow docs; affiliated submission, static review only |
| Cloudflare Agent Memory | [`../products/cloudflare-agent-memory.md`](../products/cloudflare-agent-memory.md) | [`../products/archives/cloudflare-agent-memory-overview.md`](../products/archives/cloudflare-agent-memory-overview.md) | official blog/docs; private beta / experimental label |
| AWS AgentCore Memory | [`../products/aws-agentcore-memory.md`](../products/aws-agentcore-memory.md) | [`../products/archives/aws-agentcore-memory-overview.md`](../products/archives/aws-agentcore-memory-overview.md) | official docs; cloud managed service |
| Google Memory Bank | [`../products/google-memory-bank.md`](../products/google-memory-bank.md) | [`../products/archives/google-memory-bank-overview.md`](../products/archives/google-memory-bank-overview.md) | official docs; endpoint GA update plus Preview / Pre-GA caveat |
| Microsoft Foundry Memory | [`../products/microsoft-foundry-memory.md`](../products/microsoft-foundry-memory.md) | [`../products/archives/microsoft-foundry-memory-overview.md`](../products/archives/microsoft-foundry-memory-overview.md) | official docs; preview label |
| Oracle AI Agent Memory | [`../products/oracle-ai-agent-memory.md`](../products/oracle-ai-agent-memory.md) | [`../products/archives/oracle-ai-agent-memory-overview.md`](../products/archives/oracle-ai-agent-memory-overview.md) | official docs; database substrate |
| Redis Agent Memory | [`../products/redis-agent-memory-server.md`](../products/redis-agent-memory-server.md) | [`../products/archives/redis-agent-memory-server-overview.md`](../products/archives/redis-agent-memory-server-overview.md) | current Redis Iris docs + historical OSS snapshot |
| OpenViking | [`../products/openviking.md`](../products/openviking.md) | [`../products/archives/openviking-overview.md`](../products/archives/openviking-overview.md) | docs + repo; benchmark claims labeled |
| PowerMem | [`../products/powermem.md`](../products/powermem.md) | [`../products/archives/powermem-overview.md`](../products/archives/powermem-overview.md) | repo + site; benchmark claims labeled |
| Alibaba Bailian Memory | [`../products/alibaba-bailian-memory.md`](../products/alibaba-bailian-memory.md) | [`../products/archives/alibaba-bailian-memory-overview.md`](../products/archives/alibaba-bailian-memory-overview.md) | official Aliyun docs |
| Alibaba Tablestore Memory Storage | [`../products/alibaba-tablestore-memory-storage.md`](../products/alibaba-tablestore-memory-storage.md) | [`../products/archives/alibaba-tablestore-memory-storage-overview.md`](../products/archives/alibaba-tablestore-memory-storage-overview.md) | official Tablestore docs; 2026-09-24 update |
| Basic Memory | [`../products/basic-memory.md`](../products/basic-memory.md) | [`../products/archives/basic-memory-overview.md`](../products/archives/basic-memory-overview.md) | docs + repo; AGPL/local-first |
| ByteRover | [`../products/byterover.md`](../products/byterover.md) | [`../products/archives/byterover-overview.md`](../products/archives/byterover-overview.md) | site + repo/docs; alias Cipher |
| Honcho | [`../products/honcho.md`](../products/honcho.md) | [`../products/archives/honcho-overview.md`](../products/archives/honcho-overview.md) | repo + docs; vendor eval claims labeled |
| agentmemory | [`../products/agentmemory.md`](../products/agentmemory.md) | [`../products/archives/agentmemory-overview.md`](../products/archives/agentmemory-overview.md) | GitHub repo/API; benchmark claims not independently verified |
| Memori | [`../products/memori.md`](../products/memori.md) | [`../products/archives/memori-overview.md`](../products/archives/memori-overview.md) | GitHub repo + homepage; license unresolved |
| memU | [`../products/memu.md`](../products/memu.md) | [`../products/archives/memu-overview.md`](../products/archives/memu-overview.md) | GitHub repo + homepage; license unresolved |
| memsearch | [`../products/memsearch.md`](../products/memsearch.md) | [`../products/archives/memsearch-overview.md`](../products/archives/memsearch-overview.md) | GitHub repo + docs; MIT; Zilliz/Milvus substrate |

## 9. Coordinator notes

- EverMind/EverOS/EverMemOS 已深度入库为 Tier A,满足本轮 spot-check 要求。
- Google/Microsoft/Alibaba 在 reviewer 间有分歧,最终以官方 developer docs 为准纳入
  Tier A,但保留 preview/cloud black-box 风险。
- MIRIX、Pieces LTM、MemMachine、mem9、Memstate、ClawMem、SimpleMem、memforks、
  remnic、nram、memanto、LycheeMem、Parcle Memory、Neo4j Agent Memory 等不删除,
  但先作为 Tier B 轻量索引,等待源码/许可/release health 补证。
- 所有 vendor benchmark 或性能 claim 都按 vendor-claimed / 自报处理,不写成独立实证。

## 2026-07-06 weekly refresh delta

| Decision | Item | Source | Action |
|---|---|---|---|
| update-existing | AWS AgentCore Memory | release notes / memory record streaming docs | 更新 `products/aws-agentcore-memory.md`;evented lifecycle 是产品行为证据 |
| update-existing | Google Agent Platform Memory Bank | Gemini Enterprise Agent Platform release notes 2026-06-29 | 更新 `products/google-memory-bank.md`;默认 generation model 变化不等于独立质量证据 |
| update-existing | OpenAI ChatGPT Memory | Business / Enterprise / Edu release notes 2026-06-25 | 更新 `products/openai-memory.md`;组织计划 memory controls 仍为 vendor-managed memory |
| update-existing | Mem0 | changelog highlights 2026-06-27 | 更新 `products/mem0.md`;expiration controls 作为 lifecycle signal |
| update-existing | Redis Agent Memory Server | Redis blog 2026-07-01 | 更新 `products/redis-agent-memory-server.md`;作为产品定位/实现建议,非 benchmark |
| watchlist | Cloudflare Think harness | Cloudflare docs | 暂不拆产品;与 Cloudflare Agent Memory 有重叠,先观察是否形成独立 memory product |

## 2026-09-14 weekly refresh delta

| Decision | Item | Source | Action |
|---|---|---|---|
| update-existing | Graphiti | official GitHub release `v0.30.2` | 更新 `products/graphiti.md` 与 archive;记录 Neo4j database routing、group-ID clear、并发隔离和 FalkorDB full-text 修复 |
| update-existing | memsearch | official GitHub release `v0.4.20` | 更新 `products/memsearch.md` 与 archive;记录 context-budget retention、recall status、summary failure、Milvus Lite 和 Windows 修复 |
| watchlist | MemOS `v2.0.19` | official GitHub release | 只记录为 release-health signal;本轮没有足够 memory-specific behavior 证据升级产品笔记 |
| watchlist | CreaMem / SafeMem / graph-based personalized memory | arXiv discovery | 保留观察;分别存在场景化、embodied 或 survey/overlap 边界,不重复入 core notes |
| adjacent | BIO-MEMART / KVShareArena | arXiv discovery | 保持在 prompt/KV-cache 或 adjacent lane,不计入 durable agent-memory core |

## 2026-09-21 weekly refresh delta

| Decision | Item | Source | Action |
|---|---|---|---|
| update-existing | Hindsight | official GitHub release `v0.10.0` | 更新 `products/hindsight.md` 与 archive;记录 batched embeddings、tokenizer、retention、text-search、transfer 和 coding-agent import behavior |
| update-existing | OpenViking | official releases `v0.4.21` / Python SDK `0.1.12` | 更新 `products/openviking.md` 与 archive;记录 Hermes、MiMo/MiMoCode、WorkBuddy、standalone provider 以及 storage/retrieval/MCP reliability |
| watchlist | Mem0 `v2.1.0` | official GitHub release | 只记录 surface identity / telemetry signal;没有足够新的 memory semantics |
| watchlist | TencentDB `v2.0.2-beta.2` / Cognee `v1.6.0` | official GitHub release metadata | release 可访问,但具体 memory behavior delta 未验证 |
| watchlist | ReMe | official repo/docs and related paper | file-native memory integration relevant, but needs fuller source cross-check before product-note revision |
| reject as source mismatch | Mem0 `v3.2.0` candidate | release listing points to `ts-v3.2.0` | canonical tag mismatch blocks promotion |

## 2026-10-05 weekly refresh delta

| Decision | Item | Source | Action |
|---|---|---|---|
| update-existing | Claude managed-agent memory store | official Anthropic release notes, 2026-09-28 | 更新 `products/claude-dreams.md`;记录 sandbox memory-store mount/sync,不延伸为 Dreams implementation claim |
| update-existing | Letta | official dynamic-workflows post and Letta Code releases `v0.34.0`-`v0.34.4` | 更新 `products/letta.md`;记录 workflow memory pointers and scratchpad fix,不写成 benchmark evidence |
| update-existing | Hindsight | official release `v0.10.2`, 2026-09-29 | 更新 `products/hindsight.md`;记录 scope-aware consolidation and concise extraction changes |
| update-existing | OpenViking | official release `v0.4.23`, 2026-10-02 | 更新 `products/openviking.md`;记录 recall/rerank, BM25, decay, compilation, extraction-rule and ACL surfaces |
| watchlist | Cognee `v1.6.2`, Honcho `v3.2.2`, Oracle memory announcement | official release or announcement pages with limited memory-specific detail | 保留观察,不改产品 note 或 benchmark claims |
| adjacent | generic MCP catalogs and GitHub-only benchmark harnesses | discovery sources | 只用于发现候选,不作为性能、质量或成熟度证据 |

## 2026-10-12 weekly refresh delta

| Decision | Item | Source | Action |
|---|---|---|---|
| update-existing | Zep | official 2026-10-06 / 2026-10-08 changelog | 更新 `products/zep.md`;summary writeback、large-candidate rerank 和 identity-property duplicate fix 都是 product behavior |
| update-existing | Oracle AI Agent Memory | Oracle 2026-10-06 developer blog;OCI Generative AI 2026-09-25 post as adjacent context | 更新 `products/oracle-ai-agent-memory.md`;Deep Data Security / identity-token enforcement 是 enterprise governance signal |
| watchlist | Alibaba ANOLISA v1.0 | Alibaba Cloud Community 2026-10-10 | memory migration / isolation / masking 信号强,但产品边界与 Bailian/AgentLoop 不同,留待后续 note pass |
| adjacent | AWS AgentCore Memory | AgentCore release notes | memory JSON/GovCloud deltas already covered by existing AWS note;current October notes were not new memory behavior |
| watchlist | Redis agent memory workshop | Redis event page | 2026-10-12 时为未来活动；本轮未复核后续 recording 或 docs，仍不据活动推广产品能力 |
| watchlist | MCP reference memory server | modelcontextprotocol/servers PR #5037 | upstream reference server added cross-process file locking for shared `MEMORY_FILE_PATH`;behavior signal only, still not a market product |

## 2026-10-19 weekly refresh delta

| Decision | Item | Source | Action |
|---|---|---|---|
| update-existing | Zep | official 2026-10-12/14 changelog | Update `products/zep.md`: v4 GA, scoped graph/search/MCP navigation, ingestion traces, idempotency, and integrity-preserving identity/entity behavior. |
| update-existing | Graphiti | official GitHub `v0.31.0` release | Update `products/graphiti.md`: MCP SDK 2.x, requested-group routing, LLMRuntime routing, and upstream extraction/dedup/temporal fixes. |
| adjacent | LangGraph checkpoint pruning | official GitHub `v1.2.16` release | Checkpoint persistence is not a documented LangMem durable-memory product delta. |
| reject as core evidence | GitHub topics, catalog/MCP lists, and release-star signals | discovery-only sources | Retain as discovery paths; do not infer product maturity, quality, or benchmark performance. |

## 2026-10-26 weekly refresh delta

| Decision | Item | Source | Action |
|---|---|---|---|
| update-existing | Mem0 | official 2026-10-20 time-management guide | Update `products/mem0.md` with event-time writes, current/historical selection, expiry, time-aware recall, reference time, decay, and history as product-behavior evidence only. |
| update-existing (consolidation follow-up) | Graphiti v0.31.2 | [official release](https://github.com/getzep/graphiti/releases/tag/v0.31.2) | Combined review completed on 2026-10-26: surviving-episode provenance, summary rebuild caveats, Neptune filtering, and reference-server trust boundary added to the existing product note. |
| reject as core evidence | GitHub PRs, topics, and lists | discovery-only sources | No maturity, correctness, or performance conclusion from repository activity. |
| update-existing (consolidation follow-up) | Hindsight v0.10.3 | [official release](https://github.com/vectorize-io/hindsight/releases/tag/v0.10.3) | Separate read/write scopes, current-tag consolidation and document content-hash append conditions; no universal external-store CAS claim. |
| update-existing (consolidation follow-up) | OpenViking v0.5.2 | [official release](https://github.com/volcengine/OpenViking/releases/tag/v0.5.2) | Compilation/history, WM versus LTM behavior, privacy tools and identity/SDK migration; no independent privacy or migration acceptance claim. |

## 2026-10-26 community issue decisions

These are maintainer inclusion decisions after reading the linked public sources.
An affiliated proposal supplies a discovery lead; it is not an independent
product evaluation. No proposed tool or installer was executed, no private
computer history was read, and no benchmark result is added.

| Issue | Decision | Durable record | Boundary |
|---|---|---|---|
| [#29 Screenpipe](https://github.com/Snseam/awesome-agent-memory/issues/29) | Core product, seed note | [Screenpipe](../products/screenpipe.md) and [authored source summary](../products/archives/screenpipe-overview.md) | Captured-history ingestion plus first-class editable memory records; source-available, not an independent retrieval or deletion evaluation |
| [#30 Hyperconsciousness](https://github.com/Snseam/awesome-agent-memory/issues/30) | Tier B discovery lead | Lightweight row above; version correction below | Current central-only developer alpha, not the proposal's former peer-sync design or private Companion |
| [#21 TANCO Skills](https://github.com/Snseam/awesome-agent-memory/issues/21) | Adjacent workflow discovery | Bounded handoff/checkpoint references below | Workflow artifacts are not a general memory service; advertising review and payment integration do not become core memory products |

### Screenpipe: editable memory, beyond the original capture-only proposal

Source-reading risk: the pinned upstream contains an instruction targeting AI
readers outside its repository. See the [intake trust review](#2026-10-26-intake-trust-review)
below; the seed entry is not a safety endorsement or authorization to run it.

The submitter self-identifies as the project's founder/maintainer. At source
revision `334b865ec7b2938eeb44c443e17aebfa3e0a10a3`, the current public surface
includes explicit memory create/update/delete and memory search, alongside
screen/audio history capture. That documented lifecycle supports a **seed**
product note under personal/workflow memory, with captured history as an ingest
source. The decision does not assume automated consolidation, correct recall,
secure erasure, or that local capture keeps all downstream model calls local.

The comparator is the repository's editable-memory boundary used for Basic
Memory and Kinic. The existing MIRIX/Pieces Tier B rows are historical judgments,
not a blanket exclusion of activity-derived memory; this pass does not re-review
or promote those other entries. Transport-specific tool/auth differences and
raw-history versus curated-memory retention are recorded in the canonical note.

### Hyperconsciousness: correct the proposal's versioned boundary

Source-reading risk: the pinned constraints document contains the same external
AI-reader instruction in hidden HTML comments; see the
[intake trust review](#2026-10-26-intake-trust-review).

Reviewed 2026-10-26 at `5748f89138c6817c88af419b0511cff77d0b4ee4`. The proposal
pinned `d2152ce2154affccc47f35a34876b066740d52ad`; the [version comparison](https://github.com/louis030195/hyperconsciousness/compare/d2152ce2154affccc47f35a34876b066740d52ad...5748f89138c6817c88af419b0511cff77d0b4ee4)
and current [mission](https://github.com/louis030195/hyperconsciousness/blob/5748f89138c6817c88af419b0511cff77d0b4ee4/MISSION.md)
now describe one authoritative, self-hostable node with authenticated clients.
The [central-only migration guide](https://github.com/louis030195/hyperconsciousness/blob/5748f89138c6817c88af419b0511cff77d0b4ee4/docs/CENTRAL-ONLY-MIGRATION.md)
removes peer discovery/transport and background replication; legacy data remains
readable for migration. Backup is separate from peer sync or demonstrated recovery.

The [current README](https://github.com/louis030195/hyperconsciousness/blob/5748f89138c6817c88af419b0511cff77d0b4ee4/README.md)
offers alpha binaries as well as source builds; npm is not the alpha distribution
source. Public Rust engine/CLI and MCP/HTTP capture/recall are distinct from the
private Companion and agent orchestration. [Constraints](https://github.com/louis030195/hyperconsciousness/blob/5748f89138c6817c88af419b0511cff77d0b4ee4/docs/CONSTRAINTS.md)
do not establish OS isolation, retrieval quality, secure erasure, or revocation
of exported copies. The [pinned license](https://github.com/louis030195/hyperconsciousness/blob/5748f89138c6817c88af419b0511cff77d0b4ee4/LICENSE)
is MIT; this is a license observation, not a security or maturity judgment.

Keep Tier B under the repository's evidence/maturity rule: this intake is a
limited discovery review of an evolving alpha API/migration contract, not a
complete core product assessment. The submitter's requested tier is not the
decision criterion. A future core-note review should separately examine write/read grants,
retraction and restore semantics, stable interface documentation and workload
limits; evidence for quality or security claims would require additional testing.

### TANCO: retain concrete handoff evidence, correct the proposed scope

Issue #21 was checked against the publisher's [pinned README](https://github.com/tancoai/tangke-skillhub/blob/e469dc63fe7c36a07b2439674c785fcdbb09482e/README.md)
and [SKILLS index](https://github.com/tancoai/tangke-skillhub/blob/e469dc63fe7c36a07b2439674c785fcdbb09482e/SKILLS.md),
plus live SkillHub file previews accessed 2026-10-26. That GitHub revision
contains only the two index files, not the implementation or a license. Its SHA
must not be presented as a pin for the separately distributed SkillHub code.

| Public package preview | Files read | Supported observation | Inclusion boundary |
|---|---|---|---|
| [Chuandeng 1.0.8](https://skillhub.cn/skills/tanco/tanco-chuandeng-handoff-payskill) | `scripts/handoff_snapshot.py` | Structured handoff artifacts, manifest/history, quality checks and snapshot cleanup; the agent maintains `.handoff/state.json` | Adjacent handoff workflow; state contents and checksum do not establish truth or source authenticity |
| [Lianzhu 1.2.10](https://skillhub.cn/skills/tanco/tanco-lianzhu-devchain-payskill) | `scripts/lianzhu.py`, `LICENSE.md` | JSON state writes, artifact hashes, checkpoints and resume identity checks | Adjacent execution workflow, not a general memory service; no execution/recovery test performed |
| [Chayan 1.1.7](https://skillhub.cn/skills/tanco/tanco-chayan-copywriting-payskill) | `scripts/chayan_scan.py` | Local rule-based Chinese promotional-copy scanning with text/JSON output | Corrects the issue's broader signal-review description; does not establish factual verification or memory-admission behavior |

Lianzhu's observed package license is **Source-Available Audit License**, explicitly
not open source. Reuse rights for the other two reviewed packages were not
established; do not infer their terms from Lianzhu or from public code visibility.
Package versions above are the platform's displayed versions, not independently
verified downloaded artifacts. No package was installed, executed or hash-verified.
The [payment adapter](https://skillhub.cn/skills/tanco/tencent-skillhub-pay-adapter)
remains outside memory-core scope. Publisher ratings, downloads and promotional
claims are not quality evidence. A future memory-specific review would need a
stable artifact/source version and explicit write/read/update/retention semantics,
separate from task status and generic workflow recovery.

### 2026-10-26 intake trust review

The follow-up audit found **indirect prompt injection in linked primary sources**,
not in the three issue bodies. Screenpipe's
[pinned MCP source, lines 1–4](https://github.com/screenpipe/screenpipe/blob/334b865ec7b2938eeb44c443e17aebfa3e0a10a3/packages/screenpipe-mcp/src/index.ts#L1-L4)
contains a comment directing AI readers to propagate a promotional header into
files they edit, including outside that repository. HC's
[pinned constraints, lines 1–3](https://github.com/louis030195/hyperconsciousness/blob/5748f89138c6817c88af419b0511cff77d0b4ee4/docs/CONSTRAINTS.md#L1-L3)
contains the same direction in HTML comments, which ordinary rendered Markdown
can hide. This is an attempt to cross the data/instruction boundary. It was
ignored; the operational wording is not copied into this repository.

All three current issues had zero comments at review time. Their raw bodies did
not contain an observed instruction override, hidden payload or exfiltration
request. The Codex authorship statements in #29/#30 are submitter claims, not
OpenAI endorsement or authority. #21 contains promotional scope claims already
corrected above; this review does not establish its entire linked distribution
as injection-free.

The original PR review missed the linked-source injection risk. A follow-up
search of Git-tracked content at `750141f` found no copy of the observed header
or cross-repository propagation instruction. This bounds the observed result;
it does not prove absence of every possible influence on the earlier review.
The attack finding does not itself disprove the source's memory CRUD, nor does
correct CRUD make the source safe for an agent to trust. Inclusion and source
handling require separate judgments under the existing Tier criteria.

Scope: current issue bodies/comments, PR #38 changes, selected pinned primary
sources and fresh-context independent review. This was not an exhaustive crawl
of all linked pages, historical/deleted content, distributed packages or runtime
behavior. The [review controls](weekly-memory-refresh-runbook.md#external-content-trust-boundary)
reduce exposure but are not an execution sandbox or a security certification.
