---
title: 2026-07 Memory Radar refresh
date: 2026-07-06
status: current-source-refresh
language: zh-CN
---

# 2026-07 Memory Radar refresh

本页记录 2026-07-06 的 weekly radar refresh。主 agent 从最新 `origin/main`
创建 `codex/weekly-memory-radar-2026-07-06`,并用 paper/product/GitHub discovery
子 agent 做候选检索。所有 GitHub/list/catalog 信号只作为 discovery;最终收录只依赖
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
- 本轮 benchmark catalog 从 18 行增至 21 行;paper seed notes 从 12 增至 15;product
  note count 不变。
