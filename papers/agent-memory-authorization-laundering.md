---
title: Agent Memory Is a Surface for Endogenous Authorization Laundering
arxiv_id: 2609.01836
source: arXiv:2609.01836
date: 2026-09
domain: memory-security
core_claim: |
  Persistent agent memory can become part of the agent's effective
  authorization policy when written memories misrepresent evolving permissions,
  restrictions, or revocations.
evidence_level: medium
code_available: check
license: check
memory_modules:
  - memorydiff-generator
  - policy-privacy
  - evaluator-benchmark
status: seed
last_revised: 2026-09-07
urls:
  - https://arxiv.org/abs/2609.01836
---

# Agent Memory Authorization Laundering(arXiv 2609.01836)

## Problem statement

This paper names a memory-security failure mode where an agent's own persisted
memory records grant authority that the underlying interaction history did not
grant. The authors call this **endogenous authorization laundering** because the
failure can arise from memory update errors without an external attacker.

## Core claim

The paper introduces EAL-Bench to evaluate whether persistent memory preserves
evolving authorization state and whether false authority propagates into
downstream actions. The arXiv abstract reports procurement, cybersecurity, and
finance tasks with memory writers and executors; those results are
author-reported primary-paper evidence, not independent reproduction.

Two safeguards are highlighted: requiring stored permissions to be backed by
valid source events, and tracking permission changes through bounded event
sourcing. The important design pressure is that memory provenance becomes an
authorization-control surface, not just retrieval metadata.

## Decision relevance

- `memorydiff-generator`: permission grants, revocations, and constraints need
  source-backed transition records instead of lossy summaries.
- `policy-privacy`: memory records that affect authority should be checked
  against source events before action.
- `evaluator-benchmark`: evaluation should measure downstream unauthorized
  action, not only memory-write accuracy.

## Caveats

本地笔记是 seed 质量。需要 full read 后确认 EAL-Bench task construction, dataset
availability, exact safeguards, and whether the benchmark should be used as a
governance regression suite.

## Sources

- arXiv:https://arxiv.org/abs/2609.01836

---

> *Ymem 项目对本笔记决策相关性的具体绑定见
> [`../docs/ymem-binding/relevance-index.md`](../docs/ymem-binding/relevance-index.md)。*
