---
title: LongMemEval — Benchmarking Chat Assistants on Long-Term Memory
source: arXiv:2410.10813
date: 2024-10
domain: eval
ymem_modules:
  - evaluator-benchmark
  - retriever-reranker
  - dream-consolidator
evidence_level: strong
code_available: yes (https://github.com/xiaowu0162/LongMemEval)
license: MIT (check)
status: seed
---

# LongMemEval

## Core claim

长程对话中,聊天助手在五种核心 memory 能力上的表现远未达到生产标准:
information extraction、multi-session reasoning、temporal reasoning、knowledge
update、abstention。LongMemEval 提供 500 个人工标注的 QA,覆盖这五种能力,在
长达多月、跨多 session 的对话历史上做评估。

## Method summary

(待精读后填充)

- 500 examples × 5 capability types
- 多 session conversation context
- Human-annotated ground truth
- 评估指标:accuracy on capability-stratified subsets

## Required assumptions

- 对话历史已经成功保存(memory store 是给定的输入,不是被评估对象)
- 评估侧重"问题回答正确率",不直接评 storage 效率或 latency

## Benchmark used

- 本文即为 benchmark 的提出方

## Cost / complexity

- 数据集中等规模(500 examples),评估开销主要来自需要长上下文输入(可能需要
  context > 100K)
- 适合作为 Ymem v0 的金牌评估之一

## Relevance to Ymem

- 直接驱动 `evaluator-benchmark` 模块的 v0 设计
- knowledge update 与 abstention 两种能力对 `dream-consolidator` 和
  retrieve 时的 confidence 阈值有直接影响
- temporal reasoning 章节会反推 `valid_from/valid_to` schema 的必要性

## Open questions

- 中文/多语种扩展是否存在?
- 数据集是否避开了训练数据泄漏?

## Notes

(随精读迭代)
