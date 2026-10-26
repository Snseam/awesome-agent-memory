---
title: "MINTEval: Evaluating Memory under Multi-Target Interference in Long-Horizon Agent Systems"
benchmark_id: minteval
name: MINTEval
aliases:
  - Long-Horizon Memory under INTerference Evaluation
status: seed
origin_type: paper_origin
origin_source: https://arxiv.org/abs/2605.18565
first_public_date: 2026-05
domain: evolving_memory_interference
modality: text
task_grain: long_horizon_question_answering
capability_axes:
  - revised_fact_retrieval
  - multi_target_aggregation
  - interference_robustness
dataset_size: 15.6k question-answer pairs; mean context 138.8k tokens
data_nature: multi_domain_evolving_contexts
metrics:
  - answer_accuracy
judge_type: check
code_available: yes
data_available: yes
license: check
known_limitations:
  - seed note; splits, judge, artifact license, and baseline setup need full read
canonical_sources:
  - https://arxiv.org/abs/2605.18565
  - https://github.com/amy-hyunji/MINTEval
confidence: medium
memory_modules:
  - evaluator-benchmark
  - retriever-reranker
last_revised: 2026-09-28
---

# MINTEval

## What It Measures

Recall and aggregation when later updates interfere with earlier facts. The
origin paper spans state tracking, dialogue, Wikipedia revisions, and GitHub
commits; tasks include single-target recall and multi-target reasoning.

## Dataset / Scale

The paper reports 15.6k question-answer pairs, 138.8k average context tokens,
and a maximum of 1.8M tokens. The official repository links a dataset and
baseline runners; neither artifact nor split balance has been locally audited.

## Protocol

Long evolving contexts feed question answering after intervening updates. The
official implementation lists full-context, RAG, and memory-agent baselines.
Exact prompts, judges, and model parity need a full protocol pass.

## Comparability Notes

- The origin paper's system results are author-reported, not independent
  reproductions.
- The benchmark is about interference and aggregation, not merely context
  length. Compare domain, update count, model, and evidence budget together.

## Validity / License Caveats

- Code/data availability is linked by the authors; license and redistribution
  terms remain unchecked.
- No local dataset execution or score normalization was performed.

## Related Papers

- [Origin paper](https://arxiv.org/abs/2605.18565)
- [Official implementation](https://github.com/amy-hyunji/MINTEval)

## Impact Use

- `evaluator-benchmark`: tests whether retrieval and consolidation survive
  revised facts and multi-target interference.
- Ready for ImpactReport: no; normalize protocol and artifacts first.
