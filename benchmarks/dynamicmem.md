---
title: DynamicMem — long-horizon memory benchmark in real-world settings
benchmark_id: dynamicmem
name: DynamicMem
aliases:
  - DynamicMem
status: seed
origin_type: paper_origin
origin_source: https://arxiv.org/abs/2606.22877
first_public_date: 2026-06
domain: evolving_user_profile_memory
modality: text
task_grain: multi_app_long_horizon_profile
capability_axes:
  - profile_reconstruction
  - temporal_update
  - retrieval_at_scale
  - service_task_accuracy
dataset_size: 15 months per user; average 2.2M tokens and 1,772 grounded events per user
data_nature: synthetic_multi_app_user_histories
metrics:
  - profile_reconstruction
  - service_task_accuracy
  - checkpoint_performance
judge_type: check
code_available: check
data_available: check
license: check
known_limitations:
  - seed note; protocol, code, data license, and reported systems need full read
canonical_sources:
  - https://arxiv.org/abs/2606.22877
confidence: medium
memory_modules:
  - evaluator-benchmark
  - retriever-reranker
  - dream-consolidator
last_revised: 2026-06-29
---

# DynamicMem

## What It Measures

DynamicMem evaluates whether memory systems can maintain evolving user profiles
over long histories. The arXiv abstract emphasizes heterogeneous attributes,
habits, and preferences that evolve on different timelines and must be inferred
from small signals scattered across multiple apps.

## Dataset / Scale

The paper reports synthetic 15-month user activity histories, averaging 2.2M
tokens and 1,772 grounded events per user across 16 application domains. The
profile is not given explicitly; systems infer it from activity traces.

## Protocol

The benchmark evaluates at five quarterly checkpoints to track scaling as
history grows. The abstract distinguishes profile reconstruction from downstream
service-task accuracy.

## Metrics and Judging

Metrics and judging details need a full paper read. This seed records only the
origin protocol and high-level task shape.

## Baselines and Reported Results

No normalized results are logged here. Reported system comparisons remain
paper-origin claims until the setup is mapped into `claims/claims.yaml`.

## Validity / Contamination / License Caveats

- Synthetic histories are used because real multi-app personal histories are
  privacy-sensitive.
- Code, data availability, and license require follow-up verification.

## Comparability Notes

Compare with LongMemEval, LoCoMo, and PersonaMem-v2 on personalization and
temporal update axes, but do not average scores across these protocols.

## Related Papers

- Paper:https://arxiv.org/abs/2606.22877

## Impact Use

- `evaluator-benchmark`:candidate benchmark for evolving profile memory and
  retrieval degradation over months.
- Ready for ImpactReport:no, upgrade after full protocol read.
