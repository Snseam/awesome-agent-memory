---
title: LongMemEval — long-term interactive memory benchmark
benchmark_id: longmemeval
name: LongMemEval
aliases:
  - LongMemEval_S
  - LongMemEval_M
status: full
origin_type: paper_origin
origin_source: ../papers/longmemeval.md
first_public_date: 2024-10
domain: long_term_chat_memory
modality: text
task_grain: qa
capability_axes:
  - information_extraction
  - multi_session_reasoning
  - knowledge_update
  - temporal_reasoning
  - abstention
dataset_size:
  qa_count: 500
  token_scale: "115k tokens (S) / 1.5M tokens (M)"
data_nature: human_annotated
metrics:
  - accuracy
  - llm_as_judge
judge_type: llm_judge
code_available: yes
data_available: yes
license: MIT (check)
known_limitations:
  - small subgroup sample sizes
  - possible benchmark contamination after publication
  - LLM-as-judge bias
canonical_sources:
  - ../papers/longmemeval.md
  - https://arxiv.org/abs/2410.10813
  - https://github.com/xiaowu0162/LongMemEval
confidence: high
memory_modules:
  - evaluator-benchmark
  - retriever-reranker
  - dream-consolidator
last_revised: 2026-06-11
---

# LongMemEval

## What It Measures

LongMemEval evaluates whether a chat assistant can answer questions grounded in
multi-session, long-term conversation history. It is useful because it separates
five memory abilities: information extraction, multi-session reasoning,
knowledge update, temporal reasoning, and abstention.

## Dataset / Scale

The local full note records 500 human-annotated QA items, two context scales,
and seven question types. LongMemEval_S covers a single-session scale around
115k tokens; LongMemEval_M covers 500 sessions at roughly 1.5M tokens.

## Protocol

The paper frames chat memory as indexing -> retrieval -> reading, with control
points for value, key, query, and reading. This makes it a direct input for
`evaluator-benchmark` and `retriever-reranker` design.

## Metrics and Judging

The benchmark uses ground-truth answers and LLM-as-judge scoring. Any reuse
should keep the judge model, subset, and question type visible.

## Baselines and Reported Results

Tracked usage events live in [`claims/claims.yaml`](claims/claims.yaml).
Current repo evidence includes Mem0 and Hindsight product claims using
LongMemEval, plus ConvoMem's methodological critique of the benchmark's sample
size and filler-conversation leakage risk.

## Validity / Contamination / License Caveats

The local note flags subgroup error bars, LLM-as-judge bias, and possible
training contamination as the main caveats. Do not use small subgroup deltas as
strong evidence without independent reruns.

## Comparability Notes

LongMemEval is best for capability-level diagnosis. Scores should not be mixed
with LoCoMo or ConvoMem unless the report separates task family, dataset scale,
and judge setup.

## Related Papers

- [`../papers/longmemeval.md`](../papers/longmemeval.md)
- [`../papers/convomem.md`](../papers/convomem.md)

## Related Products

- [`../products/mem0.md`](../products/mem0.md)
- [`../products/hindsight.md`](../products/hindsight.md)
- [`../products/hy-memory.md`](../products/hy-memory.md)

## Impact Use

- Ready for ImpactReport: yes
- Recommended use: v0 regression suite for long-term chat-memory retrieval,
  knowledge update, temporal reasoning, and abstention.
