---
title: From Memory to Skills — Evidence-Grounded Co-Evolution Governance for Long-Horizon LLM Agents
arxiv_id: 2607.16621
source: arXiv:2607.16621
date: 2026-07
domain: memory
core_claim: |
  Long-horizon agents can promote selected trace memories into callable skills
  when the promotion keeps evidence links, applicability boundaries,
  verification rules, and reliability estimates.
evidence_level: medium
code_available: check
license: check
memory_modules:
  - dream-consolidator
  - memorydiff-generator
  - policy-privacy
status: seed
last_revised: 2026-07-27
urls:
  - https://arxiv.org/abs/2607.16621
---

# From Memory to Skills(arXiv 2607.16621)

## Problem statement

Experience memory is often retrieved as passive context. For repeated
long-horizon work, some traces may be better represented as procedural skills,
but uncontrolled promotion risks turning noisy episodes into executable policy.

## Core claim

MSCE organizes experience into grounded traces, procedural policies, and
declarative environmental cognition. It promotes evidence-backed policies into
callable skills with applicability and reliability metadata, and uses
reflection-weighted value backfilling to govern evolution. Reported EvoAgentBench
and LoCoMo gains are paper-origin evidence only.

## Decision relevance

- `dream-consolidator`:skill promotion is a higher-order consolidation output
  beyond fact summaries.
- `memorydiff-generator`:promotion should include evidence links and
  reliability estimates.
- `policy-privacy`:callable memory-derived skills need stricter gates than
  passive recalled context.

## Caveats

This is a seed note. Full read should verify skill schema, evidence-link
semantics, reliability calibration, and benchmark setup.

## Sources

- arXiv:https://arxiv.org/abs/2607.16621

---

> *Ymem 项目对本笔记决策相关性的具体绑定见
> [`../docs/ymem-binding/relevance-index.md`](../docs/ymem-binding/relevance-index.md)。*
