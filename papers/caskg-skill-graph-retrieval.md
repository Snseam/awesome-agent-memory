---
title: CaSKG — Counterfactual-Causal Skill Graphs for Scalable Agent Skill Retrieval
arxiv_id: 2608.25500
source: arXiv:2608.25500
date: 2026-08
domain: memory
core_claim: |
  Procedural memory libraries need retrieval that preserves prerequisites,
  state changes, and verification steps. CaSKG builds a counterfactual-causal
  skill graph and retrieves task-conditioned neighborhoods without prompting the
  full library.
evidence_level: medium
code_available: yes
license: check
memory_modules:
  - retriever-reranker
  - semantic-dedup
  - evaluator-benchmark
status: seed
last_revised: 2026-08-31
urls:
  - https://arxiv.org/abs/2608.25500
  - https://github.com/ZhiyuanLi218/Caskg
---

# CaSKG(arXiv 2608.25500)

## Problem statement

可复用 skill library 是 procedural memory,但检索很容易失真:全库 prompt 成本高,
向量检索把技能当作孤立文本,普通 graph retrieval 又依赖不可靠边。

## Core claim

CaSKG 用 semantic、lexical、input/output、structural evidence 和可选 LLM judge 建高召回
候选图,再通过方向条件的文本反事实 probe 校准 skill pair 关系。最终产出的
state-filtered weighted graph 用于任务条件扩展,不改变下游 agent policy。

## Decision relevance

- `retriever-reranker`:procedural memory retrieval 要保留顺序、前置条件、状态变化和验证例程。
- `semantic-dedup`:skill 相似不是可替代;反事实关系可帮助区分依赖、替换和补充。
- `evaluator-benchmark`:需要任务成功率、环境步数和 graph ablation,不能只评估检索相似度。

## Caveats

本地笔记是 seed 质量。尚未 full read PDF、复核 GitHub license、数据构造和 ALFWorld /
ScienceWorld 设置。论文结果只能作为 paper-origin claim。

## Sources

- arXiv:https://arxiv.org/abs/2608.25500
- Code:https://github.com/ZhiyuanLi218/Caskg

---

> *Ymem 项目对本笔记决策相关性的具体绑定见
> [`../docs/ymem-binding/relevance-index.md`](../docs/ymem-binding/relevance-index.md)。*
