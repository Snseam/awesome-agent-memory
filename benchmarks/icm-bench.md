---
title: ICM-Bench — identity-centric memory benchmark for multimodal agents
benchmark_id: icm-bench
name: ICM-Bench
aliases:
  - ICM-Bench
  - Identity-Centric Memory Benchmark
status: seed
origin_type: paper_origin
origin_source: https://arxiv.org/abs/2609.04438
first_public_date: 2026-09
domain: identity_centric_multimodal_memory
modality: multimodal
task_grain: long_video_identity_reasoning
capability_axes:
  - identity_consistency
  - cross_time_relation_reasoning
  - multimodal_evidence_binding
  - long_term_profile_memory
data_nature: synthetic_video
metrics:
  - open_ended_qa_accuracy
  - identity_profile_accuracy
judge_type: check
code_available: yes
data_available: check
license: check
known_limitations:
  - seed note; protocol, generation pipeline, judge setup, and released data need full read
canonical_sources:
  - https://arxiv.org/abs/2609.04438
confidence: medium
memory_modules:
  - evaluator-benchmark
  - retriever-reranker
  - policy-privacy
last_revised: 2026-09-07
---

# ICM-Bench

## What It Measures

ICM-Bench evaluates identity-centric memory in long-horizon multimodal agents:
whether systems can link recurring faces, voices, names, person-associated
objects, events, and social relations to stable identities over time.

## Protocol

The arXiv abstract describes 839 synthetic clips across a one-year life album
and 1,217 open-ended questions about six recurring adults. The benchmark
associates questions with target identities and traceable supporting evidence.
Full generation pipeline, data license, judge prompts, scoring details, and
released artifacts need a deeper read.

## Baselines and Reported Results

No normalized scores are logged here. The source abstract reports model and
agent comparisons, but those remain paper-origin evidence until the setup is
mapped into `claims/claims.yaml`.

## Comparability Notes

Compare ICM-Bench with multimodal memory and persona-memory benchmarks only on
identity binding and cross-time profile reasoning. It should not be treated as a
general text memory benchmark or as independent evidence about any hosted model.

## Related Papers

- Paper:https://arxiv.org/abs/2609.04438

## Impact Use

- `evaluator-benchmark`:candidate benchmark for person-level multimodal memory.
- `retriever-reranker`:tests whether retrieval preserves stable identity
  evidence across time.
- `policy-privacy`:identity-centric memory raises profile and consent questions.
- Ready for ImpactReport:no, upgrade after full protocol read.
