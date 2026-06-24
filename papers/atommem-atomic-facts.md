---
title: AtomMem — Building Simple and Effective Memory System for LLM Agents via Atomic Facts
arxiv_id: 2606.19847
source: arXiv:2606.19847
date: 2026-06
domain: memory
core_claim: |
  Long-term agent memory can be made denser and more stable by extracting
  high-value atomic facts, organizing them into hierarchical event structures,
  and maintaining temporal user profiles.
evidence_level: medium
code_available: check
license: check
memory_modules:
  - parser-chunker
  - semantic-dedup
  - dream-consolidator
  - retriever-reranker
status: seed
last_revised: 2026-06-24
urls:
  - https://arxiv.org/abs/2606.19847
---

# AtomMem atomic facts(arXiv 2606.19847)

## Disambiguation

本条是 2026-06 的 **AtomMem: Building Simple and Effective Memory System for
LLM Agents via Atomic Facts**。不要与本仓已有 2026-01 stub
[`stubs/atommem-learnable-dynamic-agentic-memory-with-atomic-memory.md`](stubs/atommem-learnable-dynamic-agentic-memory-with-atomic-memory.md)
混淆;后者 arXiv ID 是 `2601.08323`,标题是 **Learnable Dynamic Agentic Memory
with Atomic Memory Operation**。

## Core claim

论文提出 Fact Executor,从 long-form interactions 中选择性抽取 high-value atomic
facts,再组织成 hierarchical event structures 与 temporal profiles。目标是让长期记忆
既 compact 又能保持 episodic coherence 和 user attribute evolution。

## Decision relevance

- `parser-chunker`:atomic fact 是比 raw chunk 更适合长期存储的最小单元。
- `semantic-dedup`:atomic fact 需要 structured metadata,否则容易产生碎片化重复。
- `dream-consolidator`:hierarchical event structure 是 consolidation 输出的一种候选形态。
- `retriever-reranker`:retrieval 应同时支持 fact-level 和 event/profile-level 召回。

## Caveats

本地笔记是 seed 质量。下一步应验证数据集、fact extraction 训练方式和是否有 official code。

## Sources

- arXiv:https://arxiv.org/abs/2606.19847

---

> *Ymem 项目对本笔记决策相关性的具体绑定见
> [`../docs/ymem-binding/relevance-index.md`](../docs/ymem-binding/relevance-index.md)。*
