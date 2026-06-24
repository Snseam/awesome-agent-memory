# Documentation map

This directory contains the concept layer for awesome-agent-memory. Use it to
decide what to read before opening the paper index or the product notes.

## Read first

1. [`agent-memory-survey.md`](agent-memory-survey.md) — living maintainer survey
   and the current synthesis of the field.
2. [`taxonomy.md`](taxonomy.md) — shared vocabulary for classifying agent memory
   systems and papers.
3. [`research-radar.md`](research-radar.md) — workflow for turning papers,
   products, and benchmark evidence into ResearchItems, ImpactReports,
   experiments, and ADRs.
4. [`weekly-memory-refresh-runbook.md`](weekly-memory-refresh-runbook.md) —
   Codex weekly refresh runbook for papers, products, GitHub discovery, and
   benchmarks.
5. [`memory-radar-2026-06.md`](memory-radar-2026-06.md) — latest current-source
   refresh across papers, products, GitHub projects, and reviewer decisions.
6. [`benchmarks-landscape.md`](benchmarks-landscape.md) — benchmark map by
   capability, usage type, and evidence independence.
7. [`products-landscape.md`](products-landscape.md) — product map by domain and
   audience.
8. [`product-architecture-diagrams.md`](product-architecture-diagrams.md) —
   architecture diagrams for the current memory product notes.
9. [`product-memory-architectures.md`](product-memory-architectures.md) —
   cross-product memory architecture patterns and comparison tables.

## Concept docs

| File | Purpose |
|---|---|
| [`agent-memory-survey.md`](agent-memory-survey.md) | Living survey for memory architectures, retrieval, consolidation, forgetting, and evaluation. |
| [`taxonomy.md`](taxonomy.md) | Cross-walk of external taxonomies and common memory-kernel responsibilities. |
| [`meta-surveys.md`](meta-surveys.md) | External survey index from late 2025 through 2026 H1. |
| [`signals.md`](signals.md) | Reverse-chronological release, comparison, and blog signal log. |
| [`benchmarks-landscape.md`](benchmarks-landscape.md) | Benchmark usage landscape split by raw mentions, eval uses, vendor claims, and independent evidence. |
| [`product-discovery-log.md`](product-discovery-log.md) | Multi-agent product discovery log with Tier A / Tier B / reject decisions. |
| [`product-memory-architectures.md`](product-memory-architectures.md) | Cross-product architecture patterns across memory OS, graph, MCP/local, platform-managed, and personal memory. |
| [`product-architecture-diagrams.md`](product-architecture-diagrams.md) | Mermaid architecture diagrams for product notes and public implementation patterns. |

## Research workflow

| File | Purpose |
|---|---|
| [`research-radar.md`](research-radar.md) | Generic Radar loop: paper/product/benchmark -> ResearchItem or BenchmarkItem -> ImpactReport -> sandbox -> ADR. |
| [`weekly-memory-refresh-runbook.md`](weekly-memory-refresh-runbook.md) | Weekly Codex automation contract for source search, subagent review, verification, and PR output. |
| [`memory-radar-2026-06.md`](memory-radar-2026-06.md) | 2026-06 current-source refresh with must-add, update-existing, watchlist, and reject decisions. |
| [`information-sources.md`](information-sources.md) | Source catalog for papers, products, communities, and zh-CN information channels. |
| [`related-work.md`](related-work.md) | Positioning against sibling agent-memory awesome-lists. |

## Product and project bindings

| File | Purpose |
|---|---|
| [`products-landscape.md`](products-landscape.md) | Agent-memory products grouped by domain and buyer/audience. |
| [`product-discovery-log.md`](product-discovery-log.md) | Evidence index and inclusion-boundary record for product-search runs. |
| [`ymem-binding/README.md`](ymem-binding/README.md) | Ymem-specific module names, stance, and radar bindings. Safe to skip if you only need the generic reading list. |

The detailed paper index lives outside this directory at
[`../papers/index.md`](../papers/index.md). Product notes live under
[`../products/`](../products/), with archived source-page snapshots in
[`../products/archives/`](../products/archives/). Benchmark protocol notes live
under [`../benchmarks/`](../benchmarks/), with usage events in
[`../benchmarks/claims/claims.yaml`](../benchmarks/claims/claims.yaml).
