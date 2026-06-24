---
title: Fact-based memory vs long-context cost-performance benchmark
benchmark_id: fact-memory-vs-long-context
name: Fact-based memory vs long-context cost-performance
aliases:
  - Beyond the Context Window
  - Cost-Performance Analysis of Fact-Based Memory vs. Long-Context LLMs
status: candidate
origin_type: paper_origin
origin_source: ../papers/stubs/beyond-the-context-window-a-cost-performance-analysis-of.md
first_public_date: 2026-03
domain: memory_vs_long_context_tradeoff
modality: text
task_grain: persistent_agent_cost_accuracy_analysis
capability_axes:
  - memory_vs_context_cost
  - factual_recall
  - persona_consistency
  - cumulative_api_cost
dataset_size:
  benchmark_inputs: "LongMemEval, LoCoMo, PersonaMem-v2"
data_nature: derived_from_existing_benchmarks
metrics:
  - accuracy
  - cumulative_api_cost
  - break_even_turns
judge_type: inherited_from_source_benchmarks
code_available: check
data_available: check
license: check
known_limitations:
  - source is still a paper stub in this repo
  - compares one fact-based memory implementation against long-context inference
  - not a standalone memory capability benchmark
canonical_sources:
  - ../papers/stubs/beyond-the-context-window-a-cost-performance-analysis-of.md
  - https://arxiv.org/abs/2603.04814
confidence: low
memory_modules:
  - evaluator-benchmark
  - context-packer
  - retriever-reranker
last_revised: 2026-06-24
---

# Fact-based memory vs long-context cost-performance

## What It Measures

This candidate benchmark tracks the production trade-off between passing full
conversation history to a long-context LLM and maintaining a fact-based memory
system. It is useful because agent-memory systems need cost and accuracy
criteria, not only recall metrics.

## Dataset / Scale

The paper compares on LongMemEval, LoCoMo, and PersonaMem-v2. It also models
cumulative API cost over interaction turns.

## Protocol

The protocol compares a fact-based memory system against long-context inference
under persistent-agent workloads. It should be treated as a cost-performance
analysis framework rather than a standalone new dataset.

## Metrics and Judging

Metrics include factual recall accuracy, cumulative API cost, and reported
break-even turns. Judge details are inherited from the underlying benchmark
tasks and need source normalization.

## Baselines and Reported Results

The arXiv abstract reports that long-context GPT-5-mini has stronger factual
recall on LongMemEval and LoCoMo, while the memory system is competitive on
PersonaMem-v2; it also reports a cost break-even around ten turns at 100K
tokens. Treat these as source-paper claims until normalized.

## Validity / Contamination / License Caveats

- Candidate quality only.
- The comparison is implementation-specific and should not be generalized to all
  memory layers without reruns.
- API-pricing assumptions are time-sensitive.

## Comparability Notes

Use this row for cost/accuracy trade-off planning. Do not mix it into pure
memory-capability leaderboards.

## Related Papers

- [`../papers/stubs/beyond-the-context-window-a-cost-performance-analysis-of.md`](../papers/stubs/beyond-the-context-window-a-cost-performance-analysis-of.md)

## Related Products

- [`../products/mem0.md`](../products/mem0.md)

## Impact Use

- Ready for ImpactReport: no.
- Recommended use: evaluator lane for memory-vs-context economic trade-offs.
