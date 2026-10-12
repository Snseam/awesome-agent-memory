---
title: "Persistent Memory in Multi-Agent LLM Inference: What It Costs, What It Buys, and When You Can Tell"
arxiv_id: 2610.07782
source: arXiv:2610.07782
date: 2026-10
domain: memory_cost
core_claim: |
  Persistent memory ablations in multi-agent inference need task regimes where
  recall can plausibly help, otherwise memory tiers may add measurable cost
  without detectable accuracy gains.
evidence_level: medium
code_available: check
data_available: check
license: check
memory_modules:
  - evaluator-benchmark
  - retriever-reranker
  - observability
status: seed
last_revised: 2026-10-12
urls:
  - https://arxiv.org/abs/2610.07782
---

# Persistent Memory in Multi-Agent LLM Inference

## Summary

This paper measures a three-tier multi-agent inference architecture where
decomposition reduces the active KV working set, but the persistent memory tier
adds peak cache cost without a detectable accuracy gain under the tested
single-question benchmark conditions.

## Method / Architecture

The study separates decomposition effects from persistent-memory effects. It
argues that many benchmark items already provide the evidence needed for each
question and require resetting stored traces between conditions, leaving little
informative history for recall to retrieve.

## Evidence Boundary

The result is a paper-origin null finding on one architecture and benchmark
regime. It should be used as methodological pressure, not as a general claim
that persistent memory cannot help multi-agent systems. The paper is accepted
as a poster at the Machine Learning for Systems Workshop, NeurIPS 2026.

## Decision Relevance

- `evaluator-benchmark`: memory ablations must prove the task actually admits a
  memory benefit and has enough power to detect it.
- `retriever-reranker`: retrieved traces can be useless or harmful when the task
  is independently evidenced and resets state between arms.
- `observability`: KV working set, latency, confidence intervals, and serving
  drift need to be reported alongside accuracy.

## Caveats

This seed note does not normalize the reported measurements into a benchmark
ledger. Treat it as an evaluation-design warning and read the paper before
using it to reject a concrete persistent-memory architecture.

## Sources

- arXiv: https://arxiv.org/abs/2610.07782
