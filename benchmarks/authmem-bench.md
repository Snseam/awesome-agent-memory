---
title: AuthMem-Bench — authority collapse at the memory consolidation boundary
benchmark_id: authmem-bench
name: AuthMem-Bench
aliases:
  - AuthMem-Bench
  - Authority Collapse
status: seed
origin_type: paper_origin
origin_source: https://arxiv.org/abs/2608.01679
first_public_date: 2026-08
domain: memory_authority_governance
modality: text
task_grain: paired_authority_and_downstream_action_evaluation
capability_axes:
  - source_authority
  - provenance
  - consolidation_safety
  - unauthorized_action_prevention
data_nature: controlled_paired_benchmark
metrics:
  - write_time_collapse_rate
  - downstream_authorization_error
  - unauthorized_action_rate
judge_type: benchmark_protocol_and_automatic_label_checks
code_available: check
data_available: check
license: check
known_limitations:
  - seed note; authority labels, task construction, and released artifacts need full review
canonical_sources:
  - https://arxiv.org/abs/2608.01679
confidence: medium
memory_modules:
  - evaluator-benchmark
  - policy-privacy
  - memorydiff-generator
last_revised: 2026-08-10
---

# AuthMem-Bench

## What It Measures

AuthMem-Bench evaluates authority collapse: a memory consolidator preserves a
claim while dropping constraints about who said it, under what authority, and
how it may be reused.

## Dataset / Scale

The paper describes a controlled paired benchmark that holds the downstream task
and focal claim fixed while varying source authority. Exact item count, release
format, and license need full review.

## Protocol

The benchmark checks write-time collapse, downstream authorization errors, and
whether persisted authority labels reduce unauthorized actions.

## Metrics and Judging

Reported collapse rates and unauthorized-action rates are author-reported
paper-origin claims. This repository records the protocol pressure, not a
leaderboard.

## Baselines and Reported Results

The source evaluates multiple consolidators and LLM backbones, but those results
remain origin-paper claims until the setup is normalized and independently
reproduced.

## Validity / Contamination / License Caveats

Authority metadata can be domain-specific. Full review must verify the label
taxonomy, action-grounded task construction, and whether automatic checks
overlook subtle source constraints.

## Comparability Notes

AuthMem-Bench belongs beside GateMem, MEMPROBE, MemSyco-Bench, and memory
poisoning work because it tests governance at the consolidation boundary rather
than simple retrieval accuracy.

## Related Papers

- Paper:https://arxiv.org/abs/2608.01679

## Impact Use

- `policy-privacy`:candidate benchmark for source authority and authorized
  reuse controls.
- `memorydiff-generator`:authority labels should persist through consolidation.
- `evaluator-benchmark`:separate write-time collapse from downstream action
  failure.
- Ready for ImpactReport:no, upgrade after full protocol and artifact review.
