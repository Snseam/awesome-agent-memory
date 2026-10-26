---
title: TWIST: Intervention Quality in Conversational Memory
benchmark_id: twist
name: TWIST
aliases:
  - TWIST
status: seed
origin_type: paper_origin
origin_source: https://arxiv.org/abs/2609.28575
first_public_date: 2026-09
domain: conversational_memory_intervention
modality: text
task_grain: contradiction_and_belief_revision_intervention
capability_axes:
  - unprompted_tension_detection
  - outgoing_draft_vetting
  - belief_supersession
  - sensitive_recall_governance
dataset_size: Track B v1.0 has 161 human-validated items; full suite size needs full read
data_nature: LoCoMo-derived conversational memory intervention suite
metrics:
  - contradiction_recall
  - hard_negative_specificity
  - attribution
judge_type: human_validated_and_model_baselines
code_available: check
data_available: check
license: check
known_limitations:
  - proposed benchmark; full release artifacts and license need verification
canonical_sources:
  - https://arxiv.org/abs/2609.28575
confidence: medium
memory_modules:
  - evaluator-benchmark
  - policy-privacy
  - retriever-reranker
last_revised: 2026-09-28
---

# TWIST

## What It Measures

TWIST is a proposed benchmark for intervention quality in conversational memory:
whether a deployed memory system knows when to detect tension, block unsafe or
contradictory outgoing drafts, preserve supersession history, and govern
sensitive recall.

## Dataset / Scale

The abstract says TWIST extends LoCoMo-style corpora and reports a
human-validated Track B v1.0 key with 161 items. Full suite size, release
status, and license need follow-up.

## Protocol

The benchmark exercises the system through its own ingest, recall, and vetting
surface. Matched hard negatives are used to price false interventions, so a
system cannot win by flagging everything.

## Metrics and Judging

The abstract reports contradiction recall, hard-negative specificity, and
attribution. These are paper-origin values and should remain separate from
independent reproductions.

## Comparability Notes

TWIST complements recall-heavy conversational memory benchmarks such as LoCoMo
and LongMemEval by measuring whether memory should intervene at belief-change
points. It is not a generic answer-accuracy leaderboard.

## Validity / License Caveats

- Proposed benchmark; release artifacts are unchecked.
- Human annotation details and judge calibration need a full read.
- Because it extends existing conversational-memory corpora, contamination and
  license inheritance should be checked before using it in ImpactReports.

## Related Papers

- TWIST: https://arxiv.org/abs/2609.28575

## Impact Use

- `policy-privacy`: sensitive-recall and intervention governance signal.
- `retriever-reranker`: recall is insufficient without contradiction and
  hard-negative controls.
- `evaluator-benchmark`: useful companion to LoCoMo / LongMemEval.
- Ready for ImpactReport: no, upgrade after full protocol and artifact review.
