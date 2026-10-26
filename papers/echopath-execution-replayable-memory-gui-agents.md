---
title: EchoPath: Execution-Level Replayable Memory for GUI Agents
arxiv_id: 2609.16635
source: arXiv:2609.16635
date: 2026-09
domain: memory
core_claim: |
  Validated GUI trajectories can become parameterized, provenance-bearing
  callable memories with preconditions, replay checks, and bounded repair.
evidence_level: medium
code_available: check
data_available: check
license: check
memory_modules:
  - memorydiff-generator
  - retriever-reranker
  - evaluator-benchmark
status: seed
last_revised: 2026-09-21
urls:
  - https://arxiv.org/abs/2609.16635
---

# EchoPath

## Problem statement

GUI agents repeatedly perform similar enterprise tasks, but replaying raw
trajectories is brittle when screens, coordinates, or declared inputs change.

## Core claim

EchoPath turns artifact-validated GUI trajectories into callable memories with
intent keys, application and state preconditions, parameters, visual evidence,
validation provenance, and lifecycle state. During replay it re-aims visual
targets, rebinds only declared inputs, and rejects incompatible steps before
bounded repair or fresh planning.

The abstract reports token and execution-time reductions on real computer-use
tasks. Those results remain paper-origin evidence.

## Decision relevance

- `memorydiff-generator`: provenance and lifecycle state make replayable
  procedures inspectable and revocable.
- `retriever-reranker`: retrieval must consider runtime preconditions, not only
  semantic similarity.
- `evaluator-benchmark`: execution memory needs replay success, rejection,
  repair, latency, and cost metrics.

## Caveats

This is a seed note. Full reading is needed for task coverage, failure cases,
artifact release, and transfer beyond GUI workflows.

## Sources

- arXiv: https://arxiv.org/abs/2609.16635
