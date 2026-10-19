---
title: MemCode: Discrete Semantic Representations for Long-Term Agent Memory
arxiv_id: 2610.19472
source: arXiv:2610.19472
date: 2026-10
domain: memory
core_claim: |
  Retrieval-oriented atomic writes plus a discrete associative codebook can
  complement vector retrieval and separate online writes from consolidation.
evidence_level: medium
code_available: check
data_available: check
license: check
memory_modules:
  - parser-chunker
  - retriever-reranker
  - dream-consolidator
status: seed
last_revised: 2026-10-19
urls:
  - https://arxiv.org/abs/2610.19472
---

# MemCode: Discrete Semantic Representations for Long-Term Agent Memory

## Summary

MemCode rewrites dialogue into self-contained atomic memory units, maps them to
a learned discrete codebook, and uses codebook co-occurrence as an associative
retrieval path alongside vector search. Its write path is online while
consolidation is asynchronous.

## Evidence Boundary

The arXiv abstract reports author-run LongMemEval-S and LoCoMo comparisons and
construction-time claims. Those are primary-paper results, not independent
reproductions; this seed does not establish a production latency or quality
ranking.

## Decision Relevance

- `parser-chunker`: atomic units should be self-contained enough to survive a
  later query without their original dialogue context.
- `retriever-reranker`: discrete association is a candidate complementary path,
  not a replacement for scoped lexical or vector retrieval.
- `dream-consolidator`: the online-write/offline-consolidate split is an
  explicit lifecycle boundary worth testing.

## Caveats

Code, dataset terms, codebook maintenance cost, and failure cases need a full
paper and artifact read. It overlaps existing atomic-memory and consolidation
work; only its discrete associative retrieval framing is recorded here.

## Sources

- arXiv: https://arxiv.org/abs/2610.19472
