---
title: MemSentry: A Framework for Detecting Persistent Memory Poisoning in Agentic AI
arxiv_id: 2609.08747
source: arXiv:2609.08747
date: 2026-09
domain: security-privacy
core_claim: |
  Persistent agent memory needs admission and quarantine decisions that account
  for source trust, semantic risk, dependency impact, and access risk.
evidence_level: medium
code_available: check
data_available: check
license: check
memory_modules:
  - policy-privacy
  - memorydiff-generator
  - evaluator-benchmark
status: seed
last_revised: 2026-09-14
urls:
  - https://arxiv.org/abs/2609.08747
---

# MemSentry

## Problem statement

Persistent memory poisoning can suppress alerts, escalate privileges, alter
trust, or override policy after the original interaction has ended. A memory
layer therefore needs a security decision at admission time, not only a filter
at answer time.

## Core claim

MemSentry proposes configuration-driven Accept, Review, and Quarantine decisions
using source trust, semantic risk, attack radius over a dependency graph, access
risk, and signed security-state deltas. The paper evaluates the classifier on
generated scenarios over a synthetic asset and access graph.

The reported accuracy, macro-F1, and quarantine rates are paper-origin evidence.
They are not independent security guarantees.

## Decision relevance

- `policy-privacy`: memory writes need trust and access-risk policy inputs.
- `memorydiff-generator`: security-state changes should be signed and reviewable.
- `evaluator-benchmark`: poisoning tests should include external and insider
  threat paths, not only retrieval-time prompt injection.

## Caveats

This is a seed note. Full reading is needed to verify scenario realism,
dependency-graph assumptions, false-negative analysis, and implementation
availability before using the numbers in a security decision.

## Sources

- arXiv: https://arxiv.org/abs/2609.08747
