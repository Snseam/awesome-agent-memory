---
title: "COLLABMEM: A Diagnostic Benchmark for Collaborative Memory Operations in Multi-Agent LLM Systems"
benchmark_id: collabmem
name: COLLABMEM
aliases: []
status: seed
origin_type: paper_origin
origin_source: https://aclanthology.org/2026.emnlp-main.1194/
first_public_date: check
proceedings_date: 2026-10
venue: EMNLP 2026
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
dataset_size: "58 hand-authored scenarios (1,118 core probes); a 174-scenario scaled split (3,359 probes); additional challenge splits"
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
  - security-privacy
last_revised: 2026-11-18
---

# COLLABMEM

## What It Measures

COLLABMEM evaluates collaborative memory operations in multi-agent LLM
systems, including sharing, access control, routing, provenance, conflict
resolution, and retention.

## Protocol

The origin authors fix the trace, target role, answering model, judge and gold event. This makes it possible to localize errors to specific memory operations while keeping the rest of the task fixed. The core and scaled figures count different splits.

## Evidence Boundary

The ACL Anthology record is the primary source for the benchmark identity and
scope. Results remain paper-origin evidence until the data, code, and protocol
are independently reviewed.

## Impact Use

- `evaluator-benchmark`: tests shared-memory behavior beyond single-agent QA.
- `security-privacy`: makes visibility and access decisions explicit.
- Ready for ImpactReport: no; full artifact and license review remain open.

## Sources

- ACL Anthology: https://aclanthology.org/2026.emnlp-main.1194/
