---
title: MemLeak — multimodal memory information-leak benchmark
benchmark_id: memleak
name: MemLeak
aliases:
  - MemLeak
status: seed
origin_type: paper_origin
origin_source: https://arxiv.org/abs/2606.29788
first_public_date: 2026-06
domain: multimodal_memory_privacy
modality: text_image
task_grain: deletion_and_residual_recovery
capability_axes:
  - deletion_compliance
  - provenance
  - multimodal_residual_leakage
  - policy_privacy
data_nature: real_images_and_synthetic_or_curated_memory_pairs
metrics:
  - recovery_rate
  - false_positive_rate
  - judge_agreement
judge_type: human_validated_and_model_probe
code_available: check
data_available: check
license: check
known_limitations:
  - seed note; image sourcing, production-memory setup, and deletion protocol need full read
canonical_sources:
  - https://arxiv.org/abs/2606.29788
confidence: medium
memory_modules:
  - evaluator-benchmark
  - policy-privacy
  - semantic-dedup
last_revised: 2026-07-06
---

# MemLeak

## What It Measures

MemLeak evaluates whether facts requested for deletion can remain recoverable
from retained multimodal memory artifacts, especially images that carry implicit
visual cues correlated with deleted text facts.

## Protocol

The paper introduces an Information Provenance Graph taxonomy for deletion
affordances and tests a deletion cascade. The arXiv abstract reports direct
probing, correlated retained text, retained images, and content-aware semantic
deletion conditions.

## Baselines and Reported Results

Reported recovery rates and human-validation agreement are paper-origin claims.
This seed does not register them as independent reproduction evidence.

## Validity / Contamination / License Caveats

The paper mentions real Unsplash-licensed photographs and a production memory
system. Full source, license, and exact probe setup must be reviewed before
using MemLeak as a production gate.

## Comparability Notes

MemLeak complements GateMem and memory-poisoning work by shifting privacy tests
from text-only access control to multimodal residual leakage after deletion.

## Related Papers

- Paper:https://arxiv.org/abs/2606.29788

## Impact Use

- `policy-privacy`:candidate benchmark for deletion semantics and provenance.
- `evaluator-benchmark`:multimodal memory deletion audit pressure.
- Ready for ImpactReport:no, upgrade after full protocol read.
