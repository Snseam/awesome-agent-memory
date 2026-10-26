---
title: "Memory-R2: Fair Credit Assignment for Long-Horizon Memory-Augmented LLM Agents"
arxiv_id: 2605.21768
source: arXiv:2605.21768
date: 2026-05
domain: long-horizon-memory-training
core_claim: |
  Memory writes change later rollout state, so training comparisons should
  control intermediate memory state when assigning credit to memory actions.
evidence_level: medium
code_available: check
license: check
memory_modules:
  - dream-consolidator
  - evaluator-benchmark
status: seed
last_revised: 2026-09-28
urls:
  - https://arxiv.org/abs/2605.21768
---

# Memory-R2 (arXiv 2605.21768)

## Problem statement

The paper argues that rollouts which write, update, or delete different
memories do not share the same later environment. Comparing only their final
trajectory rewards can therefore misassign credit to a memory operation.

## Decision relevance

- `dream-consolidator`: evaluate write/update/delete decisions against
  alternatives from the same intermediate memory state when possible.
- `evaluator-benchmark`: report state divergence in long-horizon memory-agent
  training rather than treating all rollouts as exchangeable.

## Evidence boundary

This seed follows the arXiv abstract. LoGo-GRPO local rerollouts and the
8/16/32-session curriculum are author-described method details, not tested
implementations here. Full paper, code, and result comparability remain open.

## Sources

- arXiv:https://arxiv.org/abs/2605.21768

---

> *Ymem 项目对本笔记决策相关性的具体绑定见
> [`../docs/ymem-binding/relevance-index.md`](../docs/ymem-binding/relevance-index.md)。*
