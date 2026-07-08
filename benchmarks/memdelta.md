---
title: MemDelta — controlled baselines for agent-memory evaluation
benchmark_id: memdelta
name: MemDelta
aliases:
  - MemDelta
status: seed
origin_type: paper_origin
origin_source: https://arxiv.org/abs/2606.29914
first_public_date: 2026-06
domain: memory_evaluation_methodology
modality: text
task_grain: controlled_memory_vs_rag_evaluation
capability_axes:
  - baseline_control
  - cost_reporting
  - model_family_sensitivity
  - embedding_model_sensitivity
data_nature: LongMemEval-S controlled protocol
metrics:
  - accuracy
  - cost
  - refusal_rate
  - component_delta
judge_type: source_protocol_check
code_available: check
data_available: check
license: check
known_limitations:
  - seed note; protocol, significance tests, and compared pipelines need full read
canonical_sources:
  - https://arxiv.org/abs/2606.29914
confidence: medium
memory_modules:
  - evaluator-benchmark
  - retriever-reranker
last_revised: 2026-07-06
---

# MemDelta

## What It Measures

MemDelta is a controlled evaluation protocol for agent-memory claims. It asks
whether reported memory gains are actually caused by the memory architecture or
by confounds such as the language model, embedding model, retrieval pipeline, or
write-path cost.

## Protocol

The abstract describes one-component-at-a-time comparisons on LongMemEval-S
across multiple model families. It recommends fixing embedding models across
comparisons, stratifying by model family, and reporting write-path cost before
attributing gains to a memory architecture.

## Baselines and Reported Results

No normalized results are logged here. MemDelta's reported comparisons remain
paper-origin methodological claims until the setup is fully mapped.

## Comparability Notes

Use MemDelta as a claims-ledger discipline tool. It is not a new end-user memory
task, but it is directly relevant when comparing Mem0, RAG, full context, and
memory servers on LongMemEval-like protocols.

## Related Papers

- Paper:https://arxiv.org/abs/2606.29914

## Impact Use

- `evaluator-benchmark`:baseline-control checklist for future benchmark notes.
- `retriever-reranker`:warns against comparing retrieval stacks with different
  embedding models as if only memory architecture changed.
- Ready for ImpactReport:no, upgrade after full protocol read.
