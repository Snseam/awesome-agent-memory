---
title: PM-Bench — prospective memory benchmark for LLM agents
benchmark_id: pm-bench
name: PM-Bench
aliases:
  - PM-Bench
  - Prospective Memory Bench
status: seed
origin_type: paper_origin
origin_source: https://arxiv.org/abs/2607.12385
first_public_date: 2026-07
domain: prospective_memory
modality: text
task_grain: delayed_intention_execution
capability_axes:
  - delayed_intention
  - cue_monitoring
  - ongoing_activity
  - state_change_detection
data_nature: simulated_week
metrics:
  - f1
  - intention_execution_accuracy
judge_type: check
code_available: check
data_available: check
license: check
known_limitations:
  - seed note; protocol, task counts, resources, and reported results need full read
canonical_sources:
  - https://arxiv.org/abs/2607.12385
confidence: medium
memory_modules:
  - evaluator-benchmark
  - retriever-reranker
  - policy-privacy
last_revised: 2026-07-20
---

# PM-Bench

## What It Measures

PM-Bench evaluates prospective memory: whether an LLM agent can remember an
intention, keep doing an ongoing activity, monitor future cues or state changes,
and execute the deferred task when it becomes due.

## Protocol

The arXiv abstract describes a text-based simulated seven-day week inspired by
the cognitive-science Virtual Week paradigm. Agents continue an ongoing
activity while deciding whether any delayed intention should fire. Full task
templates, released resources, and configuration details need a deeper read.

## Baselines and Reported Results

No normalized scores are logged here. The abstract reports a best F1 score under
one agent configuration, but that remains an author-reported result until the
setup, model versions, and evaluation scripts are checked.

## Comparability Notes

Compare PM-Bench with LoCoMo / LongMemEval only on long-horizon memory behavior,
not on factual recall. PM-Bench is most useful when the design question is
whether a memory layer can preserve pending commitments and state-triggered
intentions over time.

## Related Papers

- Paper:https://arxiv.org/abs/2607.12385

## Impact Use

- `evaluator-benchmark`:candidate benchmark for pending-intention recall and
  cue monitoring.
- `policy-privacy`:helps separate legitimate reminders from stale or
  unauthorized remembered intentions.
- Ready for ImpactReport:no, upgrade after full protocol read.
