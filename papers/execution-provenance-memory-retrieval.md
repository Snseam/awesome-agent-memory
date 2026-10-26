---
title: "EPGM: Execution Provenance for Budgeted Agent Memory Retrieval"
arxiv_id: 2609.25913
source: arXiv:2609.25913
date: 2026-09
domain: execution-provenance-memory
core_claim: |
  Source-aligned provenance units address retrieval granularity under a token
  budget; typed graph propagation provides an additional author-reported
  benefit for evidence distributed across execution events.
evidence_level: medium
code_available: check
license: check
memory_modules:
  - retriever-reranker
  - evaluator-benchmark
status: seed
last_revised: 2026-10-26
urls:
  - https://arxiv.org/abs/2609.25913
---

# EPGM: Execution Provenance for Budgeted Agent Memory Retrieval

## Problem statement

Agents accumulate execution traces, tool calls, and intermediate artifacts, but
it is not always clear when that provenance improves later memory retrieval
enough to justify the added context and search cost.

## Core claim

The current v2 abstract formulates retrieval as budgeted evidence completion.
It builds source-aligned units from tool arguments and outputs, then uses a
zero-initialized residual R-GCN to refine frozen dense-retrieval scores over
typed provenance edges. The author-reported analysis separates the benefit of
candidate granularity from the smaller graph-propagation benefit on evidence
spread across multiple events. These are paper-origin findings, not an
independent reproduction or a claim that graphs generally outperform flat
retrieval.

## Decision relevance

- `retriever-reranker`: execution traces need selection and completion metrics,
  not blind replay.
- `evaluator-benchmark`: provenance benefit should be measured against token,
  latency, and task-completion budgets.

## Caveats

This seed note follows the v2 title and abstract, revised 2026-10-06. The
full protocol, ISETrace artifacts, baseline matching, and implementation remain
unreviewed. Reported retrieval evidence-completion gains do not establish
end-to-end agent task-success gains.

## Source Check

Canonical title and abstract rechecked on 2026-10-26; this remains an
abstract-based seed note, not a full-paper or artifact review. The stable
filename and arXiv identity are unchanged.

## Sources

- arXiv:https://arxiv.org/abs/2609.25913

---

> *Ymem 项目对本笔记决策相关性的具体绑定见
> [`../docs/ymem-binding/relevance-index.md`](../docs/ymem-binding/relevance-index.md)。*
