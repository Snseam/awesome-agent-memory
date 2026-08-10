---
title: "MutMem: Cryptographically Authorized Mutation in Persistent Agent Memory"
arxiv_id: 2608.02843
source: arXiv:2608.02843
date: 2026-08
domain: memory_security
core_claim: |
  Persistent agent memory needs auditable signed mutation transitions so
  reviewers can distinguish authorized adaptation from database tampering.
evidence_level: medium
code_available: yes
license: check
memory_modules:
  - memorydiff-generator
  - policy-privacy
  - evaluator-benchmark
status: seed
last_revised: 2026-08-10
urls:
  - https://arxiv.org/abs/2608.02843
  - https://github.com/wallidsaydi-creator/HOM-AIMOS
---

# MutMem(arXiv 2608.02843)

## Problem statement

Persistent memory must evolve as new outcomes arrive, but mutable retrieval
weights can obscure whether a change was authorized adaptation or tampering.

## Core claim

MutMem records signed positive and negative outcome evidence, binds nontrivial
weight changes to housekeeper-authorized transitions, and verifies the mutation
chain with cryptographic commitments. Poison-likely content is retained with
signed, revisable labels that recall can use as trust evidence.

Reported LongMemEval / LoCoMo, latency, and poisoning-adaptation numbers are
author-reported source claims from the paper / project context. The paper also
states the protocol gives mutation integrity rather than content truth.

## Decision relevance

- `memorydiff-generator`:memory mutation events should preserve predecessor,
  signer, old/new weights, and terminal provenance.
- `policy-privacy`:poison labels can remain as signed trust evidence instead of
  deleting the source record.
- `evaluator-benchmark`:integrity, utility, and poisoning adaptation are
  separable axes.

## Caveats

本地笔记是 seed 质量。Need full read and repository review for cryptographic
assumptions, implementation maturity, license, and comparability of reported
benchmark numbers.

## Sources

- arXiv:https://arxiv.org/abs/2608.02843
- Code:https://github.com/wallidsaydi-creator/HOM-AIMOS

---

> *Ymem 项目对本笔记决策相关性的具体绑定见
> [`../docs/ymem-binding/relevance-index.md`](../docs/ymem-binding/relevance-index.md)。*
