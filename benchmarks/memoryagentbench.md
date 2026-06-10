---
title: MemoryAgentBench — incremental multi-turn memory-agent evaluation
benchmark_id: memoryagentbench
name: MemoryAgentBench
aliases: []
status: seed
origin_type: paper_origin
origin_source: ../papers/memoryagentbench.md
first_public_date: 2026
domain: agent_task_memory
modality: text
task_grain: multi_turn_interaction
capability_axes:
  - accurate_retrieval
  - test_time_learning
  - long_range_understanding
  - selective_forgetting
dataset_size:
  qa_count: check
data_nature: check
metrics:
  - accuracy
judge_type: check
code_available: check
data_available: check
license: check
known_limitations:
  - local note is seed quality
canonical_sources:
  - ../papers/memoryagentbench.md
  - https://iclr.cc/virtual/2026/poster/10010781
confidence: medium
memory_modules:
  - evaluator-benchmark
  - retriever-reranker
  - dream-consolidator
last_revised: 2026-06-11
---

# MemoryAgentBench

## What It Measures

MemoryAgentBench decomposes memory-agent quality into four dimensions: accurate
retrieval, test-time learning, long-range understanding, and selective
forgetting. This makes it a useful organizing frame even before all protocol
details are promoted from seed to full.

## Dataset / Scale

The local note is seed quality and needs a full read before this benchmark can
support ImpactReport-grade evidence.

## Protocol

Each dimension corresponds to a different interaction pattern. This lets a
memory kernel distinguish retrieval failures from update, consolidation, or
forgetting failures.

## Metrics and Judging

Metrics and judging details are not yet normalized in this repo.

## Baselines and Reported Results

The claims ledger currently records survey and product-question usage, not
independent score comparisons.

## Validity / Contamination / License Caveats

Treat all details beyond the four capability axes as check until the source note
is upgraded.

## Comparability Notes

MemoryAgentBench is best used as a capability taxonomy for test planning until
the note is full.

## Related Papers

- [`../papers/memoryagentbench.md`](../papers/memoryagentbench.md)
- [`../papers/memory-for-autonomous-llm-agents-survey.md`](../papers/memory-for-autonomous-llm-agents-survey.md)

## Related Products

- [`../products/mem0.md`](../products/mem0.md)

## Impact Use

- Ready for ImpactReport: no, upgrade source note first.
- Recommended use: define evaluator-benchmark ability dimensions.
