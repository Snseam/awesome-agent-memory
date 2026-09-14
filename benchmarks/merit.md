---
title: MERIT: Memory Evaluation for Realistic Instrumented Tasks
benchmark_id: merit
name: MERIT
aliases:
  - MERIT
  - Memory Evaluation for Realistic Instrumented Tasks
status: seed
origin_type: paper_origin
origin_source: https://arxiv.org/abs/2609.05441
first_public_date: 2026-09
domain: tool_using_memory_utility
modality: text
task_grain: episodic_tool_use
capability_axes:
  - memory_utility
  - leak_detection
  - updated_fact_recall
  - corruption_robustness
  - cost_accounting
dataset_size: 23,440 scored episodes in the paper-reported evaluation
data_nature: instrumented_tool_use_tasks
metrics:
  - dependent_task_success
  - updated_fact_recall
  - memory_leak_rate
  - token_cost
  - dollar_cost
judge_type: check
code_available: check
data_available: check
license: check
known_limitations:
  - seed note; release artifacts, task domains, and full cost-metering protocol need verification
canonical_sources:
  - https://arxiv.org/abs/2609.05441
confidence: medium
memory_modules:
  - evaluator-benchmark
  - retriever-reranker
last_revised: 2026-09-14
---

# MERIT

## What It Measures

MERIT evaluates whether long-term memory improves realistic tool-using agent
tasks while tracking failure modes and the cost of using memory.

## Dataset / Scale

The paper reports 23,440 scored episodes across three tool-use domains, with
instrumentation for token and dollar accounting. The exact task inventory and
release packaging need a full source read.

## Protocol

MERIT includes leak checks, updated-fact recall, controlled memory corruption,
and a preregistered grid over three models and three seeds. The design separates
memory utility from simply exposing more context to the agent.

## Metrics and Judging

The protocol tracks dependent-task success, recall of updated facts, leakage or
corruption behavior, and token/dollar cost. The paper's pilot and grid results
remain origin-paper evidence.

## Comparability Notes

MERIT is a tool-use utility and economics protocol, not a replacement for
LongMemEval or LoCoMo. Its value is the instrumented connection between memory
behavior, downstream actions, and runtime cost.

## Validity / License Caveats

- Code, traces, data, and license status are currently unchecked.
- Cost claims require dated model pricing and explicit caching assumptions.
- Paper-reported results should not be presented as independent reproduction.

## Related Papers

- Paper: https://arxiv.org/abs/2609.05441

## Impact Use

- `evaluator-benchmark`: candidate end-to-end memory utility protocol.
- Cost lane: candidate for measuring quality-cost break-even under tool use.
- Ready for ImpactReport: no, upgrade after release and setup review.
