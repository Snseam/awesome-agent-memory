---
title: EAL-Bench — endogenous authorization laundering benchmark
benchmark_id: eal-bench
name: EAL-Bench
aliases:
  - EAL-Bench
  - Endogenous Authorization Laundering Benchmark
status: seed
origin_type: paper_origin
origin_source: https://arxiv.org/abs/2609.01836
first_public_date: 2026-09
domain: memory_authorization
modality: text
task_grain: memory_write_to_downstream_action
capability_axes:
  - authorization_state
  - provenance
  - revocation_tracking
  - downstream_action_safety
data_nature: check
metrics:
  - false_authority_rate
  - unauthorized_action_rate
  - legitimate_action_rejection
judge_type: check
code_available: check
data_available: check
license: check
known_limitations:
  - seed note; protocol, task counts, resources, and reported results need full read
canonical_sources:
  - https://arxiv.org/abs/2609.01836
confidence: medium
memory_modules:
  - evaluator-benchmark
  - memorydiff-generator
  - policy-privacy
last_revised: 2026-09-07
---

# EAL-Bench

## What It Measures

EAL-Bench evaluates whether persistent agent memory preserves evolving
authorization state and whether memory-write errors lead to unauthorized
downstream actions. It is anchored in endogenous authorization laundering:
spurious stored permissions, restrictions, or revocation summaries that no
longer match the underlying event history.

## Protocol

The arXiv abstract reports domains including procurement, cybersecurity, and
finance, with separate memory-writer and executor roles. The benchmark appears
to test both memory-state fidelity and the behavioral consequence of false
authority. Full task definitions, labels, scoring, and resource links still need
a deeper read.

## Baselines and Reported Results

No normalized scores are logged here. Source-paper numbers remain
author-reported paper-origin evidence until the setup is mapped in detail.

## Comparability Notes

Compare EAL-Bench with GateMem and MemSyco-Bench on authority/scope behavior,
not recall accuracy. EAL-Bench is narrower and action-grounded: the key failure
is an unauthorized action induced by corrupted authorization memory.

## Related Papers

- Paper:https://arxiv.org/abs/2609.01836

## Impact Use

- `evaluator-benchmark`:candidate regression suite for authorization-bearing
  memory.
- `memorydiff-generator`:requires source-backed grant/revocation transitions.
- `policy-privacy`:turns memory provenance into an action-permission control.
- Ready for ImpactReport:no, upgrade after full protocol read.
