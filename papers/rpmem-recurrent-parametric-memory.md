---
title: RPMem - Learning Long-Term Recurrent Parametric Memory Across Sessions for LLM Agents
arxiv_id: 2609.23466
source: arXiv:2609.23466
date: 2026-09
domain: recurrent-parametric-memory
core_claim: |
  Long-term agent memory can be represented as recurrent parametric latent
  state across sessions, offering a contrast to external fact stores and graph
  memories.
evidence_level: medium
code_available: check
license: check
memory_modules:
  - dream-consolidator
  - retriever-reranker
status: seed
last_revised: 2026-09-28
urls:
  - https://arxiv.org/abs/2609.23466
---

# RPMem(arXiv 2609.23466)

## Problem statement

Most notes in this repository focus on external editable memory stores. RPMem
is relevant because it explores recurrent parametric memory across sessions,
which changes the auditability, portability, and update-control tradeoffs.

## Core claim

The paper proposes learning long-term recurrent parametric memory for LLM
agents. This note records the architecture contrast only; reported results are
paper-origin evidence until independently reproduced.

## Decision relevance

- `dream-consolidator`: latent parametric memory is a different consolidation
  target from text/graph artifacts.
- `retriever-reranker`: if memory is parametric, recall and inspection surfaces
  differ from external retrieval.

## Caveats

本地笔记是 seed 质量。需要 full read 后 verify training setup, cross-session
state handling, auditability, privacy implications, and model independence.

## Sources

- arXiv:https://arxiv.org/abs/2609.23466

---

> *Ymem 项目对本笔记决策相关性的具体绑定见
> [`../docs/ymem-binding/relevance-index.md`](../docs/ymem-binding/relevance-index.md)。*
