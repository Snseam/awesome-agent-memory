---
title: DyadMem — relationship-aware long-term agent memory benchmark
benchmark_id: dyadmem
name: DyadMem
aliases:
  - DyadMem
status: seed
origin_type: paper_origin
origin_source: https://arxiv.org/abs/2610.03020
first_public_date: 2026-10-02
domain: relationship_aware_agent_memory
modality: text
task_grain: episode_session_qa
capability_axes:
  - capture
  - update
  - recall
  - deletion
  - full_pipeline
dataset_size: 3,065 episodes / 50,961 sessions / 61,210 QA
data_nature: author_annotated_multi_session_trajectories
metrics:
  - capture_recall
  - update_recall
  - question_answering
judge_type: paper-described QA settings
code_available: check
data_available: check
license: check
known_limitations:
  - seed note; paper-origin protocol only
  - artifact and license status not independently checked
canonical_sources:
  - https://arxiv.org/abs/2610.03020
confidence: medium
memory_modules:
  - evaluator-benchmark
  - user-model
  - policy-privacy
last_revised: 2026-10-05
---

# DyadMem

## What It Measures

DyadMem evaluates how an agent captures, updates, recalls, and deletes
relationship-aware information across multi-session interactions.

## Dataset / Scale

The paper describes 3,065 episodes, 50,961 sessions, and 61,210 question-answer
items. The dataset is presented as author-annotated multi-session trajectories.

## Protocol

The protocol separates capture, update, and recall behavior and also reports a
full-pipeline setting. Deletion and relationship-sensitive memory behavior are
important dimensions beyond ordinary factual recall.

## Metrics and Judging

The paper uses capture recall, update recall, and question-answering measures.
Exact judge prompts, splits, and annotation procedures need a full read.

## Evidence Boundary

This is a paper-origin benchmark note. No score is treated as an independent
reproduction, and code, data, and license availability remain unchecked.

## Comparability Notes

DyadMem is complementary to LongMemEval and LoCoMo because it emphasizes
relationship-aware memory lifecycle behavior and multi-session coverage.

## Sources

- arXiv: https://arxiv.org/abs/2610.03020
