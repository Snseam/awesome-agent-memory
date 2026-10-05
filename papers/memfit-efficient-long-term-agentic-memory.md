---
title: MemFit: Efficient Long-Term Agentic Memory
arxiv_id: 2610.00872
source: arXiv:2610.00872
date: 2026-10
domain: memory
core_claim: |
  Long-term agent memory can use an append-only store with lightweight
  insertion and staged retrieval to reduce write-time and query-time overhead.
evidence_level: medium
code_available: check
data_available: check
license: check
memory_modules:
  - ingest-adapter
  - retriever-reranker
  - evaluator-benchmark
status: seed
last_revised: 2026-10-05
urls:
  - https://arxiv.org/abs/2610.00872
---

# MemFit

## Summary

MemFit presents an efficient long-term memory pipeline for agentic systems. The
paper describes append-only verbatim storage, LLM-free insertion, and staged
lexical, semantic, and cross-encoder retrieval. It also discusses text and
multimodal memory.

## Method / Architecture

The design separates cheap memory admission from more expensive retrieval
stages. This is a useful systems signal because it treats write-path cost,
candidate generation, and reranking as different controls rather than one
opaque memory call.

## Evidence Boundary

The paper reports experiments on LoCoMo, MemGallery, and LongMemEval-S. Those
results remain paper-origin claims; this repository does not normalize the
scores or treat them as independent reproductions.

## Decision Relevance

- `ingest-adapter`: an append-only, LLM-free write path is a concrete low-cost
  baseline for admission experiments.
- `retriever-reranker`: lexical, semantic, and cross-encoder stages expose
  useful ablations for latency-quality trade-offs.
- `evaluator-benchmark`: existing memory benchmarks can be used without
  implying that the pipeline is a new benchmark.

## Caveats

This is a seed note. Code, data, license, multimodal setup, and exact scoring
protocol need a full source read before implementation or performance claims.

## Sources

- arXiv: https://arxiv.org/abs/2610.00872
