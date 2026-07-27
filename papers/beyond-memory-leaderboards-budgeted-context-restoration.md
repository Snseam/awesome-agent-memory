---
title: "Beyond Memory Leaderboards: Evaluating Scientific Memory as Budgeted Context Restoration"
arxiv_id: 2607.16848
source: arXiv:2607.16848
date: 2026-07
domain: memory_benchmark
core_claim: |
  Scientific memory systems should be evaluated as budgeted, modality-aware
  context restoration rather than unconstrained memory leaderboards, because
  retrieval budget, raw-text preservation, modality, and judge choice can change
  rankings.
evidence_level: medium
code_available: yes
license: check
memory_modules:
  - evaluator-benchmark
  - context-packer
  - retriever-reranker
status: seed
last_revised: 2026-07-27
urls:
  - https://arxiv.org/abs/2607.16848
  - https://gitlab.com/quantellence/research/scientific-recall-bench
  - https://huggingface.co/datasets/quantellence/srb-data
---

# Beyond Memory Leaderboards(arXiv 2607.16848)

## Problem statement

Research agents need to restore evidence from full scientific papers, but many
memory benchmarks mix retrieval budget, ingestion granularity, memory substrate,
and judge settings into a single leaderboard score.

## Core claim

The paper introduces scientific-memory evaluation as budgeted context
restoration and releases PAIM / PTr datasets plus a harness. Its reported
comparisons across Graphiti, Mem0, RAG variants, and Theoria are paper-origin
claims only; this seed note records the protocol pressure, not a product ranking.

## Decision relevance

- `evaluator-benchmark`:use budget-normalized retrieval and rubric audit before
  comparing memory architectures.
- `context-packer`:record retrieved-context volume as a first-class evaluation
  variable.
- `retriever-reranker`:sparse-dense hybrid retrieval may matter more than the
  memory product label in scientific-recall settings.

## Caveats

This is a seed note. Full read should verify dataset licenses, benchmark task
construction, judge calibration, and whether the released harness is usable.

## Sources

- arXiv:https://arxiv.org/abs/2607.16848
- Code:https://gitlab.com/quantellence/research/scientific-recall-bench
- Dataset:https://huggingface.co/datasets/quantellence/srb-data

---

> *Ymem 项目对本笔记决策相关性的具体绑定见
> [`../docs/ymem-binding/relevance-index.md`](../docs/ymem-binding/relevance-index.md)。*
