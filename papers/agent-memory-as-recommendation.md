---
title: "Agent Memory as Recommendation: Recommender-System Design for Long-Term Memory of LLM Agents"
arxiv_id: "2610.34673"
source: arXiv:2610.34673v1
authors: [Xinyu Zhang, Weiwei Sun]
date: 2026-10-26
domain: retrieval
core_claim: |
  作者将记忆选择形式化为预算约束下的 slate recommendation，并分别分析候选集和最终上下文的证据完整性。
method_summary: |
  AgentMemRec 以 BM25 与稠密检索生成候选，用证据监督训练 LambdaRank，再按包含会话头的实际渲染成本贪心填充上下文。
required_assumptions: |
  排序器需要 gold evidence 监督。逐项排序化简依赖给定完整性条件后的组合不变奖励与增加证据单位时奖励不减。
benchmark_used: [LongMemEval-S, LongMemEval-M, LoCoMo]
evidence_class: primary_paper
evidence_level: medium
code_available: check
license: "软件许可待核查，已读论文页面未找到作者代码入口。"
cost_complexity: |
  基础选择器无需 LLM 选择调用，仍需嵌入、cross-encoder、监督训练排序器及 token 计数。可选会话记录生成另需 LLM。
memory_modules: [retriever-reranker, context-packer, evaluator-benchmark]
decision_relevance: |
  维护者推断，可以分别检查候选证据缺失、排序遗漏与预算填充遗漏，并把会话头成本计入上下文预算。
status: seed
last_revised: 2026-11-18
urls:
  - https://arxiv.org/abs/2610.34673v1
  - https://arxiv.org/html/2610.34673v1
---

# AgentMemRec 的预算化记忆选择

Xinyu Zhang、Weiwei Sun 于 2026-10-26 发布 v1，本次为十月截止补录，核对日期为 2026-11-18。[v1 元数据](https://arxiv.org/abs/2610.34673v1)

## 作者方法与协议

- 论文把请求对应推荐请求、对话 turn 对应 item、有限上下文对应 slate，区分候选池是否含全部证据与最终 slate 是否保留全部证据。将 slate 选择化简为逐项排序需要奖励对组合的条件不变性及扩展单调性，适用条件限制了形式化结论。[§3.1–3.3](https://arxiv.org/html/2610.34673v1#S3.SS1)
- 基础 AgentMemRec 使用小写分词 BM25 和 bge-m3 余弦检索，以 RRF 合并，常数为 60，候选池为 128。LightGBM LambdaRank 用 LongMemEval-S/M 开发问题的 gold evidence 标签训练，十类特征覆盖相关性、检索排名、cross-encoder、角色、会话位置、时间、长度及共享实体键。选择阶段无需 LLM 调用，排序器需要监督训练。[§4.1–4.2](https://arxiv.org/html/2610.34673v1#S4.SS1)
- 按排名遍历并跳过放不下的条目，继续尝试后续条目。边际成本包括新增会话头，最终按会话分组并依时间渲染，预算固定为 2700 tokens。可选 Qwen3-32B 会话记录保存日期、实体与引用 turns，并把来源 turns 补入候选池，该生成路径另有模型成本。[§4.3–4.4](https://arxiv.org/html/2610.34673v1#S4.SS3)
- LongMemEval-S/M 使用共享问题 ID，按问题划分开发和测试，排除不可回答问题，主测试层关注证据跨至少两个会话的问题。LoCoMo 包含全问题及留出对话协议，排序器由 LongMemEval 转移。LongMemEval 使用 Qwen3-32B 或固定版本 DeepSeek reader 与官方 GPT-4o 类型判定，LoCoMo 使用 GPT-4o-mini reader/judge。[§5 协议](https://arxiv.org/html/2610.34673v1#S5) · [附录 A](https://arxiv.org/html/2610.34673v1#A1)

## 解释边界

证据完整性与下游回答之间仍受 reader、干扰项和组合方式影响。逐项排序的奖励假设有条件成立，gold evidence 监督以及排除不可回答问题、突出多会话子集的设置也限制了外推范围。已读官方摘要和 HTML 未找到作者代码或项目链接，软件许可待核查，本次未运行实现。[§7](https://arxiv.org/html/2610.34673v1#S7) · [附录 B](https://arxiv.org/html/2610.34673v1#A2)

**维护者推断。** 可以按候选召回、排序和实际渲染后的预算填充分阶段记录证据遗漏，并在预算核算时包含会话头。该诊断设计的可行性需要目标工作负载验证。[推断所据的分解](https://arxiv.org/html/2610.34673v1#S3.SS3)
