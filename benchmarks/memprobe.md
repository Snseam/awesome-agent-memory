---
title: MEMPROBE — hidden user-state recovery benchmark for long-term agent memory
benchmark_id: memprobe
name: MEMPROBE
aliases:
  - MEMPROBE
status: seed
origin_type: paper_origin
origin_source: https://arxiv.org/abs/2606.24595
first_public_date: 2026-06
domain: auditable_user_state_memory
modality: text
task_grain: post_interaction_memory_artifact_probe
capability_axes:
  - hidden_state_recovery
  - memory_artifact_audit
  - top_k_retrieval_robustness
dataset_size: 50 simulated users; 31 hidden dimensions each; 1,550 recovery targets
data_nature: synthetic_hidden_user_state
metrics:
  - category_balanced_recovery
  - full_store_recovery
  - top_k_recovery
judge_type: check
code_available: check
data_available: check
license: check
known_limitations:
  - seed note; protocol, simulator, data license, and score normalization need full read
canonical_sources:
  - https://arxiv.org/abs/2606.24595
confidence: medium
memory_modules:
  - evaluator-benchmark
  - policy-privacy
  - retriever-reranker
last_revised: 2026-06-29
---

# MEMPROBE

## What It Measures

MEMPROBE evaluates the memory artifact itself. Instead of judging only later
answers or task success, it asks what structured user state can be recovered
from a memory-equipped agent after ordinary assistance.

## Dataset / Scale

The arXiv abstract reports 50 simulated users, 31 hidden dimensions each, and
1,550 recovery targets. Tasks are leak-controlled so the benchmark can compare
what the memory store retains and exposes.

## Protocol

The benchmark reconstructs a taxonomy-anchored hidden user-state bank from the
agent's resulting memory under full-store and top-k access.

## Metrics and Judging

The abstract mentions category-balanced recovery and top-k recovery degradation.
Judging implementation details need a full read.

## Baselines and Reported Results

No normalized score rows are logged here. The paper's reported memory-system
results remain origin-paper evidence until mapped into ledger events.

## Validity / Contamination / License Caveats

- Synthetic ground truth improves auditability but may not capture real user
  ambiguity.
- Full-store access may not match production privacy boundaries; top-k probing
  is more operationally relevant.

## Comparability Notes

MEMPROBE is complementary to downstream personalization benchmarks: it measures
recoverable state, not just whether the agent completed a task.

## Related Papers

- Paper:https://arxiv.org/abs/2606.24595

## Impact Use

- `evaluator-benchmark`:candidate audit benchmark for memory artifact quality.
- `policy-privacy`:also useful for checking over-retention and recoverability
  boundaries.
- Ready for ImpactReport:no, upgrade after full protocol read.
