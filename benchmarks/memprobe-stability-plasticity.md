---
title: MemProbe: Stability-Plasticity Diagnostics for Agent Memory
benchmark_id: memprobe-stability-plasticity
name: MemProbe Stability-Plasticity
aliases:
  - Stability-Plasticity MemProbe
  - MemProbe Stability-Plasticity
status: seed
origin_type: paper_origin
origin_source: https://arxiv.org/abs/2609.30558
first_public_date: 2026-09
domain: memory_diagnostics
modality: text
task_grain: multi_episode_diagnostic_suite
capability_axes:
  - interference
  - misinformation
  - consolidation_strength
  - reconsolidation_window
  - source_reliability
dataset_size: 56-episode diagnostic suite
data_nature: cognitive_science_inspired_memory_paradigms
metrics:
  - behavioral_profile_breakdown
  - update_preserve_attribute_temporal_organization
judge_type: check
code_available: yes
data_available: check
license: check
known_limitations:
  - seed note; distinct from existing MEMPROBE hidden-state benchmark
  - code and data license need verification
canonical_sources:
  - https://arxiv.org/abs/2609.30558
  - https://github.com/jq-ding/MemProbe
confidence: medium
memory_modules:
  - evaluator-benchmark
  - dream-consolidator
last_revised: 2026-09-28
---

# MemProbe Stability-Plasticity

## What It Measures

This MemProbe paper evaluates stability-plasticity tradeoffs in agent memory:
when systems should update, preserve, attribute, or temporally organize
information under interference, misinformation, consolidation strength, and
reconsolidation-window manipulations.

## Dataset / Scale

The abstract reports a 56-episode diagnostic suite. Code is linked from the
paper abstract at `jq-ding/MemProbe`; data and license need follow-up.

## Protocol

The suite adapts cognitive experimental paradigms for incremental memory
systems. It decomposes aggregate correctness into behavioral profiles so two
systems with similar final-answer scores can show different maintenance
failures.

## Metrics and Judging

The abstract emphasizes behavioral profiles rather than a single leaderboard
score. Local normalization should wait for the full paper.

## Comparability Notes

Do not confuse this entry with [`memprobe.md`](memprobe.md), the 2026-06
hidden user-state recovery benchmark. They share a name but evaluate different
failure surfaces.

## Validity / License Caveats

- Seed note only; code/data/license and EMNLP 2026 metadata need verification.
- Behavioral-profile comparisons should not be averaged into recall-only
  benchmark tables.

## Related Papers

- Probing Stability-Plasticity Tradeoffs in Agent Memory through Cognitive
  Experimental Paradigms:https://arxiv.org/abs/2609.30558

## Impact Use

- `dream-consolidator`: useful diagnostic pressure for update-vs-preserve
  policy.
- `evaluator-benchmark`: candidate protocol for interpretable memory-maintenance
  profiles.
- Ready for ImpactReport: no, upgrade after full protocol and artifact review.
