---
title: 2026-09-28 Memory Radar refresh
date: 2026-09-28
status: current-source-refresh
language: zh-CN
---

# 2026-09-28 Memory Radar refresh

本页记录 2026-09-28 的 weekly radar refresh。主 agent 从 `origin/main`
commit `56dd272` 创建 `codex/weekly-memory-radar-2026-09-28`。本轮提升
2026-09-21 之后 primary-source 搜索中直接影响 agent memory 设计、治理、产品
行为或评测的项目。

## 执行模型

| Lane | 角色 | 输出 |
|---|---|---|
| papers/conferences | researcher + arXiv/API/web pass | post-2026-09-21 memory papers and benchmark candidates |
| products/platforms | researcher + official-source pass | Databricks, Mem0, Zep, AWS, Microsoft, Alibaba, OpenAI and related official sources |
| GitHub/benchmarks | researcher discovery pass | repository/list/MCP signals as discovery only |
| repo-map | local inspection | counts, duplicate risks, landing files, verifier contract |
| source/relevance review | main agent, with second-pass verifier + critic | final must-add / update-existing / watchlist / adjacent / reject decisions |

One fast repo-map subagent failed because its configured model was unavailable,
so the repo-map work was done locally. Research subagents returned paper,
product, and GitHub/benchmark discovery rows; the main agent owns final
classification and integration.

The same-day second pass checked the still-open PR against unchanged
`origin/main`. Official Alibaba Cloud Tablestore docs dated 2026-09-24 resolved
one product-boundary watchlist item; this addition is part of the existing PR.

## Must-add / update-existing

### Papers and benchmarks

| Action | Item | Why it matters | Local anchor |
|---|---|---|---|
| must-add | DolphinBench | adds action-based memory evaluation with task completion, cost, latency, and Pareto framing; treated as affiliated evidence | [`../benchmarks/dolphinbench.md`](../benchmarks/dolphinbench.md) |
| must-add | MemCalib | evaluates whether agents overuse, underuse, or correctly use retrieved memories | [`../benchmarks/memcalib.md`](../benchmarks/memcalib.md) |
| must-add | Correlated Promotion Benchmark | tests shared-memory claim admission under correlated / paraphrased evidence | [`../benchmarks/correlated-promotion-benchmark.md`](../benchmarks/correlated-promotion-benchmark.md) |
| must-add | MemProbe Stability-Plasticity | adds diagnostic profiles for update/preserve/attribute/time-organize behavior | [`../benchmarks/memprobe-stability-plasticity.md`](../benchmarks/memprobe-stability-plasticity.md) |
| must-add | TWIST | tests conversational-memory intervention quality at belief-change points with hard negatives | [`../benchmarks/twist.md`](../benchmarks/twist.md) |
| must-add (backfill) | LongMemEval-V2 | evaluates customized environment state, workflows, and failure modes; distinct from original LongMemEval | [`../benchmarks/longmemeval-v2.md`](../benchmarks/longmemeval-v2.md) |
| must-add (backfill) | MINTEval | tests revised facts and multi-target aggregation under long-horizon interference | [`../benchmarks/minteval.md`](../benchmarks/minteval.md) |
| must-add (backfill) | InMind | tests indirect retrieval of user facts that require a knowledge bridge | [`../benchmarks/inmind.md`](../benchmarks/inmind.md) |
| must-add | Scope Before You Persist | shows retrieval scope must match the task family that certified a persistent skill memory | [`../papers/scope-before-you-persist.md`](../papers/scope-before-you-persist.md) |
| must-add | Just-in-Time Memory | makes read-time task-adaptive curation a concrete alternative to irreversible write-time summaries | [`../papers/just-in-time-memory.md`](../papers/just-in-time-memory.md) |
| must-add | EnSIMem | adds entity/property/source-turn/temporal structure as indexing pressure for long-term memory | [`../papers/ensimem-entity-structured-indexing.md`](../papers/ensimem-entity-structured-indexing.md) |
| must-add | Jev-Mem | treats memory typing, routing, and budget allocation as a fast controller problem | [`../papers/jev-mem-system-one-controlled-agentic-memory.md`](../papers/jev-mem-system-one-controlled-agentic-memory.md) |
| must-add | AkasicMEM | frames enterprise memory around source-to-derived authorization continuity | [`../papers/akasicmem-governed-enterprise-memory.md`](../papers/akasicmem-governed-enterprise-memory.md) |
| must-add | Execution provenance retrieval | asks when execution histories help memory retrieval under budget constraints | [`../papers/execution-provenance-memory-retrieval.md`](../papers/execution-provenance-memory-retrieval.md) |
| must-add | RPMem | explores recurrent parametric memory as a contrast to external editable stores | [`../papers/rpmem-recurrent-parametric-memory.md`](../papers/rpmem-recurrent-parametric-memory.md) |
| must-add (backfill) | SAMem | Findings of ACL paper makes current decision state explicit in experiential-memory retrieval | [`../papers/samem-state-aware-fine-grained-memory.md`](../papers/samem-state-aware-fine-grained-memory.md) |
| must-add (backfill) | GAM | ACL paper separates event encoding from topic-level graph consolidation | [`../papers/gam-hierarchical-graph-agentic-memory.md`](../papers/gam-hierarchical-graph-agentic-memory.md) |
| must-add (backfill) | Memory-R2 | arXiv paper frames fair credit assignment for long-horizon memory writes/updates/deletes | [`../papers/memory-r2-fair-credit-assignment.md`](../papers/memory-r2-fair-credit-assignment.md) |
| update-existing | PersonaAgent stub | arXiv v2 / Findings of ACL use a new canonical title for the existing `2506.06254` paper | [`../papers/stubs/personaagent-when-large-language-model-agents-meet.md`](../papers/stubs/personaagent-when-large-language-model-agents-meet.md) |

