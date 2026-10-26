---
title: U-Fuzz — fuzzing persistent memory use in LLM agents
benchmark_id: ufuzz
name: U-Fuzz
aliases:
  - U-Fuzz
status: seed
origin_type: paper_origin
origin_source: https://arxiv.org/abs/2609.38275
first_public_date: 2026-09-29
domain: persistent_memory_failure_testing
modality: text
task_grain: query_memory_state_mutation
capability_axes:
  - memory_use_failures
  - query_mutation
  - state_mutation
  - output_only_testing
dataset_size: paper-defined checkpoint seeds and mutation campaign
data_nature: fuzzed_queries_and_memory_states
metrics:
  - confirmed_memory_use_failures
  - baseline_comparison
judge_type: check
code_available: check
data_available: check
license: check
known_limitations:
  - seed note; mutation operators, corpus, artifacts, and license need verification
  - paper-origin findings are not independent failure rates
canonical_sources:
  - https://arxiv.org/abs/2609.38275
confidence: medium
memory_modules:
  - evaluator-benchmark
  - policy-privacy
  - retriever-reranker
last_revised: 2026-10-05
---

# U-Fuzz

## What It Measures

U-Fuzz targets failures in how agents use persistent memory, including cases
where stored information is correct but the agent retrieves or applies it
incorrectly.

## Protocol

The method mutates queries and memory states around checkpointed agent
histories, then tests an output-only interface. This makes memory-use failures
observable without requiring internal access to a production memory engine.

## Metrics and Judging

The paper counts confirmed memory-use failures and compares the mutation
campaign against baselines. Exact confirmation rules and corpus construction
need a full read.

## Evidence Boundary

This is a paper-origin failure-testing protocol. It does not provide an
independent failure rate for all memory systems, and the paper's results remain
unreproduced in this repository.

## Comparability Notes

U-Fuzz complements answer-quality benchmarks by testing robustness and unsafe
use of persistent memory rather than only successful recall.

## Sources

- arXiv: https://arxiv.org/abs/2609.38275
