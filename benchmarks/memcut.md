---
title: MemCut
benchmark_id: memcut
name: MemCut
aliases:
  - Every Secret Leaves a Trail in the Long-Term Memory of LLM Agents
status: seed
origin_type: paper_origin
origin_source: https://arxiv.org/abs/2610.21405
first_public_date: 2026-10-15
domain: memory-forgetting-and-residual-disclosure
modality: text
task_grain: long-horizon secret deletion with annotated evidence trails
capability_axes:
  - requested forgetting
  - evidence-trail deletion
  - residual recovery
dataset_size: 456 hand-designed secrets
data_nature: benchmark-authored long-horizon conversations with annotations
metrics:
  - native recovery
  - residual recovery
judge_type: reader success under normal and direct-survivor access
code_available: check
data_available: check
license: check
known_limitations:
  - primary-paper source only
  - deletion baselines and artifact terms require full review
canonical_sources:
  - https://arxiv.org/abs/2610.21405
confidence: medium
memory_modules:
  - evaluator-benchmark
  - security-privacy
  - memorydiff-generator
last_revised: 2026-10-19
---

# MemCut

## What It Measures

MemCut evaluates requested forgetting where secrets can remain inferable from
surviving objects even after a direct disclosure is removed. It separates normal
system retrieval (native recovery) from access to traced survivors (residual
recovery).

## Dataset / Scale

The primary paper reports 456 hand-designed secrets in long-horizon
conversations with fully annotated disclosure/evidence trails.

## Protocol and Evidence Boundary

Reported five-design/four-LLM deletion baselines are paper-origin evidence
only. The benchmark's reported residual-recovery results must not be treated as
an independent ranking of memory products.

## Impact Use

- `evaluator-benchmark`: adds a recovery-after-deletion axis beyond ordinary
  retrieval evaluation.
- `security-privacy`: makes evidence fan-out a testable deletion property.
- Ready for ImpactReport: no; need full artifact, license, and annotation review.

## Sources

- arXiv: https://arxiv.org/abs/2610.21405
