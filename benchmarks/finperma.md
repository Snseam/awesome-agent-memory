---
title: FinPerMA — event-grounded personalized-memory benchmark for LLM agents
benchmark_id: finperma
name: FinPerMA
aliases:
  - FinPerMA
status: seed
origin_type: paper_origin
origin_source: https://arxiv.org/abs/2608.04095
first_public_date: 2026-08
domain: personalized_memory_benchmark
modality: text
task_grain: longitudinal_persona_event_adaptation
capability_axes:
  - personalization
  - preference_update
  - event_grounding
  - shock_adaptation
data_nature: synthetic_or_controlled_longitudinal_investor_personas
metrics:
  - accuracy
  - multiple_choice_accuracy
  - post_shock_accuracy
judge_type: automatic_screening_and_task_metrics
code_available: check
data_available: check
license: check
known_limitations:
  - seed note; finance-domain assumptions, persona generation, and artifact release need full review
canonical_sources:
  - https://arxiv.org/abs/2608.04095
confidence: medium
memory_modules:
  - evaluator-benchmark
  - memorydiff-generator
last_revised: 2026-08-10
---

# FinPerMA

## What It Measures

FinPerMA evaluates whether a personalized LLM agent can maintain and update an
individual user model over long horizons when material events change the user's
preferences or constraints.

## Dataset / Scale

The source reports 276 investor personas and 2,994 questions. It describes
frozen longitudinal trajectories, deterministic theory-informed impact rules,
controlled narration, and automated quality screening.

## Protocol

A Post-Shock checkpoint isolates whether the agent incorporated a material event
into persistent user memory rather than only recalling static facts.

## Metrics and Judging

The abstract reports overall and multiple-choice accuracy across frontier LLMs
and memory configurations. This seed records the benchmark shape only; it does
not normalize the reported numbers.

## Baselines and Reported Results

All reported results are paper-origin claims. The source's observation that
summary memory may retain facts while losing preference signals is decision
relevant but must stay author-reported until reproduced.

## Validity / Contamination / License Caveats

The benchmark is high-stakes-domain inspired and uses controlled personas. Full
review must verify whether financial assumptions, persona data, code, and data
licenses are fit for reuse.

## Comparability Notes

FinPerMA complements LoCoMo, DynamicMem, and PersonaMem-style work by putting
preference adaptation under event shocks ahead of static factual recall.

## Related Papers

- Paper:https://arxiv.org/abs/2608.04095

## Impact Use

- `evaluator-benchmark`:candidate benchmark for personalized memory update.
- `memorydiff-generator`:preference changes should be modeled as event-driven
  state transitions, not only accumulated profile summaries.
- Ready for ImpactReport:no, upgrade after full protocol and artifact review.
