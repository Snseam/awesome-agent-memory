---
title: Product discovery log — agent memory products
date: 2026-06-24
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

## 6. Reject / boundary decisions

| pattern | decision | reason |
|---|---|---|
| Pure vector DB / pure RAG | reject as core product | 提供存储/检索但不处理记忆生命周期、更新、遗忘、冲突 |
| MCP reference memory server | reject as product | 是协议示例/参考实现,不是面向市场的一等产品 |
| Generic agent frameworks | reject unless memory is first-class | AutoGen/CrewAI/LlamaIndex 等不能因为有 memory feature 就计入核心产品 |
| Ordinary chat history | reject | 缺少 extraction/consolidation/retrieval/governance lifecycle |
| Catalog-only MCP servers | reject or Tier B | 没有 canonical repo/docs 时不写产品笔记 |

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
| Cloudflare Agent Memory | [`../products/cloudflare-agent-memory.md`](../products/cloudflare-agent-memory.md) | [`../products/archives/cloudflare-agent-memory-overview.md`](../products/archives/cloudflare-agent-memory-overview.md) | official blog/docs; private beta / experimental label |
| AWS AgentCore Memory | [`../products/aws-agentcore-memory.md`](../products/aws-agentcore-memory.md) | [`../products/archives/aws-agentcore-memory-overview.md`](../products/archives/aws-agentcore-memory-overview.md) | official docs; cloud managed service |
| Google Memory Bank | [`../products/google-memory-bank.md`](../products/google-memory-bank.md) | [`../products/archives/google-memory-bank-overview.md`](../products/archives/google-memory-bank-overview.md) | official docs; endpoint GA update plus Preview / Pre-GA caveat |
| Microsoft Foundry Memory | [`../products/microsoft-foundry-memory.md`](../products/microsoft-foundry-memory.md) | [`../products/archives/microsoft-foundry-memory-overview.md`](../products/archives/microsoft-foundry-memory-overview.md) | official docs; preview label |
| Oracle AI Agent Memory | [`../products/oracle-ai-agent-memory.md`](../products/oracle-ai-agent-memory.md) | [`../products/archives/oracle-ai-agent-memory-overview.md`](../products/archives/oracle-ai-agent-memory-overview.md) | official docs; database substrate |
| Redis AMS | [`../products/redis-agent-memory-server.md`](../products/redis-agent-memory-server.md) | [`../products/archives/redis-agent-memory-server-overview.md`](../products/archives/redis-agent-memory-server-overview.md) | official docs + repo |
| OpenViking | [`../products/openviking.md`](../products/openviking.md) | [`../products/archives/openviking-overview.md`](../products/archives/openviking-overview.md) | docs + repo; benchmark claims labeled |
| PowerMem | [`../products/powermem.md`](../products/powermem.md) | [`../products/archives/powermem-overview.md`](../products/archives/powermem-overview.md) | repo + site; benchmark claims labeled |
| Alibaba Bailian Memory | [`../products/alibaba-bailian-memory.md`](../products/alibaba-bailian-memory.md) | [`../products/archives/alibaba-bailian-memory-overview.md`](../products/archives/alibaba-bailian-memory-overview.md) | official Aliyun docs |
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

## 10. 2026-07-06 weekly refresh delta

| Decision | Item | Source | Action |
|---|---|---|---|
| update-existing | AWS AgentCore Memory | release notes / memory record streaming docs | 更新 `products/aws-agentcore-memory.md`;evented lifecycle 是产品行为证据 |
| update-existing | Google Agent Platform Memory Bank | Gemini Enterprise Agent Platform release notes 2026-06-29 | 更新 `products/google-memory-bank.md`;默认 generation model 变化不等于独立质量证据 |
| update-existing | OpenAI ChatGPT Memory | Business / Enterprise / Edu release notes 2026-06-25 | 更新 `products/openai-memory.md`;组织计划 memory controls 仍为 vendor-managed memory |
| update-existing | Mem0 | changelog highlights 2026-06-27 | 更新 `products/mem0.md`;expiration controls 作为 lifecycle signal |
| update-existing | Redis Agent Memory Server | Redis blog 2026-07-01 | 更新 `products/redis-agent-memory-server.md`;作为产品定位/实现建议,非 benchmark |
| watchlist | Cloudflare Think harness | Cloudflare docs | 暂不拆产品;与 Cloudflare Agent Memory 有重叠,先观察是否形成独立 memory product |

## 11. 2026-08-10 weekly refresh delta

| Decision | Item | Source | Action |
|---|---|---|---|
| update-existing | Microsoft Foundry Agent Service Memory | Learn memory usage guide, last updated 2026-08-05 | 更新 `products/microsoft-foundry-memory.md`;CRUD / TTL / scope / remember-forget 是 preview 产品行为证据,不是 independent benchmark |
| update-existing | AWS AgentCore Memory | release notes, August 2026 GovCloud availability | 更新 `products/aws-agentcore-memory.md`;区域 / 合规可用性是产品行为证据,不是 benchmark 或性能证据 |
| watchlist | Anthropic Claude Managed Agents | release notes 2026-08-07 | managed-agent platform 能力增强,但本周没有新的 memory-store-specific 更新;暂不升级 `products/claude-dreams.md` |
| watchlist | Cloudflare Think / Redis Iris / Alibaba billing / Oracle Select AI memory depth | official docs / marketplace / release notes | 相邻产品行为或未来计费信号;不进入本轮核心 product count |
| watchlist | Google Memory Bank release notes | July 2026 GA profiles / IngestEvents / embedding updates | 上周 open PR 已覆盖 Google Memory Bank 更新风险;本轮不重复推广到主线差异 |
| watchlist | Mem0 / Zep / Letta / LangMem / Graphiti changelogs | official docs / changelogs spot-check | 本轮未发现足够强且未被 open PR 覆盖的新增 product behavior |
