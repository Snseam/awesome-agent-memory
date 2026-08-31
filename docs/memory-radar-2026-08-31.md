---
title: 2026-08 Memory Radar refresh
date: 2026-08-31
status: current-source-refresh
language: zh-CN
---

# 2026-08 Memory Radar refresh

本页记录 2026-08-31 的 weekly radar refresh。主 agent 从最新 `origin/main`
创建 `codex/weekly-memory-radar-2026-08-31`,并用 paper/product/GitHub discovery
子 agent 做候选检索。所有 GitHub/list/catalog 信号只作为 discovery;最终收录只依赖
primary paper/product/repository sources。

## 执行模型

| Lane | 角色 | 输出 |
|---|---|---|
| papers/conferences | `researcher` | arXiv 2026-08 候选、paper-vs-benchmark 分流、duplicate 风险 |
| products/platforms | `researcher` | 官方 release notes、changelog、GitHub release |
| GitHub/benchmarks | `researcher` | repo/list/leaderboard discovery signals only |
| repo-map | `explore` | counts、landing files、现有条目和 open PR overlap 风险 |
| source/relevance review | main agent + reviewer | must-add / update-existing / watchlist / adjacent / reject |

## Must-add / update-existing

### Papers and benchmarks

| Action | Item | Why it matters | Local anchor |
|---|---|---|---|
| must-add | ContextPilot | 把 proactive context management 做成 planning + long-term memory + soft offloading 的长任务路线 | [`../papers/contextpilot-proactive-context-management.md`](../papers/contextpilot-proactive-context-management.md) |
| must-add | EARM | 用 historical query-memory relevance score amortize LLM reranking cost,补 retriever memory 方向 | [`../papers/earm-experience-amortized-reranking.md`](../papers/earm-experience-amortized-reranking.md) |
| must-add | Recuris | recursive working / experiential / skill memory loop,补 self-improving agent memory 方向 | [`../papers/recuris-experiential-working-memory.md`](../papers/recuris-experiential-working-memory.md) |
| must-add | EviGraph | evidence graph 作为 persistent working memory / process reward,补 proof-like graph construction 方向 | [`../papers/evigraph-evidence-construction.md`](../papers/evigraph-evidence-construction.md) |
| must-add | KOPE | kernel optimization 的 experience graph memory,补高成本搜索任务中的 reusable experience 证据 | [`../papers/kope-experience-graph-memory.md`](../papers/kope-experience-graph-memory.md) |
| must-add | CaSKG | counterfactual-causal skill graph retrieval,补 procedural/skill memory 检索方向 | [`../papers/caskg-skill-graph-retrieval.md`](../papers/caskg-skill-graph-retrieval.md) |
| must-add | UAQ | uncertainty-aware querying for memory,补 memory access calibration 和 abstention 方向 | [`../papers/uaq-agent-memory.md`](../papers/uaq-agent-memory.md) |
| must-add | GraphMemix | evidence forests for graph-based memory reasoning,补多模态/图记忆候选 | [`../papers/graphmemix-evidence-forests.md`](../papers/graphmemix-evidence-forests.md) |
| must-add | Constraint Weakening | summaries/plans/tickets/memories/handoffs 会削弱 constraints,补 operational memory decay 风险 | [`../papers/constraint-weakening-agent-workflows.md`](../papers/constraint-weakening-agent-workflows.md) |
| must-add | InjecMEM | persistent memory-injection attack surface,补 memory write/retrieve 安全 benchmark | [`../benchmarks/injecmem.md`](../benchmarks/injecmem.md) |
| must-add | Compaction Cliff | context compaction 下 rule/artifact retention 和 downstream compliance,补长任务压缩 benchmark | [`../benchmarks/compaction-cliff.md`](../benchmarks/compaction-cliff.md) |
| must-add | Stale Constraints | inherited memory 中 stale/superseded constraint 未验证的失败模式,补 freshness benchmark | [`../benchmarks/stale-constraints.md`](../benchmarks/stale-constraints.md) |
| must-add | MemUse | direct QA 之外的 natural memory integration,补 conversational memory 产品评测方向 | [`../benchmarks/memuse.md`](../benchmarks/memuse.md) |
| watchlist | Agent Memory Leaderboard | public benchmark platform signal,但 leaderboard governance/protocol 尚未读完 | [`../benchmarks/agent-memory-leaderboard.md`](../benchmarks/agent-memory-leaderboard.md) |

