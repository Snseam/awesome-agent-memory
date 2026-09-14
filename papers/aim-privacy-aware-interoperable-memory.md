---
title: AIM: A Privacy-Aware Interoperable Memory Framework for Multi-Agent Multi-User LLM Systems
arxiv_id: 2609.12320
source: arXiv:2609.12320
date: 2026-09
domain: security-privacy
core_claim: |
  Multi-user agent memory needs explicit private versus shared visibility and
  interoperable operations for retrieval, creation, update, and deletion.
evidence_level: medium
code_available: check
data_available: check
license: check
memory_modules:
  - policy-privacy
  - ingest-adapter
  - retriever-reranker
  - evaluator-benchmark
status: seed
last_revised: 2026-09-14
urls:
  - https://arxiv.org/abs/2609.12320
---

# AIM

## Problem statement

Shared memory across users and agents creates a visibility problem: a memory
record may be useful to a team while remaining private to its owner. CRUD
operations need to preserve that boundary across interoperable clients.

## Core claim

AIM separates private and public/shared memory and proposes index-level access
controls for multi-agent, multi-user systems. Its evaluation introduces MUMBench,
which tests retrieval, creation, update, and deletion across four multi-user
domains.

The abstract reports visibility-classification and operation-accuracy figures
over repeated runs. These are paper-origin claims, not independent measurements.

## Decision relevance

- `policy-privacy`: visibility is an index and operation-level contract.
- `ingest-adapter`: interoperable clients need a stable write/update/delete
  surface.
- `retriever-reranker`: retrieval must enforce visibility before ranking.
- `evaluator-benchmark`: MUMBench adds a multi-user CRUD and privacy pressure
  missing from ordinary recall benchmarks.

## Caveats

This is a seed note. Full reading is needed to verify the access-control model,
domain construction, resource release, and behavior under revocation, sharing
changes, and cross-tenant deletion.

## Sources

- arXiv: https://arxiv.org/abs/2609.12320
- Related benchmark: [`MUMBench`](../benchmarks/mumbench.md)
