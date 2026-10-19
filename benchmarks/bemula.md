---
title: Bemula
benchmark_id: bemula
name: Bemula
aliases:
  - Can Agents Forget When Asked?
status: seed
origin_type: paper_origin
origin_source: https://arxiv.org/abs/2610.18052
first_public_date: 2026-10-13
domain: agent-memory-unlearning
modality: text
task_grain: multi-session dialogues with explicit forget requests
capability_axes:
  - exact deletion
  - preservation of unrelated memory
  - relearning
  - extraction-attack resistance
dataset_size: 50 dialogue instances; 135 requests; 1,742 questions
data_nature: benchmark-authored multi-session dialogue
metrics:
  - end-to-end forget-request success
  - storage
  - requested-information removal
  - preservation
  - relearning
  - extraction resistance
judge_type: benchmark tests
code_available: reported by authors; not locally verified
data_available: reported by authors; not locally verified
license: check
known_limitations:
  - protocol and artifact terms need full-source verification
  - origin results are not independent reproductions
canonical_sources:
  - https://arxiv.org/abs/2610.18052
confidence: medium
memory_modules:
  - evaluator-benchmark
  - security-privacy
  - memorydiff-generator
last_revised: 2026-10-19
---

# Bemula

## What It Measures

Bemula measures whether a long-term-memory agent honors a user forgetting
request precisely while preserving unrelated memories and resisting simple
extraction attempts.

## Dataset / Scale

The primary paper describes 50 multi-session dialogues, 135 forget requests in
six categories, and 1,742 questions. Every dialogue has a control without the
forget requests.

## Protocol and Evidence Boundary

The paper defines five suites for storage, removal, preservation, relearning,
and extraction resistance. Its negative results across six memory systems and
three backbone LLMs are author-reported origin evidence only; this note does
not normalize or compare their scores.

## Impact Use

- `evaluator-benchmark`: validates deletion as a multi-property lifecycle task.
- `security-privacy`: tests whether secrets remain recoverable after deletion.
- Ready for ImpactReport: no; require a full protocol/code/license review.

## Sources

- arXiv: https://arxiv.org/abs/2610.18052
