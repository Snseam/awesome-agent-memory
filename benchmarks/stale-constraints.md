---
title: Stale Constraints — inherited-memory freshness benchmark
benchmark_id: stale-constraints
name: When Stale Constraints Go Unchecked
aliases:
  - Stale Constraints
status: seed
origin_type: paper_origin
origin_source: https://arxiv.org/abs/2608.25553
first_public_date: 2026-08
domain: memory_freshness
modality: text
task_grain: inherited_agent_memory
capability_axes:
  - freshness_verification
  - supersession_detection
  - budgeted_rechecking
data_nature: check
metrics:
  - stale_constraint_failure_rate
  - verification_cost
judge_type: check
code_available: check
data_available: check
license: check
known_limitations:
  - seed note; dataset, Zenodo resource details, and verification-budget setup need full read
canonical_sources:
  - https://arxiv.org/abs/2608.25553
confidence: medium
memory_modules:
  - evaluator-benchmark
  - provenance-ledger
  - memorydiff-generator
last_revised: 2026-08-31
---

# Stale Constraints

## What It Measures

This benchmark targets failures caused by inherited memories whose constraints
have been superseded. It is directly relevant to agents that resume old project
state, compacted handoffs, or profile memories without verifying whether those
constraints still hold.

## Protocol

The source paper frames stale constraint use as a freshness and verification
problem, including budgeted checking. The arXiv record also points to a Zenodo
artifact. Full split, task, and metric details need a deeper read before any
score comparison.

## Baselines and Reported Results

No normalized results are logged here. Origin-paper results remain
paper-origin claims.

## Comparability Notes

Compare against A-TMA-style state validity and memory governance benchmarks on
supersession behavior, not raw recall. The useful product question is whether
memory retrieval can force revalidation when old constraints are risky.

## Related Papers

- Paper:https://arxiv.org/abs/2608.25553

## Impact Use

- `evaluator-benchmark`:candidate benchmark for stale memory and supersession.
- `provenance-ledger`:useful for linking remembered constraints to source and age.
- Ready for ImpactReport:no, upgrade after full protocol read.
