---
title: StructMemEval — memory-structure organization benchmark
benchmark_id: structmemeval
name: StructMemEval
aliases:
  - Evaluating Memory Structure in LLM Agents
status: seed
origin_type: paper_origin
origin_source: https://arxiv.org/abs/2602.11243
first_public_date: 2026-02
domain: structured_memory_organization
modality: text
task_grain: structured_task_suite
capability_axes:
  - memory_structure_selection
  - structured_state_tracking
  - task_specific_organization
  - retrieval_beyond_fact_recall
dataset_size:
  task_families: "accounting, tree-based, state tracking, recommendations"
data_nature: synthetic_structured_tasks
metrics:
  - task_accuracy
judge_type: deterministic_or_task_specific
code_available: yes
data_available: yes
license: Apache-2.0 code; dataset license check
known_limitations:
  - seed note; full protocol, splits, and result tables still need normalization
  - source emphasizes prompting memory agents to use an appropriate structure
canonical_sources:
  - https://arxiv.org/abs/2602.11243
  - https://github.com/yandex-research/StructMemEval
confidence: medium
memory_modules:
  - evaluator-benchmark
  - parser-chunker
  - retriever-reranker
last_revised: 2026-06-24
---

# StructMemEval

## What It Measures

StructMemEval tests whether an LLM agent can organize long-term memory into
task-useful structures instead of only recalling facts. The paper frames this as
a gap in existing long-term memory benchmarks, which often measure simple
fact retention, multi-hop recall, or temporal updates but do not stress complex
memory hierarchies.

## Dataset / Scale

The supplementary repository lists raw benchmark data for accounting,
tree-based, state-machine location, and recommendation-style tasks. The exact
split sizes and license details still need a full source read before this note
can support ImpactReport-grade claims.

## Protocol

Tasks are designed around structures that humans would naturally maintain, such
as transaction ledgers, to-do lists, trees, and state trackers. The key protocol
question is whether the agent can choose and maintain the right structure for
the task, not merely retrieve a stored fact.

## Metrics and Judging

The primary metric is task accuracy. Judge implementation and confidence
reporting need source normalization.

## Baselines and Reported Results

The arXiv abstract reports that simple retrieval-augmented LLMs struggle on
these tasks, while memory agents can perform reliably when prompted to organize
memory. Treat that as paper-origin evidence only until results are fully
normalized here.

## Validity / Contamination / License Caveats

- This note is seed quality.
- The benchmark may be sensitive to prompt hints that tell an agent which
  memory structure to use.
- Code appears to be Apache-2.0 in the supplementary repository; dataset
  redistribution status still needs a full check.

## Comparability Notes

StructMemEval is not directly comparable to LoCoMo, LongMemEval, or ConvoMem:
it targets memory organization and structure selection rather than conversational
fact recall.

## Related Papers

- [arXiv 2602.11243](https://arxiv.org/abs/2602.11243)

## Related Products

-

## Impact Use

- Ready for ImpactReport: no, upgrade to full note first.
- Recommended use: add an evaluator lane for structure-aware memory tasks.
