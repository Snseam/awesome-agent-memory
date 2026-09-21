---
title: Disentangling Long-Term Memory via Latent Neuro-Symbolic Reasoning
arxiv_id: 2609.18461
source: arXiv:2609.18461
date: 2026-09
domain: memory
core_claim: |
  Query-conditioned latent memory nodes and sparse relational activation can
  disentangle noisy long-term personalization evidence without a fixed graph.
evidence_level: medium
code_available: check
data_available: check
license: check
memory_modules:
  - parser-chunker
  - retriever-reranker
  - semantic-dedup
  - evaluator-benchmark
status: seed
last_revised: 2026-09-21
urls:
  - https://arxiv.org/abs/2609.18461
---

# Latent Neuro-Symbolic Long-Term Memory

## Problem statement

Personalized agents must combine explicit preferences with implicit behavioral
evidence spread across long interaction histories. Flat retrieval and static
graphs can leave those relations noisy or query-independent.

## Core claim

The paper presents a latent graph construction using a sparse autoencoder.
Historical interactions are mapped to query-conditioned latent memory nodes,
while a graph encoder performs preference-conditioned message passing over the
activated subgraph.

The abstract reports gains on long-term personalization benchmarks. Those
results remain paper-origin evidence.

## Decision relevance

- `parser-chunker`: memory construction may preserve latent concepts rather
  than only textual summaries.
- `retriever-reranker`: query-conditioned edges challenge fixed graph retrieval.
- `semantic-dedup`: sparse concept activations may provide a new unit for
  separating overlapping preference evidence.

## Caveats

This is a seed note. Full reading is needed to assess latent-state
interpretability, update and deletion behavior, compute cost, and artifacts.

## Sources

- arXiv: https://arxiv.org/abs/2609.18461
