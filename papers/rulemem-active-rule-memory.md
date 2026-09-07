---
title: RuleMem — Active Rule Memory for Long-Term Conversational Agents
arxiv_id: 2609.03915
source: arXiv:2609.03915
date: 2026-09
domain: rule-memory
core_claim: |
  Long-term conversational agents can improve retrieval and reasoning by
  inducing reusable natural-language rules from history rather than storing only
  passive facts.
evidence_level: medium
code_available: check
license: check
memory_modules:
  - dream-consolidator
  - retriever-reranker
  - evaluator-benchmark
status: seed
last_revised: 2026-09-07
urls:
  - https://arxiv.org/abs/2609.03915
---

# RuleMem(arXiv 2609.03915)

## Problem statement

Question-answering agents over long conversations need to bridge semantic gaps
between a user question and distant historical evidence. The paper argues that
fact-only memory is too passive for this setting.

## Core claim

RuleMem induces reusable natural-language Horn clauses from conversations and
validates them with a Rule Perplexity Consistency mechanism. The induced rules
guide both evidence retrieval and answer generation. Reported LoCoMo and
LongMemEval_s* gains are author-reported paper results, not independent
reproduction.

## Decision relevance

- `dream-consolidator`: consolidation may need to produce reusable rules in
  addition to fact summaries.
- `retriever-reranker`: rule memory can bridge semantically distant evidence
  that embedding search might miss.
- `evaluator-benchmark`: LoCoMo-style evaluation should distinguish factual
  recall from rule-guided evidence use.

## Caveats

本地笔记是 seed 质量。需要 full read 后 confirm rule extraction, validation
criteria, benchmark variant naming, and whether induced rules introduce brittle
overgeneralization.

## Sources

- arXiv:https://arxiv.org/abs/2609.03915

---

> *Ymem 项目对本笔记决策相关性的具体绑定见
> [`../docs/ymem-binding/relevance-index.md`](../docs/ymem-binding/relevance-index.md)。*
