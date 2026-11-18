---
title: "EvoDisco: Strategy Discovery for Evolving Agent Memory"
arxiv_id: "2611.22102"
source: arXiv:2611.22102v1
date: 2026-11-17
domain: memory
authors: [Mingyang Liu, Qingcan Kang, Shixiong Kai, Kaichao Liang, Xiaojin Fu, Tao Zhong, Linqi Song]
core_claim: 记忆图的改写操作和选择策略都可以从任务流学习。
method_summary: 结合当前编辑效用和较长时间窗的反馈，学习何时抽象、细化、连边或重组。
required_assumptions: 可获得任务流、检索质量反馈和图复杂度度量。
benchmark_used: [ALFWorld, WebShop, LifelongAgentBench]
cost_complexity: 图改写、检索与后续环境交互分别消耗计算。
decision_relevance: 在固定任务预算下分别测在线学习和冻结记忆迁移。
evidence_class: primary_paper
evidence_level: medium
memory_modules: [dream-consolidator, retriever-reranker, evaluator-benchmark]
status: seed
last_revised: 2026-11-18
code_available: check
license: check
urls:
  - https://arxiv.org/abs/2611.22102
  - https://arxiv.org/html/2611.22102v1
---

# EvoDisco

Mingyang Liu 等人研究怎样让 agent 在任务间调整记忆图。策略根据当前子图和近期任务，
选择抽象、细化、建立跨条目连接或重组推理链。一次改写的反馈来自检索质量变化与图复杂度，
较长时间窗的反馈还考虑先前的选择及其效用估计。基础语言模型在实验中冻结。[方法，第 3 节](https://arxiv.org/html/2611.22102v1)

## 评测与边界

作者在 ALFWorld、WebShop 和 LifelongAgentBench 的操作系统及数据库任务上依次学习，
随后冻结记忆，测量它对留出任务的帮助。在线阶段允许继续写入，冻结阶段只能利用已积累的经验。
两种设置回答不同的问题。端到端开销还包含执行任务的步骤数，不能从总运行时间推出单次改写的成本。
公共实现与许可待核，本仓未运行作者实验。[实验与附录 A](https://arxiv.org/html/2611.22102v1)

**维护者解读。** 与只调节条目保留价值的方案并读时，可以固定检索预算，分别记录改写的调用成本、
图的增长量和后续任务成功率。这样才能判断结构调整何时值得做。[AdMem](admem-expectation-grounded-procedural-memory.md)
