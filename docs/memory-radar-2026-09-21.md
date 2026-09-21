---
title: 2026-09 Memory Radar refresh
date: 2026-09-21
status: current-source-refresh
language: zh-CN
---

# 2026-09 Memory Radar refresh

本页记录 2026-09-21 的 weekly radar refresh。主 agent 从
`origin/main` commit `56dd272` 创建 `codex/weekly-memory-radar-2026-09-21`
分支，搜索窗口为 2026-09-15 至 2026-09-21；2026-09-14 的论文、产品和
benchmark delta 只作为去重上下文。

## 执行模型

| Lane | 角色 | 输出 |
|---|---|---|
| papers | bounded researcher | arXiv primary-source candidates and direct abstract checks |
| products | official-source researcher | official release pages for Hindsight, OpenViking, Mem0, TencentDB, and Cognee |
| GitHub/benchmarks | discovery researcher | benchmark, catalog, MCP, and sibling-list signals |
| repo-map | repository inspection | counts, connected surfaces, and duplicate risks |
| source-check | verifier | canonical URLs, dates, HTTP reachability, and source mismatches |
| relevance-review | critic | final promotion boundary and evidence-class challenge |

## Must-add / update-existing

### Papers

| Action | Item | Why it matters | Local anchor |
|---|---|---|---|
| must-add | MACE | adaptive procedural memory graphs connect support, conflict, repair, retrieval, and execution feedback | [`../papers/mace-memory-agent-co-evolution.md`](../papers/mace-memory-agent-co-evolution.md) |
| must-add | Latent neuro-symbolic long-term memory | query-conditioned latent memory nodes target distributed personalization evidence | [`../papers/latent-neuro-symbolic-long-term-memory.md`](../papers/latent-neuro-symbolic-long-term-memory.md) |
| must-add | Interactive Memory Learning | delayed rewards connect later conversational quality to earlier write and retrieval policy choices | [`../papers/interactive-memory-learning-long-term-conversations.md`](../papers/interactive-memory-learning-long-term-conversations.md) |
| must-add | ThinkFlow | probabilistic latent memory skills and test-time evolution target lifelong personalization | [`../papers/thinkflow-latent-memory.md`](../papers/thinkflow-latent-memory.md) |
| must-add | EchoPath | validated GUI trajectories become preconditioned, provenance-bearing callable memories | [`../papers/echopath-execution-replayable-memory-gui-agents.md`](../papers/echopath-execution-replayable-memory-gui-agents.md) |
| must-add | Semantic-TVM | local exact state and protected remote views connect memory utility with privacy exposure | [`../papers/semantic-tvm-trustworthy-virtual-memory.md`](../papers/semantic-tvm-trustworthy-virtual-memory.md) |

### Products

| Action | Product | Verified delta | Local anchor |
|---|---|---|---|
| update-existing | Hindsight | official `v0.10.0`: batched embeddings, tokenizer update, oversized-item retention, per-bank text search, transfer export, and coding-agent import fixes | [`../products/hindsight.md`](../products/hindsight.md) |
| update-existing | OpenViking | official `v0.4.21` / Python SDK `0.1.12`: Hermes and agent integrations, standalone Hermes provider, and storage/retrieval/MCP reliability work | [`../products/openviking.md`](../products/openviking.md) |

No new benchmark catalog row was promoted. No claims-ledger event was added.

## Watchlist / adjacent / reject

| Decision | Item | Reason |
|---|---|---|
| watchlist | LTM100 | GitHub discovery candidate for multi-user memory load and scalability; protocol needs primary-source review |
| watchlist | REVOKE | promising procedural-memory invalidation benchmark repository; paper/protocol provenance not yet verified |
| watchlist | MemCalib / ReliAgent Bench | benchmark repositories need canonical paper, task, data, and license verification |
| watchlist | recalld-benchmarks | affiliated benchmark harness; not independent evidence |
| watchlist | Spomory / starlogz / Spector | small MCP or project-memory implementations; maturity and canonical documentation need follow-up |
| watchlist | OWASP Agent Memory Guard | existing poisoning/security watchlist item with refreshed repository activity |
| watchlist | ReMe | relevant file-native memory integrations, but current delta needs a fuller source and paper cross-check |
| watchlist | Mem0 `v2.1.0`, TencentDB `v2.0.2-beta.2`, Cognee `v1.6.0` | official release signals were found, but no sufficiently isolated new memory semantic was verified for this run |
| watchlist | Collaborative Memory for Multi-Agent VLM Systems | primary paper is accessible, but the abstract is a foundation/design direction with limited evaluation detail |
| adjacent | CIPL, SVMemAgent, Agora, Cognitive Extensions, TrialAtlas, long-context/KV-cache/context-router systems | relevant memory pressure or architecture context, but not yet a general durable editable memory core |
| reject as performance evidence | GitHub stars, README numbers, list placement, vendor summaries, and affiliated benchmark numbers | discovery or vendor evidence only; none supports independent quality conclusions |

## Source mismatches and blockers

- Mem0 release discovery surfaced a `v3.2.0` candidate whose canonical listing
  points to `ts-v3.2.0`; the tag mismatch blocks promotion.
- The Cloudflare memory API candidate URL returned HTTP 404 and was not promoted.
- GitHub REST release API access was rate-limited with HTTP 403; direct HTML
  release pages were used for the accepted Hindsight and OpenViking behavior
  updates.
- arXiv API access timed out, but direct arXiv abstract pages for all six
  accepted papers returned HTTP 200.

## Evidence boundaries

- All six new paper notes are `seed`; no full PDF read, normalized score table,
  code/data audit, or independent reproduction was added.
- Paper-reported results in MACE, ThinkFlow, EchoPath, Semantic-TVM, and other
  abstracts remain paper-origin evidence.
- Hindsight and OpenViking changes are official product behavior signals, not
  independent benchmark evidence.
- GitHub, catalog, and sibling-list sources were used for discovery only.

## Trend synthesis

- **Memory policy is becoming adaptive**: MACE and Interactive Memory Learning
  move write, retrieval, presentation, and feedback into a coupled policy loop.
- **Latent state is re-entering the design space**: ThinkFlow and latent
  neuro-symbolic memory trade human-readable records for evolving internal
  representations, raising inspectability and deletion questions.
- **Procedural memory is becoming executable**: EchoPath treats validated
  experience as a callable asset with preconditions, provenance, and bounded
  repair.
- **Privacy is shifting to the memory view**: Semantic-TVM treats protected
  remote representations and later observations as part of the memory boundary.
- **Products continue to harden local and integration paths**: Hindsight and
  OpenViking releases emphasize ingestion, retention, provider integration,
  transfer, storage, and retrieval correctness.

## Review notes

The connected surfaces now record 989 scraped papers plus 13 manual 2026-09
paper/benchmark additions, 79 seed paper notes, 23 benchmark catalog rows, and
40 product notes. The final integration and review were performed by the main
agent after the bounded research, source-check, and relevance-review passes.
