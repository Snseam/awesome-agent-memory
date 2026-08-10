---
title: Causal Episodic Memory for Feedback-Driven Agent Repair
arxiv_id: 2608.05906
source: arXiv:2608.05906
date: 2026-08
domain: episodic_memory
core_claim: |
  Feedback-driven agents can reuse finalized repair episodes as causal episodic
  memory, but gains are task- and dataset-dependent.
evidence_level: medium
code_available: check
license: check
memory_modules:
  - retriever-reranker
  - evaluator-benchmark
  - dream-consolidator
status: seed
last_revised: 2026-08-10
urls:
  - https://arxiv.org/abs/2608.05906
---

# MERIT causal episodic memory(arXiv 2608.05906)

## Problem statement

LLM agents that repair failures often discard useful corrections after the
episode ends. MERIT asks whether verified repair outcomes can become reusable
episodic memory for later Text-to-SQL repair tasks without model updates.

## Core claim

MERIT stores oracle-verified corrections and observed unsuccessful directions,
classifies failure types, and conditions a hybrid lexical-dense retriever before
each future revision. The paper's own abstract reports clear Spider gains but
weaker or more qualified separation on BIRD.

Reported task gains are author-reported paper-origin claims. The value here is
the causal episode structure and cautious result boundary, not a generalized
agent-memory performance conclusion.

## Decision relevance

- `retriever-reranker`:repair memories benefit from typed failure metadata and
  schema-local retrieval, not only similar prior tasks.
- `evaluator-benchmark`:episode-memory results should report when the typed
  memory is not separated from simpler dynamic retrieval.
- `dream-consolidator`:negative memories and unsuccessful directions can be
  useful but need careful utility measurement.

## Caveats

本地笔记是 seed 质量。The setting is Text-to-SQL repair with oracle-assisted
feedback, so this remains adjacent-to-core until full protocol and code/data
availability are checked.

## Sources

- arXiv:https://arxiv.org/abs/2608.05906

---

> *Ymem 项目对本笔记决策相关性的具体绑定见
> [`../docs/ymem-binding/relevance-index.md`](../docs/ymem-binding/relevance-index.md)。*