### Products

| Action | Product | Why it matters | Local anchor |
|---|---|---|---|
| update-existing | Claude memory / Claude Dreams | 2026-08-25 release notes 将 memory 扩展到 Claude Cowork/app 并公开 Topics/sensitive-topic/default-plan controls | [`../products/claude-dreams.md`](../products/claude-dreams.md) |
| update-existing | Mem0 | changelog highlights 增加 DeepSeek Harness plugin,继续验证 memory-as-agent-tool packaging | [`../products/mem0.md`](../products/mem0.md) |
| update-existing | TencentDB Agent Memory | v2.0.1 release 增加 client bindings、persistent session binding、Memory Hub search/permission signals | [`../products/tencentdb-agent-memory.md`](../products/tencentdb-agent-memory.md) |
| update-existing | Letta Code | release notes 增加 configurable memory layout、root-layout memory prompts、memory limits/shared-memory frontmatter signals | [`../products/letta.md`](../products/letta.md) |

## Watchlist / adjacent / reject

| Decision | Item | Reason |
|---|---|---|
| watchlist | Agent Memory Leaderboard | GitHub activity and README are discovery evidence;protocol governance and task definitions must be normalized before using scores. |
| watchlist | MCP Memory Service / small OSS memory repos | repo activity is not enough for Tier A product evidence without canonical docs, release health, license, and actual lifecycle surface. |
| watchlist | AWS Natera / platform case studies | useful managed-memory practice signal, but not new product capability or independent benchmark evidence this round. |
| adjacent | GraphMemix / CaSKG / KOPE | relevant to memory design, but domain-specific enough to keep as seed notes until full read. |
| reject as duplicate | AuthMem-Bench / FinPerMA / MemSecBench / Setoka / Zero-Mem / Databricks and related August candidates | already covered by open weekly PR branches;do not duplicate into the 2026-08-31 branch until those PRs are merged or closed. |
| reject as source | Google Memory Bank pricing/update snippet | page text was not verified strongly enough during this run;leave existing product note unchanged. |
| reject as performance evidence | GitHub stars, README benchmark numbers, vendor blogs, awesome-list placement | only discovery or vendor/product behavior;not independent quality evidence. |

## Evidence gaps / next verification

| Item | Gap | Why not blocking |
|---|---|---|
| 9 paper seed notes | full PDF reads, code/data/license, exact experiment setup, and reported result normalization remain incomplete | seed notes only establish source relevance and design axis;no score claims were promoted |
| 4 benchmark seed notes + 1 candidate platform | dataset splits, judge setup, leaderboard governance, and claims rows beyond origin events remain incomplete | claims ledger records only origin/platform events |
| Product updates | official release/changelog pages support behavior only | no independent benchmark or product superiority claim was added |
| Open PR overlap | PRs #18-#20 already own many August candidates | this branch avoids importing those names to prevent duplicate catalog entries |

## Trend synthesis

- **Memory safety is shifting from privacy-only to persistence-aware threat
  modeling**:InjecMEM、Stale Constraints、Constraint Weakening 都把 old state /
  injected state / inherited constraints 当成 runtime hazard。
- **Context management is becoming a memory benchmark problem**:Compaction Cliff
  and ContextPilot both test whether agents can compress or offload context
  without losing obligations.
- **Retrieval systems are learning from their own retrieval history**:EARM makes
  the retriever remember prior relevance judgments instead of reranking every
  query from scratch.
- **Memory products are exposing more explicit governance controls**:Claude
  Topics/sensitive-topic controls、TencentDB Memory Hub、Letta Code memory layout
  and Mem0 harness tools are all public product-surface signals.

## Review notes

- 收录项均要求 primary source:论文用 arXiv,产品用官方 release notes / changelog /
  GitHub release,platform candidate 用 canonical GitHub repo。
- Author-reported benchmark results are paper-origin claims;vendor numbers are
  vendor claims;GitHub activity is discovery only。
- 本轮 benchmark catalog 从 21 行增至 26 行;paper seed notes 从 15 增至 24;product
  note count 不变。
