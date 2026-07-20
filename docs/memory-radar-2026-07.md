---
title: 2026-07 Memory Radar refresh
date: 2026-07-20
status: current-source-refresh
language: zh-CN
---

# 2026-07 Memory Radar refresh

本页记录 2026-07 weekly radar refresh。主 agent 从最新 `origin/main` 创建
`codex/weekly-memory-radar-2026-07-06` 与
`codex/weekly-memory-radar-2026-07-20`,并用 paper/product/GitHub discovery 子
agent 做候选检索。所有 GitHub/list/catalog 信号只作为 discovery;最终收录只依赖
primary paper/product sources。

## 执行模型

| Lane | 角色 | 输出 |
|---|---|---|
| papers/conferences | `researcher` | arXiv / ACL Anthology 2026 候选与 duplicate 风险 |
| products/platforms | `researcher` | 官方产品文档、release notes、changelog |
| GitHub/benchmarks | `researcher` | repo/list/dataset discovery signals only |
| repo-map | `explore` | counts、landing files、现有条目和别名风险 |
| source/relevance review | main agent + later reviewer | must-add / update-existing / watchlist / adjacent / reject |

## Must-add / update-existing

### Papers and benchmarks

| Action | Item | Why it matters | Local anchor |
|---|---|---|---|
| must-add | PM-Bench | 把 prospective memory / pending intention 从普通 recall 中拆出来,测试 agent 是否能在 ongoing activity 中监控 future cue 并执行 delayed task | [`../benchmarks/pm-bench.md`](../benchmarks/pm-bench.md) |
| must-add | Memory as a Controlled Process | 将 retrieve / plan reuse / consolidate / forget 统一成 online memory-control policy,避免固定 heuristic 掩盖 memory failure | [`../papers/memory-as-controlled-process.md`](../papers/memory-as-controlled-process.md) |
| must-add | Experience Memory Graph | 用 failed vs successful trajectory graph edit path 作为可检索的纠错记忆,补充 workflow-level behavioral memory diff | [`../papers/experience-memory-graph.md`](../papers/experience-memory-graph.md) |
| must-add | MemOps | 把 remember / forget / update / reflect / no-op 抽成显式 operation selection benchmark,可用于评估 memory manager 是否知道何时写、删、改或不动 | [`../benchmarks/memops.md`](../benchmarks/memops.md) |
| must-add | Bad Memory | 把 persistent prompt injection 放到 memory files、preferences、knowledge bases 和 defense 设置中,补 coding-agent / tool-agent memory safety 维度 | [`../benchmarks/bad-memory-prompt-injection.md`](../benchmarks/bad-memory-prompt-injection.md) |
| must-add | Why Git | 将 git 作为 agentic development lifecycle 的 persistent memory substrate,补 code/workflow memory 的版本化、branch、diff 视角 | [`../papers/git-bound-agent-memory.md`](../papers/git-bound-agent-memory.md) |
| must-add | MemPoison | 记录 persistent memory poisoning 的 L1/L2/L3 分层,补 compositional multi-record corruption 与 dormant trigger 防御盲点 | [`../benchmarks/mempoison.md`](../benchmarks/mempoison.md) |
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
| update-existing | Google Agent Platform Memory Bank | 2026-07-15 release notes 将 memory profiles 与 IngestEvents 标为 GA,并加入 Gemini Embedding 2 similarity-search 配置 | [`../products/google-memory-bank.md`](../products/google-memory-bank.md) |
| update-existing | Oracle AI Agent Memory | 26.6 docs / product page 明确 hybrid vector+keyword search、CRUD/cascade delete、retention policy、context cards、async APIs 和 custom extraction | [`../products/oracle-ai-agent-memory.md`](../products/oracle-ai-agent-memory.md) |
| update-existing | OpenAI ChatGPT Memory | 2026-07-20 复核当前 release notes / Help Center 仍暴露 memory summary 删除、关闭、文本框编辑和高亮纠错控制 | [`../products/openai-memory.md`](../products/openai-memory.md) |
| update-existing | AWS Bedrock AgentCore Memory | 2026-07-20 复核当前 release notes 仍把 Harness built-in/BYO memory 列为 GA 能力面;未发现 post-window memory delta | [`../products/aws-agentcore-memory.md`](../products/aws-agentcore-memory.md) |
| update-existing | AWS Bedrock AgentCore Memory | release notes / docs 继续确认 memory record create/update/delete streaming,支持 evented lifecycle 判断 | [`../products/aws-agentcore-memory.md`](../products/aws-agentcore-memory.md) |
| update-existing | Google Agent Platform Memory Bank | 2026-06-29 release notes 将 Memory Bank generation 默认模型切到 Gemini 3.5 Flash | [`../products/google-memory-bank.md`](../products/google-memory-bank.md) |
| update-existing | OpenAI ChatGPT Memory | 2026-06-25 Business / Enterprise / Edu release notes 扩展 memory summary/source/correction/delete controls | [`../products/openai-memory.md`](../products/openai-memory.md) |
| update-existing | Mem0 | changelog highlights 增加 memory expiration controls,作为 lifecycle/retention signal | [`../products/mem0.md`](../products/mem0.md) |
| update-existing | Redis Agent Memory Server | 2026-07-01 Redis guide 继续强化 short-term + long-term memory positioning | [`../products/redis-agent-memory-server.md`](../products/redis-agent-memory-server.md) |

