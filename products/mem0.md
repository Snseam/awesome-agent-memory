---
title: Mem0 — memory layer for AI agents
source: https://github.com/mem0ai/mem0
date: 2024-2026 (ongoing)
domain: memory
ymem_modules:
  - ingest-adapter
  - semantic-dedup
  - retriever-reranker
evidence_level: medium (open-source library, blog claims need independent benchmarking)
code_available: yes
license: Apache 2.0
status: seed
---

# Mem0

## Core idea

提供一个语言无关、host-agnostic 的 memory layer:抽取关键 facts、做 dedup、
存 vector + metadata、按用户/session 范围查询。强调"agent 不需要管 memory 怎
么存,只调用 add / search / get"。

## Architecture (as advertised)

- LLM-based fact extraction from conversation turns
- Vector store + 关系图(可选 Neo4j)
- 检索:语义检索 + scope filtering(user_id / agent_id / run_id)
- Hosted SaaS + self-host SDK

## Relevance to Ymem

**对照学习对象**:Mem0 占据了和 Ymem 相似的生态位(host-agnostic memory
layer)。Ymem 的差异化应该清晰:

| 维度 | Mem0 | Ymem(目标) |
|---|---|---|
| 抽取 | LLM 抽 fact,粒度细,易产生噪声 | host 决定抽取策略,kernel 不强制抽 fact |
| Schema | 偏对话场景,User/Agent/Run 三元 scope | 通用 MemoryRecord + ProvenanceRef,不假设对话 |
| 整理 | 实时 merge / update | 离线 consolidate + MemoryDiff 候选 |
| 审计 | 弱:无显式 diff 流,变更不可逆 | 强:每次 consolidate 产 diff,host 决定接受 |
| Provenance | 弱 | 一等公民 |

## What to borrow

- Scope filtering 的实用性(user_id / session_id 等)值得在 `MemoryQuery` 中
  考虑
- 多语言文档与 quickstart 经验
- Hosted vs self-host 双轨的 packaging 思路(远期)

## What to deliberately not copy

- Mem0 的 LLM 抽 fact 默认管线:它在产品演示里好看,但在长期工作流里产生大量
  低价值 fact,反而是 Ymem 要解决的问题
- in-place mutation:违背 Ymem 的"diff 优先"原则

## Open questions

- Mem0 在 LongMemEval / MemoryAgentBench 上的实测表现?
- 长期 store 的存储成本是否被 LLM 抽取膨胀?

## Notes

(随版本更新追踪)
