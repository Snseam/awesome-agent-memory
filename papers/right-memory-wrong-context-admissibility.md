---
title: "The Right Memory in the Wrong Context: Verifying Retrieval Admissibility in Long-Term Agent Memory"
arxiv_id: 2610.07309
source: arXiv:2610.07309
date: 2026-10
domain: security
core_claim: |
  Long-term memory systems need admissibility checks that decide whether a
  retrieved memory may be exposed in the current context.
evidence_level: medium
code_available: check
data_available: check
license: check
memory_modules:
  - policy-privacy
  - retriever-reranker
  - evaluator-benchmark
status: seed
last_revised: 2026-10-12
urls:
  - https://arxiv.org/abs/2610.07309
---

# The Right Memory in the Wrong Context

## Summary

This paper introduces retrieval admissibility as a distinct memory-system
problem. A memory can be relevant and correct while still being inappropriate to
expose in the current prompt, namespace, user scope, or task context.

## Method / Architecture

The work is relevant to privacy and governance because it moves beyond recall
accuracy into prompt-exposure verification. It also gives a useful bridge
between retriever design and access-control policy.

## Evidence Boundary

This is a seed note. The NeurIPS workshop metadata on arXiv is author-supplied
until checked against the official workshop record. Reported reanalyses should
be read as paper-origin evidence.

## Decision Relevance

- `policy-privacy`: admissibility checks belong beside retrieval, not only at
  memory write time.
- `retriever-reranker`: relevance ranking must be filtered by context rules.
- `evaluator-benchmark`: memory benchmarks should count unsafe or
  out-of-scope exposure as failures.

## Sources

- arXiv: https://arxiv.org/abs/2610.07309