## Watchlist / adjacent / reject

| Decision | Item | Reason |
|---|---|---|
| watchlist | Speculate with Memory | memory-augmented speculator 与 latency/cost 相关,但更像 agent execution acceleration;先放 cost-savings/adjacent 队列,不升级核心 note |
| watchlist | Your Agent's Memories Are Not Its Own / FARMA | 记忆安全方向相关,但与 7 月已入库 trajectory forensics 和 MemPoison 有重叠;先等 full read 决定是否单独 seed |
| watchlist | AgenticSTS | bounded-memory testbed 和可复现实验方法有价值,但场景绑定 Slay the Spire 2;先等 code/data review 后再决定是否进 benchmark catalog |
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
| PM-Bench / MemOps / Bad Memory / MemPoison | 尚未 full read PDF、code/data/license、exact task counts、released resources 和 reported results | 本轮只登记 benchmark-origin event,不登记 score claim |
| Memory as a Controlled Process / Experience Memory Graph / Why Git | 尚未 full read benchmarks、agent frameworks、code availability 与实验设置 | 本轮只登记 seed note,不登记性能结论 |
| A-TMA / MemSyco-Bench / MemLeak / MemDelta / Mandol / trajectory signatures | 尚未 full read PDF、code/data/license、leaderboard 和 exact setup | 本轮只登记 seed note / benchmark-origin event,不登记 score claim |
| Product updates | release notes and docs support product behavior only | 未写任何 independent benchmark 或 superiority claim |
| GitHub discovery | repo activity, releases, catalog hits remain noisy | 保留 watchlist,不影响 README counts 或 core product list |

## Trend synthesis

- **State validity is overtaking static recall**:A-TMA、MemSyco-Bench、MemDelta 都要求区分
  remembered fact 的 authority、scope、currentness 与 evaluation component。
- **Prospective memory is now a benchmark axis**:PM-Bench 把 delayed intention 与
  future cue monitoring 单独抽成 agent-memory 能力,补足 reminder / commitment 场景。
- **Memory policy is moving from heuristic to control**:Memory as a Controlled
  Process 把 retrieval、plan reuse、consolidation、forgetting 视为可学习 action,提示
  kernel 需要暴露 memory-policy 实验面。
- **Memory privacy now includes multimodal residue**:MemLeak 显示删除 text memory 之后,
  correlated images / text 仍可能泄漏被删除事实。
- **Persistent poisoning is becoming compositional and workspace-native**:MemPoison、
  Bad Memory 与 trajectory forensic 方向共同说明 write-time single-record filtering 不足以
  覆盖多记录组合、workspace memory files 和 dormant trigger。
- **Runtime evidence matters for security**:trajectory-signature work把 memory poisoning
  从内容检测扩展到 tool-call forensics。
- **Managed memory products are tuning lifecycle controls**:AWS streaming、Google
  profiles/IngestEvents GA、OpenAI memory summary controls、Oracle retention/search
  workflows、Mem0 expiration、Redis two-tier guide 都说明 vendor products 正在把
  retention / lifecycle / state scope 做成公开产品面。

## Review notes

- 收录项均要求 primary source:论文用 arXiv / ACL Anthology,产品用官方 docs / release
  notes / changelog / blog。
- GitHub stars、README 性能数字、MCP catalog 和 awesome-list placement 只作 discovery。
- Author-reported benchmark results are paper-origin claims;vendor numbers are vendor claims。
- 2026-07-20 本轮 benchmark catalog 从 21 行增至 25 行;paper seed notes 从 15 增至
  18;product note count 不变。
