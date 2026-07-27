---
title: Memora — long-term memory benchmark for personalized agents
benchmark_id: memora
name: Memora
aliases:
  - Memora
  - FAMA
status: seed
origin_type: paper_origin
origin_source: https://arxiv.org/abs/2604.20006
first_public_date: 2026-04
domain: personalized_agent_memory
modality: text
task_grain: multi_session_personalization
capability_axes:
  - recall
  - reasoning
  - recommending
  - forgetting
dataset_size:
  question_count: check
data_nature: weeks-to-months persona conversations
metrics:
  - FAMA
  - task_accuracy
judge_type: yes/no sub-question judge
code_available: yes
data_available: yes
license: Apache-2.0 repository; dataset license check
known_limitations:
  - seed note; dataset generation, human validation, and judge calibration need full read
canonical_sources:
  - https://arxiv.org/abs/2604.20006
  - https://github.com/geniesinc/Memora
confidence: medium
memory_modules:
  - evaluator-benchmark
  - memorydiff-generator
last_revised: 2026-07-27
---

# Memora

## What It Measures

Memora evaluates long-term memory for personalized agents across conversations
spanning weeks to months. It combines remembering, reasoning, and recommending
tasks with explicit penalties for using obsolete or invalidated memory.

## Dataset / Scale

The official repository releases dataset and evaluation code. The README
describes persona-period datasets and question blocks for weekly, monthly, and
quarterly horizons. This seed note does not normalize dataset counts yet.

## Protocol

The paper introduces Forgetting-Aware Memory Accuracy(FAMA), which combines
memory-presence and forgetting-absence checks so agents get credit for recalling
valid memory and avoiding deleted or superseded memory.

## Metrics and Judging

The repository describes yes/no sub-questions tagged by memory presence or
forgetting absence. Full judging details need a paper read before score claims
are used.

## Baselines and Reported Results

No normalized result rows are imported. The official README table is paper-origin
evidence and should not be treated as independent reproduction.

## Validity / Contamination / License Caveats

The repo license is Apache-2.0, but dataset redistribution terms still need a
full check. Human evaluation and automated grounding checks should be verified
before using Memora in an ImpactReport.

## Comparability Notes

Memora is most comparable to personalization and evolving-profile benchmarks,
not to million-token scale benchmarks or generic long-context retrieval tasks.

## Related Papers

- Paper:https://arxiv.org/abs/2604.20006
- Repository:https://github.com/geniesinc/Memora

## Related Products

- Use as future pressure against products that claim personalized long-term
  memory with update/delete semantics.

## Impact Use

- `evaluator-benchmark` relevance:adds an explicit forgetting-aware metric for
  personalized memories.
- Ready for ImpactReport:no, upgrade after full protocol and license read.
