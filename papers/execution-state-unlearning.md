---
title: Forgetting Without Restarting — Execution-State Unlearning for Stateful LLM Agents
arxiv_id: 2609.04875
source: arXiv:2609.04875
date: 2026-09
domain: memory-security
core_claim: |
  Memory deletion is incomplete when derived execution artifacts such as
  summaries, plans, prompts, and KV cache still carry revoked information.
evidence_level: medium
code_available: check
license: check
memory_modules:
  - memorydiff-generator
  - policy-privacy
  - evaluator-benchmark
status: seed
last_revised: 2026-09-07
urls:
  - https://arxiv.org/abs/2609.04875
---

# Execution-State Unlearning(arXiv 2609.04875)

## Problem statement

Long-running LLM agents carry state beyond explicit memory records: compressed
summaries, pending tool plans, prompt artifacts, and serving-layer KV cache can
all derive from information later revoked by a user. The paper argues that
deleting a plaintext memory record is therefore not enough.

## Core claim

The paper formalizes execution-state unlearning and proposes
Provenance-Guided Selective Replay as a cross-layer contract spanning prompt,
compressed memory, and cache. The abstract reports behavioral audits across
agent suites and model families; those results remain author-reported evidence
until normalized in a full note.

## Decision relevance

- `memorydiff-generator`: forget/delete operations need dependency tracking
  across derived artifacts, not just direct memory rows.
- `policy-privacy`: privacy controls should specify the counterfactual behavior
  target after revocation.
- `evaluator-benchmark`: deletion benchmarks should probe behavioral leakage,
  not only store-level absence.

## Caveats

本地笔记是 seed 质量。需要 full read 后 confirm proof assumptions, selective replay
mechanics, cache boundary assumptions, and benchmark resources.

## Sources

- arXiv:https://arxiv.org/abs/2609.04875

---

> *Ymem 项目对本笔记决策相关性的具体绑定见
> [`../docs/ymem-binding/relevance-index.md`](../docs/ymem-binding/relevance-index.md)。*
