---
title: "Salami Attack: Stealthy Collusive Memory Poisoning against OpenClaw"
arxiv_id: 2608.01637
source: arXiv:2608.01637
date: 2026-08
domain: memory_security
core_claim: |
  Persistent agent memory can be poisoned by multiple individually benign-looking
  fragments whose combined effect steers later sessions.
evidence_level: medium
code_available: check
license: check
memory_modules:
  - policy-privacy
  - memorydiff-generator
  - evaluator-benchmark
status: seed
last_revised: 2026-08-10
urls:
  - https://arxiv.org/abs/2608.01637
---

# Salami Attack(arXiv 2608.01637)

## Problem statement

Memory-poisoning defenses often inspect individual records. The Salami Attack
paper argues that a realistic attacker can split one objective across multiple
innocuous memory fragments that become harmful only when consolidated or jointly
retrieved later.

## Core claim

The paper introduces MemCollusion, a red-teaming framework for building
collusive memory-poisoning attacks, and MoltLab, a controlled reproduction setup
where platform content is first observed, distilled into memory, and only later
used by an OpenClaw agent.

Reported save-rate and attack-success numbers are author-reported paper-origin
claims. This note records the threat model and benchmark pressure, not an
independent reproduction.

## Decision relevance

- `policy-privacy`:record-level safety checks are insufficient when fragments
  can collude across sessions.
- `memorydiff-generator`:write-time review should preserve source and grouping
  context, not only extracted fact text.
- `evaluator-benchmark`:security tests need cross-session setup where memories
  are created before the harmful task appears.

## Caveats

本地笔记是 seed 质量。需要 full read 后确认 MoltLab fidelity, OpenClaw setup,
defense baselines, and any released artifacts.

## Sources

- arXiv:https://arxiv.org/abs/2608.01637

---

> *Ymem 项目对本笔记决策相关性的具体绑定见
> [`../docs/ymem-binding/relevance-index.md`](../docs/ymem-binding/relevance-index.md)。*
