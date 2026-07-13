---
title: From Passive Retrieval to Active Memory Navigation — Learning to Use Memory as a Structured Action Space
arxiv_id: 2607.05794
source: arXiv:2607.05794
date: 2026-07
domain: memory
core_claim: |
  Long-term user memory can be exposed as a structured action space with
  navigable granularity, provenance, and learned memory-tool selection rather
  than as passive retrieved context.
evidence_level: medium
code_available: check
license: check
memory_modules:
  - retriever-reranker
  - semantic-dedup
  - evaluator-benchmark
status: seed
last_revised: 2026-07-13
urls:
  - https://arxiv.org/abs/2607.05794
---

# From Passive Retrieval to Active Memory Navigation(arXiv 2607.05794)

## Problem statement

Many memory systems preselect evidence and pass it to the answer model. The
paper argues that this leaves the agent as a passive memory consumer and hides
which memory granularity should be inspected for a given user query.

## Core claim

NapMem organizes user history into a linked multi-granularity memory pyramid:
raw conversations, typed memory records, topic tracks, and user profiles are
connected through provenance relations and exposed through memory tools. The
agent learns to select among memory tools and granularities before answering.

Reported PersonaMem-v2, LongMemEval, and LoCoMo results are paper-origin
claims. This seed note records the memory-as-action-space design pressure, not
an independent benchmark conclusion.

## Decision relevance

- `retriever-reranker`:retrieval should sometimes be a learned navigation policy
  over memory levels, not only a static top-k result.
- `semantic-dedup`:multi-granularity memory needs provenance links between raw
  conversations, records, topics, and profiles.
- `evaluator-benchmark`:tool-use behavior and granularity choices are measurable
  components of memory evaluation.

## Caveats

This local note is seed quality. A full read should verify code/data
availability, memory pyramid construction, RL setup, and whether benchmark
comparisons isolate memory navigation from model/backbone differences.

## Sources

- arXiv:https://arxiv.org/abs/2607.05794

---

> *Ymem project-specific decision relevance is mapped in
> [`../docs/ymem-binding/relevance-index.md`](../docs/ymem-binding/relevance-index.md).*
