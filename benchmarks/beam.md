---
title: BEAM — million-token long-term memory scale benchmark
benchmark_id: beam
name: BEAM
aliases:
  - BEAM (1M)
  - BEAM (10M)
status: candidate
origin_type: paper_origin
origin_source: ../papers/stubs/beyond-a-million-tokens-benchmarking-and-enhancing-long.md
first_public_date: check
domain: long_scale_memory
modality: text
task_grain: qa
capability_axes:
  - long_scale_recall
  - temporal_reasoning
  - scale_degradation
dataset_size:
  token_scale: "1M / 10M variants reported in product claims"
data_nature: check
metrics:
  - score
  - tokens_per_query
judge_type: check
code_available: check
data_available: check
license: check
known_limitations:
  - tracked here from product claims before full source-note upgrade
canonical_sources:
  - ../papers/stubs/beyond-a-million-tokens-benchmarking-and-enhancing-long.md
  - ../products/mem0.md
confidence: low
memory_modules:
  - evaluator-benchmark
  - context-packer
last_revised: 2026-06-11
---

# BEAM

## What It Measures

BEAM is tracked here because Mem0 reports BEAM 1M and BEAM 10M scores in its
2026 memory benchmark blog. The local source is still candidate quality, so this
note is a placeholder for long-scale memory evaluation evidence.

## Dataset / Scale

The current repo evidence records 1M and 10M variants through Mem0 product/blog
claims. The benchmark source note must be upgraded before BEAM supports
ImpactReport-grade conclusions.

## Protocol

Protocol details are check.

## Metrics and Judging

Mem0 reports absolute scores and tokens/query. Judge details need source
verification.

## Baselines and Reported Results

The current usage ledger records Mem0 vendor self-claims only. Do not treat
these rows as independent reproduction.

## Validity / Contamination / License Caveats

All BEAM claims are low-confidence until the benchmark source is read and
availability/license details are recorded.

## Comparability Notes

BEAM is useful as a scale-stress placeholder, not yet as a normalized ranking
surface.

## Related Papers

- [`../papers/stubs/beyond-a-million-tokens-benchmarking-and-enhancing-long.md`](../papers/stubs/beyond-a-million-tokens-benchmarking-and-enhancing-long.md)

## Related Products

- [`../products/mem0.md`](../products/mem0.md)

## Impact Use

- Ready for ImpactReport: no
- Recommended use: backlog item for million-token memory scale evaluation.
