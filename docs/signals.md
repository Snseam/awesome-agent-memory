---
title: Signals — agent memory news, releases, comparisons (reverse chrono)
date: 2026-10-26
status: living-log
language: zh-CN
---

# Signals

行业信号反时序日志。比"survey"更轻、比"twitter feed"更结构化。
每条:**日期 / 来源 URL / 类型 / 一句话摘要 / Radar 动作**。

类型 enum:`release` `comparison` `blog` `paper` `talk` `incident` `funding` `product`

Radar 动作 enum:`stub` `seed-note` `deep-note` `impact-report` `archive-only`
(`deep-note` 表示已落地产品/聚合笔记,不等同于 frontmatter `status: full`;
`archive-only` 表示有趣但不进入 ResearchItem 流程)

## 2026 Q4

| 日期 | 来源 | 类型 | 一句话 | Radar 动作 |
|---|---|---|---|---|
| 2026-10-26 | [Screenpipe source](https://github.com/screenpipe/screenpipe/tree/334b865ec7b2938eeb44c443e17aebfa3e0a10a3) / [community intake decisions](product-discovery-log.md#2026-10-26-community-issue-decisions) | product | 核查社区投稿：Screenpipe以可编辑memory API进入seed产品；HC按central-only新边界留Tier B；TANCO交接/检查点作为相邻工作流，修正察言的泛化描述 | `seed-note` ✅(Screenpipe；其余仅discovery) |
| 2026-10-26 | [WorldMemArena v2](https://arxiv.org/pdf/2605.29341v2) / [UMA / Ledger-QA](https://aclanthology.org/2026.emnlp-main.1299/) / [FrontierMemory rules](https://github.com/letta-ai/frontiermemory/blob/49bea0f33a72da9771f8ef853ed7e48b69bf53df/docs/rules.md) | paper | 本次复核新增两个 seed 协议，区分摘要/PDF计数、训练/测试资产、生成次数/任务尝试；无独立复现 | `seed-note` ✅(见 `benchmarks/`) |
| 2026-10-26 | [Graphiti v0.31.2](https://github.com/getzep/graphiti/releases/tag/v0.31.2) / [Hindsight v0.10.3](https://github.com/vectorize-io/hindsight/releases/tag/v0.10.3) / [OpenViking v0.5.2](https://github.com/volcengine/OpenViking/releases/tag/v0.5.2) | release | 本次复核补删除传播与reference-server信任边界、读写scope和并发标签、WM/LTM分离与迁移；日期为复核日期，各版本发布日期见产品笔记 | `deep-note` ✅(更新 `products/`) |
| 2026-10-26 | [MCCL](https://arxiv.org/abs/2610.29357) / [FrontierMemory](https://www.frontiermemory.com/blog/v1/) | paper / benchmark | MCCL frames memory as continual behavioral improvement; FrontierMemory supplies an affiliated, no-memory-control protocol for trajectory-derived memory | `seed-note` ✅(见 `papers/` / `benchmarks/`) |
| 2026-10-20 | [Mem0 temporal controls](https://mem0.ai/blog/managing-time-in-ai-memory) | product | official guide documents event time, state selection, expiry, time-aware retrieval, replay reference time, decay, and history; product behavior only | `deep-note` ✅(更新 `products/mem0.md`) |
| 2026-10-19 | [MemCode](https://arxiv.org/abs/2610.19472) / [MemComposer](https://arxiv.org/abs/2610.21091) / [MemCut](https://arxiv.org/abs/2610.21405) | paper | 原子写入与离散关联检索、任务反馈驱动的记忆组装、以及删后残余秘密恢复构成本周三个直接 memory seed | `seed-note` ✅(见 `papers/`) |
| 2026-10-19 | [Bemula](https://arxiv.org/abs/2610.18052) / [MemCut](https://arxiv.org/abs/2610.21405) | paper | 两个 origin benchmark 分别覆盖显式忘却请求和证据链残余恢复；结果仍是作者原始评测 | `seed-note` ✅(见 `benchmarks/`) |
| 2026-10-14 | [Zep v4](https://help.getzep.com/changelog/2026/10/14) / [Graphiti v0.31.0](https://github.com/getzep/graphiti/releases/tag/v0.31.0) | release | 现有 temporal-graph memory 产品新增 v4 API/MCP/ingestion tracing 和 group-scoped routing、dedupe/temporal fixes | `deep-note` ✅(更新 `products/`) |
| 2026-10-12 | [Test-Time Memory Construction](https://arxiv.org/abs/2610.13348) / [Capability-Driven Self-Evolution](https://arxiv.org/abs/2610.06361) / [DAEDALUS](https://arxiv.org/abs/2610.08048) | paper | 10 月新论文把 query-time construction、capability-specific self-evolution、self-generated task traces 都推进为 memory policy surface | `seed-note` ✅(见 `papers/`) |
| 2026-10-12 | [From Retrieval to Reconstruction](https://arxiv.org/abs/2610.11314) / [Event-Centric Memory](https://arxiv.org/abs/2610.11920) / [MINDSET](https://arxiv.org/abs/2610.08586) | paper | graph / event / schema 路线继续把 memory 从 top-k recall 推向 versioned state reconstruction | `seed-note` ✅(见 `papers/`) |
| 2026-10-12 | [Relevance Is Not Sufficiency](https://arxiv.org/abs/2610.09348) / [Right Memory Wrong Context](https://arxiv.org/abs/2610.07309) / [Persistent Memory in Multi-Agent Inference](https://arxiv.org/abs/2610.07782) | paper | 新评测压力分别强调 evidence sufficiency、retrieval admissibility 和 persistent-memory ablation 可检出性 | `seed-note` ✅(见 `papers/`) |
| 2026-10-12 | [Zep changelog](https://help.getzep.com/changelog/2026/10/6) / [Oracle enterprise memory blog](https://blogs.oracle.com/developers/building-the-enterprise-brain-what-changes-when-agent-memory-belongs-to-a-company) | product | Zep 强化 graph-memory summary/rerank/entity matching;Oracle 把 enterprise memory 的 identity、read/write policy 和 audit 问题推到 database governance 层 | `deep-note` ✅(更新 `products/`) |
| 2026-10-02 | [OpenViking v0.4.23](https://github.com/volcengine/OpenViking/releases/tag/v0.4.23) | release | 官方 release 增加 global vector recall/unified reranking、BM25、event-time decay、memory compilation、extraction rules、ACL tools 和 session auto-commit compatibility | `deep-note` ✅(更新 `products/openviking.md`) |
| 2026-10-02 / 2026-10-01 / 2026-09-30 / 2026-09-29 / 2026-09-28 | [DyadMem](https://arxiv.org/abs/2610.03020) / [MemFit](https://arxiv.org/abs/2610.00872) / [APDMem](https://arxiv.org/abs/2610.02472) / [Mem++](https://arxiv.org/abs/2610.02002) / [Interpreting at Write Time](https://arxiv.org/abs/2610.02897) / [MemCodex](https://arxiv.org/abs/2609.39765) / [Audience-Bound Persistent Memory](https://arxiv.org/abs/2609.36373) / [TAGGRAPH](https://arxiv.org/abs/2609.38353) / [U-Fuzz](https://arxiv.org/abs/2609.38275) | paper | 新一轮 primary sources 把 relationship memory、progressive disclosure、non-destructive storage、goal-conditioned writing、自编程层级记忆、audience authorization、graph retrieval 和 memory-use fuzzing 推进到可记录协议 | `seed-note` ✅(见 `papers/` / `benchmarks/`) |
| 2026-10-02 to 2026-10-04 | [agent-memory-benchmarks](https://github.com/RonsenbergVI/agent-memory-benchmarks) / DriftTrap-Bench / Flux memory benchmark / MemArena-Bench | discovery | 新 harness、drift、preregistered comparison 和 vendor-affiliated benchmark 项目值得跟踪,但没有足够独立 protocol/result evidence | `archive-only`(watchlist, discovery-only) |

## 2026 Q3

| 日期 | 来源 | 类型 | 一句话 | Radar 动作 |
|---|---|---|---|---|
| 2026-09-29 | [Hindsight v0.10.2](https://github.com/vectorize-io/hindsight/releases/tag/v0.10.2) | release | scope-aware consolidation、coding-agent concise extraction 和 consolidation API typing 进入 release surface | `deep-note` ✅(更新 `products/hindsight.md`) |
| 2026-09-28 | [Tablestore Memory Storage Service](https://www.alibabacloud.com/help/en/tablestore/memory-storage-service-sub-product-test/memory-storage-overview) / [Memory Dream](https://www.alibabacloud.com/help/en/tablestore/memory-storage-service-sub-product-test/memory-consolidation-dream) | product | 阿里云 2026-09-24 官方文档确认 AgentStorage 独立的结构化/文件记忆与整合任务产品面;性能数字仍为厂商宣称 | `deep-note` ✅([`../products/alibaba-tablestore-memory-storage.md`](../products/alibaba-tablestore-memory-storage.md)) |
| 2026-09-28 | [Redis Agent Memory docs](https://redis.io/docs/latest/develop/ai/context-engine/agent-memory/) / [OSS boundary](https://redis.github.io/agent-memory-server/) / [Letta Code releases](https://github.com/letta-ai/letta-code/releases/tag/v0.33.0) / [Hindsight v0.10.1](https://github.com/vectorize-io/hindsight/releases/tag/v0.10.1) | product | 官方来源修正 Redis 托管服务与 OSS 参考实现边界,并补 Letta Code 后台记忆维护和 Hindsight bank/retrieval 治理更新 | `deep-note` ✅(更新 `products/`) |
| 2026-09-28 | [SAMem](https://aclanthology.org/2026.findings-acl.722/) / [GAM](https://aclanthology.org/2026.acl-long.1600/) / [Memory-R2](https://arxiv.org/abs/2605.21768) / [PersonaAgent](https://aclanthology.org/2026.findings-acl.1315/) | paper | ACL/旧 arXiv 补录 state-aware retrieval、graph consolidation、memory-action credit assignment,并修正 PersonaAgent 旧标题 | `seed-note` ✅(三篇 seed + 一条 stub 元数据修正) |
| 2026-09-28 | [DolphinBench](https://arxiv.org/abs/2609.24971) / [MemCalib](https://arxiv.org/abs/2609.24259) / [CPB](https://arxiv.org/abs/2609.30813) / [MemProbe Stability-Plasticity](https://arxiv.org/abs/2609.30558) / [TWIST](https://arxiv.org/abs/2609.28575) | paper | 新 benchmark 把 agent-memory 评测推进到成本/延迟 Pareto、memory-use calibration、shared-memory admission、稳定性/可塑性和 intervention quality | `seed-note` ✅(见 `benchmarks/`) |
| 2026-09-28 | [Scope Before You Persist](https://arxiv.org/abs/2609.29144) / [JitMem](https://arxiv.org/abs/2609.27334) / [EnSIMem](https://arxiv.org/abs/2609.27279) / [AkasicMEM](https://arxiv.org/abs/2609.25563) | paper | 新论文分别补 retrieval scope authorization、read-time curation、entity-structured indexing 和 enterprise governed memory | `seed-note` ✅(见 `papers/`) |
| 2026-09-28 | [Databricks Managed Agent Memory](https://docs.databricks.com/aws/en/agents/agent-memory/managed-memory) / [Zep v3 changelog](https://help.getzep.com/v3/changelog) / [Microsoft Agent Framework memory](https://devblogs.microsoft.com/agent-framework/interactive-experiences-memory-and-resilient-execution/) | product | 官方产品源补充 Lakebase-backed managed memory、Zep source traceability / Agent Skills gating 和 FoundryMemoryProvider 集成 | `deep-note` ✅(更新 `products/`) |
| 2026-09-28 | [Anthropic Managed Agents release notes](https://platform.claude.com/docs/en/release-notes/overview?entry=september-28-2026) / [Letta dynamic workflows](https://www.letta.com/blog/dynamic-workflows/) | product / blog | managed sandbox memory-store sync 与 stateless subagent 的 memory pointer 传递成为可观察产品行为 | `deep-note` ✅(更新产品笔记) |
| 2026-09-21 | [MACE](https://arxiv.org/abs/2609.21533) / [Disentangling Long-Term Memory](https://arxiv.org/abs/2609.18461) / [Interactive Memory Learning](https://arxiv.org/abs/2609.17088) / [ThinkFlow](https://arxiv.org/abs/2609.17010) / [EchoPath](https://arxiv.org/abs/2609.16635) / [Semantic-TVM](https://arxiv.org/abs/2609.15011) | paper | 本周新 primary sources 把 adaptive memory policy、latent personalization、可执行 procedural memory 和 privacy-shaped memory view 推进到 memory core | `seed-note` ✅(见 `papers/`) |
| 2026-09-21 | [Hindsight v0.10.0](https://github.com/vectorize-io/hindsight/releases/tag/v0.10.0) / [OpenViking v0.4.21](https://github.com/volcengine/OpenViking/releases/tag/v0.4.21) | release | 官方 release 强化 ingestion/retention、transfer、coding-agent import、Hermes/WorkBuddy/MiMo integrations 以及 storage/retrieval/MCP 可靠性 | `deep-note` ✅(更新 `products/`) |
| 2026-09-21 | [LTM100](https://github.com/skhynix/LTM100) / [REVOKE](https://github.com/Dextergao14/REVOKE) / [recalld-benchmarks](https://github.com/bit-robotics/recalld-benchmarks) | release | GitHub discovery 暴露 memory load、procedural invalidation 和 affiliated reproducibility 三条 benchmark 线,但尚未升级为 catalog evidence | `archive-only`(watchlist) |
| 2026-09-14 | [LifeFuse-Mem](https://arxiv.org/abs/2609.12436) / [ROAM](https://arxiv.org/abs/2609.09778) / [MemSentry](https://arxiv.org/abs/2609.08747) / [MemForest](https://arxiv.org/abs/2609.08273) / [AIM](https://arxiv.org/abs/2609.12320) | paper | 9 月新论文把 durable-versus-temporary fusion、atomic relation organization、persistent-memory poisoning、EventTree compression 和 multi-user visibility/CRUD 推到 memory core | `seed-note` ✅(见 `papers/`) |
| 2026-09-14 | [MUMBench](https://arxiv.org/abs/2609.12320) / [MERIT](https://arxiv.org/abs/2609.05441) | paper | 新 benchmark 分别补 multi-user private/shared memory operations 与 tool-use memory utility/cost/leakage instrumentation | `seed-note` ✅(见 `benchmarks/`) |
| 2026-09-14 | [Graphiti v0.30.2](https://github.com/getzep/graphiti/releases/tag/v0.30.2) / [memsearch v0.4.20](https://github.com/zilliztech/memsearch/releases/tag/v0.4.20) | release | 官方 release 继续强化 Graphiti 的 backend isolation/routing 与 memsearch 的 context-budget retention、recall status 和 local runtime behavior | `deep-note` ✅(更新 `products/`) |
| 2026-07-06 | [A-TMA](https://arxiv.org/abs/2607.01935) / [Mandol](https://arxiv.org/abs/2606.29778) / [Forensic Trajectory Signatures](https://arxiv.org/abs/2606.30566) | paper | 周更 radar 追加 state-aware ghost memory、agglomerative memory-native storage、memory-poisoning trajectory forensics 三条 seed note | `seed-note` ✅(见 `papers/`) |
| 2026-07-06 | [MemSyco-Bench](https://arxiv.org/abs/2607.01071) / [MemLeak](https://arxiv.org/abs/2606.29788) / [MemDelta](https://arxiv.org/abs/2606.29914) | paper | benchmark catalog 新增 memory-induced sycophancy、多模态删除泄漏、controlled baseline methodology | `seed-note` ✅(见 `benchmarks/`) |
| 2026-07-06 | [AWS AgentCore release notes](https://docs.aws.amazon.com/bedrock-agentcore/latest/devguide/release-notes.html) / [Google release notes](https://docs.cloud.google.com/gemini-enterprise-agent-platform/release-notes) / [OpenAI Business release notes](https://help.openai.com/en/articles/11391654-chatgpt-business-release-notes) / [Mem0 changelog](https://docs.mem0.ai/changelog/highlights) / [Redis guide](https://redis.io/blog/build-smarter-ai-agents-manage-short-term-and-long-term-memory-with-redis/) | product | 官方产品源补充 AgentCore streaming、Memory Bank model default、ChatGPT org memory controls、Mem0 expiration 和 Redis two-tier guidance | `deep-note` ✅(更新 `products/`) |

## 2026 Q2

| 日期 | 来源 | 类型 | 一句话 | Radar 动作 |
|---|---|---|---|---|
| 2026-06-29 | [DynamicMem](https://arxiv.org/abs/2606.22877) / [MEMPROBE](https://arxiv.org/abs/2606.24595) / [TrustMem](https://arxiv.org/abs/2606.25161) / [memory poisoning](https://arxiv.org/abs/2606.24322) / [Infini Memory](https://arxiv.org/abs/2606.10677) / [What Deserves Memory](https://aclanthology.org/2026.acl-long.1607/) | paper | 周更 radar 追加 primary-source seed:profile dynamics、memory-artifact audit、transition verification、origin-bound authority、topic-document memory 和 adaptive distillation | `seed-note` ✅(见 `papers/` / `benchmarks/`) |
| 2026-06-29 | [AWS Harness GA](https://aws.amazon.com/blogs/machine-learning/amazon-bedrock-agentcore-harness-is-now-generally-available-go-from-idea-to-production-grade-agent-in-minutes/) / [Google release notes](https://docs.cloud.google.com/gemini-enterprise-agent-platform/release-notes) / [Microsoft Build 2026 recap](https://devblogs.microsoft.com/foundry/whats-new-in-microsoft-foundry-build-2026/) / [Alibaba AgentLoop](https://help.aliyun.com/en/document_detail/3033860.html) / [Redis memory blog](https://redis.io/blog/why-bigger-context-window-wont-fix-agent-memory/) | product | 官方产品源补充 managed/BYO memory、Memory Bank endpoint GA、procedural/user/session memory、AgentLoop memory policies 和 Redis two-tier positioning | `deep-note` ✅(更新 `products/`) |
| 2026-06-24 | [2026-06 Memory Radar refresh](memory-radar-2026-06.md) | paper/product | 本轮用并行子 agent 搜索 + source/relevance review,把论文、官方产品和 GitHub 项目分成 must-add / update-existing / watchlist / reject | `deep-note` ✅([`memory-radar-2026-06.md`](memory-radar-2026-06.md)) |
| 2026-06-24 | [Agent Memory](https://arxiv.org/abs/2606.06448) / [RaMem](https://arxiv.org/abs/2606.22844) / [AdaMem](https://arxiv.org/abs/2606.21144) / [LightMem](https://aclanthology.org/2026.acl-long.588/) | paper | 6 月论文把 memory 生命周期推进到 systems profiling、context-valid retrieval、personalized write policy 和 bounded-cost SLM memory | `seed-note` ✅(见 `papers/`) |
| 2026-06-24 | [GateMem](https://arxiv.org/abs/2606.18829) | paper | shared-memory agent benchmark 开始把 utility、access control、active forgetting 联合评估 | `stub` ✅([`../benchmarks/gatemem.md`](../benchmarks/gatemem.md)) |
| 2026-06-24 | [`rohitg00/agentmemory`](https://github.com/rohitg00/agentmemory) / [`MemoriLabs/Memori`](https://github.com/MemoriLabs/Memori) / [`NevaMind-AI/memU`](https://github.com/NevaMind-AI/memU) / [`zilliztech/memsearch`](https://github.com/zilliztech/memsearch) | release | coding-agent / workspace-agent memory 继续产品化,但 GitHub stars 只作为 discovery signal | `deep-note` ✅(见 `products/`) |
| 2026-06-24 | [AWS AgentCore Memory streaming](https://aws.amazon.com/about-aws/whats-new/2026/03/agentcore-memory-streaming-ltm/) / [AWS LTM metadata](https://aws.amazon.com/about-aws/whats-new/2026/05/agentcore-longterm-memory-metadata/) / [Google Memory Bank](https://docs.cloud.google.com/gemini-enterprise-agent-platform/scale/memory-bank) / [Microsoft Foundry Memory](https://learn.microsoft.com/en-us/azure/foundry/agents/concepts/what-is-memory) / [Cloudflare Agent Memory](https://developers.cloudflare.com/agent-memory/) | product | managed memory 平台从"有 LTM"推进到 record streaming、metadata filtering、scope/TTL/revisions、CRUD/search 和 beta/private-beta 治理面 | `deep-note` ✅(更新 `products/`) |
| 2026-06-11 | [EverOS](https://evermind.ai/everos) / [`EverMind-AI/EverOS`](https://github.com/EverMind-AI/EverOS) | product | EverMind/EverOS/EverMemOS 明确以 Profile/Episodic/Skill、self-evolving skills 和 Markdown export 切入 memory OS | `deep-note` ✅([`../products/everos.md`](../products/everos.md)) |
| 2026-06-11 | [`MemTensor/MemOS`](https://github.com/MemTensor/MemOS) | release | MemOS 作为独立 self-evolving memory OS 出现,需与已有 MemoryOS/EverMemOS 区分 | `deep-note` ✅([`../products/memos.md`](../products/memos.md)) |
| 2026-06-11 | [AWS AgentCore Memory](https://docs.aws.amazon.com/bedrock-agentcore/latest/devguide/memory.html) / [Google Memory Bank](https://docs.cloud.google.com/gemini-enterprise-agent-platform/scale/memory-bank) / [Microsoft Foundry Memory](https://learn.microsoft.com/en-us/azure/foundry/agents/concepts/what-is-memory) | product | hyperscaler agent platforms 同时把 managed long-term memory 做成 scope/TTL/strategy/CRUD 能力 | `deep-note` ✅(见 `products/`) |
| 2026-06-11 | [Cloudflare Agent Memory](https://blog.cloudflare.com/introducing-agent-memory/) / [Oracle AI Agent Memory](https://docs.oracle.com/en/database/oracle/agent-memory/26.4/agmea/about.html) / [Alibaba Bailian Memory](https://help.aliyun.com/zh/model-studio/memory-library) | product | platform-managed memory 从 edge runtime、enterprise DB 到中文云平台三路扩散 | `deep-note` ✅(见 `products/`) |
| 2026-06-11 | [Redis Agent Memory Server](https://redis.github.io/agent-memory-server/) / [OpenViking](https://volcengine-openviking.mintlify.app/) / [PowerMem](https://github.com/oceanbase/powermem) | release | OSS/DB 厂商路线开始提供 memory API server、context DB 和 Experience+Skill distillation | `deep-note` ✅(见 `products/`) |
| 2026-06-11 | [Basic Memory](https://docs.basicmemory.com/) / [ByteRover](https://www.byterover.dev/) / [Honcho](https://github.com/plastic-labs/honcho) | product | coding-agent memory 形成 local-first Markdown、portable context tree、peer-centric memory 三条路线 | `deep-note` ✅(见 `products/`) |
| 2026-06-11 | 多子 agent discovery log | product | 本轮把核心 memory 产品深度入库、相邻产品轻量索引,并新增整体产品架构文档 | `deep-note` ✅([`product-discovery-log.md`](product-discovery-log.md), [`product-memory-architectures.md`](product-memory-architectures.md)) |
| 2026-05-31 | [`supermemory.ai`](https://supermemory.ai/) / [`supermemoryai/supermemory`](https://github.com/supermemoryai/supermemory) | release | Supermemory 把 memory、RAG、profiles、connectors 和 MCP/插件整合成 context cloud | `deep-note` ✅([`../products/supermemory.md`](../products/supermemory.md)) |
| 2026-05-31 | [`TencentCloud/TencentDB-Agent-Memory`](https://github.com/TencentCloud/TencentDB-Agent-Memory) | release | TencentDB Agent Memory 开源 L0-L3 分层记忆与 Mermaid context offloading;2026-06-29 复核 canonical repo 为 TencentCloud org | `deep-note` ✅([`../products/tencentdb-agent-memory.md`](../products/tencentdb-agent-memory.md)) |
| 2026-05-31 | [`hy-memory.com`](https://hy-memory.com/) | release | 腾讯混元 Hy-Memory 作为 OpenClaw shared memory plugin 出现,主打 6-layer cognitive memory | `deep-note` ✅([`../products/hy-memory.md`](../products/hy-memory.md)) |
| 2026-05-31 | [`vectorize-io/hindsight`](https://github.com/vectorize-io/hindsight) | release | Hindsight 以 "Agent Memory That Learns" 切入,提供 retain / recall / reflect 与 LLM wrapper | `deep-note` ✅([`../products/hindsight.md`](../products/hindsight.md)) |
| 2026-05-31 | [Anuma](https://www.anuma.ai/ai-memory) / [Personal AI](https://www.personal.ai/products) / [Kinic](https://www.kinic.io/) | product | C 端 memory ownership 路线升温:跨模型、可编辑、可携带或可验证的个人 memory | `deep-note` ✅(见 `products/`) |
| 2026-05-31 | [MemoryOS](https://github.com/BAI-LAB/MemoryOS) / [A-MEM](https://github.com/agiresearch/A-mem) / [MemX](https://memx.me/) | release | 开源框架侧出现 OS-style、agentic organization、local-first single-file 三条不同 memory 路线 | `deep-note` ✅(见 `products/`) |
| 2026-05 | mem0.ai/blog "State of AI Agent Memory 2026" | comparison | 6 大主流 memory layer 横评,Mem0 自家算法在 LoCoMo / LongMemEval 都报 SOTA | `archive-only`(自评,需交叉验证) |
| 2026-05 | arXiv 2605.06716 "From Storage to Experience" | paper | Storage → Reflection → Experience 三阶段记忆演进框架 | `deep-note` ✅ |
| 2026-04 | mem0.ai blog | release | Mem0 算法 v2:single-pass hierarchical extraction + multi-signal retrieval,声称 temporal +29.6 / multi-hop +23.1 | `deep-note` ✅(更新 [`../products/mem0.md`](../products/mem0.md))|
| 2026-04 | arXiv 2604.16548 "Toward Mnemonic Sovereignty" | paper | cross-session poisoning / 越权访问 / 状态污染的威胁模型 | `deep-note` ✅(驱动 `security-privacy` 模块设计)|
| 2026-04 | atlan.com / blog.devgenius.io / explore.n1n.ai 多篇 | comparison | 同一周内多个产品横评,把 Letta / Mem0 / Zep / Cognee 摆在一起评 | `archive-only` |
| 2026-04 | fountaincity.tech blog | comparison | "agent memory in 2026":偏 PKM 视角的横评,讨论隐私与本地化 | `archive-only` |
| 2026-04 | evermind.ai blog | blog | personal-AI 视角的"为什么记忆比模型重要"长文 | `archive-only` |

## 2026 Q1

| 日期 | 来源 | 类型 | 一句话 | Radar 动作 |
|---|---|---|---|---|
| 2026-03 | arXiv 2603.07670 "Memory for Autonomous LLM Agents" | paper | write-manage-read loop + temporal-scope × substrate × control-policy 三维 taxonomy | `deep-note` ✅ |
| 2026-02 | arXiv (多篇 2602.* 综述) | paper | "Rethinking Memory Mechanisms of Foundation Agents" 等多篇 2026-02 综述爆发 | `stub`(纳入 papers/index)|
| 2026-01 | arXiv 2512.13564 v2 "Memory in the Age of AI Agents" | paper | Forms × Functions × Dynamics 三轴 taxonomy(Shichun Liu 等)| `deep-note` ✅ |
| 2026-01 | arXiv 2601.03236 MAGMA | paper | Multi-Graph based Agentic Memory(9 仓中 6 个引用,最热 top1)| `stub` (候选升级 deep-note)|

## 2025 H2

| 日期 | 来源 | 类型 | 一句话 | Radar 动作 |
|---|---|---|---|---|
| 2025-12 | arXiv 2512.13564 v1 "Memory in the Age of AI Agents" | paper | 同上 v2 的初版 | 见上 |
| 2025-12 | 多篇 benchmark 上线 | paper | CloneMem / KnowMe-Bench / RealMem / PersonaMem-v2 / LoCoBench-Agent / ConvoMem / MemoryArena | 部分 `deep-note`,其他 `stub` |
| 2025-09 | ECAI 2025 | paper | Mem0 LoCoMo 上 10 方法头对头比较 | `deep-note` ✅ |

## 跟踪中(待定型)

- **Anthropic Claude Dreams 公开度**:目前来源仍是早期 docs + 二手讨论,等
  Anthropic 出官方技术博客后升级 [`../products/claude-dreams.md`](../products/claude-dreams.md)
- **OpenAI Memory 形态演进**:从 ChatGPT memory(2024)→ Agents SDK + memory hooks
  (2025)→ ???(2026 H2 预期),目前只有产品页面快照,等更深技术披露
- **Cursor / Windsurf 等 IDE agent 的 memory 形态**:无官方技术资料,
  靠用户使用反推
- **LangMem 与 LangGraph checkpoint 的关系**:LangChain 的 memory 故事 2026
  又重写了一遍,等 LangGraph v1 稳定后建笔记
- **小型 OSS/MCP memory servers 的证据补齐**:MemMachine、mem9、Memstate、ClawMem、
  SimpleMem、memforks、remnic、nram、MemoryCloud、Universal Memory Protocol、
  memanto、LycheeMem、Parcle Memory、Neo4j Agent Memory 等先留在 discovery log 或
  radar watchlist,等 license/release health 与 canonical docs 查清再决定是否 deep-note

## 维护说明

这份日志的目的是**新条目快速分流**:看到一个东西先在这里登记,再决定走
ResearchItem 流程还是 archive-only。**不**追求穷尽。
"我看到了 N 个产品横评"对决策没用,"这个横评提供了某个我们没有的对比维度"
才有用 —— 后者升级到 ResearchItem,前者只留链接。