### Products

| Action | Product | Verified delta | Local anchor |
|---|---|---|---|
| update-existing | Databricks Managed Agent Memory | canonical docs now describe Lakebase-backed beta managed memory with actor/session/path entries and search/list APIs | [`../products/databricks-managed-agent-memory.md`](../products/databricks-managed-agent-memory.md) |
| update-existing | Mem0 | DolphinBench launch is useful evaluation signal, but benchmark/leaderboard claims remain vendor-affiliated | [`../products/mem0.md`](../products/mem0.md) |
| update-existing | Zep | v3 changelog adds Agent Skills gating by Agent Memory access, source episodes on entity nodes, traceability docs, and graph fixes | [`../products/zep.md`](../products/zep.md) |
| update-existing | Microsoft Foundry Memory | `FoundryMemoryProvider` integration retrieves memories before runs and submits conversations for async extraction afterward | [`../products/microsoft-foundry-memory.md`](../products/microsoft-foundry-memory.md) |
| must-add | Alibaba Cloud Tablestore Memory Storage Service | AgentStorage exposes a distinct Tablestore-backed managed store with structured/file memory, scoped retrieval, and Dream consolidation; no independent performance claim | [`../products/alibaba-tablestore-memory-storage.md`](../products/alibaba-tablestore-memory-storage.md) |
| update-existing | Alibaba Bailian Memory Library | distinguish its `memoryId` / `AddMemory` API from Tablestore AgentStorage and Model Studio Managed Agents file-store/session-mount API | [`../products/alibaba-bailian-memory.md`](../products/alibaba-bailian-memory.md) |
| update-existing | Redis Agent Memory | correct the supported Redis Iris / Redis Cloud service versus the former OSS research server; add current lifecycle/API boundary | [`../products/redis-agent-memory-server.md`](../products/redis-agent-memory-server.md) |
| update-existing | Letta / Letta Code | official v0.33.0 and v0.33.3 releases move memory upkeep and repair to background work and add fresh-agent MemFS | [`../products/letta.md`](../products/letta.md) |
| update-existing | Hindsight | official v0.10.1 release adds bank transfer and fixes recall budgets and tenant file scoping | [`../products/hindsight.md`](../products/hindsight.md) |

## Watchlist / adjacent / reject

| Decision | Item | Reason |
|---|---|---|
| watchlist | PIA health personal intelligence agent | strong typed-record memory signal, but domain-specific health deployment needs fuller boundary review |
| watchlist | META financial episodic-memory trading agent | episodic memory is relevant, but finance/trading task scope is vertical and artifacts need verification |
| watchlist | Alibaba AgentLoop / Agent Run Memory Store | their official resource ownership and integration paths differ from both Bailian and Tablestore; track each boundary before adding another core note |
| watchlist | AML agent-memory leaderboard Cycle 2 | active evaluation-contract signal, but private data/corpora and versioned protocol need review |
| watchlist | xChuCx agent-memory / mcp-memory-service / Palinode / m3-memory | local-first MCP memory cluster; discovery only until release/license/API maturity is verified |
| watchlist | BEAM scoring fix | official repository signal still needs exact scoring-change and comparability review |
| watchlist | WorldMemArena | paper describes 400 tasks; current official repository describes a 461-item full split and 150-item small split, so reconcile dataset versions before catalog promotion |
| watchlist | Changing Preferences / SP-Mem / TrajWiki older preprints | direct memory relevance, but full method and overlap review are pending; no extra seed count yet |
| adjacent | AutoResearch production-scale failure modes | useful operational note on memory decay, but main contribution is autonomous research scaffolding |
| adjacent | Redis September platform releases | agent context mentioned, but no new Agent Memory Server behavior |
| reject | inaccessible benchmark repos / MCP catalog mismatches | source mismatch or inaccessible canonical repo blocks promotion |

