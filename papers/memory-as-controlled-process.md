---
title: "Memory as a Controlled Process: Learned Adaptive Memory Management for LLM Agents"
arxiv_id: 2607.13591
source: arXiv:2607.13591
date: 2026-07
domain: memory
core_claim: |
  Agent memory operations should be selected by an online control policy rather
  than fixed retrieval, consolidation, and forgetting heuristics.
evidence_level: medium
code_available: check
license: check
memory_modules:
  - ingest-adapter
  - retriever-reranker
  - dream-consolidator
  - evaluator-benchmark
status: seed
last_revised: 2026-07-20
urls:
  - https://arxiv.org/abs/2607.13591
---

# Memory as a Controlled Process(arXiv 2607.13591)

## Problem statement

Many agent-memory systems expose a fixed memory policy: retrieve by a static
heuristic, inject a fixed number of memories, consolidate on a fixed cadence, or
forget with hand-written rules. The paper argues that this is brittle because
the right memory operation depends on task stage, goal recurrence, stuck-state
signals, and long-run store quality.

## Core claim

MemCon models memory management as an online control problem. It wraps existing
memory backends and learns when to retrieve, what to retrieve, how much to
inject, when to reuse distilled plans, and when to consolidate or forget. The
arXiv abstract reports cross-benchmark gains and token reductions, but this
seed note records the control-policy framing only; reported scores remain
author claims until the setup is normalized.

## Decision relevance

- `retriever-reranker`:retrieval should be policy-selected from state, not just
  nearest-neighbor lookup.
- `dream-consolidator`:consolidation and pruning can be treated as controllable
  actions with feedback, not offline cleanup only.
- `evaluator-benchmark`:memory experiments should expose the policy that
  decides when to read/write/forget, because fixed policies may hide failure
  modes.

## Caveats

本地笔记是 seed 质量。需要 full read 后确认 benchmarks, agent frameworks, feedback
signal, code availability, and whether the reported token savings are comparable
to existing cost-savings notes.

## Sources

- arXiv:https://arxiv.org/abs/2607.13591

---

> *Ymem 项目对本笔记决策相关性的具体绑定见
> [`../docs/ymem-binding/relevance-index.md`](../docs/ymem-binding/relevance-index.md)。*
