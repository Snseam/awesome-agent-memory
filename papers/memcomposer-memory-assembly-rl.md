---
title: MemComposer: Learning to Assemble Memories for LLM Agents via Reinforcement Learning
arxiv_id: 2610.21091
source: arXiv:2610.21091
date: 2026-10
domain: memory
core_claim: |
  Query-conditioned selection, ordering, and budget of retrieved memories can
  be optimized from complete-agent task-success feedback.
evidence_level: medium
code_available: check
data_available: check
license: check
memory_modules:
  - retriever-reranker
  - context-packer
  - evaluator-benchmark
status: seed
last_revised: 2026-10-19
urls:
  - https://arxiv.org/abs/2610.21091
---

# MemComposer: Learning to Assemble Memories for LLM Agents via Reinforcement Learning

## Summary

MemComposer jointly considers a query and retrieved candidates to select, order,
and size a memory context. Its ExPO training signal is downstream agent task
success rather than only similarity or an isolated retrieval metric.

## Evidence Boundary

The arXiv abstract reports results on three tau-squared-bench domains with
frozen executors, including token-use reductions. They are author-reported
primary-paper results, not an independently reproduced general policy.

## Decision Relevance

- `retriever-reranker`: useful retrieval need not equal useful final context;
  reranking should preserve a separate assembly decision.
- `context-packer`: ordering and context budget are explicit host-side policy
  surfaces, so the kernel must retain enough candidate/provenance data.
- `evaluator-benchmark`: complete-task feedback can reveal errors hidden by
  top-k relevance metrics.

## Caveats

This is a seed note. Full review must check the task domains, reward design,
training cost, transfer setup, and whether the claimed savings hold under
different memory stores.

## Sources

- arXiv: https://arxiv.org/abs/2610.21091
