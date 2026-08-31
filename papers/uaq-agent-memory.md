---
title: What Makes Agent Memory Useful for Reliable Unanswerable Question Handling?
arxiv_id: 2608.27924
source: arXiv:2608.27924
date: 2026-08
domain: eval
core_claim: |
  Agent memory does not universally improve unanswerable-question handling.
  Under dataset shift, procedural and rule-based guidance can be more reliable
  than trajectory-shaped memory, and representation choice controls whether
  memory helps abstention.
evidence_level: medium
code_available: check
license: check
memory_modules:
  - retriever-reranker
  - policy-privacy
  - evaluator-benchmark
status: seed
last_revised: 2026-08-31
urls:
  - https://arxiv.org/abs/2608.27924
---

# UAQ Agent Memory(arXiv 2608.27924)

## Problem statement

可信 agent 在无法回答的问题上必须会拒答或保留不确定性。虽然 memory 常被加入 agentic
RAG,但 memory 对 unanswerable question handling 的影响并不稳定。

## Core claim

论文在统一 agentic RAG 框架下评估四类 memory 方法、三个 UAQ 数据集和两个基础模型。
作者报告 memory 带来的 UAQ 改善是选择性的,跨数据集迁移比跨模型复用更脆弱;procedural
和 rule-based memory 对拒答更可靠,组合 memory 需要搭配行为信号。

## Decision relevance

- `retriever-reranker`:retrieved memory 不能默认提高可靠性,需要 answerability-aware gating。
- `policy-privacy`:程序性规则和拒答策略可以作为 action-binding memory,不能被普通事实记忆覆盖。
- `evaluator-benchmark`:memory evaluation 应包含 abstention、dataset shift 和 false-answer risk。

## Caveats

本地笔记是 seed 质量。尚未 full read PDF、检查数据集构造、代码、license 或是否可复现。
结论只支持"需要测 UAQ / abstention",不支持某类 memory 的通用优越性。

## Sources

- arXiv:https://arxiv.org/abs/2608.27924

---

> *Ymem 项目对本笔记决策相关性的具体绑定见
> [`../docs/ymem-binding/relevance-index.md`](../docs/ymem-binding/relevance-index.md)。*
