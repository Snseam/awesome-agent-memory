---
title: MemoryAgentBench — Evaluating Memory in LLM Agents via Incremental Multi-Turn Interactions
source: ICLR 2026 (https://iclr.cc/virtual/2026/poster/10010781) / OpenReview pdf
date: 2026
domain: eval
memory_modules:
  - evaluator-benchmark
  - retriever-reranker
  - dream-consolidator
evidence_level: strong
code_available: check
license: check
status: seed
last_revised: 2026-05-19
---

# MemoryAgentBench

## Core claim

把 memory agent 的能力解耦成四个独立维度,分别构造评估:

```text
accurate retrieval
test-time learning
long-range understanding
selective forgetting
```

每个维度独立可评估,可帮助定位 memory 系统的真实瓶颈,而不是混在端到端 QA
分数里。

> Benchmark record:
> [`../benchmarks/memoryagentbench.md`](../benchmarks/memoryagentbench.md);
> usage ledger: [`../benchmarks/claims/claims.yaml`](../benchmarks/claims/claims.yaml)。

## Method summary

(待精读后填充)

四类能力对应四种交互模式:
- accurate retrieval:多文档/多 session 中精确找到对的来源
- test-time learning:新信息是否进入后续任务的回答
- long-range understanding:跨长时间窗口保持事实一致
- selective forgetting:过期/冲突/无关记忆是否被正确排除

## Cost / complexity

- 中等
- 适合作为 memory kernel v0 评估套件的核心组成

## Decision relevance

- 这四类能力对应 memory kernel 不同模块:
  - accurate retrieval → `retriever-reranker`
  - test-time learning → `ingest-adapter` + `retriever-reranker` 联合
  - long-range understanding → `semantic-dedup` + `dream-consolidator`
  - selective forgetting → `dream-consolidator` 的 forget-candidate 检测
- 直接定义了 `MemoryDiff` 中 `archive` / `supersede` 候选的 acceptance
  criteria 思路

## Notes

(随精读迭代)

---

> *Ymem 项目对本笔记决策相关性的具体绑定见
> [`../docs/ymem-binding/relevance-index.md`](../docs/ymem-binding/relevance-index.md)。*
