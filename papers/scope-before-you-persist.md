---
title: Scope Before You Persist — Preventing Cross-Family Interference in Agent Memory
arxiv_id: 2609.29144
source: arXiv:2609.29144
date: 2026-09
domain: scoped-persistent-memory
core_claim: |
  Persistent skill memories should be retrieved only inside the task-family
  scope that certified the edit; otherwise locally valid memories can harm
  unrelated task families.
evidence_level: medium
code_available: check
license: check
memory_modules:
  - policy-privacy
  - retriever-reranker
  - memorydiff-generator
status: seed
last_revised: 2026-09-28
urls:
  - https://arxiv.org/abs/2609.29144
---

# Scope Before You Persist(arXiv 2609.29144)

## Problem statement

The paper studies a failure mode in persistent agent memory for recurring
code-repair task families: a memory or skill edit can be supported by evidence
inside one family, but become harmful when retrieved globally for unrelated
families.

## Core claim

The paper separates certification from retrieval authorization. Orthogonal
Regression Control decides whether an edit is supported, while the retrieval
scope decides where that edit may be reused. The abstract reports that matching
retrieval scope to the originating family removes harmful deployments in its
fixed-intervention study and improves trajectory utility in randomized streams.

These values are paper-origin claims. This seed note records the scope-control
principle, not an independently reproduced ranking.

## Decision relevance

- `policy-privacy`: scope is not only an access-control label; it is part of
  the evidence authorization boundary for memory reuse.
- `retriever-reranker`: retrieval should carry provenance and certification
  scope, not just semantic similarity.
- `memorydiff-generator`: accepted edits need deployment constraints alongside
  their diff payload.

## Caveats

本地笔记是 seed 质量。需要 full read 后确认 ProcStream-RSI construction, ORC
gate details, statistical setup, and whether the scope principle generalizes
beyond code-repair streams.

## Sources

- arXiv:https://arxiv.org/abs/2609.29144

---

> *Ymem 项目对本笔记决策相关性的具体绑定见
> [`../docs/ymem-binding/relevance-index.md`](../docs/ymem-binding/relevance-index.md)。*
