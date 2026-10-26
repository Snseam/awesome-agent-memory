---
title: FrontierMemory — continual learning through memory
benchmark_id: frontiermemory
name: FrontierMemory
aliases:
  - FrontierMemory 1.0
status: seed
origin_type: product_research_origin
origin_source: https://www.frontiermemory.com/blog/v1/
first_public_date: 2026-10
domain: continual_learning_through_memory
modality: agent_trajectory_to_memory
task_grain: downstream_memory_dependent_task
capability_axes:
  - procedural_memory
  - continual_learning
  - downstream_task_utility
  - no_memory_control
dataset_size: "674 source trajectories; 15 memory-dependent tasks"
data_nature: gated_corpus_plus_public_task_hub
metrics:
  - strict_downstream_pass_rate
judge_type: task_verifier_with_llm_judge_on_three_APEX_tasks
code_available: yes
data_available: gated_corpus
license: Apache-2.0 code; task licenses vary
known_limitations:
  - origin is Letta-affiliated and public leaderboard results are not independent reproduction
  - corpus access requires acceptance of Hugging Face terms
  - benchmark currently focuses on offline dreaming rather than online incremental updates
  - only 15 downstream tasks; three APEX verifiers use an LLM judge
canonical_sources:
  - https://www.frontiermemory.com/blog/v1/
  - https://github.com/letta-ai/frontiermemory
confidence: medium
memory_modules:
  - evaluator-benchmark
  - memorydiff-generator
last_revised: 2026-10-26
---

# FrontierMemory

## What It Measures

FrontierMemory measures whether memory generated from prior agent trajectories
helps a fresh agent solve later, memory-dependent coding and knowledge-work
tasks. It is a downstream-utility protocol rather than a fact-recall benchmark.

## Dataset / Scale

The official repository describes 674 source trajectories, each marked PASS or
FAIL, and 15 downstream tasks adapted from public benchmarks. The source corpus
is gated on Hugging Face; task data is published through Harbor Hub.

## Protocol

A memory agent reads the fixed trajectory corpus and writes a memory folder
within a six-hour generation limit. A task agent then solves the 15 downstream
tasks with that folder; a no-memory control runs the same task agent without it.
The score is strict pass rate on task verifiers.

## Metrics and Judging

The public metric is downstream strict pass rate. The repository says three
APEX task verifiers use an LLM judge, so results require model, harness,
reasoning-effort, trial-count, and judge caveats.

## Validity / Comparability Caveats

- The benchmark and leaderboard originate with Letta; listed results are
  affiliated benchmark evidence, not independent proof of harness quality.
- It measures offline trajectory-to-memory generation, not general online
  memory CRUD, privacy, deletion, or long-horizon conversational recall.
- Gated corpus terms and per-task licenses must be reviewed before reproducing.

## Impact Use

- `evaluator-benchmark`: candidate protocol for testing whether memory produces
  behavioral improvement over a no-memory control.
- Ready for ImpactReport: no; first verify corpus terms, local task setup,
  harness adapter semantics, and judge comparability.

## Sources

- Official benchmark post: https://www.frontiermemory.com/blog/v1/
- Official repository: https://github.com/letta-ai/frontiermemory
