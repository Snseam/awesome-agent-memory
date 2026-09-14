---
title: 2026-09 Memory Radar refresh
date: 2026-09-14
status: current-source-refresh
language: zh-CN
---

# 2026-09 Memory Radar refresh

本页记录 2026-09-14 的 weekly radar refresh。主 agent 从
`origin/main` commit `b363291` 创建本分支，并以 2026-09-07 的未合并 weekly
branch 作为去重上下文。当前 run 只把 2026-09-08 至 2026-09-14 期间查到的
primary-source delta 提升到仓库；此前 weekly branches 仍未合并到 `main`。

## 执行模型

| Lane | 角色 | 输出 |
|---|---|---|
| papers/conferences | bounded research pass | arXiv HTML search and direct abstract checks |
| products/platforms | official-source pass | Graphiti and memsearch release APIs/pages |
| GitHub/benchmarks | discovery pass | repository activity and benchmark candidates |
| repo-map | repository inspection | counts, connected surfaces, duplicate risks |
| source/relevance review | main agent | final must-add / update-existing / watchlist / adjacent decisions |

The six requested subagent lanes were attempted, but five hit model-capacity or
connection limits. The main agent therefore owns the final classification and
integration review for this run.

## Must-add / update-existing

### Papers and benchmarks

| Action | Item | Why it matters | Local anchor |
|---|---|---|---|
| must-add | LifeFuse-Mem | lifecycle-aware fusion targets temporary overwrite of durable state | [`../papers/lifefuse-mem-lifecycle-aware-state-fusion.md`](../papers/lifefuse-mem-lifecycle-aware-state-fusion.md) |
| must-add | ROAM | relation-aware atomic-memory organization makes equivalence, subsumption, and conflict explicit | [`../papers/roam-robust-atomic-memory-organization.md`](../papers/roam-robust-atomic-memory-organization.md) |
| must-add | MemSentry | persistent-memory poisoning gets admission, review, quarantine, and dependency-impact signals | [`../papers/memsentry-persistent-memory-poisoning.md`](../papers/memsentry-persistent-memory-poisoning.md) |
| must-add | MemForest | EventTree partitioning and progressive merging add a concrete compression and retrieval-cost path | [`../papers/memforest-eventtree-agent-memory.md`](../papers/memforest-eventtree-agent-memory.md) |
| must-add | AIM | private/shared visibility and interoperable memory CRUD address multi-user governance | [`../papers/aim-privacy-aware-interoperable-memory.md`](../papers/aim-privacy-aware-interoperable-memory.md) |
| must-add | MUMBench | benchmark pressure for visibility classification and multi-user memory operations | [`../benchmarks/mumbench.md`](../benchmarks/mumbench.md) |
| must-add | MERIT | instrumented tool-use tasks connect memory utility, leakage, corruption, and dollar cost | [`../benchmarks/merit.md`](../benchmarks/merit.md) |

### Products

| Action | Product | Verified delta | Local anchor |
|---|---|---|---|
| update-existing | Graphiti | official `v0.30.2` release: Neo4j routing, MCP database selection, group-ID clears, concurrent isolation, and FalkorDB search fixes | [`../products/graphiti.md`](../products/graphiti.md) |
| update-existing | memsearch | official `v0.4.20` release: context-budget session retention, recall status, summary-failure handling, Milvus Lite reindexing, and Windows support | [`../products/memsearch.md`](../products/memsearch.md) |

## Watchlist / adjacent / reject

| Decision | Item | Reason |
|---|---|---|
| watchlist | CreaMem | scene-aware memory is relevant, but overlaps existing graph/personalization coverage and needs a fuller source pass |
| watchlist | SafeMem | embodied graph memory is useful adjacent pressure, not a general durable agent-memory core |
| watchlist | Graph-based personalized memory survey | survey-only discovery signal; wait for primary method or evaluation evidence |
| watchlist | Memory as Infrastructure | interesting operational record, but current evidence is a small self-reported deployment |
| watchlist | MemOS `v2.0.19` | current release-health signal without enough new memory-specific behavior to revise the product note |
| adjacent | BIO-MEMART / KVShareArena | prompt or KV-cache memory rather than durable editable agent memory |
| adjacent | long-video budget routers and similar context systems | useful context-management ideas, but outside the current memory lifecycle boundary |
| reject as performance evidence | GitHub stars, README numbers, list placement, and vendor summaries | discovery or product evidence only; none supports independent quality conclusions |
| source overlap | prior weekly branches remain unmerged | current branch avoids re-promoting their Sep 7 additions while preserving an origin/main base |

## Source verification

| Source class | Checked | Result |
|---|---|---|
| arXiv HTML search | long-term-memory and benchmark queries | search endpoint worked; arXiv API endpoint was rate-limited with HTTP 429 |
| arXiv direct pages | 2609.12436, 2609.12320, 2609.09778, 2609.08747, 2609.08273, 2609.05441 | all targeted pages returned HTTP 200 |
| GitHub release API | Graphiti `v0.30.2`, memsearch `v0.4.20` | both returned HTTP 200 with dated release metadata |
| MemForest repository | `Celina-love-sweet/MemForest` | returned HTTP 200; repository is public and non-archived |
| AWS memory release notes | current official page | no newer memory-specific Sep 8-14 delta found; previous August entries remain covered by the unmerged Sep 7 context |

## Evidence boundaries

- New paper and benchmark notes are `seed`; no local PDF full read or normalized
  score table was added.
- MUMBench and MERIT code, data, and license fields remain `check`.
- Paper-reported numbers, including LifeFuse-Mem, MemForest, MemSentry, AIM, and
  MUMBench metrics, remain paper-origin claims.
- Graphiti and memsearch updates are official product behavior signals, not
  independent benchmark results.
- GitHub discovery was used for candidate selection and implementation signals,
  not as maturity or quality evidence.

## Trend synthesis

- **State validity is becoming explicit**: LifeFuse-Mem and ROAM make lifecycle,
  relation, and evidence roles part of memory update and retrieval.
- **Governance is moving into the memory API**: AIM and MUMBench treat visibility,
  revocation, and CRUD semantics as benchmarkable behavior.
- **Security is persistent-state security**: MemSentry focuses on poisoning after
  the original interaction, including dependency and access impact.
- **Cost is an end-to-end concern**: MemForest targets compression and retrieval
  overhead, while MERIT connects memory behavior to tool-use outcomes and cost.
- **Products are tightening operational correctness**: Graphiti and memsearch
  releases focus on routing, isolation, retention, status, and local-runtime
  failure behavior.

## Review notes

The connected surfaces now record 989 scraped papers plus seven 2026-09 manual
paper/benchmark additions, 20 seed paper notes, 23 benchmark catalog rows, and
38 product notes. No new product note was created. The final reviewer pass was
performed by the main agent because requested subagent reviewer capacity was
unavailable during this run.
