---
title: 2026-07 Memory Radar refresh
date: 2026-07-27
status: current-source-refresh
language: zh-CN
---

# 2026-07 Memory Radar refresh

本页记录 2026-07-06 与 2026-07-27 的 weekly radar refresh。主 agent 从最新
`origin/main` 创建对应周更分支,并用 paper/product/GitHub discovery 子 agent 做候选
检索。所有 GitHub/list/catalog 信号只作为 discovery;最终收录只依赖 primary
paper/product sources。

## 执行模型

| Lane | 角色 | 输出 |
|---|---|---|
| papers/conferences | `researcher` | arXiv / ACL Anthology 2026 候选与 duplicate 风险 |
| products/platforms | `researcher` | 官方产品文档、release notes、changelog |
| GitHub/benchmarks | `researcher` | repo/list/dataset discovery signals only |
| repo-map | `explore` | counts、landing files、现有条目和别名风险 |
| source/relevance review | main agent + later reviewer | must-add / update-existing / watchlist / adjacent / reject |

## 2026-07-27 weekly refresh delta

### Papers and benchmarks

| Action | Item | Why it matters | Local anchor |
|---|---|---|---|
| must-add | Retain or Consolidate? | 把 raw retention 与 consolidation 变成 budget-dependent operator selection,避免固定记忆策略 | [`../papers/retain-or-consolidate-budget-dependent-memory.md`](../papers/retain-or-consolidate-budget-dependent-memory.md) |
| must-add | Mechanistic Attention Guidance for Agent Memory Refinement | 用 retrieval-head attention telemetry 指导 memory refinement,补可解释 refinement 信号 | [`../papers/mechanistic-attention-guidance-agent-memory-refinement.md`](../papers/mechanistic-attention-guidance-agent-memory-refinement.md) |
| must-add | AttriMem | 把 memory construction 的 process feedback / attribution 变成 RL 优化目标 | [`../papers/attrimem-attribution-guided-memory-learning.md`](../papers/attrimem-attribution-guided-memory-learning.md) |
| must-add | Beyond Memory Leaderboards | 要求 scientific-memory benchmark 按 retrieval budget、modality、judge/rubric 做可解释对比 | [`../papers/beyond-memory-leaderboards-budgeted-context-restoration.md`](../papers/beyond-memory-leaderboards-budgeted-context-restoration.md) |
| must-add | Forged Reasoning Attacks | 记录 malicious reasoning trace 如何污染 agent memory,补 memory write-path 安全压力 | [`../papers/forged-reasoning-attacks-agent-memory.md`](../papers/forged-reasoning-attacks-agent-memory.md) |
| must-add | From Memory to Skills | 讨论 evidence-grounded promotion from memories to skills/procedures,补 procedural memory governance | [`../papers/from-memory-to-skills.md`](../papers/from-memory-to-skills.md) |
| must-add | MemTools | 提出 memory lifecycle component contracts 与 evaluation/protocol 解耦,补 interop/evaluator 压力 | [`../papers/memtools-interoperable-agent-memory-framework.md`](../papers/memtools-interoperable-agent-memory-framework.md) |
| must-add | Proactive Memory Agent | 把 memory recall 从被动检索推进到 intervention timing/policy 问题 | [`../papers/proactive-memory-agent.md`](../papers/proactive-memory-agent.md) |
| must-add | OCR-Memory | 把长期 memory 扩展到 OCR artifact retrieval 与视觉文本上下文恢复 | [`../papers/ocr-memory.md`](../papers/ocr-memory.md) |
| must-add | Profile-Graph Memory / MemHop | 记录 profile graph 与 MemHop-style 多跳 personalization;benchmark promotion 暂缓 | [`../papers/profile-graph-memory-memhop.md`](../papers/profile-graph-memory-memhop.md) |
| must-add | MOSAIC | 补 graph storage、conflict detection、hash retrieval 的长期 memory architecture 信号 | [`../papers/mosaic-long-term-memory.md`](../papers/mosaic-long-term-memory.md) |
| must-add | Memora | 新增 weeks-to-months personalized memory benchmark 和 forgetting-aware FAMA metric | [`../benchmarks/memora.md`](../benchmarks/memora.md) |
| update-existing | BEAM | 官方 repo / dataset 源补强,但 1M/10M performance claims 仍不升级为独立证据 | [`../benchmarks/beam.md`](../benchmarks/beam.md) |

### Products

