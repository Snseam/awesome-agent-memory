---
title: "Gated Memory: Admission-Controlled Memory Formation for Conversational AI"
arxiv_id: 2610.11270
source: arXiv:2610.11270
date: 2026-10
domain: memory
core_claim: |
  Memory quality should be controlled at admission time before extraction and
  retrieval, not only repaired after irrelevant or unsafe memories are stored.
evidence_level: medium
code_available: check
data_available: check
license: check
memory_modules:
  - ingest-adapter
  - policy-privacy
  - evaluator-benchmark
status: seed
last_revised: 2026-10-12
urls:
  - https://arxiv.org/abs/2610.11270
---

# Gated Memory

## Summary

This paper focuses on admission-controlled memory formation for conversational
AI. It is a direct fit for the repository's write-policy lane because it asks
what should become memory before downstream extraction, consolidation, or
retrieval happens.

## Method / Architecture

The reported LoCoMo-10 evaluation should be read as a paper-origin test of
write/admission quality. The architecture signal is that memory gates can be a
first-class policy layer, separate from retrieval and answer generation.

## Evidence Boundary

This is a seed note from the arXiv primary page. Full method details, artifacts,
and admission categories need source review before adoption.

## Decision Relevance

- `ingest-adapter`: admission policy can reject or defer memories before they
  pollute persistent state.
- `policy-privacy`: gates can encode safety, sensitivity, or authority checks.
- `evaluator-benchmark`: write quality needs its own tests, not only answer
  accuracy after retrieval.

## Sources

- arXiv: https://arxiv.org/abs/2610.11270
