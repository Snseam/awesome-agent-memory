---
title: "Experience Rot: Experienced Agents Fail Where Novices Succeed"
arxiv_id: "2611.20922"
source: arXiv:2611.20922v1
date: 2026-11-16
domain: eval
authors: [Zhen Xu, Hang Yin, Zitao Zhang, Kevin Zhao, Xuefeng Liu]
core_claim: 先前成功的工具使用经验可能在静默版本变化后降低任务完成率。
method_summary: 在相同最终任务上控制经验来源、工具版本、文档完整度与结果状态。
required_assumptions: 仿真服务能够保存并核对任务终态，且可独立改变版本。
benchmark_used: 作者构造的版本化工具任务
cost_complexity: 每种条件均需积累或提供历史经验，并核对执行后的服务状态。
decision_relevance: 将旧经验的来源版本与真正的任务完成分开记录。
evidence_class: primary_paper
evidence_level: medium
memory_modules: [retriever-reranker, evaluator-benchmark]
status: seed
last_revised: 2026-11-18
code_available: check
license: check
urls:
  - https://arxiv.org/abs/2611.20922
  - https://arxiv.org/html/2611.20922v1
---

# Experience Rot

Zhen Xu 等人给多个 agent 同一个最终任务，只改变它过去成功操作工具时所用的版本。
对照包含无经验、经验仍有效、经验已经过期三种情况。实验记录目标服务的最终状态，
因此可以分辨工具回执、agent 自报成功和实际完成。旧经验可通过对话历史、文件、
检索记录或可复用技能影响后续行为。[论文第 3–6 节](https://arxiv.org/html/2611.20922v1)

作者观察到，文档只给出部分信息时，先前经验能帮助完成同版本任务。接口语义静默变化后，
同一经验也可能诱导 agent 沿用旧规则。六个模型使用同一简化执行循环，每组仿真服务只改一项
接口细节，任务较短。重复调用、文档是否齐全及先前任务能否成功都会影响测量结果。
实测生产服务中的发生率和公开复现资产仍待核实。[实验限制](https://arxiv.org/html/2611.20922v1)

**维护者解读。** 复用操作经验时可附上工具版本，并在评测中分别记录检索命中、
使用了哪个版本的步骤，以及结果状态。与按时间考察知识漂移的协议可以互补。[WK-Drift](../benchmarks/wk-drift.md)
