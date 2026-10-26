---
title: TAGGRAPH — controlled graph retrieval for agent memory
benchmark_id: taggraph
name: TAGGRAPH
aliases:
  - TAGGRAPH
status: seed
origin_type: paper_origin
origin_source: https://arxiv.org/abs/2609.38353
first_public_date: 2026-09-29
domain: graph_memory_retrieval
modality: text
task_grain: persistent_history_retrieval
capability_axes:
  - graph_retrieval
  - extraction_quality
  - baseline_control
dataset_size: paper-defined conversational memory sets including LongMemEval-S and ATANT
data_nature: paper-defined_persistent_memory_histories
metrics:
  - retrieval_comparison
  - mean_reciprocal_rank
judge_type: check
code_available: check
data_available: check
license: check
known_limitations:
  - seed note; paper-origin protocol only
  - exact data sizes, release artifacts, and normalization need verification
canonical_sources:
  - https://arxiv.org/abs/2609.38353
confidence: medium
memory_modules:
  - evaluator-benchmark
  - retriever-reranker
last_revised: 2026-10-05
---

# TAGGRAPH

## What It Measures

TAGGRAPH studies graph-based retrieval for persistent agent memory while
controlling the underlying graph and comparing against lexical and raw-input
baselines.

## Protocol

The paper uses tagged extraction and graph retrieval on conversational memory
tasks, including LongMemEval-S and ATANT. The controlled base graph is intended
to separate graph retrieval effects from unrelated data or indexing changes.

## Metrics and Judging

Reported measures include retrieval comparisons and mean reciprocal rank. The
paper's exact split and extraction implementation need a full read.

## Evidence Boundary

This is a paper-origin benchmark protocol. The paper's comparisons are not
independent reproductions and are not normalized into a leaderboard here.

## Comparability Notes

TAGGRAPH is useful for graph-versus-lexical retrieval analysis, but it should
not be read as evidence that graph memory is universally superior.

## Sources

- arXiv: https://arxiv.org/abs/2609.38353