| Action | Product | Why it matters | Local anchor |
|---|---|---|---|
| must-add | Databricks Managed Agent Memory | Azure Databricks 把 Unity Catalog-backed managed memory store 暴露为 beta 产品能力 | [`../products/databricks-managed-agent-memory.md`](../products/databricks-managed-agent-memory.md) |
| update-existing | AWS Bedrock AgentCore Memory | Harness GA 与 Memory execution role policy 补充 managed memory 权限/运行时信号 | [`../products/aws-agentcore-memory.md`](../products/aws-agentcore-memory.md) |
| update-existing | Google Agent Platform Memory Bank | profiles GA、IngestEvents GA、Gemini Embedding 2 支持是官方产品行为更新 | [`../products/google-memory-bank.md`](../products/google-memory-bank.md) |
| update-existing | Anthropic Claude memory-store | `agent-memory-2026-07-22` beta header 改变 memory listing 语义 | [`../products/claude-dreams.md`](../products/claude-dreams.md) |
| update-existing | OpenAI Projects memory | Project-only memory scope 与 "no list of project memories" 是 governance/control-surface 信号 | [`../products/openai-memory.md`](../products/openai-memory.md) |
| update-existing | Alibaba OpenSearch Agentic Memory | 作为 Alibaba managed-memory family / alias signal,不与 generic OpenSearch 混同 | [`../products/alibaba-bailian-memory.md`](../products/alibaba-bailian-memory.md) |
| update-existing | Letta trajectory memory | trajectory 格式是 Letta memory formation 的新信号,不是独立新产品 | [`../products/letta.md`](../products/letta.md) |

### Watchlist / adjacent / reject

| Decision | Item | Reason |
|---|---|---|
| watchlist | Supra cognitive modes | 相关 routed-memory architecture,但证据/新颖性弱于本轮 direct memory papers |
| watchlist | Oracle Agent Memory report | Oracle-affiliated LongMemEval numbers 只能进入 vendor/affiliated evidence,本轮不加 score claim |
| watchlist | Tacitus / Mnemosyne / SimpleMem / MCP memory catalogs | GitHub 或 catalog 活动只作 discovery,需 source/license/release health 补证 |
| watchlist | Cloudflare Think harness | 与 Cloudflare Agent Memory 重叠;先观察是否形成独立 memory product |
| adjacent | Microsoft Foundry Local compaction / Cloudflare Code Mode | context compaction 或 tool execution 信号,不是一等长期 memory 产品 |
| source mismatch | Alibaba OpenSearch / Bailian / generic OpenSearch | 只使用 official Aliyun/Bailian/OpenSearch Agentic Memory 页面,不把 generic OpenSearch docs 当产品证据 |
| reject as evidence | GitHub stars, README benchmark tables, third-party product lists | 可发现候选,不能支持性能、质量、maturity 或独立复现结论 |

### Evidence gaps

| Item | Gap | Why not blocking |
|---|---|---|
| 2026-07 paper seeds | 尚未 full read PDF、code/data/license、leaderboard 和 exact setup | 本轮只登记 seed note;不登记 normalized score 或 independent reproduction |
| Memora / BEAM | repo 与 dataset 源已补,但 protocol/results 未归一化 | 只新增 origin / source rows,不作为排行证据 |
| Product updates | 官方 docs/release notes 支撑 product behavior | 未写任何 independent benchmark 或 superiority claim |
| OpenAI Projects source | shell reachability 可能 403,但 Help Center 页面浏览器可访问 | 只更新 product behavior;保留可访问性 caveat |

### Trend synthesis

- **Operator choice is becoming budget-aware**:Retain/Consolidate、Beyond Memory
  Leaderboards、MemDelta 都把 retrieval budget 和 context volume 变成评价前提。
- **Memory write governance is now a security surface**:AttriMem、FARMA、
  From Memory to Skills、MemTools 都把写入、归因、promotion 或 interop 合同推到前台。
- **Managed memory is moving into governed cloud substrates**:Databricks、
  Google、AWS、OpenAI、Anthropic、Alibaba 更新都强调 scope、identity、policy、store。
- **Personalization benchmarks are adding forgetting pressure**:Memora 与
  Profile-Graph/MemHop 让长期 profile 不再只测 recall,还要测 obsolete-memory 抑制。

## Must-add / update-existing

### Papers and benchmarks

| Action | Item | Why it matters | Local anchor |
|---|---|---|---|
| must-add | A-TMA | 把 ghost memory 拆成 bank / retrieval / answer-time state-resolution failure,强调 current/historical/transition state roles | [`../papers/atma-state-aware-memory-failures.md`](../papers/atma-state-aware-memory-failures.md) |
| must-add | MemSyco-Bench | 评估 retrieved memory 什么时候不应影响事实判断,补 memory-induced sycophancy / authority 维度 | [`../benchmarks/memsyco-bench.md`](../benchmarks/memsyco-bench.md) |
| must-add | MemLeak | 多模态 memory 删除后仍可从保留图片/相关文本恢复事实,补 deletion / provenance / residual leakage 维度 | [`../benchmarks/memleak.md`](../benchmarks/memleak.md) |
| must-add | MemDelta | 用 controlled baseline 压住 memory-vs-RAG/full-context claims,要求固定 embedding/model family 并报告 write-path cost | [`../benchmarks/memdelta.md`](../benchmarks/memdelta.md) |
| must-add | Mandol | memory-native graph substrate + agglomerative abstraction,补 unified store / hybrid retrieval 工程路线 | [`../papers/mandol-agglomerative-agent-memory.md`](../papers/mandol-agglomerative-agent-memory.md) |
| must-add | Forensic Trajectory Signatures | persistent memory poisoning 的 tool-call trajectory audit 视角,补 runtime forensic signal | [`../papers/forensic-trajectory-memory-poisoning.md`](../papers/forensic-trajectory-memory-poisoning.md) |
| update-existing | Chain-of-Memory / Mem2ActBench / Learning How and What to Memorize / Mnemis | ACL 2026 official pages 已上线,但本仓已有 scrape stub,本轮不重复建 note | `papers/stubs/` |

