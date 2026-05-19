---
title: LoCoMo — Evaluating Very Long-Term Conversational Memory of LLM Agents
source: ACL 2024 (https://aclanthology.org/2024.acl-long.747.pdf)
date: 2024
domain: eval
memory_modules:
  - evaluator-benchmark
  - retriever-reranker
evidence_level: strong
code_available: check
license: check
status: seed
last_revised: 2026-05-19
---

# LoCoMo

## Core claim

合成多月、跨多 session 的对话语料,并在其上评估 LLM agent 的:

- 长程事实回忆
- 时间推理(事件先后、相对时间)
- 因果推理(事件依赖)
- 多 session 一致性

发现 SOTA agent 在这些维度上仍有显著差距。

## Method summary

(待精读后填充)

- 合成 + 半人工对话历史(months-scale)
- 多种 QA 类型分层
- 评估时间和因果推理而不仅仅是事实问答

## Decision relevance

- 时间推理直接反推 memory kernel 的 schema 需要 `valid_from / valid_to / supersedes /
  contradicted_by` 字段
- 因果推理对 `semantic-dedup` 在合并相似事件时的策略有影响:不能简单合并,
  需要保留时间序列
- LoCoMo 可作为 `evaluator-benchmark` 中"事实+时间+因果"维度的标准

## 与 LongMemEval / MemoryAgentBench 对比

(待写)

| 维度 | LongMemEval | MemoryAgentBench | LoCoMo |
|---|---|---|---|
| 主轴 | 五种核心能力 | 四类 memory 维度 | 长程对话 + 时间因果 |
| 评估单位 | QA accuracy | 维度独立 | QA + 时间逻辑 |
| 适合定位 | 端到端验证 | 模块定位 | schema 设计验证 |

## Notes

(随精读迭代)

---

> *Ymem 项目对本笔记决策相关性的具体绑定见
> [`../ymem-binding/relevance-index.md`](../ymem-binding/relevance-index.md)。*
