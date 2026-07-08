---
title: Forensic Trajectory Signatures for Agent Memory Poisoning Detection
arxiv_id: 2606.30566
source: arXiv:2606.30566
date: 2026-06
domain: memory-security
core_claim: |
  Persistent memory poisoning can leave detectable tool-call trajectory
  signatures, allowing incident responders to distinguish memory-channel attacks
  from prompt-injection-only attacks in some agent architectures.
evidence_level: medium
code_available: check
license: check
memory_modules:
  - policy-privacy
  - evaluator-benchmark
status: seed
last_revised: 2026-07-06
urls:
  - https://arxiv.org/abs/2606.30566
---

# Forensic trajectory signatures(arXiv 2606.30566)

## Problem statement

Memory poisoning is usually discussed at write-time or content-filtering time.
This paper looks at a runtime forensics surface: whether successful persistent
memory attacks produce observable tool-call trajectories that defenders can
detect from logs.

## Core claim

In the evaluated architecture, successful memory poisoning attacks require a
memory recall step before a privileged action. The paper reports that a simple
trajectory rule and a classifier over trajectory features can separate
memory-channel attacks from non-exfiltrating sessions and prompt-injection
attacks that bypass memory.

These are author-reported results under a specific architecture. The seed note
records the detection idea and audit pressure, not a general independent
detection guarantee.

## Decision relevance

- `policy-privacy`:memory systems should preserve enough write/read/action
  provenance to support incident response.
- `evaluator-benchmark`:security benchmarks should log memory tool traces, not
  just final success/failure.

## Caveats

本地笔记是 seed 质量。需要 full read 后 confirm evaluated architecture, companion
paper dependency, dataset availability, and whether the invariant generalizes to
agents with hidden retrieval.

## Sources

- arXiv:https://arxiv.org/abs/2606.30566

---

> *Ymem 项目对本笔记决策相关性的具体绑定见
> [`../docs/ymem-binding/relevance-index.md`](../docs/ymem-binding/relevance-index.md)。*
