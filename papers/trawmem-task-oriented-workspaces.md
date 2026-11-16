---
title: TrawMem: Reframing Agent Memory as Task-Oriented Role-Adaptive Workspaces
arxiv_id: 2610.36918
source: arXiv:2610.36918
date: 2026-10-27
domain: memory
core_claim: |
  TrawMem organizes retrieved memories into task-oriented Anchor, Bridge, and
  Context roles, preserving provenance and assembling a bounded workspace for
  the current task.
evidence_level: medium
code_available: check
data_available: check
license: check
memory_modules:
  - retriever-reranker
  - memorydiff-generator
  - evaluator-benchmark
status: seed
last_revised: 2026-11-16
urls:
  - https://arxiv.org/abs/2610.36918
---

# TrawMem: Reframing Agent Memory as Task-Oriented Role-Adaptive Workspaces

## Summary

TrawMem treats memory selection as task-oriented workspace construction. It
assigns retrieved items Anchor, Bridge, or Context roles, links supporting
memories, and keeps provenance while fitting the assembled workspace to a
budget.

## Evidence Boundary

The arXiv page supports the method framing and abstract-level claims. Any
reported task scores remain primary-paper evidence; this seed note does not
establish an independent ranking or production advantage.

## Decision Relevance

- `retriever-reranker`: relevance alone is insufficient when a weakly similar
  bridge memory is needed to connect evidence.
- `memorydiff-generator`: provenance-preserving workspace assembly makes the
  selected memory state inspectable.
- `evaluator-benchmark`: role-aware selection can be tested against flat
  top-k retrieval under the same context budget.

## Caveats

The full paper, code, data, license, and ablation setup still need review.

## Sources

- arXiv: https://arxiv.org/abs/2610.36918
