---
title: MemOps — lifecycle memory operations benchmark
benchmark_id: memops
name: MemOps
aliases:
  - MemOps
status: seed
origin_type: paper_origin
origin_source: https://arxiv.org/abs/2607.12893
first_public_date: 2026-07
domain: memory_lifecycle_operations
modality: text
task_grain: operation_level_conversational_memory
capability_axes:
  - remembering
  - forgetting
  - updating
  - reflecting
  - evidence_binding
  - state_transition
data_nature: generated_long_horizon_conversations
metrics:
  - operation_trace_accuracy
  - probe_accuracy
judge_type: check
code_available: check
data_available: check
license: check
known_limitations:
  - seed note; protocol, generation pipeline, resources, and reported results need full read
canonical_sources:
  - https://arxiv.org/abs/2607.12893
confidence: medium
memory_modules:
  - evaluator-benchmark
  - memorydiff-generator
  - retriever-reranker
last_revised: 2026-07-20
---

# MemOps

## What It Measures

MemOps evaluates long-term conversational memory as a lifecycle of explicit
operations rather than final-answer recall alone. It focuses on remembering,
forgetting, updating, reflecting, operation composition, and whether each memory
event is tied to the right trigger, target, scope, state transition, and
supporting evidence.

## Protocol

The arXiv abstract describes a controllable generation pipeline that embeds
memory operations into long task-oriented conversations and produces gold
operation traces plus six categories of operation-level probes. Full probe
categories, dataset construction, released resources, and scoring details need a
deeper read.

## Baselines and Reported Results

No normalized scores are logged here. The abstract reports comparisons across
long-context, retrieval-based, parametric, and managed-memory systems, but those
remain author-reported results until the setup is normalized.

## Comparability Notes

Compare MemOps with A-TMA and MemDelta on failure decomposition, not leaderboard
rank. It is most useful when the design question is whether a memory system can
explain the operation that created, updated, forgot, or reflected on a memory.

## Related Papers

- Paper:https://arxiv.org/abs/2607.12893

## Impact Use

- `evaluator-benchmark`:candidate protocol for operation-level memory
  diagnosis.
- `memorydiff-generator`:maps naturally to explicit memory event traces and
  state transitions.
- Ready for ImpactReport:no, upgrade after full protocol read.
