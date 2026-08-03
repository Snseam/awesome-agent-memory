---
title: MemSecBench — memory poisoning persistence-to-repair benchmark
benchmark_id: memsecbench
name: MemSecBench
aliases:
  - MemSecBench
status: seed
origin_type: paper_origin
origin_source: https://arxiv.org/abs/2607.27080
first_public_date: 2026-07
domain: memory_security
modality: text
task_grain: poisoning_persistence_consequence_repair
capability_axes:
  - persistence
  - downstream_consequence
  - selective_repair
  - memory_backend_comparison
data_nature: attack_and_repair_tasks
metrics:
  - persistence_rate
  - consequence_rate
  - repair_success
judge_type: source_protocol_check
code_available: check
data_available: check
license: check
known_limitations:
  - seed note; attack set, backend setup, and repair metrics need full read
canonical_sources:
  - https://arxiv.org/abs/2607.27080
confidence: medium
memory_modules:
  - evaluator-benchmark
  - policy-privacy
  - memorydiff-generator
last_revised: 2026-08-03
---

# MemSecBench

## What It Measures

MemSecBench evaluates memory poisoning across the full lifecycle from
persistence, to downstream action consequence, to selective repair.

## Protocol

The arXiv abstract frames the benchmark around malicious instructions that enter
long-term memory, are recalled later, and influence real actions. It emphasizes
tracking the same malicious semantics across persistence, consequence, and
repair, with comparisons across memory backends.

## Baselines and Reported Results

No normalized scores are logged here. Any reported backend comparison remains a
paper-origin claim until the setup is fully mapped.

## Validity / Contamination / License Caveats

Seed note only. The attack corpus, memory backends, repair mechanism, and judge
protocol must be reviewed before use as a production security gate.

## Related Papers

- Paper:https://arxiv.org/abs/2607.27080

## Impact Use

- `policy-privacy`:candidate benchmark for persistent memory poisoning.
- `memorydiff-generator`:repair semantics may inform selective rollback.
- Ready for ImpactReport:no, upgrade after full protocol read.
