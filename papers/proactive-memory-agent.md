---
title: Remember When It Matters — Proactive Memory Agent for Long-Horizon Agents
arxiv_id: 2607.08716
source: arXiv:2607.08716
date: 2026-07
domain: memory
core_claim: |
  A separate memory agent can update a structured memory bank and selectively
  inject memory-grounded reminders into long-horizon agents when state would
  otherwise decay from the working context.
evidence_level: medium
code_available: check
license: check
memory_modules:
  - dream-consolidator
  - retriever-reranker
  - evaluator-benchmark
status: seed
last_revised: 2026-07-13
urls:
  - https://arxiv.org/abs/2607.08716
---

# Remember When It Matters(arXiv 2607.08716)

## Problem statement

In long-horizon tasks, requirements, diagnoses, prior attempts, environment
facts, and open subgoals can be buried in an expanding trajectory. The paper
calls this behavioral state decay and treats memory as an active intervention
mechanism rather than passive retrieval.

## Core claim

The proposed memory agent runs beside an unmodified action agent. It updates a
structured memory bank from recent trajectory evidence and decides whether to
inject a memory-grounded reminder or stay silent. The paper reports results on
Terminal-Bench 2.0 and tau2-Bench and explores open-weight memory policies.

Reported pass@1 gains are paper-origin claims. This seed note records the
selective-intervention design, not an independent benchmark result.

## Decision relevance

- `dream-consolidator`:memory updates can happen as a sidecar process over the
  recent trajectory rather than inside the action agent.
- `retriever-reranker`:retrieval may need a silence option; always injecting
  memory can be worse than selective intervention.
- `evaluator-benchmark`:long-horizon agent tasks should measure whether memory
  affects decisions at the point it matters.

## Caveats

This local note is seed quality. A full read should verify the memory bank
schema, intervention policy labels, benchmark harness details, and whether gains
come from memory timing rather than extra advisor compute.

## Sources

- arXiv:https://arxiv.org/abs/2607.08716

---

> *Ymem project-specific decision relevance is mapped in
> [`../docs/ymem-binding/relevance-index.md`](../docs/ymem-binding/relevance-index.md).*
