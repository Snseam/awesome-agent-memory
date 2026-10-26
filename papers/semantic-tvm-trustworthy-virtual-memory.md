---
title: Semantic-TVM: Structure-Preserving Trustworthy Virtual Memory for Memory-Augmented and Tool-Using Agents
arxiv_id: 2609.15011
source: arXiv:2609.15011
date: 2026-09
domain: security
core_claim: |
  A local exact-value state with protected remote views can preserve task
  utility while reducing sensitive-value exposure during memory-augmented work.
evidence_level: medium
code_available: check
data_available: check
license: check
memory_modules:
  - security-privacy
  - retriever-reranker
  - evaluator-benchmark
status: seed
last_revised: 2026-09-21
urls:
  - https://arxiv.org/abs/2609.15011
---

# Semantic-TVM

## Problem statement

Memory-augmented and tool-using agents can expose exact private values when a
remote model processes retrieved memory, actions, and intermediate observations.
Whole-field masking can protect values but also remove task-critical context.

## Core claim

Semantic-TVM keeps exact state local and presents a protected view to the
remote model. Instead of replacing whole fields, it predicts and masks only
sensitive spans while preserving surrounding task context, then closes the
loop through local recovery and execution checks.

The abstract reports utility and exposure measurements on Memory-EHR and
Memory-RAP. Those results remain paper-origin evidence.

## Decision relevance

- `security-privacy`: memory access control must cover remote views and later
  observations, not only storage permissions.
- `retriever-reranker`: retrieval can produce privacy-shaped views rather than
  raw records.
- `evaluator-benchmark`: utility, exposure, and executability should be tested
  together.

## Caveats

This is a seed note. Full reading is needed for threat-model assumptions,
trusted-model requirements, leakage coverage, and released artifacts.

## Sources

- arXiv: https://arxiv.org/abs/2609.15011
