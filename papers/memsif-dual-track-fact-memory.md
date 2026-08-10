---
title: "MemSIF: From Structured Interactions to Dual-Track Fact Memory for LLM Agents"
arxiv_id: 2608.01742
source: arXiv:2608.01742
date: 2026-08
domain: memory
core_claim: |
  Long-term interaction memory should preserve topical/event structure and split
  facts into stable write-time CoreFact memory and demand-driven ActiveFact
  memory.
evidence_level: medium
code_available: yes
license: check
memory_modules:
  - ingest-adapter
  - semantic-dedup
  - memorydiff-generator
  - retriever-reranker
status: seed
last_revised: 2026-08-10
urls:
  - https://arxiv.org/abs/2608.01742
  - https://github.com/luoyufeihaha/MemSIF
---

# MemSIF(arXiv 2608.01742)

## Problem statement

MemSIF names two long-horizon failure patterns: temporal proximity does not
always match topical or event-level relatedness, and write-time salience does
not always predict future query utility.

## Core claim

Structured Interaction Memory organizes raw interactions into topical segments
and event trajectories. Dual-Track Fact Memory stores stable schema-guided
CoreFacts at write time, while ActiveFacts are formed on demand and promoted
after recurring query demand and multi-source support.

Reported LoCoMo / LongMemEval-S gains are author-reported paper-origin claims.

## Decision relevance

- `ingest-adapter`:raw interaction structure should preserve topical coherence
  and cross-time event continuity.
- `semantic-dedup`:fact promotion should require recurring demand and source
  support, not only one extractor pass.
- `memorydiff-generator`:stable and active fact lanes need separate update rules.

## Caveats

本地笔记是 seed 质量。The GitHub URL is listed by the primary arXiv page, but
license, code completeness, and dataset scripts still need review.

## Sources

- arXiv:https://arxiv.org/abs/2608.01742
- Code:https://github.com/luoyufeihaha/MemSIF

---

> *Ymem 项目对本笔记决策相关性的具体绑定见
> [`../docs/ymem-binding/relevance-index.md`](../docs/ymem-binding/relevance-index.md)。*
