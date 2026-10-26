---
title: 2026-10 Memory Radar refresh
date: 2026-10-05
status: current-source-refresh
language: zh-CN
---

# 2026-10 Memory Radar refresh

> Historical weekly snapshot. The [2026-10-26 consolidation](memory-radar-consolidation-2026-10-26.md) records the combined inventory and later resolutions; counts and watchlist decisions below describe this original pass.

本页记录 2026-10-05 的 weekly radar refresh。主 agent 从
`origin/main` commit `56dd2728eb76a9577c7ccc621c298e3c4273c204` 创建新分支,
并以 2026-09-21 与 2026-09-28 的未合并 weekly branches 作为去重上下文。
本轮只提升 2026-09-28 至 2026-10-05 期间经过 primary-source 检查的变化。

## 执行模型

| Lane | 角色 | 输出 |
|---|---|---|
| papers | bounded researcher | arXiv current-window search and direct abstract checks |
| products | bounded researcher | official release notes, docs, and product blogs |
| GitHub/benchmarks | bounded researcher | discovery-only repositories, harnesses, and benchmark signals |
| repo-map | bounded explorer | counts, connected surfaces, and duplicate risks |
| source-check | bounded verifier | canonical URL, date, title, and accessibility checks |
| relevance-review | main agent | final must-add / update-existing / watchlist / adjacent / reject decisions |

The requested six bounded lanes were attempted. The initial Spark repo-map lane
was unavailable under the current account, so a standard researcher replacement
completed the repository map. A separate critic lane could not be allocated
after the six bounded slots were used; the main agent performed the final
relevance and consistency review.

## Must-add / update-existing

### Papers and benchmarks

| Action | Item | Why it matters | Local anchor |
|---|---|---|---|
| must-add | MemFit | separates cheap append-only insertion from staged lexical/semantic/reranked retrieval | [`../papers/memfit-efficient-long-term-agentic-memory.md`](../papers/memfit-efficient-long-term-agentic-memory.md) |
| must-add | APDMem | makes hierarchical progressive disclosure and memory access cost explicit | [`../papers/apdmem-progressive-disclosure-memory.md`](../papers/apdmem-progressive-disclosure-memory.md) |
| must-add | Mem++ | preserves dated source documents and moves selection to read time for auditability | [`../papers/memplus-nondestructive-memory.md`](../papers/memplus-nondestructive-memory.md) |
| must-add | Interpreting at Write Time | shows that write-time goal conditioning is a memory policy surface | [`../papers/interpreting-write-time-multi-goal-memory.md`](../papers/interpreting-write-time-multi-goal-memory.md) |
| must-add | MemCodex | treats adaptive memory programs as persistent, evaluable policy artifacts | [`../papers/memcodex-self-programming-hierarchical-memory.md`](../papers/memcodex-self-programming-hierarchical-memory.md) |
| must-add | Audience-Bound Persistent Memory | carries audience authorization through derivation, retrieval, and suppression | [`../papers/audience-bound-persistent-memory.md`](../papers/audience-bound-persistent-memory.md) |
| must-add | DyadMem | adds relationship-aware capture/update/recall/deletion protocol pressure | [`../benchmarks/dyadmem.md`](../benchmarks/dyadmem.md) |
| must-add | TAGGRAPH | controls graph retrieval comparisons against lexical and raw-input baselines | [`../benchmarks/taggraph.md`](../benchmarks/taggraph.md) |
| must-add | U-Fuzz | tests incorrect or unsafe use of persistent memory, not only successful recall | [`../benchmarks/ufuzz.md`](../benchmarks/ufuzz.md) |

### Products

