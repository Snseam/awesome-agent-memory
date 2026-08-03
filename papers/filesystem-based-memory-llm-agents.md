---
title: Filesystem-Based Memory for LLM Agents
arxiv_id: 2607.26637
source: arXiv:2607.26637
date: 2026-07
domain: systems
core_claim: |
  Deployed agents increasingly use filesystem trees, often Markdown files, as
  durable memory. The paper frames organization, evolution, stale/conflicting
  memory, and sustainability as first-class evaluation questions for this
  substrate.
evidence_level: medium
code_available: check
license: check
memory_modules:
  - parser-chunker
  - ingest-adapter
  - semantic-dedup
  - audit-ui
status: seed
last_revised: 2026-08-03
urls:
  - https://arxiv.org/abs/2607.26637
---

# Filesystem-Based Memory for LLM Agents

## Problem statement

Many practical agents maintain memory as a directory tree of human-readable
files. The arXiv abstract argues that research has under-tested the default
assumption that agents can keep such stores organized as memories accumulate,
conflict, and go stale.

## Core claim

Filesystem memory is a memory substrate, not just an implementation detail. It
needs its own organization, evolution, and sustainability evaluation.

## Decision relevance

- `parser-chunker`:Markdown and file-tree boundaries become memory-unit
  boundaries.
- `semantic-dedup`:conflict, staleness, and reorganization are central quality
  dimensions for file memory.
- `audit-ui`:human-editable memory surfaces create audit advantages that graph
  or vector-only stores may not have.

## Caveats

Seed quality only. This note does not yet validate the benchmark setup, agent
workloads, code, or any reported improvement.

## Sources

- arXiv:https://arxiv.org/abs/2607.26637

---

> *Ymem project binding: see
> [`../docs/ymem-binding/relevance-index.md`](../docs/ymem-binding/relevance-index.md).*
