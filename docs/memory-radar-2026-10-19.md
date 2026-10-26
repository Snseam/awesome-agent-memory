---
title: 2026-10-19 Memory Radar refresh
date: 2026-10-19
status: current-source-refresh
language: zh-CN
---

# 2026-10-19 Memory Radar refresh

> Historical weekly snapshot. The [2026-10-26 consolidation](memory-radar-consolidation-2026-10-26.md) records the combined inventory and later resolutions; counts and watchlist decisions below describe this original pass.

This weekly refresh started from `origin/main` commit `56dd272` on
`codex/weekly-memory-radar-2026-10-19`. Pending weekly branches were used only
for duplicate checks and were not re-imported.

## Must-add / update-existing

| Action | Item | Evidence decision | Local anchor |
|---|---|---|---|
| must-add | MemCode | Primary preprint directly separates atomic online writes, discrete associative retrieval, and asynchronous consolidation; author-reported results remain seed evidence. | [`../papers/memcode-discrete-semantic-agent-memory.md`](../papers/memcode-discrete-semantic-agent-memory.md) |
| must-add | MemComposer | Primary preprint makes query-time selection/order/budget of retrieved memories a task-feedback policy surface. | [`../papers/memcomposer-memory-assembly-rl.md`](../papers/memcomposer-memory-assembly-rl.md) |
| must-add | MemCut | Primary preprint directly tests residual recovery after a forget request, not only normal memory retrieval. | [`../papers/memcut-residual-forgetting.md`](../papers/memcut-residual-forgetting.md) |
| must-add | Bemula | Benchmark origin directly targets precise user-requested memory unlearning; its paper results are not independently reproduced. | [`../benchmarks/bemula.md`](../benchmarks/bemula.md) |
| must-add | MemCut benchmark | Benchmark origin distinguishes native recovery from residual recovery through surviving evidence trails. | [`../benchmarks/memcut.md`](../benchmarks/memcut.md) |
| update-existing | Zep | Official v4 GA and data-integrity entries add API/MCP navigation, traces, retry identity, scoped search, and safer entity handling. | [`../products/zep.md`](../products/zep.md) |
| update-existing | Graphiti | Official v0.31.0 adds MCP SDK 2.x, group-scoped routing, LLMRuntime routing, and upstream extraction/dedup/temporal fixes. | [`../products/graphiti.md`](../products/graphiti.md) |

## Watchlist, adjacent, and reject

| Decision | Item | Reason |
|---|---|---|
| watchlist | Beyond Downstream QA / FEB-30, Beyond Marginal Influence / JointCoreBench, and persistent-assistant benchmark papers | Direct primary preprints, but their artifact schemas, licenses, and overlap with existing evaluation protocols need a separate full protocol pass before catalog promotion. |
| watchlist | Memory Echo, TEM, MemScope, evidence-compilation, and evidence-sufficiency preprints | Relevant direct papers, but source-only review has not yet established distinct mechanism/artifact value beyond the current seed corpus. |
| adjacent | Multimodal filesystem memory, GUI-memory modality selection, and clinical memory systems | Embodied, GUI, or vertical constraints prevent a general durable-agent-memory conclusion. |
| adjacent | LangGraph checkpoint pruning and Gemini long-context releases | Persistence/checkpoint or context-window signals are not a verified long-term-memory product update. |
| reject | SAFE-Mem arXiv candidate | Candidate ID returned 404 during source verification; no source-mismatched note was promoted. |
| reject as evidence | GitHub topics, awesome lists, MCP catalogs, stars, and community summaries | Useful discovery only; cannot support quality, maturity, or benchmark conclusions. |

## Source verification

- Direct arXiv checks verified title, date, and accessibility for 2610.18052,
  2610.19472, 2610.21091, 2610.21405, 2610.22209, and 2610.23266.
- Official Zep changelog pages dated 2026-10-12 and 2026-10-14 and the official
  Graphiti v0.31.0 release were used only as product-behavior evidence.
- Pending 2026-09-28, 2026-10-05, and 2026-10-12 weekly branches were searched
  for duplicate titles and IDs before promotion.

## Evidence boundaries and known gaps

- This run did not perform full-paper, code, dataset, license, or local-PDF
  review; every new paper and benchmark record is seed quality.
- Benchmark origin results remain author-reported and are not an independent
  ranking of memory products.
- No vendor performance claim, GitHub-only signal, or generic long-context
  feature was promoted as durable-memory evidence.
