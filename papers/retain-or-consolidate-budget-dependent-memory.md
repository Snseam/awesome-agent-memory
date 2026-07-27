---
title: Retain or Consolidate? Budget-Dependent Operator Selection for Language Agent Memory
arxiv_id: 2607.17545
source: arXiv:2607.17545
date: 2026-07
domain: memory
core_claim: |
  Agent memory should choose between raw retention and consolidation according
  to retrieval budget pressure, because compression can recover omitted
  evidence under tight budgets while harming details that already fit.
evidence_level: medium
code_available: check
license: check
memory_modules:
  - dream-consolidator
  - retriever-reranker
  - context-packer
  - evaluator-benchmark
status: seed
last_revised: 2026-07-27
urls:
  - https://arxiv.org/abs/2607.17545
---

# Retain or Consolidate?(arXiv 2607.17545)

## Problem statement

Long-term memory systems often choose a fixed policy:keep raw records and
retrieve them later, or consolidate records into shorter abstractions. This
paper frames that as a budget-dependent operator-selection problem rather than
a global design preference.

## Core claim

The paper decomposes consolidation utility into coverage over evidence omitted
by retention and replacement harm over raw evidence that already fits. Its OAS
mechanism estimates when to retain, merge, abstract, or rewrite before
generation. Reported LongMemEval and LoCoMo gains are paper-origin claims only.

## Decision relevance

- `context-packer`:memory budget should be an explicit input to memory operator
  choice.
- `dream-consolidator`:merge / abstract / rewrite are separate operators with
  different failure modes.
- `evaluator-benchmark`:memory-vs-retention comparisons need tight-budget and
  loose-budget slices.

## Caveats

This is a seed note. Full read should verify OAS features, harm calibration,
dataset splits, and whether code or prompts are available.

## Sources

- arXiv:https://arxiv.org/abs/2607.17545

---

> *Ymem 项目对本笔记决策相关性的具体绑定见
> [`../docs/ymem-binding/relevance-index.md`](../docs/ymem-binding/relevance-index.md)。*
