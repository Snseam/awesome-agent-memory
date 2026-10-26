---
title: "Mem++: Non-Destructive Memory for Long-Term Organizational LLM Agents"
arxiv_id: 2610.02002
source: arXiv:2610.02002
date: 2026-10
domain: memory
core_claim: |
  Keeping dated source documents intact and selecting evidence at read time can
  reduce irreversible information loss in organizational agent memory.
evidence_level: medium
code_available: check
data_available: check
license: check
memory_modules:
  - ingest-adapter
  - memorydiff-generator
  - retriever-reranker
  - evaluator-benchmark
status: seed
last_revised: 2026-10-26
urls:
  - https://arxiv.org/abs/2610.02002
---

# Mem++: Non-Destructive Memory for Long-Term Organizational LLM Agents

## Summary

Mem++ targets organizational records in which revised decisions arrive in new
documents. Its abstract describes retaining whole documents with dates and
authors, without a generative-model call at write time. Retrieval applies the
question's time cutoff and combines lexical and semantic rankings while
preserving older versions for the answering model.

## Method / Architecture

The architecture separates source preservation from retrieval-time contextual
selection. Its relevance to auditability and historical comparison is a
maintainer inference; retaining source documents does not by itself establish
transaction rollback or a complete reversible-update interface.

## Evidence Boundary

The paper evaluates on OrgMemBench, LoCoMo, and LongMemEval-S. Results and
comparisons remain paper-origin evidence, and this note does not promote them
to an independent leaderboard.

## Decision Relevance

- `ingest-adapter`: preserve dated source artifacts and provenance through the
  write path.
- `memorydiff-generator`: treat summaries or derived records as replaceable
  artifacts rather than destructive mutations of source memory.
- `retriever-reranker`: make read-time selection explicit and measurable.

## Caveats

This is a seed note. The storage cost, indexing strategy, artifact release,
and exact relationship between whole documents and derived memories need
verification before implementation choices are made.

## Source Check

Canonical title and abstract rechecked on 2026-10-26; this remains an
abstract-based seed note, not a full-paper or artifact review. The stable
filename and arXiv identity are unchanged.

## Sources

- arXiv: https://arxiv.org/abs/2610.02002