## Source verification

| Source class | Checked | Result |
|---|---|---|
| arXiv direct pages | 2609.24971, 2609.24259, 2609.30813, 2609.30558, 2609.29144, 2609.28575, 2609.27334, 2609.27279, 2609.23986, 2609.25563, 2609.25913, 2609.23466 | all targeted pages returned HTTP 200 |
| ACL / arXiv backfill | 2026.findings-acl.722, 2026.acl-long.1600, 2026.findings-acl.1315, 2605.21768, 2506.06254 | primary pages reachable; PersonaAgent arXiv ID matched the ACL title, so no second paper was counted |
| benchmark backfill | 2605.12493, 2605.18565, 2607.24368 and their official repositories | origin protocol verified; no reported scores normalized; WorldMemArena 400/461 version mismatch left on watchlist |
| official product docs/blogs | Databricks, Mem0, Zep, Microsoft, AWS, OpenAI, Google, Alibaba, Oracle, Cloudflare | promoted only verified product-behavior deltas; no independent performance evidence |
| official Alibaba Tablestore docs | Memory Storage overview, store management, structured/file memory, Memory Dream (2026-09-24) | targeted pages reachable; distinct AgentStorage service verified against Bailian, AgentLoop, and Agent Run docs |
| official product/release pages | Redis Iris/Agent Memory and former OSS docs; Model Studio Managed Agents Memory Store; Letta Code v0.33.0/v0.33.3; Hindsight v0.10.1 | direct product behavior and product-boundary sources; no score or runtime success inferred |
| GitHub/MCP/list discovery | AML leaderboard, xChuCx, mcp-memory-service, Palinode, m3-memory, curated CLI lists | discovery-only; no core product or benchmark performance promotion |

## Evidence boundaries

- New paper and benchmark notes are `seed`; no local PDF full read or normalized
  score table was added.
- LongMemEval-V2, MINTEval, and InMind add origin events only, not evaluation-use
  or independent-reproduction events. Dataset license/protocol details remain
  unchecked where each seed note says so.
- DolphinBench is Mem0-affiliated / vendor-adjacent evidence until independent
  reproduction exists.
- CPB, MemCalib, MemProbe Stability-Plasticity, and TWIST results remain
  paper-origin claims.
- The new MemProbe entry is intentionally named `memprobe-stability-plasticity`
  to avoid collision with the existing `MEMPROBE` hidden user-state benchmark.
- SAMem, GAM, and Memory-R2 are older-source backfills at seed quality. Their
  reported advantages are paper-origin only; PersonaAgent remained one stub.
- GitHub stars, release timing, list placement, and MCP catalog entries were
  used only as discovery signals.
- Tablestore docs disagree on whether `tenantId` is required for
  `SearchMemories`; the note records this as an unresolved API detail. Alibaba
  token-saving and scale figures remain vendor claims.
- The Redis OSS archive records its older positioning; current Redis docs
  explicitly separate the supported managed service from the research server.
- Model Studio Managed Agents Memory Store is a related file-memory API, not an
  alias for Bailian `AddMemory` / `SearchMemory` or Tablestore `AddMemories`.

## Trend synthesis

- **Evaluation is moving beyond recall**:DolphinBench, MemCalib, TWIST, and
  MemProbe emphasize cost, calibration, intervention, and behavioral profiles.
- **Memory gates are becoming epistemic gates**:CPB moves write admission from
  dedupe to lineage-aware claim support.
- **Scope is part of memory validity**:Scope Before You Persist says a memory
  can be true in one certified family and harmful globally.
- **Managed memory products are exposing more governance hooks**:Databricks,
  Zep, Microsoft, and Alibaba Tablestore expose traceability, scope, file
  versions, or lifecycle controls rather than only raw benchmark claims.

## Review notes

The connected surfaces now record 989 scraped papers plus September manual
paper/benchmark additions, 7 full paper notes, 83 seed notes, 31 benchmark
catalog rows, 41 product notes, and 40 product source snapshots. The second
pass added one product note and three benchmark seed notes.
