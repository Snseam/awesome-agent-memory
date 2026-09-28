---
title: "SAMem: State-Aware Memory as a Fine-Grained Memory for LLM Agents in Decision-Making"
source: ACL Anthology:2026.findings-acl.722
date: 2026-07
domain: state-conditioned-experiential-memory
core_claim: |
  Agent experiences should be indexed and retrieved against the current
  decision state, not only the global task or scene description.
evidence_level: medium
code_available: check
license: check
memory_modules:
  - retriever-reranker
  - evaluator-benchmark
status: seed
last_revised: 2026-09-28
urls:
  - https://aclanthology.org/2026.findings-acl.722/
---

# SAMem (Findings of ACL 2026)

## Problem statement

Task-level experiential retrieval can select memories that describe the right
task but the wrong step. The official ACL abstract says SAMem stores
state-specific reasoning thoughts and retrieves cues for the current decision.

## Decision relevance

- `retriever-reranker`: include the current state or subgoal in memory queries,
  and test whether retrieved experience applies at the decision point.
- `evaluator-benchmark`: compare state-aligned retrieval against global-task
  retrieval on multi-step tasks, with explicit cost and failure analysis.

## Evidence boundary

This seed uses the ACL paper page and abstract. Reported benchmark advantages
are author-reported; the full method, ablations, code, and data have not been
reviewed locally. Do not merge SAMem with A-TMA: they are separate papers.

## Sources

- ACL Anthology:https://aclanthology.org/2026.findings-acl.722/

---

> *Ymem 项目对本笔记决策相关性的具体绑定见
> [`../docs/ymem-binding/relevance-index.md`](../docs/ymem-binding/relevance-index.md)。*
