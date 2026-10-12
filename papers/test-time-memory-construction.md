---
title: Test-Time Memory Construction
arxiv_id: 2610.13348
source: arXiv:2610.13348
date: 2026-10
domain: memory
core_claim: |
  Long-term memory construction can be deferred to inference time and tailored
  to the current query instead of precomputing one static memory store.
evidence_level: medium
code_available: check
data_available: check
license: check
memory_modules:
  - ingest-adapter
  - retriever-reranker
  - evaluator-benchmark
status: seed
last_revised: 2026-10-12
urls:
  - https://arxiv.org/abs/2610.13348
---

# Test-Time Memory Construction

## Summary

This paper proposes building task-specific memories at inference time. The
method is directly relevant to agent memory because it shifts part of the memory
write/selection policy from an always-on ingestion pipeline to a query-aware
runtime construction step.

## Method / Architecture

The reported setting evaluates query-specific memory building on long-term
memory QA benchmarks such as LoCoMo and LongMemEval. For this repository, the
main design signal is the separation between durable raw history and the memory
object constructed for a particular question.

## Evidence Boundary

This is a seed note from the arXiv primary page. Reported benchmark results are
paper-origin claims; code, data, license, and setup details still need a full
read before any architecture recommendation.

## Decision Relevance

- `ingest-adapter`: raw history may remain less interpreted until a query
  requires a specific memory construction pass.
- `retriever-reranker`: retrieval and memory construction become coupled.
- `evaluator-benchmark`: tests should measure whether query-conditioned memory
  construction closes evidence gaps without hiding write-path cost.

## Sources

- arXiv: https://arxiv.org/abs/2610.13348
