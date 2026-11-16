---
title: 2026-11-16 Memory Radar refresh
date: 2026-11-16
status: weekly-refresh
evidence_class: maintainer_synthesis_or_inference
language: zh-CN
---

# 2026-11-16 Memory Radar refresh

本轮从 `origin/main` 的 `d786e4b` 创建 `codex/weekly-memory-radar-2026-11-16`。
范围是 2026-10-26 至 2026-11-16 的 primary papers、官方产品来源、GitHub/列表发现和
benchmark protocol。论文、产品和 benchmark 的结果仍分别保留 paper-origin、product-behavior
和 origin-protocol 证据边界。

## 1. Accepted additions

| decision | item | landing | evidence boundary |
|---|---|---|---|
| must-add | TrawMem | [`../papers/trawmem-task-oriented-workspaces.md`](../papers/trawmem-task-oriented-workspaces.md) | arXiv primary source; role-aware workspace claims are seed-level |
| must-add | Accept Changes, Reject Attacks | [`../papers/accept-changes-reject-attacks.md`](../papers/accept-changes-reject-attacks.md) | arXiv primary source; stale-fact and poisoning results remain paper-origin |
| must-add | SoMem | [`../papers/somem-self-organized-memory.md`](../papers/somem-self-organized-memory.md) | arXiv primary source; linked-document organization is recorded without duplicating its benchmark rows |
| must-add | DISCERN | [`../papers/discern-preserve-at-write.md`](../papers/discern-preserve-at-write.md) | arXiv primary source; ENT-310 and reported scores remain paper-origin |
| must-add | COLLABMEM | [`../benchmarks/collabmem.md`](../benchmarks/collabmem.md) | ACL primary source; origin protocol only |
| must-add | TimlMemBench | [`../benchmarks/timlmembench.md`](../benchmarks/timlmembench.md) | ACL primary source; origin protocol only |
| must-add | MemFail | [`../benchmarks/memfail.md`](../benchmarks/memfail.md) | ACL primary source; origin protocol only |
| must-add | WK-Drift | [`../benchmarks/wk-drift.md`](../benchmarks/wk-drift.md) | ACL primary source; origin protocol only |
| update-existing | Google Agent Platform Memory Bank | [`../products/google-memory-bank.md`](../products/google-memory-bank.md) | official release notes; lifecycle and retention behavior only |
| update-existing | Zep | [`../products/zep.md`](../products/zep.md) | official changelog; Agent Skills GA and access-control behavior only |
| update-existing | agentmemory | [`../products/agentmemory.md`](../products/agentmemory.md) | official release; release behavior only |
| must-add | JiuwenMemory | [`../products/jiuwen-memory.md`](../products/jiuwen-memory.md) | official repository/release; no quality or benchmark conclusion |

## 2. Watchlist

- Agent Memory Leaderboard Cycle 2, OmniMemEval, agent-memory-bench, Brain Memory,
  Counterparts, MemoryPilot, and Substrate plugins remain discovery or verification leads.
  Registry presence, stars, README prose, and self-reported scores were not promoted.
- Same Ranking, Different Winner is a useful benchmark-methodology signal, but its artifact
  and protocol need review before a catalog row.
- Microsoft Foundry, Tencent Cloud AppMemoryConfig, and Gemini consumer memory remain
  product-behavior watchlist items where reliable post-cutoff publication dates or full
  lifecycle evidence were not established.

## 3. Adjacent and rejected

- Cloudflare Codex harness persistence is durable session/execution state; it remains adjacent
  until semantic long-term user-memory behavior is shown.
- VibeMemBench is a useful coding-memory backfill lead but predates this weekly window.
- LongMemEval-V2, DolphinBench, MemSyco-Bench, and existing Ledger-QA/UMA identities were
  checked for duplication or date scope; no second catalog rows were added.
- Agent Memory as Recommendation was source-verified but excluded from this delta because the
  canonical arXiv submission is 2026-10-26 and the weekly cutoff is treated as post-cutoff for
  this refresh's new-item window. It remains a follow-up candidate.

## 4. Source mismatches and limits

- The canonical paper title for the existing UMA/Ledger-QA work is “Learning to Remember:
  End-to-End Training of Memory Agents for Long-Context Reasoning”; Ledger-QA remains its
  benchmark name. No duplicate paper was created.
- ACL Anthology pages expose month-level dates for several conference papers; this radar uses
  the published 2026-10 or 2026-11 metadata and does not infer exact online days.
- No full-paper reads, code/data/license audits, benchmark executions, independent reproductions,
  or full external-link crawl were performed.

## 5. Verification

- `ruby scripts/verify_memory_refresh.rb` — pending final staged-tree run.
- `git diff --check` and conflict-marker scan — pending final staged-tree run.
- Targeted GET checks completed for the promoted arXiv, ACL Anthology, Google release-note,
  Zep changelog, agentmemory release, and JiuwenMemory release URLs; all inspected primary
  pages were accessible during the source-check pass.

## 6. Counts

The connected surfaces move from 7 full + 109 seed paper notes to 7 full + 113 seed notes,
from 39 to 43 benchmark catalog rows, from 42 to 43 product notes, and from 41 to 42 product
source archives. The 989 paper and 534 PDF values remain the existing scrape/archive baselines.
