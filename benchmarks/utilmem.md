---
title: UTILMEM — benchmarking evidence utilization in long-term conversational memory
benchmark_id: utilmem
name: UTILMEM
aliases:
  - UtilMem
  - UTILMEM
status: seed
origin_type: paper_origin
origin_source: https://arxiv.org/abs/2608.30508
first_public_date: 2026-08
domain: evidence_utilization
modality: text
task_grain: long_term_conversational_memory_use
capability_axes:
  - evidence_integration
  - implicit_memory_relevance
  - distractor_resistance
  - task_oriented_synthesis
data_nature: check
metrics:
  - memory_utilization
  - evidence_integration
  - distractor_resistance
judge_type: check
code_available: yes
data_available: check
license: check
known_limitations:
  - seed note; protocol, task counts, resources, and reported results need full read
canonical_sources:
  - https://arxiv.org/abs/2608.30508
confidence: medium
memory_modules:
  - evaluator-benchmark
  - retriever-reranker
last_revised: 2026-09-07
---

# UTILMEM

## What It Measures

UTILMEM evaluates memory utilization in long-term conversational memory: whether
a system can integrate distributed, implicit, and noisy evidence across extended
interaction histories into coherent task-oriented outputs.

## Protocol

The arXiv abstract describes 1,717 diagnostic instances across five domains.
The underexplored aspects are dense-history reasoning, implicitly relevant
memories, distributed-evidence synthesis, and resistance to semantically similar
distractors. Full task definitions, code/data license, judge setup, and scoring
need a deeper read.

## Baselines and Reported Results

No normalized scores are logged here. The source abstract reports system
comparisons, but these remain paper-origin evidence until setup details are
mapped into `claims/claims.yaml`.

## Comparability Notes

Compare UTILMEM with LongMemEval and LoCoMo on long-term conversational memory,
but do not reduce it to point factual recall. Its core pressure is answer-time
evidence integration after retrieval.

## Related Papers

- Paper:https://arxiv.org/abs/2608.30508

## Impact Use

- `evaluator-benchmark`:candidate benchmark for utilization of retrieved memory.
- `retriever-reranker`:useful for testing implicit evidence and distractor
  robustness.
- Ready for ImpactReport:no, upgrade after full protocol read.
