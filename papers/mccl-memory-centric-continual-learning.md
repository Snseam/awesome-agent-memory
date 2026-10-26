---
title: Memory-Centric Continual Learning for AI Agents
arxiv_id: 2610.29357
source: arXiv:2610.29357
date: 2026-10
domain: memory
core_claim: |
  Agent memory should be assessed by whether experience improves future actions,
  not only by recall of stored facts; MCCL frames this as a two-loop memory and
  policy lifecycle with retention, adaptation, and transfer evaluation.
evidence_level: medium
code_available: check
data_available: check
license: check
memory_modules:
  - memorydiff-generator
  - retriever-reranker
  - evaluator-benchmark
status: seed
last_revised: 2026-10-26
urls:
  - https://arxiv.org/abs/2610.29357
---

# Memory-Centric Continual Learning for AI Agents (MCCL)

## Problem statement

Most memory evaluations ask whether an agent can retrieve stored information.
MCCL asks whether accumulated experience improves future agent behavior under
interference, distribution change, and transfer.

## Core claim

The paper proposes a three-axis taxonomy for memory substrates, assets, and
management policies. Its inner loop updates memory from experience; its outer
loop refines management policy from task feedback. The proposed evaluation
separates retention under interference, adaptation to change, and task transfer
from gains caused by merely giving an agent more context.

These are primary-paper methodological claims. This seed note does not
normalize results, infer production effectiveness, or treat the proposed
protocol as an independently reproduced benchmark.

## Decision relevance

- `memorydiff-generator`: distinguish changing memory state from changes to the
  policy that admits, consolidates, or removes it.
- `retriever-reranker`: evaluate retrieval as one component of future task
  behavior, not the end metric.
- `evaluator-benchmark`: retention, adaptation, and transfer provide a useful
  anti-shortcut frame for testing durable memory.

## Caveats

This is a v1 preprint. The taxonomy, evaluation tasks, scaling framework,
artifacts, licenses, and comparability against established memory benchmarks
need a full source and release review before use in an ImpactReport.

## Sources

- arXiv: https://arxiv.org/abs/2610.29357
