---
title: InjecMEM — memory-injection attack benchmark
benchmark_id: injecmem
name: InjecMEM
aliases:
  - InjecMEM
status: seed
origin_type: paper_origin
origin_source: https://arxiv.org/abs/2608.23471
first_public_date: 2026-08
domain: memory_security
modality: text
task_grain: agent_memory_attack
capability_axes:
  - memory_injection_resistance
  - poisoned_retrieval_detection
  - cross_session_safety
data_nature: check
metrics:
  - attack_success_rate
  - benign_task_utility
judge_type: check
code_available: check
data_available: check
license: check
known_limitations:
  - seed note; protocol, task counts, code/data release, and reported results need full read
canonical_sources:
  - https://arxiv.org/abs/2608.23471
confidence: medium
memory_modules:
  - evaluator-benchmark
  - policy-privacy
  - audit-ui
last_revised: 2026-08-31
---

# InjecMEM

## What It Measures

InjecMEM frames long-term agent memory as a persistent attack surface. The
benchmark targets memory-injection attacks where a single interaction can plant
state that later steers retrieval or downstream tool use without direct access
to the memory store.

## Protocol

The arXiv abstract positions the task around indirect persistent compromise:
attack text is introduced during ordinary interaction, stored by the memory
layer, and later retrieved in contexts where it can affect behavior. Full
datasets, task counts, attack variants, and defenses still need a full source
read.

## Baselines and Reported Results

No normalized scores are logged here. Any author-reported attack rates remain
paper-origin claims until the protocol and setup are mapped into
`claims/claims.yaml`.

## Comparability Notes

Compare with memory-poisoning and prompt-injection benchmarks on threat model,
not raw success rate. InjecMEM is most useful for testing whether memory write
and retrieval gates preserve cross-session safety.

## Related Papers

- Paper:https://arxiv.org/abs/2608.23471

## Impact Use

- `evaluator-benchmark`:candidate benchmark for persistent memory injection.
- `policy-privacy`:useful for write admission, provenance, and unsafe recall gates.
- Ready for ImpactReport:no, upgrade after full protocol read.
