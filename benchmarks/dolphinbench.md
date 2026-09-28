---
title: DolphinBench: Mapping the Pareto Frontier of Agent Memory
benchmark_id: dolphinbench
name: DolphinBench
aliases:
  - DolphinBench
status: seed
origin_type: paper_origin
origin_source: https://arxiv.org/abs/2609.24971
first_public_date: 2026-09
domain: agent_memory_pareto_benchmark
modality: text/tool
task_grain: tool_using_agent_tasks
capability_axes:
  - task_completion
  - memory_use
  - cost
  - latency
dataset_size: 600 tool-using tests per Mem0 blog; exact paper protocol needs full read
data_nature: action_based_agent_memory_tests
metrics:
  - task_completion
  - cost
  - latency
  - pareto_frontier
judge_type: check
code_available: check
data_available: check
license: check
known_limitations:
  - Mem0-affiliated benchmark and leaderboard; vendor/affiliated evidence only
  - seed note; full protocol, solvability gates, and release artifacts need verification
canonical_sources:
  - https://arxiv.org/abs/2609.24971
  - https://mem0.ai/blog/introducing-dolphinbench-mapping-the-pareto-frontier-of-agent-memory
confidence: medium
memory_modules:
  - evaluator-benchmark
last_revised: 2026-09-28
---

# DolphinBench

## What It Measures

DolphinBench evaluates agent memory with an action/task lens rather than only
question-answer recall. The Mem0 blog frames it as a Pareto frontier over task
completion, cost, and latency.

## Dataset / Scale

The Mem0 blog describes 600 tool-using tests and solvability gates. Exact splits,
task construction, code/data release, and license need verification from the
paper and artifacts.

## Protocol

This seed note records DolphinBench as an affiliated benchmark candidate for
agent-memory utility under cost/latency constraints. It should not be treated as
an independent leaderboard.

## Metrics and Judging

Reported completion, cost, latency, and Pareto-frontier results remain
paper-origin or vendor-affiliated evidence until independently reproduced.

## Comparability Notes

DolphinBench is complementary to MERIT and MemDelta because it emphasizes
agent-task outcomes and cost/latency tradeoffs. Do not average it with
LoCoMo/LongMemEval recall scores.

## Validity / License Caveats

- Mem0 affiliation must remain explicit in claims.
- Release artifacts, task licenses, and judge details are unchecked.

## Related Papers

- DolphinBench:https://arxiv.org/abs/2609.24971

## Related Products

- [`../products/mem0.md`](../products/mem0.md)

## Impact Use

- `evaluator-benchmark`: candidate for cost/latency-aware agent-memory utility.
- Ready for ImpactReport: no, upgrade after full protocol and artifact review.
