---
title: Hierarchical Graph Memory for LLM Agents with Path-level Localization and Rewrite
arxiv_id: 2608.05095
source: arXiv:2608.05095
date: 2026-08
domain: graph_memory
core_claim: |
  Evolving graph memory can reduce irrelevant retrieval and rewrite cost by
  organizing memory hierarchically and updating localized evidence paths rather
  than independent flat graph units.
evidence_level: medium
code_available: check
license: check
memory_modules:
  - semantic-dedup
  - memorydiff-generator
  - retriever-reranker
status: seed
last_revised: 2026-08-10
urls:
  - https://arxiv.org/abs/2608.05095
---

# HiGram hierarchical graph memory(arXiv 2608.05095)

## Problem statement

Flat graph memories can accumulate irrelevant historical nodes and force
unit-wise rewrites when related facts or dependencies change.

## Core claim

HiGram proposes a coarse-to-fine hierarchical graph memory, MicroGraph-based
path-level localization for query/update support, and coordinated rewriting of
both intra-unit memory and inter-unit dependencies.

Reported improvements on long-term conversational QA and conflict-aware memory
evaluation are author-reported paper-origin claims.

## Decision relevance

- `semantic-dedup`:hierarchical graph structure can keep raw units and abstract
  dependencies separate.
- `memorydiff-generator`:path-localized rewrite is a concrete alternative to
  independent fact patching.
- `retriever-reranker`:evidence selection should account for hierarchy and
  dependency paths, not only node similarity.

## Caveats

本地笔记是 seed 质量。Need full read for graph schema, conflict benchmark details,
code availability, and rewrite-safety failure cases.

## Sources

- arXiv:https://arxiv.org/abs/2608.05095

---

> *Ymem 项目对本笔记决策相关性的具体绑定见
> [`../docs/ymem-binding/relevance-index.md`](../docs/ymem-binding/relevance-index.md)。*
