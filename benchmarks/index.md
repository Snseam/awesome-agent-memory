---
title: Benchmark catalog — agent-memory evaluation protocols
date: 2026-06-11
status: seed
language: zh-CN
---

# Benchmark Catalog

This directory is the benchmark layer of `awesome-agent-memory`. It sits beside
[`../papers/`](../papers/) and [`../products/`](../products/): paper notes own
scholarly claims, product notes own product behavior and vendor claims, and
benchmark notes own evaluation protocol, dataset shape, metrics, caveats, and
cross-source usage evidence.

## Scope

Include benchmarks that evaluate long-term memory, multi-session agent behavior,
personalization, forgetting, temporal reasoning, or memory-layer cost/quality
trade-offs. Adjacent RAG, long-context, and general agent benchmarks enter this
catalog only when memory papers or memory products use them for comparison.

Stub-quality paper entries can seed this index, but claims, score comparisons,
and recommendations must point to a full note, product archive, original paper,
official repository, dataset card, or independent reproduction.

## Seed Inventory

| Benchmark | Status | Origin | Task family | Capabilities | Primary local anchor | Claim coverage |
|---|---|---|---|---|---|---|
| LongMemEval | full | paper-origin | long-term chat memory | retrieval / update / temporal / abstention | [`longmemeval.md`](longmemeval.md) | yes |
| LoCoMo | seed | paper-origin | very long-term conversational memory | retrieval / temporal / causal | [`locomo.md`](locomo.md) | yes |
| ConvoMem | full | paper-origin | conversational memory scaling | multi-evidence / preference / abstention | [`convomem.md`](convomem.md) | yes |
| MemoryAgentBench | seed | paper-origin | incremental multi-turn agent memory | retrieval / learning / long-range / forgetting | [`memoryagentbench.md`](memoryagentbench.md) | yes |
| BEAM | candidate | paper-origin | million-token memory scale | long-scale recall / temporal degradation | [`beam.md`](beam.md) | yes |
| RealMem | candidate | paper-origin | real-world memory-driven interaction | multi-source / real-world interaction | [`../papers/stubs/realmem-benchmarking-llms-in-real-world-memory-driven.md`](../papers/stubs/realmem-benchmarking-llms-in-real-world-memory-driven.md) | backlog |
| CloneMem | candidate | paper-origin | AI clone memory | identity continuity / personalization | [`../papers/stubs/clonemem-benchmarking-long-term-memory-for-ai-clones.md`](../papers/stubs/clonemem-benchmarking-long-term-memory-for-ai-clones.md) | backlog |
| KnowMe-Bench | candidate | paper-origin | lifelong digital companion memory | person understanding / personalization | [`../papers/stubs/knowme-bench-benchmarking-person-understanding-for-lifelong.md`](../papers/stubs/knowme-bench-benchmarking-person-understanding-for-lifelong.md) | backlog |
| PersonaMem-v2 | candidate | paper-origin | implicit persona memory | personalization / user modeling | [`../papers/stubs/personamem-v2-towards-personalized-intelligence-via.md`](../papers/stubs/personamem-v2-towards-personalized-intelligence-via.md) | yes |
| LoCoBench-Agent | candidate | paper-origin | long-context coding agents | software task memory / long-horizon context | [`../papers/stubs/locobench-agent-an-interactive-benchmark-for-llm-agents-in.md`](../papers/stubs/locobench-agent-an-interactive-benchmark-for-llm-agents-in.md) | backlog |
| MemoryArena | candidate | paper-origin | interdependent multi-session agent tasks | conflict resolution / shared memory | [`../papers/stubs/memoryarena-benchmarking-agent-memory-in-interdependent.md`](../papers/stubs/memoryarena-benchmarking-agent-memory-in-interdependent.md) | yes |
| MemBench | candidate | paper-origin | memory of LLM-based agents | write / manage / memory mechanism | [`../papers/stubs/membench-towards-more-comprehensive-evaluation-on-the.md`](../papers/stubs/membench-towards-more-comprehensive-evaluation-on-the.md) | yes |

## Evidence Ledgers

- [`claims/index.md`](claims/index.md) explains the usage-event schema and
  counting rules.
- [`claims/claims.yaml`](claims/claims.yaml) is the first structured ledger for
  benchmark usage, vendor self-claims, paper-origin events, and critiques.

## Counting Rules

Frequency tables must be split by evidence class:

- Raw mentions: all deduplicated benchmark events.
- Evaluation uses: `uses_for_eval`, `baseline_comparison`, and leaderboard use.
- Vendor claims: vendor-controlled product pages, blogs, and repos.
- Independent reproductions: third-party reruns with enough setup detail.
- Product-used benchmarks: benchmarks that memory products report against.
- Paper-origin reuse: paper-origin benchmarks used outside their origin paper.

Do not average scores across different models, splits, judges, or benchmark
subsets unless the setup matches and the comparison caveat is explicit.

## Maintenance

1. Add or update a benchmark note from [`_template.md`](_template.md).
2. Add usage events to [`claims/claims.yaml`](claims/claims.yaml).
3. Update [`../docs/benchmarks-landscape.md`](../docs/benchmarks-landscape.md)
   when the ledger changes enough to affect counts or conclusions.
4. Promote only full benchmark notes into ImpactReport evidence.
