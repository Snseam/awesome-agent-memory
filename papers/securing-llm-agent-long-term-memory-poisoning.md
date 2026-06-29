---
title: Securing LLM-Agent Long-Term Memory Against Poisoning
arxiv_id: 2606.24322
source: arXiv:2606.24322
date: 2026-06
domain: security
core_claim: |
  Persistent agent memory creates cross-session poisoning risk. Content-based
  and lineage-based defenses are malleable under summarization, trusted-tool
  echo, and manufactured corroboration; origin-bound authority is required for
  sound memory write-retrieve-act pipelines.
evidence_level: medium
code_available: check
license: check
memory_modules:
  - policy-privacy
  - memorydiff-generator
  - evaluator-benchmark
status: seed
last_revised: 2026-06-29
urls:
  - https://arxiv.org/abs/2606.24322
---

# Securing LLM-Agent Long-Term Memory Against Poisoning(arXiv 2606.24322)

## Problem statement

Long-term memory lets an attacker plant content in one session that can later
steer consequential actions, such as payments, settings changes, or data
exfiltration. The paper focuses on memory poisoning across the write-retrieve-act
pipeline, not one-turn prompt injection.

## Core claim

The authors argue that both content-based and lineage-based defenses are
malleable. An attacker can launder untrusted memory through agent summarization,
trusted-tool echo, or manufactured corroboration. The proposed TMA-NM design
uses non-malleable origin-bound authority with corroboration-gated elevation.

## Decision relevance

- `policy-privacy`:memory authority should bind to origin and scope, not only
  content trust scores.
- `memorydiff-generator`:summaries and revised memories must preserve authority
  metadata instead of creating apparently trusted derived content.
- `evaluator-benchmark`:the benchmark is a security stressor for memory kernels,
  but this seed note does not normalize reported attack success rates.

## Caveats

本地笔记是 seed 质量。尚未精读 formal model、machine-checked proof artifacts、benchmark
setup 和 implementation details;do not treat reported defense results as reproduced.

## Sources

- arXiv:https://arxiv.org/abs/2606.24322

---

> *Ymem 项目对本笔记决策相关性的具体绑定见
> [`../docs/ymem-binding/relevance-index.md`](../docs/ymem-binding/relevance-index.md)。*
