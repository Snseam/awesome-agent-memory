---
title: 2026-08 Memory Radar refresh
date: 2026-08-10
status: current-source-refresh
language: zh-CN
---

# 2026-08 Memory Radar refresh

本页记录 2026-08-10 的 weekly radar refresh。主 agent 从最新 `origin/main`
创建 `codex/weekly-memory-radar-2026-08-10`,并用 paper/product/GitHub discovery
子 agent 做候选检索。所有 GitHub/list/catalog 信号只作为 discovery;最终收录只依赖
primary paper/product sources。

本轮开始时 PR #16-#19 仍 open,其中 PR #19 已覆盖 2026-08-03 的 Zero-Mem、
Memory Provenance Laundering、MemHarness、Filesystem-Based Memory、MemSecBench、
Setoka 和若干产品更新。因此本轮只收录未被这些 open PR 明确覆盖的新证据。

## 执行模型

| Lane | 角色 | 输出 |
|---|---|---|
| papers/conferences | `researcher` + main agent | arXiv / OpenReview / ACL Anthology 2026 候选与 duplicate 风险 |
| products/platforms | `researcher` + main agent | 官方产品文档、release notes、changelog |
| GitHub/benchmarks | `researcher` | repo/list/dataset/MCP discovery signals only |
| repo-map | `explore` | counts、landing files、现有条目和别名风险 |
| source/relevance review | main agent + later reviewer | must-add / update-existing / watchlist / adjacent / reject |

## Must-add / update-existing

### Papers and benchmarks

| Action | Item | Why it matters | Local anchor |
|---|---|---|---|
| must-add | LeanMem | 按 compressibility / dynamics / fidelity 把 memory 分成 profile、event、source-grounded records,并按 query 分配 retrieval budget | [`../papers/leanmem-efficient-long-term-memory.md`](../papers/leanmem-efficient-long-term-memory.md) |
| must-add | MemSIF | 把 raw interactions 组织成 topical segments / event trajectories,并用 CoreFact / ActiveFact 双轨事实记忆处理 delayed utility | [`../papers/memsif-dual-track-fact-memory.md`](../papers/memsif-dual-track-fact-memory.md) |
| must-add | VerMem | 用 unified memory operation policy 管 LTM、active context 和 episodic history,并用 local/global verifier 给 memory transition credit | [`../papers/vermem-verifiable-memory.md`](../papers/vermem-verifiable-memory.md) |
| must-add | HiGram | hierarchical graph memory + path-level localization/rewrite,补 graph memory 的 dependency-aware update 形态 | [`../papers/higram-hierarchical-graph-memory.md`](../papers/higram-hierarchical-graph-memory.md) |
| must-add | MemoryCPT | 用 Query-agnostic Distillation + Query-aware Retrieval/Summarization 优化 Quality per Cost,补成本专题 | [`../papers/memorycpt-cost-performance-memory.md`](../papers/memorycpt-cost-performance-memory.md) |
| must-add | RoMeRL | reduced-order utility states 处理 self-evolving memory 的 feedback sparsity 和 memory-reward trap | [`../papers/romerl-memory-reward-trap.md`](../papers/romerl-memory-reward-trap.md) |
| must-add | MutMem | signed mutation transitions 和 poison-label retention 补 persistent memory integrity / authorized adaptation 维度 | [`../papers/mutmem-authorized-mutation.md`](../papers/mutmem-authorized-mutation.md) |
| must-add | Router-Mem | evidence-sufficiency router 在 low-cost recall 和 deeper memory execution 之间切换,补 latency-aware memory execution | [`../papers/router-mem-progressive-execution.md`](../papers/router-mem-progressive-execution.md) |
| must-add | V-Mem | modality-routed retrieval 处理 text/image memory 的 modality gap 和 similarity-relevance gap | [`../papers/v-mem-multimodal-agentic-memory.md`](../papers/v-mem-multimodal-agentic-memory.md) |
| must-add | Salami Attack / MemCollusion | collusive multi-record poisoning 把 memory safety 从单条记录检测推进到跨 fragment coalition | [`../papers/salami-attack-collusive-memory-poisoning.md`](../papers/salami-attack-collusive-memory-poisoning.md) |
| must-add | Memory Reward Inflation | memory score / reward 信号相关性会放大错误经验,补 self-improving memory evaluator 风险 | [`../papers/memory-reward-inflation.md`](../papers/memory-reward-inflation.md) |
| must-add | StateAuditor | 已更新 memory 仍可能驱动 stale behavior;从 stored state 到 draft 反向审计 implicit dependency | [`../papers/stateauditor-stale-dependencies.md`](../papers/stateauditor-stale-dependencies.md) |
| watchlist-to-seed | MERIT | Text-to-SQL repair 的 causal episodic memory 相关但 domain-specific;本轮按 seed 记录并标 caveat | [`../papers/merit-causal-episodic-memory.md`](../papers/merit-causal-episodic-memory.md) |
| must-add | AgentMemBench | memory strategy comparison 同时看 retrieval / answer quality / footprint / latency,注意与 MemoryAgentBench 区分 | [`../benchmarks/agentmembench.md`](../benchmarks/agentmembench.md) |
| must-add | FinPerMA | event-grounded personalized-memory benchmark,用 Post-Shock checkpoint 检查 preference update | [`../benchmarks/finperma.md`](../benchmarks/finperma.md) |
| must-add | AuthMem-Bench | source authority 在 consolidation boundary 丢失会导致 unauthorized reuse,补 governance benchmark | [`../benchmarks/authmem-bench.md`](../benchmarks/authmem-bench.md) |

