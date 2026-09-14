---
title: LifeFuse-Mem: Lifecycle-Aware State Fusion Against Temporary Overwriting for Long-Term Memory
arxiv_id: 2609.12436
source: arXiv:2609.12436
date: 2026-09
domain: memory
core_claim: |
  Long-term memory should represent lifecycle roles so temporary context does not
  overwrite durable user or task knowledge during repeated updates.
evidence_level: medium
code_available: check
data_available: check
license: check
memory_modules:
  - memorydiff-generator
  - semantic-dedup
  - retriever-reranker
  - evaluator-benchmark
status: seed
last_revised: 2026-09-14
urls:
  - https://arxiv.org/abs/2609.12436
---

# LifeFuse-Mem

## Problem statement

Long-running agents mix durable facts with temporary instructions, plans, and
session context. A normal update path can therefore overwrite a durable memory
with information that was only valid for the current interaction.

## Core claim

LifeFuse-Mem introduces lifecycle-aware state labels and an explicit fusion policy
that distinguishes durable knowledge from temporary context before memory update.
The paper evaluates the anti-overwrite behavior on a controlled benchmark and
reports results on two public long-memory benchmarks.

The reported retention and overwrite reductions are paper-origin evidence. This
seed note does not normalize scores or treat them as independent reproductions.

## Decision relevance

- `memorydiff-generator`: lifecycle labels should be visible in update diffs.
- `semantic-dedup`: equivalent facts need different merge rules when their
  validity duration differs.
- `retriever-reranker`: retrieval should expose durable versus temporary state.
- `evaluator-benchmark`: anti-overwrite should be tested separately from recall.

## Caveats

This is a seed note. Full reading is needed to verify the lifecycle taxonomy,
benchmark construction, code/data release, and behavior under multi-tenant
authorization or deletion requests.

## Sources

- arXiv: https://arxiv.org/abs/2609.12436
