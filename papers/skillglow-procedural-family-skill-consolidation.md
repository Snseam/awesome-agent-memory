---
title: SkillGLoW — Procedural-Family Skill Consolidation for Self-Improving Agents on Long-Horizon Task Streams
arxiv_id: 2609.02217
source: arXiv:2609.02217
date: 2026-09
domain: procedural-memory
core_claim: |
  Self-improving agents need procedural-family skill consolidation rather than a
  single global skill document or an unbounded pool of task-specific memories.
evidence_level: medium
code_available: check
license: check
memory_modules:
  - dream-consolidator
  - retriever-reranker
  - evaluator-benchmark
status: seed
last_revised: 2026-09-07
urls:
  - https://arxiv.org/abs/2609.02217
---

# SkillGLoW(arXiv 2609.02217)

## Problem statement

The paper targets long-horizon self-improving agents that write and reuse
textual skills. It argues that both a single global skill document and a flat
pool of per-task entries lose useful procedural transfer: one becomes generic,
while the other grows with instance-bound memories.

## Core claim

SkillGLoW aggregates local task skills into procedural families and compresses
them into de-instantiated global priors. A commit gate admits a prior only when
execution shows it does not degrade the deployed library. Reported benchmark
gains are author-reported primary-paper evidence and should not be treated as
independent reproduction.

## Decision relevance

- `dream-consolidator`: procedural memories may need family-level abstraction
  and admission gates rather than periodic summary compression.
- `retriever-reranker`: retrieval should distinguish procedure priors from
  instance-specific task traces.
- `evaluator-benchmark`: unseen-task transfer and non-degradation gates are
  more relevant than raw memory-library size.

## Caveats

本地笔记是 seed 质量。需要 full read 后 confirm benchmark cells, task families,
commit-gate details, and code/data availability.

## Sources

- arXiv:https://arxiv.org/abs/2609.02217

---

> *Ymem 项目对本笔记决策相关性的具体绑定见
> [`../docs/ymem-binding/relevance-index.md`](../docs/ymem-binding/relevance-index.md)。*
