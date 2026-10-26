---
title: "DAEDALUS: Bootstrapping Agent Memory from Self-Generated Tasks"
arxiv_id: 2610.08048
source: arXiv:2610.08048
date: 2026-10
domain: memory
core_claim: |
  Agents can bootstrap procedural and heuristic memory by generating their own
  practice tasks and retaining useful traces.
evidence_level: medium
code_available: yes
data_available: yes
license: check
memory_modules:
  - dream-consolidator
  - evaluator-benchmark
  - ingest-adapter
status: seed
last_revised: 2026-10-12
urls:
  - https://arxiv.org/abs/2610.08048
  - https://github.com/illuin-tech/daedalus
  - https://huggingface.co/datasets/illuin/daedalus-traces
---

# DAEDALUS

## Summary

DAEDALUS bootstraps agent memory from self-generated tasks. The paper is relevant
because it treats practice traces and generated tasks as inputs to procedural or
heuristic memory, with official code and trace artifacts linked from the primary
source.

## Method / Architecture

The key design question is whether an agent can manufacture useful memory
pressure without waiting for real production traces. This resembles dream or
sleep-time consolidation, but with self-generated task curricula and retained
execution traces.

## Evidence Boundary

This is a seed note. Official code and dataset links improve reproducibility
potential, but results remain paper-origin until the artifacts, license, and
benchmark protocol are checked.

## Decision Relevance

- `dream-consolidator`: self-practice traces can seed procedural memory.
- `evaluator-benchmark`: generated tasks may become benchmark proxies, but need
  leakage and representativeness checks.
- `ingest-adapter`: synthetic traces should be labeled separately from
  user-derived memory.

## Sources

- arXiv: https://arxiv.org/abs/2610.08048
- Code: https://github.com/illuin-tech/daedalus
- Dataset: https://huggingface.co/datasets/illuin/daedalus-traces
