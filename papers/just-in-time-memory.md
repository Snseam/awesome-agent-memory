---
title: Just-in-Time Memory — Learning to Curate Task-Adaptive Memory for LLM Agents
arxiv_id: 2609.27334
source: arXiv:2609.27334
date: 2026-09
domain: read-time-memory-curation
core_claim: |
  Memory systems can retain raw trajectories and defer compact memory payload
  construction until read time, allowing the current task to train or guide a
  task-adaptive curator.
evidence_level: medium
code_available: check
license: check
memory_modules:
  - retriever-reranker
  - dream-consolidator
  - evaluator-benchmark
status: seed
last_revised: 2026-09-28
urls:
  - https://arxiv.org/abs/2609.27334
---

# Just-in-Time Memory(arXiv 2609.27334)

## Problem statement

Most agentic memory pipelines distill a completed trajectory into a fixed
reflection, workflow, skill, or strategy before the future query is known. That
write-time compression can discard information that later becomes useful.

## Core claim

Just-in-Time Memory keeps raw trajectories and synthesizes the compact memory
payload at read time for the current task. The abstract reports gains across
ALFWorld, WebShop, and tau2-bench against no-memory and write-time memory
baselines. Those numbers are paper-origin claims only.

## Decision relevance

- `retriever-reranker`: retrieval may need a synthesis step that is conditioned
  on the immediate task, not only a top-k memory list.
- `dream-consolidator`: consolidation can be delayed until read time when
  write-time summarization would be irreversible.
- `evaluator-benchmark`: comparisons should separate raw-trace retention,
  read-time curation, and trained curator effects.

## Caveats

本地笔记是 seed 质量。需要 full read 后确认 trajectory storage assumptions,
training signal, tau2-bench setup, cost/latency impact, and artifact
availability.

## Sources

- arXiv:https://arxiv.org/abs/2609.27334

---

> *Ymem 项目对本笔记决策相关性的具体绑定见
> [`../docs/ymem-binding/relevance-index.md`](../docs/ymem-binding/relevance-index.md)。*
