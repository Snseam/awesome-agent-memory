---
title: "Verifiable Memory: Learning Unified Memory Management with Local and Global Verifiers for Large Language Model Agents"
arxiv_id: 2608.03137
source: arXiv:2608.03137
date: 2026-08
domain: memory
core_claim: |
  LTM, active context, and episodic history can be governed by one memory
  operation policy trained with local transition verifiers and global coherence
  verifiers.
evidence_level: medium
code_available: yes
license: check
memory_modules:
  - memorydiff-generator
  - retriever-reranker
  - evaluator-benchmark
  - policy-privacy
status: seed
last_revised: 2026-08-10
urls:
  - https://arxiv.org/abs/2608.03137
  - https://github.com/Sun-SYSU-24/VerMem
---

# Verifiable Memory / VerMem(arXiv 2608.03137)

## Problem statement

VerMem argues that optimizing long-term memory, active context, and episodic
history separately leaves weak credit assignment for individual memory
decisions in long-horizon agents.

## Core claim

The paper represents LTM, active context, and episodic history as distinct
states controlled by one policy with add, revise, soft-delete, retrieve, filter,
summarize, and restore operations. Local and global verifiers are used during
training to score memory transitions and terminal memory consistency.

Reported benchmark and efficiency-frontier results are author-reported
paper-origin claims.

## Decision relevance

- `memorydiff-generator`:atomic add / revise / soft-delete operations map cleanly
  to auditable memory transitions.
- `retriever-reranker`:retrieval into active context should be governed by the
  same policy family as write and context-filter operations.
- `evaluator-benchmark`:local transition quality and final coherence should be
  scored separately.

## Caveats

本地笔记是 seed 质量。The arXiv page lists code, but this note has not verified
license, training data, or whether the verifier signals generalize.

## Sources

- arXiv:https://arxiv.org/abs/2608.03137
- Code:https://github.com/Sun-SYSU-24/VerMem

---

> *Ymem 项目对本笔记决策相关性的具体绑定见
> [`../docs/ymem-binding/relevance-index.md`](../docs/ymem-binding/relevance-index.md)。*
