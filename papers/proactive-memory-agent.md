---
title: Remember When It Matters — Proactive Memory Agent for Long-Horizon Agents
arxiv_id: 2607.08716
source: arXiv:2607.08716
date: 2026-07
domain: memory
core_claim: |
  A sidecar memory agent can reduce behavioral state decay by deciding when to
  inject memory-grounded reminders into a long-horizon action agent.
evidence_level: medium
code_available: check
license: check
memory_modules:
  - retriever-reranker
  - context-packer
  - evaluator-benchmark
status: seed
last_revised: 2026-07-27
urls:
  - https://arxiv.org/abs/2607.08716
---

# Proactive Memory Agent(arXiv 2607.08716)

## Problem statement

In long-horizon tasks, relevant state can decay from the action agent's working
context even when it exists somewhere in the trajectory. Passive retrieval or
always-on memory injection can both be wasteful or distracting.

## Core claim

The paper adds a separate memory agent that updates a structured memory bank and
chooses whether to inject a reminder or stay silent. It reports improvements on
Terminal-Bench 2.0 and tau2-Bench, plus early policy training on SETA. These are
paper-origin claims.

## Decision relevance

- `retriever-reranker`:recall should include a no-inject decision, not only rank
  retrieved records.
- `context-packer`:memory context should be intervention-aware and budget-aware.
- `evaluator-benchmark`:agent-memory evals should measure action outcomes and
  distraction costs, not only recall accuracy.

## Caveats

This is a seed note. Full read should verify whether the benchmarks isolate
memory benefit from advisor behavior, the shape of SETA, and implementation
availability.

## Sources

- arXiv:https://arxiv.org/abs/2607.08716

---

> *Ymem 项目对本笔记决策相关性的具体绑定见
> [`../docs/ymem-binding/relevance-index.md`](../docs/ymem-binding/relevance-index.md)。*
