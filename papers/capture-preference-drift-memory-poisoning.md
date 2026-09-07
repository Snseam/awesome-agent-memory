---
title: CAPTURE — Disentangling Preference Drift from Memory Poisoning in Personalized LLM Agents
arxiv_id: 2609.02265
source: arXiv:2609.02265
date: 2026-09
domain: memory-security
core_claim: |
  Personalized agent memory needs to distinguish genuine preference drift from
  temporary context shifts, ambiguity, and adversarial memory poisoning.
evidence_level: medium
code_available: check
license: check
memory_modules:
  - memorydiff-generator
  - retriever-reranker
  - policy-privacy
  - evaluator-benchmark
status: seed
last_revised: 2026-09-07
urls:
  - https://arxiv.org/abs/2609.02265
---

# CAPTURE(arXiv 2609.02265)

## Problem statement

Personalized agents must update user preferences over time, but the same update
path creates a poisoning and ambiguity surface. CAPTURE frames the problem as
distinguishing true preference drift from temporary context shifts, uncertain
signals, and adversarial memory writes.

## Core claim

The paper proposes a belief-tracking approach with a multi-timescale memory
ledger, uncertainty-triggered clarification, and counterfactual auditing of cited
memories. The arXiv abstract reports held-out personalized episodes,
longitudinal histories, and adaptive-attacker results; these are
author-reported paper results until normalized in a full note.

## Decision relevance

- `memorydiff-generator`: preference updates need uncertainty and source-change
  context, not only latest-value overwrite.
- `retriever-reranker`: cited memories should be auditable and counterfactual
  checks should expose whether a memory actually changed the answer.
- `policy-privacy`: personalization robustness should track both accepted
  genuine updates and rejected poisoned updates.

## Caveats

本地笔记是 seed 质量。需要 full read 后确认 benchmark construction, longitudinal
data source, released weights/code, and whether the independently constructed
benchmark is reusable.

## Sources

- arXiv:https://arxiv.org/abs/2609.02265

---

> *Ymem 项目对本笔记决策相关性的具体绑定见
> [`../docs/ymem-binding/relevance-index.md`](../docs/ymem-binding/relevance-index.md)。*
