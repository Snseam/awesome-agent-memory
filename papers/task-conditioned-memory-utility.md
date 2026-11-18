---
title: "What Is This Memory Useful For? Measuring Task-Conditioned Utility in Long-Term Agent Memory"
arxiv_id: "2611.03930"
source: arXiv:2611.03930v1
date: 2026-11-02
domain: eval
authors: [Chih-Hsuan Yang, Anjir Ahmed Chowdhury, Feng Yan, Rajeev Thakur]
core_claim: 一条记忆的效用取决于未来任务、回答模型和上下文条件。
method_summary: 对同一记忆和任务配对，测量固定读者在有无记忆时的结果差。
required_assumptions: 写入者事先看不到未来任务，同一对照使用匹配的填充上下文。
benchmark_used: [LongMemEval-V2, SciCode, SWE-bench Verified]
cost_complexity: 配对测量需要两种读取条件，写入、存储、提供上下文的成本分别记账。
decision_relevance: 评估压缩时同时报告配对质量变化和资源开销。
evidence_class: primary_paper
evidence_level: medium
memory_modules: [evaluator-benchmark, retriever-reranker]
status: seed
last_revised: 2026-11-18
code_available: yes
data_available: yes
license: "Dataset card uses other and documents upstream text restrictions. Code reuse terms require review."
urls:
  - https://arxiv.org/abs/2611.03930
  - https://arxiv.org/html/2611.03930v1
---

# 记忆对哪个任务有用？

Chih-Hsuan Yang、Anjir Ahmed Chowdhury、Feng Yan 和 Rajeev Thakur 把评估单位设为一条记忆与一个未来任务的配对。
写入者看不到未来问题。冻结的回答模型在相同填充上下文下分别接收该记忆和空记忆，
用两次任务结果之差估算效用。作者另做等总上下文长度的对照，并记录写入、存储和向模型提供记忆的成本。[方法与实验](https://arxiv.org/html/2611.03930v1)

## 读结果时需要保留的条件

- 单次事实问答取材于 LongMemEval-V2 的网页轨迹。作者在这个设置下观察到，包含答案线索的配对获得的帮助更大。
  在测试的软件工程和科学编程任务中，即使原始记忆也未测得明确收益。数据集、回答模型和任务本身都会改变单条记忆的效用。[论文及补充材料](https://arxiv.org/html/2611.03930v1)
- 作者发布的 `v0.6-length-control` 快照含 16,816 条评测记录。一条记录对应特定任务、记忆、条件和重复测量，
  同一条记忆可以出现多次。卡片说明了未分发的上游文本，论文后续的等总长度实验也超出了该快照。
  [冻结数据卡](https://huggingface.co/datasets/AgentsSci/AAMAS2027-ConditionalMemory/tree/v0.6-length-control) · [作者仓库](https://github.com/ChihHsuan-Yang/AAMAS2027-ConditionalMemory)

**维护者解读。** 比较压缩策略时，可以在同一任务上同时报告回答差异、写入成本与读取长度。
这篇工作作为既有基准的派生用法进入 ledger。原协议的 451 个问题和上述测量记录属于不同统计单位。[LongMemEval-V2](../benchmarks/longmemeval-v2.md)
