---
title: WK-Drift: Benchmarking Procedural Memory Maintenance under World Knowledge Drift
benchmark_id: wk-drift
name: WK-Drift
aliases:
  - Procedural Memory World-Knowledge Drift Benchmark
status: seed
origin_type: paper_origin
origin_source: https://aclanthology.org/2026.findings-aacl.140/
first_public_date: 2026-11
domain: procedural-memory-maintenance
modality: text
task_grain: procedural memory update after knowledge drift
capability_axes:
  - stale-memory detection
  - post-drift accuracy
  - update cost
  - recovery latency
dataset_size: check
data_nature: benchmark-authored drift evaluation
metrics:
  - post-drift accuracy
  - update cost
  - recovery latency
judge_type: check
code_available: check
data_available: check
license: check
known_limitations:
  - primary-paper protocol only
  - full drift construction and artifact terms require review
canonical_sources:
  - https://aclanthology.org/2026.findings-aacl.140/
confidence: medium
memory_modules:
  - evaluator-benchmark
  - memorydiff-generator
last_revised: 2026-11-16
---

# WK-Drift

## What It Measures

WK-Drift evaluates procedural-memory maintenance when world knowledge changes,
including stale-memory handling, post-drift accuracy, update cost, and recovery
latency.

## Evidence Boundary

The ACL Anthology record supports the benchmark identity and drift-maintenance
scope. Results remain paper-origin evidence pending independent reproduction.

## Impact Use

- `evaluator-benchmark`: tests maintenance after environmental change rather
  than static recall.
- `memorydiff-generator`: makes update and invalidation cost observable.
- Ready for ImpactReport: no; full protocol and artifact review remain open.

## Sources

- ACL Anthology: https://aclanthology.org/2026.findings-aacl.140/
