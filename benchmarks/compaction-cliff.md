---
title: Compaction Cliff — context compaction and rule-retention benchmark
benchmark_id: compaction-cliff
name: The Compaction Cliff
aliases:
  - Compaction Cliff
  - AgentArtifactCorpus
status: seed
origin_type: paper_origin
origin_source: https://arxiv.org/abs/2608.22752
first_public_date: 2026-08
domain: context_compaction
modality: text
task_grain: long_horizon_agent_context
capability_axes:
  - rule_retention
  - artifact_retrieval
  - downstream_compliance
  - compaction_safety
data_nature: check
metrics:
  - retention_under_compaction
  - downstream_compliance
judge_type: check
code_available: check
data_available: check
license: check
known_limitations:
  - seed note; AgentArtifactCorpus details, splits, metrics, and Knowledge Triage setup need full read
canonical_sources:
  - https://arxiv.org/abs/2608.22752
confidence: medium
memory_modules:
  - evaluator-benchmark
  - parser-chunker
  - retriever-reranker
last_revised: 2026-08-31
---

# The Compaction Cliff

## What It Measures

The Compaction Cliff studies when context compaction causes agents to lose
rules, artifacts, or constraints that matter for later task compliance. It is a
benchmark signal for memory systems that summarize, compress, or offload
working context during long-horizon work.

## Protocol

The paper introduces AgentArtifactCorpus and evaluates rule retention,
retrieval, and downstream compliance after compaction. It also proposes
Knowledge Triage as a mitigation direction. Full task definitions and metric
normalization remain to be extracted.

## Baselines and Reported Results

No normalized scores are logged here. Treat all reported improvements as
paper-origin claims until claims ledger rows are expanded beyond the origin
event.

## Comparability Notes

Compare with long-context and memory benchmarks on retained obligations, not
conversation QA. This is a good check for memory kernels that turn active
context into durable artifacts.

## Related Papers

- Paper:https://arxiv.org/abs/2608.22752

## Impact Use

- `evaluator-benchmark`:candidate benchmark for compaction-safe memory.
- `parser-chunker`:useful for testing whether compressed context preserves obligations.
- Ready for ImpactReport:no, upgrade after full protocol read.
