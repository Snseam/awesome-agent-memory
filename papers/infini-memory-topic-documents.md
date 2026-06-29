---
title: Infini Memory — Maintainable Topic Documents for Long-Term LLM Agent Memory
arxiv_id: 2606.10677
source: arXiv:2606.10677
date: 2026-06
domain: memory
core_claim: |
  Long-term agent memory can be represented as maintainable topic-structured
  documents rather than isolated observations, summaries, or fragments. Topic
  documents aggregate evidence, preserve metadata, and support fact revision.
evidence_level: medium
code_available: check
license: check
memory_modules:
  - parser-chunker
  - dream-consolidator
  - retriever-reranker
status: seed
last_revised: 2026-06-29
urls:
  - https://arxiv.org/abs/2606.10677
---

# Infini Memory(arXiv 2606.10677)

## Problem statement

Persistent agent memories often become hard to maintain when observations are
stored as disconnected records. Evidence aggregation, fact revision, and
cross-session retrieval need a more inspectable unit than a flat vector row.

## Core claim

Infini Memory treats memory as topic-structured documents. New observations are
staged in a buffer and periodically consolidated into coherent textual contexts;
at inference time, an agentic retrieval procedure lets the LLM inspect memory
through iterative tool calls.

## Decision relevance

- `parser-chunker`:topic documents are an alternative memory unit for artifact-first
  systems.
- `dream-consolidator`:the staging-buffer to topic-document flow is directly
  relevant to scheduled consolidation.
- `retriever-reranker`:iterative evidence inspection is a stronger interface than
  single-shot top-k retrieval for some long-term tasks.

## Caveats

本地笔记是 seed 质量。MemoryAgentBench score claims are paper-origin only; code,
topic schema, revision policy, and retrieval loop details need a full read.

## Sources

- arXiv:https://arxiv.org/abs/2606.10677

---

> *Ymem 项目对本笔记决策相关性的具体绑定见
> [`../docs/ymem-binding/relevance-index.md`](../docs/ymem-binding/relevance-index.md)。*
