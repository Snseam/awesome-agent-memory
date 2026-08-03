---
title: MemHarness: Memory Is Reconstructed, Not Replayed
arxiv_id: 2607.28272
source: arXiv:2607.28272
date: 2026-07
domain: retrieval
core_claim: |
  Retrieved experiences should be adapted to the current decision state instead
  of replayed verbatim. The paper frames memory retrieval as reconstruction
  across abstraction gaps between stored experience and current task state.
evidence_level: medium
code_available: check
license: check
memory_modules:
  - retriever-reranker
  - dream-consolidator
  - evaluator-benchmark
status: seed
last_revised: 2026-08-03
urls:
  - https://arxiv.org/abs/2607.28272
---

# MemHarness: Memory Is Reconstructed, Not Replayed

## Problem statement

Experience retrieval is often implemented as replay: fetch a prior trace and
inject it into context. The arXiv abstract argues that this can cause negative
transfer when the stored experience is abstract or mismatched to the current
state.

## Core claim

MemHarness treats useful memory as reconstructed for the current decision
situation. This makes it relevant to retrieval/reranking and consolidation
design, because memory usefulness depends on state alignment rather than only
semantic similarity.

## Decision relevance

- `retriever-reranker`:retrieval should test applicability to the current state,
  not only nearest-neighbor similarity.
- `dream-consolidator`:stored experiences may need abstracted, reusable forms
  that can be reconstructed rather than replayed.
- `evaluator-benchmark`:future tests should separate helpful transfer from
  harmful memory replay.

## Caveats

Seed quality only. Full task suite, baselines, and reported results are not
normalized in this repo.

## Sources

- arXiv:https://arxiv.org/abs/2607.28272

---

> *Ymem project binding: see
> [`../docs/ymem-binding/relevance-index.md`](../docs/ymem-binding/relevance-index.md).*
