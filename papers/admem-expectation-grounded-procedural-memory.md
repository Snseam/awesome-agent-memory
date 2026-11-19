---
title: "AdMem: Expectation-Grounded Procedural Memory for Long-Horizon Task-Solving Agents"
arxiv_id: "2611.20605"
source: arXiv:2611.20605v1
authors: [Runzhe Wang, Huilin Lu, Shengjie Liu, Li Dong, Zhihuai Zhu]
date: 2026-11-16
domain: memory
core_claim: |
  作者提出以行动前的预期和行动后的反思构造程序记忆，再用在线效用更新管理跨任务检索、合并与淘汰。
method_summary: |
  actor 预先记录预期，异步 critic 根据实际及延迟子目标结果赋二元标签。分层短期记忆与语义、情节、程序长期记忆配合，程序检索结合相似度和 noisy-OR 效用。
required_assumptions: |
  critic 能判断预期与任务推进，合法工具集合可精确匹配。noisy-OR 的独立帮助因素及无记忆成功率假设限制效用的因果解释。
benchmark_used: [AgentBoard]
evidence_class: primary_paper
evidence_level: medium
code_available: check
license: "软件许可待核查，已读论文页面未找到作者代码入口。"
cost_complexity: |
  需 actor、异步 critic、摘要模型和嵌入检索，并维护子目标栈、程序效用及共检索统计。本文未独立测量运行成本。
memory_modules: [retriever-reranker, context-packer, dream-consolidator, memorydiff-generator]
decision_relevance: |
  维护者推断，可将行动预期、结果和效用更新保留为可追溯事件，再检查效用驱动的检索与淘汰是否适合目标任务。
status: seed
last_revised: 2026-11-18
urls:
  - https://arxiv.org/abs/2611.20605v1
  - https://arxiv.org/html/2611.20605v1
---

# AdMem 的预期与程序记忆

Runzhe Wang、Huilin Lu、Shengjie Liu、Li Dong、Zhihuai Zhu 于 2026-11-16 发布 v1。本 seed 按 2026-11-18 可读的官方版本整理。[v1 元数据](https://arxiv.org/abs/2611.20605v1)

## 作者方法与协议

- actor 在行动前写下目的与预期结果，异步 critic 观察实际结果及延迟子目标结果，记录上下文、行动、结果、反思和二元标签。标签要求预期实现且任务得到推进，critic 不操作环境。子目标栈保留当前作用域原文并压缩外层，任务间重置短期记忆，摘要长期记忆持续保留。[§2.1–2.3](https://arxiv.org/html/2611.20605v1#S2.SS1)
- 程序条目先按合法工具集合精确匹配，再以相似度与效用共同排序。语义与情节记忆使用稠密相似度。程序合并依据条件共检索频率，语义矛盾或细化可修改已有条目，低检索频率条目在满足驻留条件后可淘汰。条目保留来源上下文、行动、反思、标签与效用。[§2.4](https://arxiv.org/html/2611.20605v1#S2.SS4)
- AgentBoard 的八个领域各组成有序任务流，长期记忆跨任务保留。actor、critic 和摘要器使用 Claude Haiku 4.5，贪心解码，每任务上限 30 个环境步骤，嵌入使用冻结的 text-embedding-3-small。本文仅记录作者协议。[§3.1](https://arxiv.org/html/2611.20605v1#S3.SS1)

## 解释边界

noisy-OR 将条目视作独立帮助因素，实际实现固定无记忆成功率为零，按检索到的条目更新效用且不观察其是否实际被使用。因此无辅助成功可能给记忆过度归因，外部失败也可能惩罚被检索条目，非负效用难以表示伤害。作者的单次配置运行、单一模型和有限组件消融约束了结论范围。[§5](https://arxiv.org/html/2611.20605v1#S5) · [附录 B](https://arxiv.org/html/2611.20605v1#A2)

作者讨论了可读长期记忆持久化提示注入的风险，未开展对抗评估。已读官方摘要和 HTML 未找到作者代码或项目入口，代码可得性及软件许可待核查，本次未运行实现。[§4](https://arxiv.org/html/2611.20605v1#S4)

**维护者推断。** 效用可先作为带来源的检索启发式使用。若用于自动合并或淘汰，应另行验证 critic 误判、工具变化与记忆污染时的状态恢复。该工程建议尚需目标场景验证。[推断所据的效用与攻击面描述](https://arxiv.org/html/2611.20605v1#S2.SS4)
