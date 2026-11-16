---
title: COLLABMEM: A Diagnostic Benchmark for Collaborative Memory Operations in Multi-Agent LLM Systems
benchmark_id: collabmem
name: COLLABMEM
aliases:
  - Collaborative Memory Operations Benchmark
status: seed
origin_type: paper_origin
origin_source: https://aclanthology.org/2026.emnlp-main.1194/
first_public_date: 2026-10
domain: multi-agent-memory-governance
modality: text
task_grain: collaborative memory operation
capability_axes:
  - sharing
  - access control
  - routing
  - provenance
  - conflict resolution
  - retention
dataset_size: check
data_nature: benchmark-authored multi-agent operations
metrics:
  - diagnostic operation metrics
judge_type: check
code_available: check
data_available: check
license: check
known_limitations:
  - primary-paper protocol only
  - dataset scale and artifact terms require full review
canonical_sources:
  - https://aclanthology.org/2026.emnlp-main.1194/
confidence: medium
memory_modules:
  - evaluator-benchmark
  - policy-privacy
last_revised: 2026-11-16
---

# COLLABMEM

## What It Measures

COLLABMEM evaluates collaborative memory operations in multi-agent LLM
systems, including sharing, access control, routing, provenance, conflict
resolution, and retention.

## Evidence Boundary

The ACL Anthology record is the primary source for the benchmark identity and
scope. Results remain paper-origin evidence until the data, code, and protocol
are independently reviewed.

## Impact Use

- `evaluator-benchmark`: tests shared-memory behavior beyond single-agent QA.
- `policy-privacy`: makes visibility and access decisions explicit.
- Ready for ImpactReport: no; full artifact and license review remain open.

## Sources

- ACL Anthology: https://aclanthology.org/2026.emnlp-main.1194/
