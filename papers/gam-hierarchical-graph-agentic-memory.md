---
title: "GAM: Hierarchical Graph-based Agentic Memory for LLM Agents"
source: ACL Anthology:2026.acl-long.1600
date: 2026-07
domain: graph-agentic-memory
core_claim: |
  Separate rapid event encoding from slower topic-level consolidation to
  balance new context against stable long-term knowledge.
evidence_level: medium
code_available: check
license: check
memory_modules:
  - dream-consolidator
  - retriever-reranker
status: seed
last_revised: 2026-09-28
urls:
  - https://aclanthology.org/2026.acl-long.1600/
---

# GAM (ACL 2026)

## Problem statement

The ACL abstract contrasts noisy stream-based memory with rigid structured
memory. GAM proposes an event progression graph for ongoing dialogue and a
topic associative network updated on semantic shifts, then uses graph-guided
multi-factor retrieval.

## Decision relevance

- `dream-consolidator`: separate provisional event capture from promotion into
  stable topic structures, with a trigger that can be inspected.
- `retriever-reranker`: test whether graph structure improves relevant context
  selection beyond a simpler temporal or semantic baseline.

## Evidence boundary

This is an ACL-page seed, not a full-paper read. LoCoMo/LongDialQA outcomes in
the abstract are paper-origin claims, not independent replication. GAM is
distinct from the existing GAM-RAG and MAGMA records.

## Sources

- ACL Anthology:https://aclanthology.org/2026.acl-long.1600/

---

> *Ymem 项目对本笔记决策相关性的具体绑定见
> [`../docs/ymem-binding/relevance-index.md`](../docs/ymem-binding/relevance-index.md)。*
