---
title: Compact-Memory LLM Agents via Online Max-Member Clustering and Atom-Aware Packing
arxiv_id: 2609.04915
source: arXiv:2609.04915
date: 2026-09
domain: compact-memory
core_claim: |
  Under tight prompt budgets, memory quality depends on streaming merge rules
  and atom-aware packing, not only on retrieval recall or full-context
  availability.
evidence_level: medium
code_available: check
license: check
memory_modules:
  - semantic-dedup
  - retriever-reranker
  - evaluator-benchmark
status: seed
last_revised: 2026-09-07
urls:
  - https://arxiv.org/abs/2609.04915
---

# Compact-Memory LLM Agents(arXiv 2609.04915)

## Problem statement

Long-horizon agents often operate under prompt-budget, latency, and cost
constraints. This paper focuses on the compact-memory regime where full-context
prompting is not practical and where the memory system must preserve useful
evidence in a small context budget.

## Core claim

The paper proposes RSM-full, combining an online max-member merge rule with an
atom-aware grouped context packer. The abstract reports evaluations on
AMA-Bench and RealMem and frames the result as a quality-token Pareto point.
These results remain author-reported evidence until the full setup and code are
normalized.

## Decision relevance

- `semantic-dedup`: merge policy quality is a first-order design variable for
  compact memory.
- `retriever-reranker`: packing retrieved atoms into grouped evidence can matter
  as much as what was retrieved.
- `evaluator-benchmark`: cost-quality claims should report the token budget
  range where the method is actually competitive.

## Caveats

本地笔记是 seed 质量。需要 full read 后 confirm benchmark splits, statistical
testing, token accounting, baseline implementations, and code/data availability.

## Sources

- arXiv:https://arxiv.org/abs/2609.04915

---

> *Ymem 项目对本笔记决策相关性的具体绑定见
> [`../docs/ymem-binding/relevance-index.md`](../docs/ymem-binding/relevance-index.md)。*
