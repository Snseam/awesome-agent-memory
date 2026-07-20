---
title: "Experience Memory Graph: One-Shot Error Correction for Agents"
arxiv_id: 2607.13884
source: arXiv:2607.13884
date: 2026-07
domain: memory
core_claim: |
  Failed and successful agent trajectories can be converted into an experience
  memory graph that retrieves graph-edit corrections for one-shot recovery.
evidence_level: medium
code_available: check
license: check
memory_modules:
  - ingest-adapter
  - retriever-reranker
  - memorydiff-generator
  - evaluator-benchmark
status: seed
last_revised: 2026-07-20
urls:
  - https://arxiv.org/abs/2607.13884
---

# Experience Memory Graph(arXiv 2607.13884)

## Problem statement

Reflection-style self-correction often requires repeated test-time trials and
stores task-specific lessons that may not transfer. Long-horizon agents need a
memory format that can encode how failed trajectories differ from successful
ones and retrieve a corrective action pattern without a new reflection loop.

## Core claim

Experience Memory Graph (EMG) converts failed exploration trajectories and
successful expert trajectories into directed action-decision graphs. It stores
common successful subgraphs and graph edit paths as memory, then retrieves the
relevant correction at test time. The seed note treats EMG as trajectory-memory
evidence, not as an independent benchmark claim.

## Decision relevance

- `memorydiff-generator`:graph edit paths are a concrete form of behavioral
  memory diff between failed and successful trajectories.
- `retriever-reranker`:retrieval over action-decision subgraphs is a stronger
  analogy for agent workflows than pure text similarity.
- `evaluator-benchmark`:ALFWorld / ScienceWorld results are useful only after
  the exact setup and baselines are checked.

## Caveats

本地笔记是 seed 质量。需要 full read 后确认 graph construction, training-time expert
trajectory assumptions, transfer scope, code/data availability, and whether the
method is memory-native or mainly a reflection replacement.

## Sources

- arXiv:https://arxiv.org/abs/2607.13884

---

> *Ymem 项目对本笔记决策相关性的具体绑定见
> [`../docs/ymem-binding/relevance-index.md`](../docs/ymem-binding/relevance-index.md)。*
