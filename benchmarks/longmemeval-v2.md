---
title: "LongMemEval-V2: Evaluating Long-Term Agent Memory Toward Experienced Colleagues"
benchmark_id: longmemeval-v2
name: LongMemEval-V2
aliases:
  - LME-V2
status: seed
origin_type: paper_origin
origin_source: https://arxiv.org/abs/2605.12493
first_public_date: 2026-05
domain: environment_experience_memory
modality: multimodal_web_trajectories
task_grain: trajectory_history_question
capability_axes:
  - static_state_recall
  - dynamic_state_tracking
  - workflow_knowledge
  - environment_gotchas
  - premise_awareness
dataset_size: 451 curated questions; histories up to 500 trajectories and 115M tokens
data_nature: customized_web_and_enterprise_environment_trajectories
metrics:
  - answer_accuracy
  - query_latency
judge_type: check
code_available: yes
data_available: yes
license: code Apache-2.0; dataset terms check
known_limitations:
  - seed note; evaluation tiers, judge, dataset license, and result setup not fully normalized
  - distinct from the original LongMemEval conversational-memory benchmark
canonical_sources:
  - https://arxiv.org/abs/2605.12493
  - https://github.com/xiaowu0162/LongMemEval-V2
confidence: medium
memory_modules:
  - evaluator-benchmark
  - retriever-reranker
last_revised: 2026-09-28
---

# LongMemEval-V2

## What It Measures

Whether memory built from prior agent trajectories supplies the environment
experience needed to answer questions about state, workflows, failure modes,
and invalid premises. This is not the original LongMemEval's user-chat protocol.

## Dataset / Scale

The origin paper reports 451 manually curated questions and histories as large
as 500 trajectories / 115M tokens. The official repository describes web and
enterprise domains and small/medium public tiers. These are paper/repository
descriptions, not a locally reproduced dataset audit.

## Protocol

Memory backends ingest trajectories and return compact text or image evidence
for a fixed downstream reader. The released harness includes no-retrieval,
RAG, and AgentRunbook baselines; its repository specifies answer accuracy and
latency evaluation. Exact tier weights and judging remain to be normalized.

## Comparability Notes

- The origin paper's AgentRunbook results are author-reported, not independent
  reproductions or cross-product rankings.
- Keep model, reader, tier, memory-context budget, and latency setup fixed
  before comparing methods.
- Do not merge this benchmark's events with original LongMemEval.

## Validity / License Caveats

- Code is released under Apache-2.0; dataset redistribution terms need review.
- The full paper, released data, and scorer have not been locally executed.

## Related Papers

- [Origin paper](https://arxiv.org/abs/2605.12493)
- [Official code and protocol](https://github.com/xiaowu0162/LongMemEval-V2)

## Impact Use

- `evaluator-benchmark`: environment-experience memory and accuracy/latency
  pressure, not generic chat recall.
- Ready for ImpactReport: no; normalize protocol and artifacts first.
