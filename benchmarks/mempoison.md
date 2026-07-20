---
title: MemPoison — persistent memory poisoning benchmark and analysis
benchmark_id: mempoison
name: MemPoison
aliases:
  - MemPoison
status: seed
origin_type: paper_origin
origin_source: https://arxiv.org/abs/2607.14651
first_public_date: 2026-07
domain: memory_security
modality: text
task_grain: persistent_memory_poisoning
capability_axes:
  - memory_poisoning
  - compositional_corruption
  - dormant_trigger
  - write_time_defense
  - retrieval_composition
data_nature: hand_validated_cases
metrics:
  - attack_success_rate
  - defense_effectiveness
judge_type: check
code_available: check
data_available: check
license: check
known_limitations:
  - seed note; protocol, system setup, resources, and reported results need full read
canonical_sources:
  - https://arxiv.org/abs/2607.14651
confidence: medium
memory_modules:
  - evaluator-benchmark
  - policy-privacy
  - memorydiff-generator
last_revised: 2026-07-20
---

# MemPoison

## What It Measures

MemPoison studies persistent poisoning in external agent memory. It focuses on
adversarial records that enter through normal interaction channels, persist
across turns, and later distort behavior through retrieval composition or
trigger-conditioned activation.

## Protocol

The arXiv abstract describes 1,227 hand-validated cases across attack types,
injection channels, and memory substrates. It introduces L1 direct single-record
corruption, L2 compositional multi-record corruption, and L3 context-triggered
dormant corruption. Full case construction, memory substrates, defenses, and
released resources need a deeper read.

## Baselines and Reported Results

No normalized scores are logged here. Reported attack and defense rates remain
paper-origin claims until the setup is mapped into the claims ledger with
comparable model and memory-substrate details.

## Comparability Notes

Compare with memory-poisoning trajectory-forensics work only on threat model and
defense surface. MemPoison is about structural blind spots in persistent memory
defense, not a general prompt-injection leaderboard.

## Related Papers

- Paper:https://arxiv.org/abs/2607.14651

## Impact Use

- `evaluator-benchmark`:candidate protocol for compositional and dormant
  memory poisoning failures.
- `policy-privacy`:useful for write-time versus retrieval-time defense design.
- Ready for ImpactReport:no, upgrade after full protocol read.
