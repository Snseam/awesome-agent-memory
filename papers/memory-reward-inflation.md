---
title: Memory Reward Inflation in Self-Improving LLM Agents
arxiv_id: 2608.00017
source: arXiv:2608.00017
date: 2026-06
domain: self_improving_memory
core_claim: |
  Self-improving agents can amplify bad memories when stored reward scores are
  produced by correlated LLM self-judgment instead of an independent signal.
evidence_level: medium
code_available: check
license: check
memory_modules:
  - evaluator-benchmark
  - retriever-reranker
  - memorydiff-generator
status: seed
last_revised: 2026-08-10
urls:
  - https://arxiv.org/abs/2608.00017
---

# Memory Reward Inflation(arXiv 2608.00017)

## Problem statement

Experience-learning agents often store solved episodes with a reward or quality
score, then retrieve high-scoring memories for future tasks. If that score comes
from an LLM judge whose errors correlate with the original agent's errors, the
memory store can overvalue mistakes.

## Core claim

The paper names the failure as the Echo Gap and argues that a corrective signal
must track truth while decorrelating its errors from the memory bias. It also
introduces LUCID as an answer-free de-inflation algorithm for self-improving
agents.

Reported BIRD text-to-SQL gains are author-reported paper-origin claims. They
are relevant to evaluation design, but not independent evidence that a product
memory layer improves performance.

## Decision relevance

- `evaluator-benchmark`:memory quality scores should not be treated as ground
  truth unless the evaluator's error is independent enough from the stored
  policy bias.
- `retriever-reranker`:ranking by stored reward can compound bad memories, even
  when retrieval also uses similarity.
- `memorydiff-generator`:experience memories may need confidence provenance and
  de-inflation metadata, not a single scalar score.

## Caveats

本地笔记是 seed 质量。The task setting is Text-to-SQL self-improvement, so it
should be used as failure-mode evidence before being generalized to all agent
memory.

## Sources

- arXiv:https://arxiv.org/abs/2608.00017

---

> *Ymem 项目对本笔记决策相关性的具体绑定见
> [`../docs/ymem-binding/relevance-index.md`](../docs/ymem-binding/relevance-index.md)。*
