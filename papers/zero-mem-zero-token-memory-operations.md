---
title: Zero-Mem: Zero-Token Memory Operations for LLM Agents
arxiv_id: 2607.29377
source: arXiv:2607.29377
date: 2026-07
domain: systems
core_claim: |
  Agent memory operations can avoid extra LLM calls outside final answering by
  using deterministic structured access paths. The paper frames memory cost as a
  write/read-path systems problem, not only a retrieval-quality problem.
evidence_level: medium
code_available: check
license: check
memory_modules:
  - ingest-adapter
  - retriever-reranker
  - evaluator-benchmark
status: seed
last_revised: 2026-08-03
urls:
  - https://arxiv.org/abs/2607.29377
---

# Zero-Mem: Zero-Token Memory Operations for LLM Agents

## Problem statement

Many agent-memory systems use LLM calls to extract, summarize, merge, or mediate
memory before the final answer. The arXiv abstract argues that these operations
create recurring token and latency cost, and may obscure the original evidence
behind intermediate memory records.

## Core claim

Zero-Mem proposes zero-token memory operations: no LLM invocation outside final
question answering for memory access. This seed note records the idea as a
systems-design pressure on memory kernels, not as a reproduced efficiency claim.

## Decision relevance

- `ingest-adapter`:raises the bar for when a memory write actually needs an LLM
  extraction step.
- `retriever-reranker`:useful baseline for deterministic retrieval or structured
  access paths before adding LLM-mediated memory operations.
- `evaluator-benchmark`:future cost evaluations should count write/read-path LLM
  calls, not only final-answer tokens.

## Caveats

Seed quality only. Full protocol, compared systems, code, and any reported
cost/quality results need source read before use in ImpactReports.

## Sources

- arXiv:https://arxiv.org/abs/2607.29377

---

> *Ymem project binding: see
> [`../docs/ymem-binding/relevance-index.md`](../docs/ymem-binding/relevance-index.md).*
