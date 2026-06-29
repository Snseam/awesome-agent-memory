---
title: What Deserves Memory — Adaptive Memory Distillation for LLM Agents
source: ACL Anthology 2026.acl-long.1607
date: 2026-06
domain: memory
core_claim: |
  Adaptive memory distillation asks which interaction evidence should become
  durable memory for LLM agents. The official ACL 2026 page makes this a
  venue-backed seed candidate for selective retention and memory distillation.
evidence_level: medium
code_available: check
license: check
memory_modules:
  - ingest-adapter
  - dream-consolidator
  - evaluator-benchmark
status: seed
last_revised: 2026-06-29
urls:
  - https://aclanthology.org/2026.acl-long.1607/
---

# What Deserves Memory(ACL 2026)

## Problem statement

Agent memory quality depends on deciding what deserves persistence. Selective
retention is a memory-kernel decision, not just an application prompt choice.

## Core claim

The official ACL Anthology entry identifies this work as adaptive memory
distillation for LLM agents. This seed note records the venue-backed source and
keeps the item in the curated radar queue; the full method and benchmark setup
still need PDF-level reading.

## Decision relevance

- `ingest-adapter`:admission policy should be learned or explicitly controlled,
  not default to write everything.
- `dream-consolidator`:distillation is a bridge between raw episodes and durable
  semantic/procedural memory.
- `evaluator-benchmark`:evaluation should measure retained usefulness and
  over-retention, not only recall.

## Caveats

本地笔记是 seed 质量。Only the ACL Anthology landing page was verified in this run;
PDF/code/license and detailed claims need a follow-up read.

## Sources

- ACL Anthology:https://aclanthology.org/2026.acl-long.1607/

---

> *Ymem 项目对本笔记决策相关性的具体绑定见
> [`../docs/ymem-binding/relevance-index.md`](../docs/ymem-binding/relevance-index.md)。*
