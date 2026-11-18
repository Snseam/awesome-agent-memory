---
title: "TimlMemBench: A Diagnostic Benchmark for Governed Use of Long-Term Memory in Dialogue Agents"
benchmark_id: timlmembench
name: TimlMemBench
aliases: []
status: seed
origin_type: paper_origin
origin_source: https://aclanthology.org/2026.findings-emnlp.507/
first_public_date: check
proceedings_date: 2026-10
venue: Findings of EMNLP 2026
domain: governed-long-term-memory
modality: text
task_grain: dialogue memory governance decision
capability_axes:
  - revocation
  - supersession
  - privacy scope
  - provenance
  - activation
  - restraint
dataset_size: "208 reviewed Chinese/English samples; 1,566 sessions; 1,715 questions; 1,821 governance or activation cases"
data_nature: benchmark-authored dialogue evaluation
metrics:
  - diagnostic governance metrics
judge_type: check
code_available: check
data_available: check
license: check
known_limitations:
  - primary-paper protocol only
  - exact splits and artifact terms require full review
canonical_sources:
  - https://aclanthology.org/2026.findings-emnlp.507/
confidence: medium
memory_modules:
  - evaluator-benchmark
  - security-privacy
last_revised: 2026-11-18
---

# TimlMemBench

## What It Measures

TimlMemBench diagnoses whether dialogue agents use long-term memory under
governance constraints such as revocation, supersession, privacy scope,
provenance, activation, and restraint.

## Protocol

The canonical-pool control gives systems the same sample-local assets. The raw-native condition makes each system ingest the original sessions. QA and governance/activation cases have separate denominators.

## Evidence Boundary

This note records the ACL Anthology benchmark identity and scope. It does not
turn author-reported scores into an independent comparison.

## Impact Use

- `evaluator-benchmark`: evaluates governed memory use instead of answer
  accuracy alone.
- `security-privacy`: provides cases for revocation and scope enforcement.
- Ready for ImpactReport: no; full protocol and artifact review remain open.

## Sources

- ACL Anthology: https://aclanthology.org/2026.findings-emnlp.507/
