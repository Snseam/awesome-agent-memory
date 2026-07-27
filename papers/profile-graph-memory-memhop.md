---
title: Profile-Graph Memory for LLM Agents — Implicit Cross-Entity Traversal through Narrative Profiles
arxiv_id: 2607.19359
source: arXiv:2607.19359
date: 2026-06
first_seen: 2026-07
date_note: "arXiv page dateline says submitted 2026-06-01; identifier is 2607.*"
domain: memory
core_claim: |
  Narrative profiles can provide an implicit traversal layer for multi-hop
  memory questions, while compression residuals preserve dates, quantities, and
  named items for precise recall.
evidence_level: medium
code_available: yes
license: check
memory_modules:
  - retriever-reranker
  - semantic-dedup
  - evaluator-benchmark
status: seed
last_revised: 2026-07-27
urls:
  - https://arxiv.org/abs/2607.19359
  - https://github.com/ShengtongZhu/ProGraph
---

# Profile-Graph Memory / MemHop(arXiv 2607.19359)

## Problem statement

Many long-term memory benchmarks emphasize single-hop recall. This paper argues
that agents also need multi-hop association over people, places, and events
spread across sessions.

## Core claim

The paper introduces MemHop, a multi-hop memory benchmark, and ProGraph, a
profile-graph memory architecture that uses profile expansion plus compression
residuals. Reported MemHop and LoCoMo numbers are paper-origin claims only.

## Decision relevance

- `retriever-reranker`:profile expansion is a lightweight alternative to full
  explicit graph construction for some multi-hop memory queries.
- `semantic-dedup`:compression residuals are a useful guard against losing exact
  quantities and dates.
- `evaluator-benchmark`:MemHop should be considered for a future benchmark note
  after full source review.

## Caveats

This is a seed note, not yet a benchmark catalog promotion. Full read should
verify MemHop data, license, hop annotations, and baseline comparability.
The note date follows the arXiv page dateline; this was first added to the local
radar in 2026-07 despite the June submission date.

## Sources

- arXiv:https://arxiv.org/abs/2607.19359
- Code:https://github.com/ShengtongZhu/ProGraph

---

> *Ymem 项目对本笔记决策相关性的具体绑定见
> [`../docs/ymem-binding/relevance-index.md`](../docs/ymem-binding/relevance-index.md)。*
