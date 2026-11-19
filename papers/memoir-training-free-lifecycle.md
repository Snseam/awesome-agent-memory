---
title: "MEMOIR: A Training-Free Memory Lifecycle for Long-Horizon LLM Agents"
arxiv_id: "2611.07631"
source: arXiv:2611.07631v1
authors: [Mayank Anand, Subham Raj, Aman Vaibhav Jha, Sriparna Saha]
date: 2026-11-05
domain: memory
core_claim: |
  作者将查询后的重要性归因与合并前的证据保留检查连接为无需训练的记忆生命周期。
method_summary: |
  RECALL-Q 结合检索、重要性、MMR 与 UCB 探索，TRACE 在回答后回写归因。离线合并经过多提示 judge、覆盖和长度门控，保留原条目与来源以支持回滚。
required_assumptions: |
  词面归因、置信度和 judge 能近似识别相关证据。门控的证据保留能力及跨配置适用性仍需验证。
benchmark_used: [LoCoMo, LongMemEval-S]
evidence_class: primary_paper
evidence_level: medium
code_available: yes
license: "仓库 LICENSE 为 MIT，README 同时含匿名评审传播限制说明，发布口径待澄清。"
cost_complexity: |
  在线写入无需额外 LLM 调用，仍需检索和索引维护。离线生成与多提示 judge 使用 LLM，原条目归档也占存储，TRACE-CF 另需反事实调用。
memory_modules: [retriever-reranker, dream-consolidator, memorydiff-generator, evaluator-benchmark]
decision_relevance: |
  维护者推断，可把查询后归因与合并验收作为独立可审计步骤，先核对配置和接受操作日志，再验证完整生命周期。
status: seed
last_revised: 2026-11-18
urls:
  - https://arxiv.org/abs/2611.07631v1
  - https://arxiv.org/html/2611.07631v1
  - https://github.com/AnandMayank/MEMOIR/tree/cca106ab28166392b4e993ee633ffe7dcaa67fe0
---

# MEMOIR 的归因与合并门控

Mayank Anand、Subham Raj、Aman Vaibhav Jha、Sriparna Saha 于 2026-11-05 发布 v1。本 seed 核对至 2026-11-18，并读取论文所链作者仓库的固定提交文档。[v1 元数据](https://arxiv.org/abs/2611.07631v1) · [作者仓库快照](https://github.com/AnandMayank/MEMOIR/tree/cca106ab28166392b4e993ee633ffe7dcaa67fe0)

## 作者方法与协议

- RECALL-Q 结合稠密检索、BM25、相关性、重要性、MMR 和面向低曝光条目的 UCB。先回答查询，再增加曝光并回写归因。默认 TRACE 以答案对记忆的 unigram recall 和排名折扣估算贡献，自主反馈经过置信门控，重要性单调不减。逐条移除的 TRACE-CF 属于额外消融，主文部署设置的显式 recency 系数为零，时间偏好依赖活动库的时间排序。[§3.4](https://arxiv.org/html/2611.07631v1#S3.SS4)
- 离线合并按相似度或共引用产生候选，三种 judge 提示检查事实保留、未来可回答性及遗漏或矛盾，另有覆盖与长度比例门控，高信用组成条目要求 judge 一致通过。合并继承最大重要性及曝光、最新时间戳、来源 ID 和最大共引用边权，并重建索引，原文归档支持回滚。可选 SUPERSEDE 经过冲突筛选与 judge 后可逆退役条目，DIGEST 单独追加摘要。[§3.2–3.3](https://arxiv.org/html/2611.07631v1#S3.SS2) · [§3.5](https://arxiv.org/html/2611.07631v1#S3.SS5)
- LoCoMo 在同一对话库上连续查询。LongMemEval-S 每问使用新库，覆盖冷启动，无法检验跨查询反馈积累。作者区分参考答案参与的 oracle 消融和置信门控的自主反馈。合并检查另用固定预算的文本证据召回及独立模型家族审计，继承来源 ID 本身不足以证明正文证据保留。[§4.1–4.2](https://arxiv.org/html/2611.07631v1#S4.SS1)

## 来源冲突与限制

主文 §3.4 和附录 G.2/Table 15 的 MMR 系数分别为 0.05、0.1，配置有待对齐。§3.3 将完整 SUPERSEDE 审计列为待完成，附录 I 提供初步审计，完整证据仍有限。词面归因可能遗漏改写、数字和短证据，错误置信度可能强化错误记忆，judge 门控仍是经验性检查。归档后活动库缩小也不能直接推导总存储成本。[§5](https://arxiv.org/html/2611.07631v1#S5) · [附录 G.2](https://arxiv.org/html/2611.07631v1#A7.SS2) · [附录 I](https://arxiv.org/html/2611.07631v1#A9)

作者仓库的 ARCHITECTURE.md 默认 recency 系数为 0.1，与论文主文部署设置的零值不同。README 含匿名评审发布及传播限制说明，也写有 MIT，LICENSE 则标 MIT 且版权署名 HARPO Authors、年份 2025。本文保留这一发布口径冲突，代码可得性仅指仓库可访问。论文附录仍列出环境、冻结逐问输出、接受操作日志、审计 manifest 和最终实验提交等复现材料缺口，本次只读文档，未验证实现或复现实验。[固定版本架构](https://github.com/AnandMayank/MEMOIR/blob/cca106ab28166392b4e993ee633ffe7dcaa67fe0/ARCHITECTURE.md) · [README](https://github.com/AnandMayank/MEMOIR/blob/cca106ab28166392b4e993ee633ffe7dcaa67fe0/README.md) · [LICENSE](https://github.com/AnandMayank/MEMOIR/blob/cca106ab28166392b4e993ee633ffe7dcaa67fe0/LICENSE) · [附录 I](https://arxiv.org/html/2611.07631v1#A9)

**维护者推断。** 可以把归因记录、候选合并、judge 判定和回滚关系分别留痕，并以正文证据检查验证合并。该建议仍需在配置对齐后验证其工程适用性。[推断所据的门控设计](https://arxiv.org/html/2611.07631v1#S3.SS2)
