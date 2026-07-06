---
title: A-TMA — Decoupling State-Aware Memory Failures in Long-Term Agent Memory
arxiv_id: 2607.01935
source: arXiv:2607.01935
date: 2026-07
domain: memory
core_claim: |
  Long-term agent memory should distinguish current, historical, and transition
  facts instead of letting old and current user-state records coexist as
  untyped "ghost memory" during retrieval and answer generation.
evidence_level: medium
code_available: check
license: check
memory_modules:
  - memorydiff-generator
  - retriever-reranker
  - evaluator-benchmark
status: seed
last_revised: 2026-07-06
urls:
  - https://arxiv.org/abs/2607.01935
---

# A-TMA(arXiv 2607.01935)

## Problem statement

A-TMA names a practical failure mode for personalized long-term memory:
superseded, current, and transition facts can all remain in the memory bank and
then get retrieved together. The paper calls this **ghost memory** and argues
that final QA accuracy can hide whether the failure happened in bank
maintenance, retrieval, or answer-time state resolution.

## Core claim

ATMA is an overlay for existing memory systems. It keeps superseded and
transition records, builds evidence packets for the query's requested state
view, and exposes explicit current / historical / transition labels to the QA
step. The paper introduces LoCoMo Temporal Plus (LTP) as a conflict-heavy
benchmark for these state-coordination failures.

Reported Graphiti+ATMA gains on LTP and LoCoMo are author-reported evidence
only. This seed note records the method and benchmark pressure, not an
independent result.

## Decision relevance

- `memorydiff-generator`:supersede / transition labels should be first-class
  diff outputs, not implicit overwrite side effects.
- `retriever-reranker`:retrieval should expose state role metadata, not only
  similarity.
- `evaluator-benchmark`:memory evaluation should split bank, retrieval, and
  answer-level failures instead of relying only on final QA.

## Caveats

本地笔记是 seed 质量。需要 full read 后确认 LTP construction, benchmark license,
host-memory assumptions, and code availability.

## Sources

- arXiv:https://arxiv.org/abs/2607.01935

---

> *Ymem 项目对本笔记决策相关性的具体绑定见
> [`../docs/ymem-binding/relevance-index.md`](../docs/ymem-binding/relevance-index.md)。*
