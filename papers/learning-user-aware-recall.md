---
title: Learning User-Aware Recall — Personalized Retrieval in Long-Term Conversational Memory
arxiv_id: 2607.00017
source: arXiv:2607.00017
date: 2026-07
domain: memory
core_claim: |
  Long-term conversational memory retrieval should use explicit user-profile
  priors and retrieval-oriented query rewriting instead of relying only on
  query-centered similarity or fixed ranking rules.
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
  - https://arxiv.org/abs/2607.00017
---

# Learning User-Aware Recall(arXiv 2607.00017)

## Problem statement

Long-term conversational agents need to retrieve the right remembered evidence
for the right user. The paper argues that many memory-augmented agents still
rank memories mostly by query similarity or fixed rules, leaving stable user
attributes, preferences, and relationships underused during recall.

## Core claim

The paper proposes Profile-guided Personalized Retrieval Optimization(PPRO).
PPRO builds episodic and semantic memory banks from dialogue history, derives a
user profile from accumulated memories, and uses that profile as an explicit
prior in memory ranking. It also trains a query rewriter with Group Relative
Policy Optimization while keeping the memory banks and answer model fixed.

Reported LoCoMo and LongMemEval-S gains are paper-origin claims. This seed note
records the retrieval-control design pressure, not an independent reproduction.

## Decision relevance

- `retriever-reranker`:profile-conditioned ranking is a first-class retrieval
  axis separate from semantic similarity.
- `ingest-adapter`:episodic and semantic banks need enough profile structure to
  support personalized recall without collapsing everything into flat facts.
- `evaluator-benchmark`:retrieval quality and downstream answer quality should
  both be measured when optimizing memory recall.

## Caveats

This local note is seed quality. A full read should verify code and data
availability, user-profile construction, privacy assumptions, and whether the
reported LongMemEval-S setup is directly comparable to existing memory baselines.

## Sources

- arXiv:https://arxiv.org/abs/2607.00017

---

> *Ymem project-specific decision relevance is mapped in
> [`../docs/ymem-binding/relevance-index.md`](../docs/ymem-binding/relevance-index.md).*
