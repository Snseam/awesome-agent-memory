---
title: AgentMemBench — long-term memory management strategies for conversational agents
benchmark_id: agentmembench
name: AgentMemBench
aliases:
  - AgentMemBench
status: seed
origin_type: paper_origin
origin_source: https://arxiv.org/abs/2608.00009
first_public_date: 2026-06
domain: conversational_memory_strategy_evaluation
modality: text
task_grain: multi_dataset_memory_strategy_comparison
capability_axes:
  - long_range_retrieval
  - answer_faithfulness
  - latency
  - memory_footprint
data_nature: public_datasets_reframed_for_memory_strategy_comparison
metrics:
  - recall_at_k
  - mrr
  - ndcg_at_k
  - answer_f1
  - faithfulness
  - memory_footprint
  - latency
judge_type: automatic_metrics_and_llm_judge
code_available: yes
data_available: check
license: check
known_limitations:
  - seed note; code, environment, dataset packaging, and single-author status need full review
canonical_sources:
  - https://arxiv.org/abs/2608.00009
confidence: medium
memory_modules:
  - evaluator-benchmark
  - retriever-reranker
last_revised: 2026-08-10
---

# AgentMemBench

## What It Measures

AgentMemBench compares long-term memory management strategies under a shared
conversational-agent harness. The arXiv abstract names in-context windowing,
external key-value store, graph-based episodic memory, compression-based
summarization, and web-augmented memory as compared strategies.

## Dataset / Scale

The source reports 491 annotated question turns across LoCoMo, MultiDoc2Dial,
and MSC. This seed has not independently checked the released artifacts or
whether all transformed tasks preserve the original dataset licenses.

## Protocol

The benchmark evaluates retrieval and answer quality together with memory
footprint and latency. The source says generation and judging use
Qwen2.5-7B-Instruct with deterministic decoding.

## Metrics and Judging

Metrics include Recall@k, MRR, nDCG@k, Answer F1, LLM-judge faithfulness,
memory footprint, and latency. These are protocol descriptors, not normalized
leaderboard rows in this repository.

## Baselines and Reported Results

Reported strategy comparisons, including EKV and published-system comparisons,
are author-reported paper-origin claims. They are useful for protocol design but
not independent product evidence.

## Validity / Contamination / License Caveats

The benchmark reuses public datasets and reports released artifacts, but this
seed has not checked exact splits, transformation scripts, licenses, or result
reproducibility.

## Comparability Notes

AgentMemBench is directly relevant to memory-strategy comparisons because it
tracks quality, footprint, and latency together. It should not be collapsed with
MemoryAgentBench; the names are similar but the local benchmark IDs and origin
papers differ.

## Related Papers

- Paper:https://arxiv.org/abs/2608.00009

## Impact Use

- `evaluator-benchmark`:candidate protocol for strategy-level memory quality /
  latency comparisons.
- `retriever-reranker`:useful for measuring retrieval trade-offs under shared
  downstream generation.
- Ready for ImpactReport:no, upgrade after full protocol and artifact review.
