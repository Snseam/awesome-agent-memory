---
title: TRUSTMEM — Learning Trustworthy Memory Consolidation for LLM Agents with Long-Term Memory
arxiv_id: 2606.25161
source: arXiv:2606.25161
date: 2026-06
domain: memory
core_claim: |
  Long-term memory updates can become persistent system-state failures when
  generated write, revise, or delete operations omit, corrupt, or hallucinate
  content. TrustMem adds a transition verifier and preference-guided training
  signal for more trustworthy consolidation.
evidence_level: medium
code_available: check
license: check
memory_modules:
  - dream-consolidator
  - memorydiff-generator
  - evaluator-benchmark
status: seed
last_revised: 2026-06-29
urls:
  - https://arxiv.org/abs/2606.25161
---

# TRUSTMEM(arXiv 2606.25161)

## Problem statement

Memory agents that actively write, revise, and delete external memory can create
durable errors. Once an omission, corruption, or hallucination enters the memory
store, later sessions may treat it as state rather than a one-turn generation
mistake.

## Core claim

TrustMem introduces a Memory Transition Verifier that evaluates update
transitions for coverage, preservation, and faithfulness. It then constructs
preference pairs among candidate updates under the same memory state and trains
memory-updating behavior with preference-guided reinforcement learning.

## Decision relevance

- `memorydiff-generator`:the paper frames memory updates as transitions that
  need explicit quality checks before persistence.
- `dream-consolidator`:consolidation quality should measure preservation and
  faithfulness, not only downstream task success.
- `evaluator-benchmark`:reported MemoryAgentBench, HaluMem, and Mem-alpha
  results should be treated as paper-origin claims until independently rerun.

## Caveats

本地笔记是 seed 质量。尚未精读 PDF、code/license、baseline setup 和 HaluMem /
Mem-alpha validation details;reported gains are paper-origin evidence only.

## Sources

- arXiv:https://arxiv.org/abs/2606.25161

---

> *Ymem 项目对本笔记决策相关性的具体绑定见
> [`../docs/ymem-binding/relevance-index.md`](../docs/ymem-binding/relevance-index.md)。*
