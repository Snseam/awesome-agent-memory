---
title: AttriMem — Attribution-Guided Process Feedback for Agent Memory Learning
arxiv_id: 2607.21106
source: arXiv:2607.21106
date: 2026-07
domain: memory
core_claim: |
  Memory-construction policies need fine-grained process feedback, not only
  final task rewards or module-level rewards, to learn what to extract, update,
  compress, or discard.
evidence_level: medium
code_available: check
license: check
memory_modules:
  - ingest-adapter
  - memorydiff-generator
  - evaluator-benchmark
status: seed
last_revised: 2026-07-27
urls:
  - https://arxiv.org/abs/2607.21106
---

# AttriMem(arXiv 2607.21106)

## Problem statement

Agent memory construction is a credit-assignment problem. Outcome-level rewards
can say whether the final answer succeeded, but they do not identify which
intermediate memory contents helped or hurt.

## Core claim

AttriMem augments global outcome rewards with attribution-derived local rewards
for token-level contributions to the final answer. The paper reports that this
process-feedback signal improves memory-construction policy learning on
long-horizon dialogue QA. These results remain paper-origin claims.

## Decision relevance

- `ingest-adapter`:write admission should be trainable against downstream value,
  not only heuristic salience.
- `memorydiff-generator`:memory update policies need local evidence for each
  accepted, compressed, or discarded item.
- `evaluator-benchmark`:future evaluations should expose process-level signals
  when claiming learned memory policies.

## Caveats

This is a seed note. Full read should verify attribution method, reward design,
baseline comparability, and code/data availability.

## Sources

- arXiv:https://arxiv.org/abs/2607.21106

---

> *Ymem 项目对本笔记决策相关性的具体绑定见
> [`../docs/ymem-binding/relevance-index.md`](../docs/ymem-binding/relevance-index.md)。*
