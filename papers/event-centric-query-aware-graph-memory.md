---
title: Event-Centric Memory with Query-Aware Graph Augmentation for Long-Term Conversational Agents
arxiv_id: 2610.11920
source: arXiv:2610.11920
date: 2026-10
domain: memory
core_claim: |
  Long-term conversational agents can improve recall and reasoning by indexing
  atomic events and building query-aware working-memory graphs.
evidence_level: medium
code_available: check
data_available: check
license: check
memory_modules:
  - retriever-reranker
  - semantic-dedup
  - evaluator-benchmark
status: seed
last_revised: 2026-10-12
urls:
  - https://arxiv.org/abs/2610.11920
---

# Event-Centric Query-Aware Graph Memory

## Summary

This paper uses event-indexed atomic memory and query-aware graph augmentation
for long-term conversational agents. The work is relevant because it treats the
working memory given to the agent as a dynamic graph trace, rather than a flat
list of recalled snippets.

## Method / Architecture

The reported architecture separates event memory from the compact graph used at
answer time. That division maps naturally to a durable event log plus
query-scoped reconstruction layer.

## Evidence Boundary

This is a seed note. Benchmark coverage is author-reported paper evidence; the
repository should not normalize scores or compare systems until the paper,
artifacts, and benchmark setup are read.

## Decision Relevance

- `retriever-reranker`: event-to-graph assembly is a candidate retrieval shape.
- `semantic-dedup`: event atomicity and graph augmentation can expose duplicate
  or conflicting event roles.
- `evaluator-benchmark`: six-benchmark claims need setup and metric checks
  before reuse.

## Sources

- arXiv: https://arxiv.org/abs/2610.11920
