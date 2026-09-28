---
title: "Keep It InMind: Benchmarking the Implicit-Association Blind Spot in Agent Memory"
benchmark_id: inmind
name: InMind
aliases:
  - Keep It InMind
status: seed
origin_type: paper_origin
origin_source: https://arxiv.org/abs/2607.24368
first_public_date: 2026-07
domain: implicit_association_retrieval
modality: text
task_grain: paired_direct_indirect_query
capability_axes:
  - implicit_association
  - knowledge_bridging
  - memory_routing
dataset_size: 125 expert-verified tasks
data_nature: synthetic_user_facts_with_public_provenance_for_most_tasks
metrics:
  - answer_accuracy
  - target_recall
judge_type: check
code_available: partial
data_available: yes
license: check
known_limitations:
  - small diagnostic set; paper-aligned baselines and repository license are not released
  - sensitive synthetic topics require careful interpretation
canonical_sources:
  - https://arxiv.org/abs/2607.24368
  - https://github.com/imlrz/InMind
confidence: medium
memory_modules:
  - evaluator-benchmark
  - retriever-reranker
last_revised: 2026-09-28
---

# InMind

## What It Measures

Whether an agent uses stored user facts when an indirect query requires world
knowledge to connect that fact to the answer. Paired direct and indirect
queries distinguish storage, bridging-knowledge, and retrieval failures.

## Dataset / Scale

The origin paper reports 125 expert-verified tasks across ten life domains;
the official repository publishes 125 JSONL records, a schema, provenance,
and a fixed background trace. User facts and conversations are synthetic.

## Protocol

The same stored fact is tested through a direct query and an indirect query.
The released package provides timeline generation and judging scripts. The
authors' baseline adapters, paper-aligned results, and repository license were
still marked incomplete in its release roadmap at this check.

## Comparability Notes

- Author-reported retrieval gaps are diagnostic paper results, not independent
  product rankings.
- Small percentage differences and warning-heavy answers may mislead; compare
  direct/indirect pairs under the same memory state and answer policy.

## Validity / License Caveats

- Repository license and archival release remain unchecked on the project
  roadmap. Do not assume dataset redistribution rights.
- The local catalog has not run the published scripts.

## Related Papers

- [Origin paper](https://arxiv.org/abs/2607.24368)
- [Official dataset and protocol](https://github.com/imlrz/InMind)

## Impact Use

- `evaluator-benchmark`: tests routing of important memories that query-text
  similarity may not retrieve.
- Ready for ImpactReport: no; complete artifact and judge review first.
