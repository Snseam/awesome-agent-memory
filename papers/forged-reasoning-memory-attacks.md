---
title: Your Agent's Memories Are Not Its Own — Forged Reasoning Attacks on LLM Agent Memory and Defenses
arxiv_id: 2607.05029
source: arXiv:2607.05029
date: 2026-07
domain: memory-security
core_claim: |
  Persistent agent memory must protect remembered reasoning histories, not only
  factual memory records, because forged rationale traces can be injected and
  reinforced across later agent runs.
evidence_level: medium
code_available: check
license: check
memory_modules:
  - policy-privacy
  - audit-ui
  - evaluator-benchmark
status: seed
last_revised: 2026-07-13
urls:
  - https://arxiv.org/abs/2607.05029
---

# Forged Reasoning Attacks on Agent Memory(arXiv 2607.05029)

## Problem statement

Memory poisoning work often focuses on stored factual knowledge or user facts.
This paper shifts the threat model to remembered reasoning histories: prior
decisions, rationales, and tool-use explanations that future agents may trust as
their own state.

## Core claim

The paper introduces FARMA, the Forged Amplifying Rationale Memory Attack, which
poisons remembered reasoning rather than factual memory. It also proposes
SENTINEL, a layered defense with a Reasoning Guard that analyzes candidate
reasoning entries for forgery signals.

Reported attack success and defense rates are paper-origin claims. This seed
records the security surface, not an independent validation of the metrics.

## Decision relevance

- `policy-privacy`:memory authorization has to include provenance and integrity
  of reasoning traces, not only access to facts.
- `audit-ui`:operators need to inspect why a rationale was stored and whether it
  came from a trusted execution path.
- `evaluator-benchmark`:poisoning tests should cover rationale-memory entries
  and self-referential reinforcement.

## Caveats

This local note is seed quality. A full read should verify agent harnesses,
attack insertion assumptions, benign-trace construction, and whether SENTINEL's
signals generalize beyond the evaluated agents.

## Sources

- arXiv:https://arxiv.org/abs/2607.05029

---

> *Ymem project-specific decision relevance is mapped in
> [`../docs/ymem-binding/relevance-index.md`](../docs/ymem-binding/relevance-index.md).*
