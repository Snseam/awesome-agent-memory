---
title: Your Agent's Memories Are Not Its Own — Forged Reasoning Attacks on LLM Agent Memory and Defenses
arxiv_id: 2607.05029
source: arXiv:2607.05029
date: 2026-07
domain: memory-security
core_claim: |
  Persistent memory poisoning can target remembered reasoning traces rather
  than factual memory entries, creating a separate integrity risk for agents
  that reuse prior rationale or tool-use history.
evidence_level: medium
code_available: check
license: check
memory_modules:
  - policy-privacy
  - memorydiff-generator
  - evaluator-benchmark
status: seed
last_revised: 2026-07-27
urls:
  - https://arxiv.org/abs/2607.05029
---

# Forged reasoning attacks(arXiv 2607.05029)

## Problem statement

Many memory-security discussions focus on poisoned facts or direct prompt
injection. This paper targets another surface:forged reasoning traces that an
agent later treats as its own remembered rationale.

## Core claim

The paper introduces FARMA, an attack that inserts forged reasoning into memory
and amplifies it through self-referential reuse. It also proposes SENTINEL, a
layered detection pipeline with a structural Reasoning Guard. Reported attack
and defense rates are author-reported results under the paper's setup.

## Decision relevance

- `policy-privacy`:memory stores should classify trace/rationale memory
  separately from user facts and apply stricter provenance checks.
- `memorydiff-generator`:candidate reasoning-memory writes need source and
  authorship validation before promotion.
- `evaluator-benchmark`:security evals should include rationale poisoning, not
  only fact poisoning.

## Caveats

This is a seed note. Full read should verify the evaluated agent stack, benign
trace corpus, comparison to A-MemGuard, and whether the defense generalizes to
hidden or summarized trace memory.

## Sources

- arXiv:https://arxiv.org/abs/2607.05029

---

> *Ymem 项目对本笔记决策相关性的具体绑定见
> [`../docs/ymem-binding/relevance-index.md`](../docs/ymem-binding/relevance-index.md)。*
