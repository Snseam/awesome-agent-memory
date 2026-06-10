---
title: ConvoMem — conversational memory scaling benchmark
benchmark_id: convomem
name: ConvoMem
aliases:
  - ConvoMem Benchmark
status: full
origin_type: paper_origin
origin_source: ../papers/convomem.md
first_public_date: 2025-11
domain: long_term_chat_memory
modality: text
task_grain: qa
capability_axes:
  - user_facts
  - assistant_facts
  - abstention
  - preferences
  - changing_facts
  - implicit_connections
  - multi_evidence
dataset_size:
  qa_count: 75336
  token_scale: "1k-3M token configurable context"
data_nature: synthetic
metrics:
  - accuracy
  - cost
  - latency
judge_type: hybrid
code_available: yes
data_available: yes
license: check
known_limitations:
  - synthetic data
  - Mem0 is the main RAG baseline in the published comparison
  - headline conclusion depends on strong long-context models
canonical_sources:
  - ../papers/convomem.md
  - https://github.com/SalesforceAIResearch/ConvoMem
  - https://huggingface.co/datasets/Salesforce/ConvoMem
confidence: high
memory_modules:
  - evaluator-benchmark
  - retriever-reranker
  - dream-consolidator
  - context-packer
last_revised: 2026-06-11
---

# ConvoMem

## What It Measures

ConvoMem evaluates when conversation history is small enough for long-context
reading and when RAG-style memory becomes worthwhile. It covers six evidence
categories and multi-message evidence requirements.

## Dataset / Scale

The local full note records 75,336 QA items, conversation lengths from 2 to 300,
and configurable context token ranges from 1k to 3M.

## Protocol

The benchmark generates persona, use case, evidence core, and conversations
through one pipeline, then evaluates long-context, block extraction, and
RAG-style memory approaches on the same tasks.

## Metrics and Judging

The paper reports accuracy plus cost/latency curves. Exact-match and rubric
judging are used depending on the category.

## Baselines and Reported Results

ConvoMem is tracked both as a benchmark origin and as a critique source for
LongMemEval and LoCoMo. Critique events must not be counted as independent
reproduction unless a rerun is documented.

## Validity / Contamination / License Caveats

The data is synthetic and enterprise-persona weighted. Do not generalize the
"first 150 conversations do not need RAG" claim to all memory products without
checking model, domain, and context-window assumptions.

## Comparability Notes

ConvoMem is most useful for cost/quality crossover analysis. It should be
reported separately from LongMemEval-style ability diagnosis.

## Related Papers

- [`../papers/convomem.md`](../papers/convomem.md)
- [`../papers/longmemeval.md`](../papers/longmemeval.md)
- [`../papers/mem0-paper.md`](../papers/mem0-paper.md)

## Related Products

- [`../products/mem0.md`](../products/mem0.md)

## Impact Use

- Ready for ImpactReport: yes
- Recommended use: host-side context-packer policy and RAG-vs-long-context
  crossover tests.
