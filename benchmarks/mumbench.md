---
title: MUMBench: Multi-User Memory Benchmark
benchmark_id: mumbench
name: MUMBench
aliases:
  - MUMBench
  - Multi-User Memory Benchmark
status: seed
origin_type: paper_origin
origin_source: https://arxiv.org/abs/2609.12320
first_public_date: 2026-09
domain: multi_user_memory_governance
modality: text
task_grain: multi_user_memory_crud
capability_axes:
  - private_public_visibility
  - retrieval
  - creation
  - update
  - deletion
dataset_size: Multi-user interactions across four domains; exact item counts need full read
data_nature: multi_user_interactions
metrics:
  - visibility_classification
  - strict_operation_accuracy
  - state_aware_operation_accuracy
judge_type: check
code_available: check
data_available: check
license: check
known_limitations:
  - seed note; access-control model, domain construction, and release artifacts need full read
canonical_sources:
  - https://arxiv.org/abs/2609.12320
confidence: medium
memory_modules:
  - evaluator-benchmark
  - policy-privacy
last_revised: 2026-09-14
---

# MUMBench

## What It Measures

MUMBench evaluates whether multi-user, multi-agent memory operations respect
private versus public/shared visibility while supporting retrieval, creation,
update, and deletion.

## Dataset / Scale

The AIM abstract describes multi-user interactions across four domains. Exact
instance counts, split details, and any released data should be confirmed from
the full paper and canonical artifacts.

## Protocol

The protocol exercises memory operations under changing user and sharing state.
It is intended to expose the difference between a system that retrieves useful
content and one that retrieves only content the current principal is allowed to
see.

## Metrics and Judging

The paper reports visibility classification, strict operation accuracy, and
state-aware operation accuracy. The abstract reports 96.0%, 58.8%, and 70.5%
respectively; these remain paper-origin values.

## Comparability Notes

MUMBench is complementary to single-user long-term recall benchmarks. Its
primary signal is policy correctness across operations, not generic answer
quality or retrieval ranking.

## Validity / License Caveats

- Full access-control semantics and revocation cases need a full read.
- Code, data, and license status are currently unchecked.
- Paper-reported AIM metrics should not be merged with independent benchmark rows.

## Related Papers

- AIM: https://arxiv.org/abs/2609.12320

## Impact Use

- `policy-privacy`: candidate protocol for scoped shared-memory governance.
- `evaluator-benchmark`: useful companion to GateMem and MemLeak.
- Ready for ImpactReport: no, upgrade after full protocol and artifact review.
