---
title: "APDMem: Agent-Controlled Progressive Disclosure for Query-Adaptive Long-Term Memory"
arxiv_id: 2610.02472
source: arXiv:2610.02472
date: 2026-10
domain: memory
core_claim: |
  Progressive disclosure can expose hierarchical memory detail only when a
  long-horizon agent needs it, reducing routine context access.
evidence_level: medium
code_available: check
data_available: check
license: check
memory_modules:
  - retriever-reranker
  - dream-consolidator
  - evaluator-benchmark
status: seed
last_revised: 2026-10-26
urls:
  - https://arxiv.org/abs/2610.02472
---

# APDMem: Agent-Controlled Progressive Disclosure for Query-Adaptive Long-Term Memory

## Summary

APDMem proposes adaptive progressive disclosure for hierarchical long-term
memory. A controller decides when to stay at a compact representation and when
to drill into more detailed memory.

## Method / Architecture

The abstract specifies four layers: thematic summaries, personalized key
facts, turn-level evidence notes, and raw messages. A controller opens finer
evidence when the query requires it, and a note synthesizer organizes the
retrieved material before answering. The hierarchy therefore controls access
granularity rather than only selecting a fixed number of retrieval results.

## Evidence Boundary

The paper reports LongMemEval-based evaluation and states that it was accepted
to the EMNLP 2026 Industry Track. The reported access-rate and quality results
are author-reported paper evidence, not independent reproduction.

## Decision Relevance

- `retriever-reranker`: progressive disclosure is a candidate retrieval policy.
- `dream-consolidator`: hierarchy design should preserve drill-down paths and
  provenance rather than only storing flattened summaries.
- `evaluator-benchmark`: access cost should be recorded alongside answer
  quality when testing hierarchical memory.

## Caveats

This seed note overlaps with other hierarchical and just-in-time memory work.
Exact controller training, release artifacts, and score comparability need a
full read before treating it as a distinct implementation baseline.

## Source Check

Canonical title and abstract rechecked on 2026-10-26; this remains an
abstract-based seed note, not a full-paper or artifact review. The stable
filename and arXiv identity are unchanged.

## Sources

- arXiv: https://arxiv.org/abs/2610.02472
