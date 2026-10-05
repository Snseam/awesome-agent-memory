---
title: Audience-Bound Persistent Memory
arxiv_id: 2609.36373
source: arXiv:2609.36373
date: 2026-09
domain: security-privacy
core_claim: |
  Persistent memory should carry audience authorization through derivation and
  retrieval so sharing and suppression fail closed across memory lifecycles.
evidence_level: medium
code_available: check
data_available: check
license: check
memory_modules:
  - policy-privacy
  - memorydiff-generator
  - retriever-reranker
  - evaluator-benchmark
status: seed
last_revised: 2026-10-05
urls:
  - https://arxiv.org/abs/2609.36373
---

# Audience-Bound Persistent Memory

## Summary

Audience-Bound Persistent Memory treats the intended audience of a memory as a
first-class lifecycle property. It covers authorization at creation, derived
memory propagation, retrieval suppression, and fail-closed behavior.

## Method / Architecture

The paper discusses audience labels and audience intersection for derived
memories, with both flat and graph-oriented designs. A frozen set of histories
is used to study whether audience constraints survive memory construction and
access.

## Evidence Boundary

The paper was first posted on 2026-09-28, at the boundary of this refresh
window. Its protocol and any reported results are paper-origin evidence; code,
data, and release terms remain unchecked.

## Decision Relevance

- `policy-privacy`: audience scope belongs in the record and in derived-memory
  provenance, not only in a request-time filter.
- `memorydiff-generator`: candidate merges and summaries must preserve or
  narrow audience scope.
- `retriever-reranker`: authorization should be applied before ranking and
  should fail closed when scope is ambiguous.

## Caveats

This is a seed note. The exact threat model, label algebra, revocation behavior,
and multi-tenant implementation details need a full read before adoption.

## Sources

- arXiv: https://arxiv.org/abs/2609.36373
