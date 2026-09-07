---
title: MemoryLACE — Memory Lifecycle-Aware Consolidation and Evidence Retrieval
arxiv_id: 2609.03201
source: arXiv:2609.03201
date: 2026-09
domain: lifecycle-memory
core_claim: |
  Long-term textual memory should explicitly model local evidence lifecycle
  relations such as merge, supersession, contradiction, provenance, and
  current-vs-historical evidence roles.
evidence_level: medium
code_available: check
license: check
memory_modules:
  - memorydiff-generator
  - retriever-reranker
  - semantic-dedup
status: seed
last_revised: 2026-09-07
urls:
  - https://arxiv.org/abs/2609.03201
---

# MemoryLACE(arXiv 2609.03201)

## Problem statement

The paper targets a recurring weakness in textual long-term memory systems:
repeated evidence, updates, historical states, and contradictions are often
stored as independent natural-language memories. Retrieval can then surface
related snippets without exposing how they support, supersede, or conflict with
each other.

## Core claim

MemoryLACE keeps atomic natural-language memories, but adds sparse lifecycle
relations such as merge, supersession, and contradiction. At retrieval time it
reconstructs relation-aware evidence units that expose current, historical,
supporting, and conflicting evidence for downstream reasoning.

The abstract reports results on BEAM and StructMemEval. Those numbers are
author-reported primary-paper evidence only; this seed note records the
lifecycle/provenance pressure, not an independently reproduced ranking.

## Decision relevance

- `memorydiff-generator`: merge/supersession/contradiction should be durable
  relations, not just overwritten text.
- `retriever-reranker`: evidence packets should preserve relation context and
  currentness.
- `semantic-dedup`: duplicate handling needs to keep provenance and role, not
  collapse all semantically similar statements.

## Caveats

本地笔记是 seed 质量。需要 full read 后确认 relation schema, BEAM/StructMemEval
setup, code availability, and whether lifecycle expansion increases write-path
cost.

## Sources

- arXiv:https://arxiv.org/abs/2609.03201

---

> *Ymem 项目对本笔记决策相关性的具体绑定见
> [`../docs/ymem-binding/relevance-index.md`](../docs/ymem-binding/relevance-index.md)。*
