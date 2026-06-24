---
title: MemoryRewardBench — reward-model evaluation for long-term memory management
benchmark_id: memoryrewardbench
name: MemoryRewardBench
aliases:
  - MemRewardBench
status: candidate
origin_type: paper_origin
origin_source: ../papers/stubs/memoryrewardbench-benchmarking-reward-models-for-long-term.md
first_public_date: 2026-01
domain: memory_quality_judging
modality: text
task_grain: reward_model_preference_judgment
capability_axes:
  - memory_quality_judging
  - long_context_memory_management
  - reward_model_calibration
dataset_size:
  context_length: "8K-128K tokens"
  settings: 10
data_nature: check
metrics:
  - reward_model_accuracy
  - preference_judgment_quality
judge_type: reward_model
code_available: yes
data_available: check
license: check
known_limitations:
  - source is still a paper stub in this repo
  - evaluates reward models for memory management, not end-agent memory quality directly
canonical_sources:
  - ../papers/stubs/memoryrewardbench-benchmarking-reward-models-for-long-term.md
  - https://arxiv.org/abs/2601.11969
  - https://github.com/LCM-Lab/MemRewardBench
confidence: low
memory_modules:
  - evaluator-benchmark
last_revised: 2026-06-24
---

# MemoryRewardBench

## What It Measures

MemoryRewardBench evaluates whether reward models can judge long-term memory
management processes. It is relevant to this repo because memory kernels need
quality signals for memory writes, summaries, and retained context, but it is
one step removed from direct agent-memory task performance.

## Dataset / Scale

The arXiv abstract reports 10 settings with different memory management
patterns and context lengths from 8K to 128K tokens. Dataset size, splits, and
license should be checked before using the benchmark for decisions.

## Protocol

The benchmark asks reward models to evaluate memory quality across long-context
comprehension and long-form generation settings. Protocol details remain
candidate quality until the source stub is upgraded.

## Metrics and Judging

Metrics are reward-model judgment quality and calibration style measures. Exact
metric definitions need source normalization.

## Baselines and Reported Results

The paper reports evaluation over 13 reward models. This repo does not yet
normalize those results.

## Validity / Contamination / License Caveats

- Candidate quality only.
- It is most useful as a meta-evaluator benchmark for memory-management
  judgments, not as a direct product leaderboard.

## Comparability Notes

Do not compare MemoryRewardBench scores with agent task benchmarks such as
MemoryAgentBench, LongMemEval, or LoCoMo.

## Related Papers

- [`../papers/stubs/memoryrewardbench-benchmarking-reward-models-for-long-term.md`](../papers/stubs/memoryrewardbench-benchmarking-reward-models-for-long-term.md)

## Related Products

-

## Impact Use

- Ready for ImpactReport: no.
- Recommended use: backlog item for evaluator and critic-model selection.
