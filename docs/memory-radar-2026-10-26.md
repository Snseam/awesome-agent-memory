---
title: 2026-10-26 Memory Radar refresh
date: 2026-10-26
status: current-source-refresh
language: zh-CN
---

# 2026-10-26 Memory Radar refresh

This weekly pass starts from `origin/main` at `56dd272`. It treats open weekly
PRs #33 and #34 as duplicate-risk context, not as merged evidence; their
accepted MemCode, MemComposer, MemCut, Bemula, Zep, and Graphiti material is
not re-imported here.

## Must-add / update-existing

| Action | Item | Primary source and decision relevance | Local anchor |
|---|---|---|---|
| must-add | MCCL | arXiv v1, submitted 2026-10-21, moves evaluation from recall toward retention-under-interference, adaptation, and transfer | [`../papers/mccl-memory-centric-continual-learning.md`](../papers/mccl-memory-centric-continual-learning.md) |
| must-add | FrontierMemory | Letta's official benchmark and Apache-2.0 repository test trajectory-derived memory against a same-agent no-memory control on downstream tasks | [`../benchmarks/frontiermemory.md`](../benchmarks/frontiermemory.md) |
| update-existing | Mem0 temporal controls | official 2026-10-20 guide documents event time, state selection, expiry, time-aware retrieval, replay reference time, decay, and history | [`../products/mem0.md`](../products/mem0.md) |

## Watchlist / adjacent / reject

| Decision | Item | Reason |
|---|---|---|
| watchlist | Graphiti v0.31.2 | official release includes memory-relevant fixes, but v0.31.0/v0.31.1 coverage is already in open PR #34; avoid conflicting partial re-import on an `origin/main` base |
| watchlist | UMA / Ledger-QA | a stale local stub now has an official EMNLP record, but a benchmark row needs a separate protocol/data review; do not conflate a paper upgrade with a new benchmark |
| adjacent | M-Plan | multi-agent planning with LTM/STM is not a first-class durable-memory contribution under this catalog boundary |
| adjacent | AEMAgent | official EMNLP paper is embodied/video-specific rather than general agent memory |
| reject as quality evidence | GitHub stars, topic/catalog rows, open Graphiti PRs | discovery signals only; they do not establish maturity, performance, or product behavior |

## Source verification

| Source | Result |
|---|---|
| [MCCL arXiv](https://arxiv.org/abs/2610.29357) | HTTP-accessible; canonical title, authors, 2026-10-21 submission date, and abstract checked |
| [FrontierMemory post](https://www.frontiermemory.com/blog/v1/) | HTTP-accessible official origin; protocol and affiliated leaderboard language checked |
| [FrontierMemory repository](https://github.com/letta-ai/frontiermemory) | HTTP-accessible; public Apache-2.0 code, 674-trajectory / 15-task shape, gated corpus, and no-memory control checked |
| [Mem0 temporal guide](https://mem0.ai/blog/managing-time-in-ai-memory) | HTTP-accessible official product page dated 2026-10-20; product behavior only |
| [Graphiti v0.31.2](https://github.com/getzep/graphiti/releases/tag/v0.31.2) | HTTP-accessible; held as watchlist to avoid overlap with open PR #34 |

## Evidence boundaries and known gaps

- MCCL is a seed preprint; no full-paper, code, data, license, or result-table
  normalization was performed.
- FrontierMemory is a Letta-origin protocol. Its public leaderboard is
  affiliated evidence, three APEX verifiers use an LLM judge, and the trajectory
  corpus is gated; no independent reproduction was added.
- Mem0's page supports documented product behavior, not independent claims about
  temporal correctness, forgetting, or retrieval quality.
- A full external link crawl, benchmark reproduction, and code/data audit remain
  out of scope for this weekly pass.
