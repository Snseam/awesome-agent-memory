---
title: ContextPilot — Teaching Agents for Proactive Context Management via Fine-grained RL
arxiv_id: 2608.28476
source: arXiv:2608.28476
date: 2026-08
domain: memory
core_claim: |
  Long-horizon agents need learned context-management actions beyond search,
  deletion, and summarization. ContextPilot trains proactive context editing with
  planning, long-term memory, and soft context offloading tools, using
  fine-grained credit assignment for context actions.
evidence_level: medium
code_available: yes
license: check
memory_modules:
  - ingest-adapter
  - dream-consolidator
  - retriever-reranker
  - evaluator-benchmark
status: seed
last_revised: 2026-08-31
urls:
  - https://arxiv.org/abs/2608.28476
  - https://github.com/Tencent/ContextPilot
---

# ContextPilot(arXiv 2608.28476)

## Problem statement

长任务 agent 需要不断检索、整合和维护多轮信息。只保留完整历史会让 working context
持续膨胀,而只用 search / delete / summarization 的 context editor 又缺少全局规划、
长期记忆和自适应压缩动作。

## Core claim

ContextPilot 把 context management 显式建模为 agent 行为:工具集加入 planning、
long-term memory 和 soft context offloading,再用细粒度 RL 估计上下文编辑动作的
action-level advantage。论文报告在 long-context QA 和 deep search 任务上以更紧凑的
working context 获得更好表现。

## Decision relevance

- `ingest-adapter`:context edit / offload 应记录为可审计事件,而不是隐式 prompt 操作。
- `dream-consolidator`:长期记忆和压缩动作可以由 learned policy 调度,但必须保存失败轨迹。
- `retriever-reranker`:context budget 不只是检索预算,还包含 plan、memory 和 compression action。
- `evaluator-benchmark`:需要把 compactness 与 task quality 同时记录。

## Caveats

本地笔记是 seed 质量。EMNLP 接收和代码链接来自 arXiv 页面,但尚未 full read PDF、
复核 GitHub license、训练细节或 benchmark split。性能结论只能作为 paper-origin claim。

## Sources

- arXiv:https://arxiv.org/abs/2608.28476
- Code:https://github.com/Tencent/ContextPilot

---

> *Ymem 项目对本笔记决策相关性的具体绑定见
> [`../docs/ymem-binding/relevance-index.md`](../docs/ymem-binding/relevance-index.md)。*
