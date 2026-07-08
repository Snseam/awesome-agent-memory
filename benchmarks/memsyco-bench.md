---
title: MemSyco-Bench — memory-induced sycophancy benchmark
benchmark_id: memsyco-bench
name: MemSyco-Bench
aliases:
  - MemSyco
  - MemSyco-Bench
status: seed
origin_type: paper_origin
origin_source: https://arxiv.org/abs/2607.01071
first_public_date: 2026-07
domain: memory_induced_sycophancy
modality: text
task_grain: downstream_reasoning_with_retrieved_memory
capability_axes:
  - memory_scope
  - conflict_resolution
  - memory_update
  - personalization
  - objective_evidence_use
data_nature: check
metrics:
  - sycophancy_resistance
  - valid_memory_use
judge_type: check
code_available: check
data_available: check
license: check
known_limitations:
  - seed note; protocol, task counts, resources, and reported results need full read
canonical_sources:
  - https://arxiv.org/abs/2607.01071
confidence: medium
memory_modules:
  - evaluator-benchmark
  - retriever-reranker
  - policy-privacy
last_revised: 2026-07-06
---

# MemSyco-Bench

## What It Measures

MemSyco-Bench evaluates when retrieved memories should and should not influence
an agent's downstream reasoning. It focuses on memory-induced sycophancy: cases
where an agent over-aligns with remembered user statements at the expense of
objective evidence or factual reasoning.

## Protocol

The arXiv abstract describes five task families: rejecting memory as factual
evidence, respecting memory scope, resolving conflicts between memory and
objective evidence, tracking memory updates, and using valid memory for
personalization. Full task definitions and resource links need a deeper read.

## Baselines and Reported Results

No normalized scores are logged here. Reported system results remain
paper-origin claims until the setup is mapped into `claims/claims.yaml`.

## Comparability Notes

Compare with LongMemEval / LoCoMo only on memory-use behavior, not raw recall.
MemSyco-Bench is most useful for testing whether retrieved memories are used
with the right authority and scope.

## Related Papers

- Paper:https://arxiv.org/abs/2607.01071

## Impact Use

- `evaluator-benchmark`:candidate benchmark for harmful overuse of memory.
- `policy-privacy`:useful for memory authority and objective-evidence gates.
- Ready for ImpactReport:no, upgrade after full protocol read.
