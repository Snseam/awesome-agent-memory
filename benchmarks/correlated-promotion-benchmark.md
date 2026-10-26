---
title: Correlated Promotion Benchmark
benchmark_id: correlated-promotion-benchmark
name: Correlated Promotion Benchmark
aliases:
  - CPB
  - CPB-Static
  - CPB-Live
status: seed
origin_type: paper_origin
origin_source: https://arxiv.org/abs/2609.30813
first_public_date: 2026-09
domain: shared_memory_admission
modality: text
task_grain: claim_admission
capability_axes:
  - source_lineage
  - duplicate_claim_detection
  - shared_memory_governance
  - false_belief_containment
dataset_size: CPB-Static and CPB-Live; exact item counts need full read
data_nature: annotated_sources_and_multi_agent_shared_store_runs
metrics:
  - false_adoption_rate
  - answer_coverage
  - consumer_probe_assertion_rate
judge_type: check
code_available: check
data_available: check
license: check
known_limitations:
  - seed note; lineage schema, release artifacts, and split construction need full read
canonical_sources:
  - https://arxiv.org/abs/2609.30813
confidence: medium
memory_modules:
  - evaluator-benchmark
  - policy-privacy
  - semantic-dedup
last_revised: 2026-09-28
---

# Correlated Promotion Benchmark

## What It Measures

CPB evaluates whether a shared-memory agent should admit a candidate claim when
the claim may be a copy, paraphrase, or unsupported repetition of previously
retrieved memory rather than independent evidence.

## Dataset / Scale

The abstract describes two settings:

- CPB-Static: a frozen split from publicly annotated sources with fixed gold
  admission actions.
- CPB-Live: multi-agent teams writing to a shared store, with write/retrieval
  logs and scenario-defined source lineage.

Exact instance counts, source licenses, and release artifacts need a full read.

## Protocol

Candidate claims are judged for admission into shared memory. A separate
consumer then answers from the memory store alone, exposing whether false
beliefs that entered memory become downstream assertions.

## Metrics and Judging

The abstract reports false-adoption ranges and consumer assertion rates under
different admission policies. These are paper-origin values and should not be
merged with independent reproductions.

## Comparability Notes

CPB is closest to GateMem, MUMBench, and memory-poisoning benchmarks, but its
core axis is epistemic admission under source correlation rather than user
visibility or prompt-injection resilience.

## Validity / License Caveats

- No normalized score table is recorded in this seed note.
- Release status, licensing, and lineage annotation details remain unchecked.
- The benchmark should be used for admission-policy design pressure, not as a
  general memory-system leaderboard.

## Related Papers

- A Benchmark and Diagnostic Study of Epistemic Admission in Shared Agent Memory:
  https://arxiv.org/abs/2609.30813

## Impact Use

- `semantic-dedup`: distinguishes repeated/paraphrased evidence from independent
  support.
- `policy-privacy`: shared memory needs admission policy, not just retrieval
  policy.
- `evaluator-benchmark`: candidate protocol for memory write-gate evaluation.
- Ready for ImpactReport: no, upgrade after full protocol and artifact review.
