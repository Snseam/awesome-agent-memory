---
title: Interactive Memory Learning for Long-Term Conversations
arxiv_id: 2609.17088
source: arXiv:2609.17088
date: 2026-09
domain: memory
core_claim: |
  Memory writing and retrieval can be learned as an online policy whose delayed
  rewards connect future conversational quality to earlier storage decisions.
evidence_level: medium
code_available: check
data_available: check
license: check
memory_modules:
  - memorydiff-generator
  - retriever-reranker
  - evaluator-benchmark
status: seed
last_revised: 2026-09-21
urls:
  - https://arxiv.org/abs/2609.17088
---

# Interactive Memory Learning

## Problem statement

Static heuristics often archive or retrieve information without adapting memory
value to changing user needs or later response outcomes.

## Core claim

The paper proposes ICML, a multi-agent memory policy with a Planner that
selects information to encode and a Trigger that retrieves it. Online
reinforcement learning and delayed rewards propagate later conversational
feedback back to earlier storage decisions.

The abstract reports continuous improvement over accumulated interactions.
Those results remain paper-origin evidence.

## Decision relevance

- `retriever-reranker`: retrieval becomes an action policy with a stopping and
  feedback problem, not only a similarity score.
- `memorydiff-generator`: delayed reward creates an audit trail for why a write
  or recall policy changed.
- `evaluator-benchmark`: evaluation should test policy adaptation across time,
  not only one-shot recall.

## Caveats

This is a seed note. Full reading is needed for reward design, exploration
controls, privacy implications, and reproducibility details.

## Sources

- arXiv: https://arxiv.org/abs/2609.17088
