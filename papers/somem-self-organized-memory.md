---
title: Can LLM Agents Organize Their Own Memory?
arxiv_id: 2611.11929
source: arXiv:2611.11929
date: 2026-11-09
domain: memory
core_claim: |
  SoMem stores linked documents, lets an agent revise topic organization, and
  preserves links from summaries to source interactions for later inspection.
evidence_level: medium
code_available: check
data_available: check
license: check
memory_modules:
  - dream-consolidator
  - memorydiff-generator
  - retriever-reranker
status: seed
last_revised: 2026-11-16
urls:
  - https://arxiv.org/abs/2611.11929
---

# Can LLM Agents Organize Their Own Memory?

## Summary

The paper introduces self-organized memory (SoMem), a linked-document memory
framework. The agent decides what to summarize, how to group topics, and when
to revise them; summaries retain links to source interactions. Runtime views
cover temporal, relational, and recent-memory access.

## Evidence Boundary

The storage and organization behavior is described by the primary arXiv source.
Its benchmark results and comparisons remain paper-origin evidence and are not
duplicated as new benchmark rows here.

## Decision Relevance

- `dream-consolidator`: organization and revision are explicit consolidation
  operations rather than an opaque embedding update.
- `memorydiff-generator`: source links make derived summaries auditable.
- `retriever-reranker`: query-time navigation can inspect original evidence
  when a summary is insufficient.

## Caveats

Full-paper, repository, dataset, license, and independent reproduction review
remain open.

## Sources

- arXiv: https://arxiv.org/abs/2611.11929