### Products

| Action | Product | Why it matters | Local anchor |
|---|---|---|---|
| update-existing | AWS Bedrock AgentCore Memory | release notes / docs 继续确认 memory record create/update/delete streaming,支持 evented lifecycle 判断 | [`../products/aws-agentcore-memory.md`](../products/aws-agentcore-memory.md) |
| update-existing | Google Agent Platform Memory Bank | 2026-06-29 release notes 将 Memory Bank generation 默认模型切到 Gemini 3.5 Flash | [`../products/google-memory-bank.md`](../products/google-memory-bank.md) |
| update-existing | OpenAI ChatGPT Memory | 2026-06-25 Business / Enterprise / Edu release notes 扩展 memory summary/source/correction/delete controls | [`../products/openai-memory.md`](../products/openai-memory.md) |
| update-existing | Mem0 | changelog highlights 增加 memory expiration controls,作为 lifecycle/retention signal | [`../products/mem0.md`](../products/mem0.md) |
| update-existing | Redis Agent Memory Server | 2026-07-01 Redis guide 继续强化 short-term + long-term memory positioning | [`../products/redis-agent-memory-server.md`](../products/redis-agent-memory-server.md) |

## Watchlist / adjacent / reject

| Decision | Item | Reason |
|---|---|---|
| watchlist | AutoMem | memory as cognitive skill 方向相关,但本轮未完成 project/code/data verification |
| watchlist | Governed Shared Memory / Forget to Improve | post-window awesome-list commits surfaced pre-window papers;先等 full source read 后再决定是否升级 |
| watchlist | Cloudflare Think harness | Cloudflare agent harness 暴露 persistent memory/context patterns,但与 Cloudflare Agent Memory 产品边界重叠 |
| watchlist | Harmix/pam-benchmark | open benchmark harness 相关,但 README results 是 affiliated/self-report |
| watchlist | Synapse / AegisDB / Ogham / NeverTwice / Tenet / Remnic activity | GitHub activity 是 discovery signal,不能支持质量或 maturity 结论 |
| adjacent | What Memory Do GUI Agents Really Need? / ContextSniper / Analytic Concept-Centric Memory | 分别偏 GUI execution state、code repair cost memory、embodied manipulation;有参考价值但不进入本轮 core |
| adjacent | Cloudflare / Redis implementation guides | 产品实践信号,不是独立 memory benchmark |
| reject as core | catalog-only MCP memory entries | catalog placement 无 canonical source / lifecycle evidence 时不入核心 |
| reject as performance evidence | GitHub stars, README benchmark numbers, vendor blogs, awesome-list placement | 只能用于 discovery 或 vendor/product behavior,不能支持性能/质量结论 |
| source mismatch | no new mismatched canonical URL promoted | 本轮未发现需要入库的 title/URL 错配;ACL official pages with existing stubs treated as update-existing |

## Evidence gaps / next verification

| Item | Gap | Why not blocking |
|---|---|---|
| A-TMA / MemSyco-Bench / MemLeak / MemDelta / Mandol / trajectory signatures | 尚未 full read PDF、code/data/license、leaderboard 和 exact setup | 本轮只登记 seed note / benchmark-origin event,不登记 score claim |
| Product updates | release notes and docs support product behavior only | 未写任何 independent benchmark 或 superiority claim |
| GitHub discovery | repo activity, releases, catalog hits remain noisy | 保留 watchlist,不影响 README counts 或 core product list |

## Trend synthesis

- **State validity is overtaking static recall**:A-TMA、MemSyco-Bench、MemDelta 都要求区分
  remembered fact 的 authority、scope、currentness 与 evaluation component。
- **Memory privacy now includes multimodal residue**:MemLeak 显示删除 text memory 之后,
  correlated images / text 仍可能泄漏被删除事实。
- **Runtime evidence matters for security**:trajectory-signature work把 memory poisoning
  从内容检测扩展到 tool-call forensics。
- **Managed memory products are tuning lifecycle controls**:AWS streaming、Google model
  default、OpenAI org memory controls、Mem0 expiration、Redis two-tier guide 都说明
  vendor products 正在把 retention / lifecycle / state scope 做成公开产品面。

## Review notes

- 收录项均要求 primary source:论文用 arXiv / ACL Anthology,产品用官方 docs / release
  notes / changelog / blog。
- GitHub stars、README 性能数字、MCP catalog 和 awesome-list placement 只作 discovery。
- Author-reported benchmark results are paper-origin claims;vendor numbers are vendor claims。
- 2026-07-06 轮次 benchmark catalog 从 18 行增至 21 行;paper seed notes 从 12
  增至 15;product note count 不变。
- 2026-07-27 轮次 benchmark catalog 从 21 行增至 22 行;paper seed notes 从 15
  增至 26;product notes 从 38 增至 39;product archives 从 37 增至 38。
