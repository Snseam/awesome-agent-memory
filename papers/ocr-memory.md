---
title: OCR-Memory — Optical Context Retrieval for Long-Horizon Agent Memory
source: ACL Anthology 2026.acl-long.474
date: 2026-07
domain: memory
core_claim: |
  Long-horizon agent trajectories can be rendered as visually indexed artifacts
  and later retrieved through locate-and-transcribe, preserving verbatim evidence
  under strict context budgets.
evidence_level: medium
code_available: check
license: ACL Anthology
memory_modules:
  - parser-chunker
  - context-packer
  - retriever-reranker
status: seed
last_revised: 2026-07-27
urls:
  - https://aclanthology.org/2026.acl-long.474/
---

# OCR-Memory(ACL 2026)

## Problem statement

Text-only summaries and raw trajectory replay both strain long-horizon agents:
summaries lose detail, while raw text can exceed context budgets. OCR-Memory
tests whether visual artifacts can preserve compact, faithful access to long
histories.

## Core claim

The paper renders historical trajectories into images with visual identifiers,
retrieves relevant regions, and transcribes verbatim text from those regions.
Reported gains on long-horizon agent benchmarks are paper-origin evidence only.

## Decision relevance

- `parser-chunker`:memory artifacts need not be text rows only; screenshot-like
  artifacts can preserve layout and exact evidence.
- `context-packer`:visual retrieval is a possible budget valve when raw text is
  too large.
- `retriever-reranker`:locate-and-transcribe separates evidence selection from
  free-form generation.

## Caveats

This is a seed note. Full read should verify storage cost, OCR failure modes,
benchmark tasks, and whether visual identifiers are practical for normal agent
logs.

## Sources

- ACL Anthology:https://aclanthology.org/2026.acl-long.474/

---

> *Ymem 项目对本笔记决策相关性的具体绑定见
> [`../docs/ymem-binding/relevance-index.md`](../docs/ymem-binding/relevance-index.md)。*
