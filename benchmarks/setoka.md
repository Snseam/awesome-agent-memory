---
title: Setoka — hierarchical user-understanding benchmark
benchmark_id: setoka
name: Setoka
aliases:
  - Setoka
status: seed
origin_type: paper_origin
origin_source: https://arxiv.org/abs/2607.27056
first_public_date: 2026-07
domain: personalized_agent_memory
modality: heterogeneous_user_data
task_grain: hierarchical_user_understanding
capability_axes:
  - explicit_fact_retrieval
  - abstract_persona_inference
  - heterogeneous_data_grounding
  - personalization
data_nature: heterogeneous_personal_data_tasks
metrics:
  - retrieval_accuracy
  - persona_understanding
  - inference_quality
judge_type: source_protocol_check
code_available: check
data_available: check
license: check
known_limitations:
  - seed note; data provenance, privacy boundary, and task construction need full read
canonical_sources:
  - https://arxiv.org/abs/2607.27056
confidence: medium
memory_modules:
  - evaluator-benchmark
  - retriever-reranker
  - policy-privacy
last_revised: 2026-08-03
---

# Setoka

## What It Measures

Setoka evaluates whether personalized agents can infer hierarchical user
understanding from heterogeneous data, rather than only retrieve facts explicitly
stated in conversations.

## Protocol

The arXiv abstract positions Setoka as a benchmark for deeper user
understanding: explicit memory retrieval plus abstract personal characteristics
needed for personalized assistance.

## Baselines and Reported Results

No normalized results are recorded. Treat any paper scores as origin-protocol
claims until the benchmark setup and data construction are fully reviewed.

## Validity / Contamination / License Caveats

Personalized memory benchmarks can encode sensitive user data assumptions. Full
review should check data provenance, consent model, privacy risks, and whether
abstract-persona labels are stable enough for kernel decisions.

## Related Papers

- Paper:https://arxiv.org/abs/2607.27056

## Impact Use

- `evaluator-benchmark`:candidate protocol for user-modeling depth.
- `policy-privacy`:privacy and consent caveats are first-order.
- Ready for ImpactReport:no, upgrade after full protocol read.
