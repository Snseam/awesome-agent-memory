---
title: LoCoMo — very long-term conversational memory benchmark
benchmark_id: locomo
name: LoCoMo
aliases:
  - LOCOMO
status: seed
origin_type: paper_origin
origin_source: ../papers/locomo.md
first_public_date: 2024
domain: long_term_chat_memory
modality: text
task_grain: qa
capability_axes:
  - factual_recall
  - temporal_reasoning
  - causal_reasoning
  - multi_session_consistency
dataset_size:
  conversation_count: 10
  qa_count: check
data_nature: synthetic_hybrid
metrics:
  - f1
  - bleu
  - llm_as_judge
judge_type: hybrid
code_available: check
data_available: check
license: check
known_limitations:
  - small conversation count
  - product scores often use incompatible setups
canonical_sources:
  - ../papers/locomo.md
  - https://aclanthology.org/2024.acl-long.747.pdf
confidence: medium
memory_modules:
  - evaluator-benchmark
  - retriever-reranker
last_revised: 2026-06-11
---

# LoCoMo

## What It Measures

LoCoMo targets very long-term conversational memory: factual recall, temporal
reasoning, causal reasoning, and consistency over month-scale dialogue history.

## Dataset / Scale

The local seed note records a small long-dialogue setup and flags that the full
method summary still needs precision work. Mem0's full paper note also treats
LoCoMo as its primary benchmark.

## Protocol

LoCoMo is commonly used to compare memory systems under long conversation
history. Because product pages frequently cite LoCoMo without identical setup
details, usage events must preserve model, memory method, judge, and context
budget when available.

## Metrics and Judging

The Mem0 paper note reports F1, BLEU-1, and LLM-as-judge style scores on LoCoMo.
Any score table must identify whether it comes from a paper evaluation, vendor
self-report, or independent reproduction.

## Baselines and Reported Results

Tracked usage events include Mem0 paper results, Mem0 blog algorithm-v2 claims,
Zep product-page claims, MemoryOS claims, and Graphiti-as-Zep-foundation notes.

## Validity / Contamination / License Caveats

The main caveat is sample size: the Mem0 note and ConvoMem note both flag that
LoCoMo has limited statistical power for broad product claims.

## Comparability Notes

LoCoMo is useful for temporal/causal schema pressure. It is not a universal
memory-product leaderboard unless setup parity is documented.

## Related Papers

- [`../papers/locomo.md`](../papers/locomo.md)
- [`../papers/mem0-paper.md`](../papers/mem0-paper.md)
- [`../papers/convomem.md`](../papers/convomem.md)

## Related Products

- [`../products/mem0.md`](../products/mem0.md)
- [`../products/zep.md`](../products/zep.md)
- [`../products/graphiti.md`](../products/graphiti.md)
- [`../products/memoryos.md`](../products/memoryos.md)

## Impact Use

- Ready for ImpactReport: no, seed note should be upgraded first.
- Recommended use: schema validation for temporal reasoning, valid-time fields,
  and causal/multi-session consistency.
