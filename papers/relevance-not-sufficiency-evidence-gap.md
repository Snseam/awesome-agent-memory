---
title: "Relevance Is Not Sufficiency: What Actually Closes the Evidence Gap in Long-Term Memory QA"
arxiv_id: 2610.09348
source: arXiv:2610.09348
date: 2026-10
domain: eval
core_claim: |
  Long-term memory QA should evaluate whether retrieved evidence is sufficient
  for the answer, not only whether retrieved items look relevant.
evidence_level: medium
code_available: check
data_available: check
license: check
memory_modules:
  - retriever-reranker
  - evaluator-benchmark
status: seed
last_revised: 2026-10-12
urls:
  - https://arxiv.org/abs/2610.09348
---

# Relevance Is Not Sufficiency

## Summary

This paper reframes long-term memory QA retrieval around sufficient evidence-set
construction. It is directly relevant to this repository's benchmark layer
because relevance-only retrieval can look successful while still failing to
provide enough evidence for a grounded answer.

## Method / Architecture

The reported evaluation uses LoCoMo and LongMemEval-S style settings and adds
evidence coverage pressure. For memory systems, this points toward retrieval
metrics that distinguish topically related memory from answer-complete memory.

## Evidence Boundary

This is a seed note from the arXiv primary source. Treat any metric or system
ranking as paper-origin until the full protocol is read and the evidence-set
definitions are checked.

## Decision Relevance

- `retriever-reranker`: rankers should optimize sufficiency, not only semantic
  relatedness.
- `evaluator-benchmark`: benchmark ledgers should preserve whether a memory
  result gives enough evidence to justify the answer.

## Sources

- arXiv: https://arxiv.org/abs/2610.09348
