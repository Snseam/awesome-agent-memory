---
title: DISCERN: Preserve at Write, Resolve at Read for Persistent LLM-Agent Memory
arxiv_id: 2611.15729
source: arXiv:2611.15729
date: 2026-11-11
domain: memory
core_claim: |
  Persistent memory should preserve evidence at write time and resolve entity,
  temporal, and answerability conflicts at read time.
evidence_level: medium
code_available: check
data_available: check
license: check
memory_modules:
  - memorydiff-generator
  - retriever-reranker
  - evaluator-benchmark
status: seed
last_revised: 2026-11-16
urls:
  - https://arxiv.org/abs/2611.15729
---

# DISCERN: Preserve at Write, Resolve at Read for Persistent LLM-Agent Memory

## Summary

DISCERN frames persistent-memory errors around entity ambiguity, superseded
states, and insufficient evidence. It preserves source material during writes,
then resolves identity and time state during reads, including an answer or
abstain decision when evidence is insufficient.

## Evidence Boundary

The arXiv abstract describes ENT-310 and the proposed read-time resolution
design. Reported scores are primary-paper evidence; no independent evaluation
is recorded here.

## Decision Relevance

- `memorydiff-generator`: append-only evidence and derived resolution should be
  separate state layers.
- `retriever-reranker`: entity and temporal resolution belong in the read path.
- `evaluator-benchmark`: answerability and abstention should be measured with
  unanswerable cases, not only recall.

## Caveats

ENT-310 is described as a synthetic enterprise benchmark. Full protocol,
artifacts, code, and comparison normalization need review.

## Sources

- arXiv: https://arxiv.org/abs/2611.15729