| Action | Product | Verified delta | Local anchor |
|---|---|---|---|
| update-existing | Claude managed agents | self-hosted sandboxes can mount a memory store and sync worker changes | [`../products/claude-dreams.md`](../products/claude-dreams.md) |
| update-existing | Letta | dynamic workflows pass memory pointers to stateless workers; v0.34.x fixes and changes memory surfaces | [`../products/letta.md`](../products/letta.md) |
| update-existing | Hindsight | `v0.10.2` adds scope-aware consolidation, concise extraction controls, and API/store fixes | [`../products/hindsight.md`](../products/hindsight.md) |
| update-existing | OpenViking | `v0.4.23` adds recall/rerank, BM25, decay, compilation, extraction-rule, ACL, and session changes | [`../products/openviking.md`](../products/openviking.md) |

## Watchlist / adjacent / reject

| Decision | Item | Reason |
|---|---|---|
| watchlist | DriftTrap-Bench, `agent-memory-benchmarks`, Flux memory benchmark, AgentMemory, MemArena-Bench, Agent Memory Atlas | GitHub discovery signals with incomplete or vendor-affiliated protocol/result evidence |
| watchlist | Cognee `v1.6.2`, Honcho `v3.2.2`, Oracle memory announcement | official signals, but not enough new memory-specific detail for a note update |
| adjacent | GraphMemory, SourceLearn, AgentWebRec, GUI predictive-state memory | memory-adjacent structured/context or vertical-agent work rather than general durable user-agent memory |
| adjacent | MCP catalogs and generic agent frameworks | discovery only; catalog placement and stars cannot support quality or maturity claims |
| reject | `2609.00366` reported as “What Should an Agent Remember?” | direct arXiv page resolves to an unrelated “Counterfactual Fragility Certificates” paper; title/ID pairing is a source mismatch |
| source boundary | vendor release notes and GitHub activity | retained as product behavior or discovery evidence, never independent benchmark evidence |

## Source verification

| Source class | Checked | Result |
|---|---|---|
| arXiv direct pages | 2610.00872, 2610.02472, 2610.02002, 2610.02897, 2609.39765, 2609.36373, 2610.03020, 2609.38353, 2609.38275 | targeted pages accessible; title/date pairings verified except the separately rejected 2609.00366 mismatch |
| Official product releases | Anthropic, Letta, Hindsight `v0.10.2`, OpenViking `v0.4.23` | canonical release/blog pages accessible and dated |
| GitHub discovery | current benchmark repositories and harnesses | used only for watchlist discovery; no GitHub-only score promoted |
| Existing weekly branches | 2026-09-21 and 2026-09-28 branches | overlap checked before promotion; no duplicate entries added |

## Evidence boundaries

- New papers and benchmark notes are `seed`; paper-origin metrics are not
  independent reproductions.
- DyadMem, TAGGRAPH, and U-Fuzz are protocol records in the claims ledger;
  their paper-reported results are not normalized into a leaderboard.
- Product changes record official behavior only. Hindsight and OpenViking
  benchmark figures remain vendor or affiliated claims.
- GitHub/list/MCP sources remain discovery-only and do not support performance,
  quality, or maturity conclusions.

## Verification status

- Repository surface updates were applied across notes, indexes, landscape
  pages, signals, discovery log, claims ledger, README counts, and this radar.
- `git diff --check` and conflict-marker scanning are required before commit.
- `ruby scripts/verify_memory_refresh.rb` passes after a minimal Ruby 4
  compatibility fix that explicitly permits YAML `Date` values.

## Trend synthesis

- Memory systems are making write policy explicit: append-only admission,
  non-destructive source preservation, and goal-conditioned interpretation all
  separate write-time choices from retrieval.
- Retrieval is becoming cost- and structure-aware: progressive disclosure,
  graph-versus-lexical controls, and event-time decay expose different axes of
  quality and runtime behavior.
- Governance is moving into derived memory: audience scope and deletion/failure
  behavior are being tested as lifecycle properties, not only request filters.
- Product releases are tightening operational surfaces around memory stores,
  consolidation scope, reranking, compilation, and worker synchronization.

## Review notes

The connected surfaces now record 989 scraped papers plus six new seed paper
notes, 26 benchmark catalog rows, 40 product notes, and 39 product archives.
The final main-agent review found accepted additions and updates, so this run
should produce a ready PR rather than a no-change report.
