---
title: Memory in the Loop — In-Process Retrieval as Extended Working Memory for Language Agents
arxiv_id: 2607.05690
source: arXiv:2607.05690
date: 2026-07
domain: memory-systems
core_claim: |
  If retrieval is fast enough to run inside every observe-reason-act step, an
  in-process memory store can function as extended working memory rather than a
  once-per-turn external tool.
evidence_level: medium
code_available: check
license: check
memory_modules:
  - retriever-reranker
  - ingest-adapter
  - evaluator-benchmark
status: seed
last_revised: 2026-07-13
urls:
  - https://arxiv.org/abs/2607.05690
---

# Memory in the Loop(arXiv 2607.05690)

## Problem statement

Most language-agent memory stores are queried once per turn or managed as a
separate tool because networked retrieval adds latency. The paper asks what
changes when memory reads and writes can happen inside every agent step.

## Core claim

The paper frames in-process retrieval as extended working memory. It argues that
latency is a placement property: when the store is local enough to answer in
microseconds rather than cloud round trips, per-step memory access becomes a
different design regime. The reported experiments connect memory latency to
redundant agent actions under a fixed per-turn budget.

Reported latency and redundancy measurements are paper-origin claims. This seed
records the systems hypothesis, not an independent reproduction.

## Decision relevance

- `retriever-reranker`:retrieval placement and latency budget affect whether
  memory can participate in every reasoning step.
- `ingest-adapter`:in-loop write paths need consistency and overhead rules, not
  just a batch consolidation job.
- `evaluator-benchmark`:memory cost metrics should include step-level latency
  and behavioral side effects such as redundant actions.

## Caveats

This local note is seed quality. A full read should verify implementation,
hardware, memory-store design, model choices, and whether the extended-working
memory framing holds beyond the reported task setup.

## Sources

- arXiv:https://arxiv.org/abs/2607.05690

---

> *Ymem project-specific decision relevance is mapped in
> [`../docs/ymem-binding/relevance-index.md`](../docs/ymem-binding/relevance-index.md).*
