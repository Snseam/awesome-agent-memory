---
title: MemUse — natural integration benchmark for conversational memory
benchmark_id: memuse
name: MemUse
aliases:
  - MemUse
status: seed
origin_type: paper_origin
origin_source: https://arxiv.org/abs/2608.24189
first_public_date: 2026-08
domain: conversational_memory
modality: text
task_grain: downstream_response_with_memory
capability_axes:
  - natural_memory_integration
  - direct_memory_qa
  - user_preference_use
data_nature: real_world_deployment_plus_benchmark
metrics:
  - response_quality_with_memory
  - direct_qa_accuracy
judge_type: check
code_available: yes
data_available: check
license: check
known_limitations:
  - seed note; four-month deployment design, benchmark release, and metrics need full read
canonical_sources:
  - https://arxiv.org/abs/2608.24189
confidence: medium
memory_modules:
  - evaluator-benchmark
  - retriever-reranker
last_revised: 2026-08-31
---

# MemUse

## What It Measures

MemUse separates direct memory question answering from natural integration of
remembered user information into assistant responses. That makes it useful for
product-facing conversational memory, where a correct retrieved fact can still
be used awkwardly or with the wrong salience.

## Protocol

The paper reports a four-month deployment and releases a benchmark for natural
memory use. The abstract says the task is not only whether the system can answer
questions about memory, but whether it can integrate memory into live
conversation. Full annotations, metrics, and judge details remain to be mapped.

## Baselines and Reported Results

No normalized scores are logged here. Reported benchmark results stay as
paper-origin evidence until the setup is extracted.

## Comparability Notes

Compare with LongMemEval and LoCoMo on task family, but not raw accuracy:
MemUse emphasizes conversational integration rather than direct retrieval QA
alone.

## Related Papers

- Paper:https://arxiv.org/abs/2608.24189

## Impact Use

- `evaluator-benchmark`:candidate benchmark for natural memory use.
- `retriever-reranker`:useful for evaluating whether retrieved memories improve output quality.
- Ready for ImpactReport:no, upgrade after full protocol read.