### Products

| Action | Product | Why it matters | Local anchor |
|---|---|---|---|
| update-existing | Microsoft Foundry Agent Service Memory | 2026-08-05 Learn how-to 明确 memory store/item CRUD、default TTL/retention、scope 和 direct remember/forget command behavior | [`../products/microsoft-foundry-memory.md`](../products/microsoft-foundry-memory.md) |
| update-existing | AWS Bedrock AgentCore Memory | 2026-08 release notes 显示 memory / policy / harness 进入 AWS GovCloud US-West,补 enterprise/compliance deployment signal | [`../products/aws-agentcore-memory.md`](../products/aws-agentcore-memory.md) |

## Watchlist / adjacent / reject

| Decision | Item | Reason |
|---|---|---|
| watchlist | Anthropic Claude Managed Agents | 2026-08-07 release notes 增强 managed-agent surface,但本周未发现 memory-store-specific 新能力 |
| watchlist | Cloudflare Think / Redis Iris / Alibaba Memory billing / Oracle Select AI memory depth | 官方来源有相邻产品行为或未来商业化信号,但不是本轮核心 memory product 能力新增 |
| watchlist | Mem0 / TencentDB Agent Memory | 有上游新 release / repo positioning,但 PR #19 已刷新这些产品;为避免 open-PR 重复,本轮不在 `origin/main` branch 上二次推广 |
| watchlist | Agent Memory Leaderboard / MedMemoryBench / AgentMemoryBench / Agent Memory Atlas | GitHub benchmark/list discovery signal;需 primary protocol / artifact / license review |
| watchlist | bettermemory / NeuraKeep / MemoryRouter / Lodekeep / AMFS / Memory Engine / AtomicMemory / Sibyl Memory / JiuwenMemory / Memorix / Agent Memory Vault | MCP or GitHub discovery;catalog placement、pushedAt、README claims 不能支持产品质量或 maturity 结论 |
| watchlist | LiveMem / GROVE / FocusMem / AntiSkillBench / Memory-ITT / MINDSET / StaleBench / MRMS | 相关但存在 model-internal、multimodal/GUI/domain-specific 或 OpenReview direct-access caveat;先等 source/code/protocol 复核 |
| adjacent | SafeCommit | safety layer 与 memory-grounded action 有关,但不是 memory subsystem / benchmark 本身 |
| reject for now | Librarian Agents | filesystem construction 与 open PR #19 的 Filesystem-Based Memory duplicate risk 高;OpenReview direct fetch 未过 |
| reject as performance evidence | GitHub stars, README benchmark numbers, MCP catalog placement, vendor release prose | 只能作为 discovery 或 product behavior,不能支持性能/质量结论 |
| source mismatch | no new mismatched canonical URL promoted | 本轮 arXiv canonical title / ID 均直接复核;OpenReview challenge 页面未推广为 accepted source |

## Evidence gaps / next verification

| Item | Gap | Why not blocking |
|---|---|---|
| All new paper seeds | 尚未 full read PDF、artifact license、code/data availability、exact benchmark setup | 本轮只登记 seed note,不登记 normalized score claim |
| New benchmark notes | claims ledger 只记录 origin protocol event | 不登记 reported metrics;不作为 independent reproduction |
| Microsoft / AWS product updates | 官方 docs 支持 product behavior only | 未写任何 independent benchmark 或 superiority claim |
| Open PR overlap | PR #16-#19 仍 open,且本 branch 基于 `origin/main` | radar 明确标注 duplicate avoidance;后续 merge 需解决 overlap |
| External link crawl | 本轮只做 targeted reachability | 没有做全仓 link checker |

## Trend synthesis

- **Memory is becoming typed at write time**:LeanMem、MemSIF、VerMem 都把 memory
  lane / operation / verification 从通用摘要中拆出来。
- **Cost-aware memory is now first-class**:Router-Mem、MemoryCPT、LeanMem 都要求
  quality 与 latency / token / construction cost 一起报告。
- **Security moved from poisoned content to authorized state transitions**:
  MutMem、AuthMem-Bench、Salami Attack、StateAuditor 都把 provenance、authority、
  mutation 和跨记录合谋变成核心风险。
- **Benchmarks are specializing beyond static recall**:FinPerMA、AuthMem-Bench、
  AgentMemBench 分别压 personalized event shocks、source authority 和 strategy
  quality/cost comparison。

## Review notes

- 收录项均要求 primary source:论文用 arXiv,产品用官方 docs / release notes。
- GitHub stars、README 性能数字、MCP catalog 和 awesome-list placement 只作 discovery。
- Author-reported benchmark results are paper-origin claims;vendor numbers are vendor claims。
- 本轮 benchmark catalog 从 21 行增至 24 行;paper seed notes 从 15 增至 28;product
  note count 不变。
