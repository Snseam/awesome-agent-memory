---
title: Making Prospective Memory SLM-Shaped — Typed Intention Stores for Small-Model Agents
arxiv_id: 2609.01272
source: arXiv:2609.01272
date: 2026-09
domain: prospective-memory
core_claim: |
  Prospective memory for agents can be treated as typed intention-state
  tracking, with lifecycle logic in code and scoped language work delegated to
  small models.
evidence_level: medium
code_available: check
license: check
memory_modules:
  - ingest-adapter
  - memorydiff-generator
  - evaluator-benchmark
status: seed
last_revised: 2026-09-07
urls:
  - https://arxiv.org/abs/2609.01272
---

# Prospective Memory SLM-Shaped(arXiv 2609.01272)

## Problem statement

The paper focuses on prospective memory: carrying out a deferred intention when
the right future cue appears while unrelated work continues. It argues that this
is closer to schema-constrained state tracking than open-ended reasoning.

## Core claim

The proposed Prospective Intention Store(PIS) keeps typed lifecycle logic in
code and leaves bounded language work to the model. The arXiv abstract reports
large gains on PM-Bench, especially for small models. Those scores remain
author-reported paper evidence; this seed note records the design pressure
rather than a normalized benchmark claim.

## Decision relevance

- `memorydiff-generator`: future intentions need explicit status, cue, scope,
  and completion transitions.
- `ingest-adapter`: not all memory is retrospective fact storage; some records
  are pending commitments that require lifecycle handling.
- `evaluator-benchmark`: PM-Bench-style tasks should be tracked as a prospective
  memory benchmark lane once the origin source is normalized in this repo.

## Caveats

PM-Bench is already covered by an open August weekly PR and is not duplicated in
this branch. Before using PIS as an implementation recommendation, full-read the
benchmark origin, task schema, and released code/data.

## Sources

- arXiv:https://arxiv.org/abs/2609.01272

---

> *Ymem 项目对本笔记决策相关性的具体绑定见
> [`../docs/ymem-binding/relevance-index.md`](../docs/ymem-binding/relevance-index.md)。*
