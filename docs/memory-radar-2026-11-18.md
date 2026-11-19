---
title: "Agent memory research and PR consolidation, 2026-11-18"
date: 2026-11-18
status: consolidated-source-review
evidence_class: maintainer_synthesis_or_inference
language: zh-CN
---

# Agent memory 研究整合 · 2026-11-18

这次调研追踪同一条记忆的三个时刻：写入时依据什么保留它，环境变化后它是否仍然适用，
以及评测能否识别它对下一项任务的实际帮助。下表给出能区分这些问题的对照条件。

| 研究问题 | 已有证据 | 研究设计上的含义（维护者解读） |
|---|---|---|
| 哪条经验值得积累？ | AdMem 用行动前的预期和行动后的观察给条目赋值。EvoDisco 学习何时重组记忆图，再冻结图做迁移测试。 | 控制基础模型及检索预算，同时看在线表现和停止写入后的留出任务。这样可以区分当场学会的行为和可迁移的经验。[AdMem](../papers/admem-expectation-grounded-procedural-memory.md) · [EvoDisco](../papers/evodisco-memory-evolution.md) |
| 什么时候旧经验反而有害？ | Experience Rot 让同一个最终任务遇到无经验、仍有效经验或已过期经验。作者记录真实服务状态和 agent 自报结果。 | 把工具版本与观察到的状态记进评测。过期操作仍可能得到成功回执。对知识发生变化的任务，也应记录修正所需的轮次和代价。[Experience Rot](../papers/experience-rot-tool-change.md) · [WK-Drift](../benchmarks/wk-drift.md) |
| 召回的内容是否足够？ | AgentMemRec 在每次请求中选择一组证据；任务条件效用研究固定回答模型与填充文本，配对比较有记忆和无记忆的结果。 | 对多跳问题检查必要证据是否到齐。对压缩方案，固定上下文预算并分别记录写、存、读成本。网页轨迹问答上的收益尚未在该研究的编程任务上观察到。[AgentMemRec](../papers/agent-memory-as-recommendation.md) · [条件效用](../papers/task-conditioned-memory-utility.md) |
| 同一个基准名称是否意味着同一种测量？ | MEMOIR 的 LoCoMo 检索消融用 1,905 对去重问答；Becos 团队排除一个类别后用 1,540 题，改变回答提示和裁判，并人工盲查 150 个答案。 | 先对齐问题子集、评分对象和反馈时序。证据 recall@5、最终问答准确率和服务端实际状态各自回答不同问题。[LoCoMo 协议对照](../benchmarks/locomo.md) · [Becos 作者实验](https://arxiv.org/abs/2611.19199) |
| 离线整理何时值得做？ | MEMOIR 在离线合并前检查证据损失。Anthropic 的文档任务同时展示 wiki 补链的好处和直接检索已足够的情形。 | 保留原始证据可达性，单列整理成本，并用直接检索做对照。实验设置及观察来自各自作者。[MEMOIR](../papers/memoir-training-free-lifecycle.md) · [Anthropic 工程研究](https://www.anthropic.com/research/components-of-agent-memory) |

## 历史 PR 如何进入这次整合

以 GitHub 主分支 `d786e4b` 为基线。检索时共有 35 个 PR，16 个已合并、10 个已关闭但未合并、9 个开放。逐项核对了标题、正文、变更文件及已有讨论。下表覆盖全部 35 个编号。[仓库 PR 历史](https://github.com/Snseam/awesome-agent-memory/pulls?q=is%3Apr)

| PR | 检索时状态 | 本次处理 |
|---|---|---|
| #1–#8、#10–#14 | 已合并 | 沿用中英入口、证据分级、声明台账、成本专题和周报核验流程。[证据模型 #5](https://github.com/Snseam/awesome-agent-memory/pull/5) · [周报流程 #8](https://github.com/Snseam/awesome-agent-memory/pull/8) |
| #15–#20、#22–#24；#25 | 前九个已关闭，#25 已合并 | 七至九月的研究和 Tree Ring Memory 已随 #25 进入主分支。[第一次汇总](https://github.com/Snseam/awesome-agent-memory/pull/25) |
| #27 | 已关闭 | 提交者撤回了 OrcaReplay 的收录请求。保留记录回放与长期记忆的范围判断。[原讨论](https://github.com/Snseam/awesome-agent-memory/pull/27) |
| #28、#31–#34、#36；#37 | 六个周报仍开放，#37 已合并 | 旧周报共享基线，独有增量已由 #37 归并。沿用整合后的条目和计数。[六期对照与固定版本](memory-radar-consolidation-2026-10-26.md) |
| #38 | 已合并 | 沿用 Screenpipe、HC、TANCO 的收录决定、投稿者归属与外部来源审查要求。[社区投稿汇总](https://github.com/Snseam/awesome-agent-memory/pull/38) |
| #26、#35 | 开放 | 按各自来源重新评定 GoodMem 和 MoobFS。输入分别为 `6a8891f` 和 `8021703`。[GoodMem 投稿](https://github.com/Snseam/awesome-agent-memory/pull/26) · [MoobFS 投稿](https://github.com/Snseam/awesome-agent-memory/pull/35) |
| #42 | 开放 | 完整纳入原提交 `cc4186d` 的 4 篇论文 seed、4 个基准协议、JiuwenMemory 及 3 个既有产品更新，再核对来源和索引。[11 月 16 日记录](memory-radar-2026-11-16.md) |

按历史 PR 的变更路径与主分支逐项对照，六份开放旧周报涉及的论文、产品、基准和周报笔记均已找到。#16 有一个旧文件名消失；#37 按同一 arXiv 号 2607.05029 合并了重复笔记，原研究仍可追溯。[去重记录](memory-radar-consolidation-2026-10-26.md) · [保留的笔记](../papers/forged-reasoning-attacks-agent-memory.md)

## 检索与选取

- **arXiv。** 按提交时间查询 11 月 1 日 00:00 至 11 月 18 日 03:59 UTC。标题包含 `agent memory`、`agent memories`、`procedural memory`、`episodic memory`，或同时包含 `memory` 和 `agents`，查询当次返回 67 条。另按主题和相邻日期检索题名未含这些词的文章，包括 Experience Rot 和 LoCoMo 方法学研究。AgentMemRec 是 10 月 26 日旧窗口边界的补录。[复查这次 arXiv 查询](https://export.arxiv.org/api/query?search_query=%28ti%3A%22agent%20memory%22%20OR%20ti%3A%22procedural%20memory%22%20OR%20%28ti%3Amemory%20AND%20ti%3Aagents%29%20OR%20ti%3A%22agent%20memories%22%20OR%20ti%3A%22episodic%20memory%22%29%20AND%20submittedDate%3A%5B202611010000%20TO%20202611180359%5D&max_results=100&sortBy=submittedDate&sortOrder=descending)
- **会议与别名。** 在 ACL Anthology 和 OpenReview 检索协作、个性化、拒答和记忆评估，使用官方题名、作者、标识符和会议版本去重。原有 AdaMem 条目补入 EMNLP 工业轨版本，UAQ 条目补入 EMNLP 主会版本。AdMem 指程序性经验；AdaMem 指个性化写入策略，两者作者与 arXiv ID 均不同。[AdaMem](../papers/adamem-learning-what-to-remember.md) · [UAQ](../papers/uaq-agent-memory.md)
- **实现与资产。** 产品使用厂商文档、带版本发布记录或固定源码。论文所指的数据卡、代码和许可证单独核对，社区清单和自报分数只用于发现。条件效用数据快照中的 16,816 条是带条件和重复测量的记录；Becos 的结果仓库则提供作答、裁判及盲查材料。[条件效用数据卡](https://huggingface.co/datasets/AgentsSci/AAMAS2027-ConditionalMemory/tree/v0.6-length-control) · [Becos 结果仓库](https://github.com/becos-ai/locomo-results)

## 新收录的两个基准

[VibeMemBench](../benchmarks/vibemembench.md) 补上 #42 留待回查的 9 月论文：90 个仓库中的 111 个任务有可执行测试，另有 3,634 条历史轨迹供记忆系统利用。选题时要求在参考设置下注入经验能帮助执行，因此结果适用于这批经筛选的任务。[原始论文](https://arxiv.org/abs/2609.23570)

[StaleBench](../benchmarks/stalebench.md) 用带有效年份的 892 个更新事实考察另一种失败：首位可命中当前事实，后续返回的旧版本仍可能干扰读者。协议同时记录当前版本命中、前五项过期信息与回答表现。两个基准各新增一条来源事件。[原始论文](https://arxiv.org/abs/2611.19752)

## 产品与社区投稿

| 条目 | 核到的范围 | 证据 |
|---|---|---|
| GoodMem（#26） | 持久化空间有应用选择的写入路径、跨会话召回和工作负载权限，纳入产品 seed。保留 PAIR Systems 创始人的投稿归属和 9 月来源记录。 | [产品笔记](../products/goodmem.md) · [来源存档](../products/archives/goodmem-overview.md) |
| MoobFS（#35） | 目录级查询、类型化扩展属性和文件权限与记忆存储相关。语义检索和记忆管理仍由应用提供，列入 Tier B。 | [投稿判断与固定版本](product-discovery-log.md#2026-11-18-community-submissions) |
| Hindsight v1.2.1 | 11 月 10 日发布的版本支持部分更新标签，并在同文档、相同内容的重叠 retain 中去重。不同内容及外部存储有各自的并发约定。 | [产品笔记](../products/hindsight.md) · [官方发布](https://github.com/vectorize-io/hindsight/releases/tag/v1.2.1) |
| Letta Code v0.34.61 | 11 月 14 日发布的本地后端可以用 agent 模型自压缩，保留失败时回退至摘要的路径。适用范围是本地上下文。 | [产品笔记](../products/letta.md) · [官方发布](https://github.com/letta-ai/letta-code/releases/tag/v0.34.61) |
| #42 原有产品项 | JiuwenMemory 新增产品及来源存档，Google、Zep、agentmemory 更新已有笔记。 | [JiuwenMemory](../products/jiuwen-memory.md) · [Google Memory Bank](../products/google-memory-bank.md) · [Zep](../products/zep.md) · [agentmemory](../products/agentmemory.md) |

## 相邻研究与待核线索

- **多 agent 的交接损失。** 一项基于 11 个 Harvey LAB 文档审阅任务的工作跟踪冲突证据从 worker 阅读、上报、到主 agent 结论的流向。它适合解释单次任务中的交接损失，跨会话共享记忆应另看 COLLABMEM。[交接研究](https://arxiv.org/abs/2611.22245) · [COLLABMEM](../benchmarks/collabmem.md)
- **多跳检索。** LMMR 在固定阅读预算下选择段落和句子片段。其验证集是多跳 QA，用作召回与证据组装的相邻对照，未纳入持久化写入和维护协议计数。[LMMR](https://arxiv.org/abs/2611.22425)
- **现有条目和历史观察项。** SoMem 已随 #42 收录；MemSkill 在原始抓取中已有同一 arXiv 号的 stub。GitHub 星数、注册榜与自报排名没有提供独立运行证据。[SoMem](../papers/somem-self-organized-memory.md) · [MemSkill](../papers/stubs/memskill-learning-and-evolving-memory-skills-for-self.md)
- **来源差异。** MEMOIR 正文的检索默认参数与固定版本仓库文档有差异，README 与 LICENSE 的发布说明也需要作者澄清。Becos 在同一批 LoCoMo 对话上开发了所测配置。上述来源可支持方法和实验设置，跨产品排名仍缺独立复现。[MEMOIR 核对结果](../papers/memoir-training-free-lifecycle.md) · [LoCoMo 比较条件](../benchmarks/locomo.md)
- **发行日期。** Hindsight 的两个改动先于 v1.2.1 合并，按稳定版本发布日期收录。已核 AWS 说明中的短期记忆定价和 TTL 属于 10 月，未作为 11 月发布计入。[Hindsight](../products/hindsight.md) · [AWS 发布说明](https://docs.aws.amazon.com/bedrock-agentcore/latest/devguide/release-notes.html)

## 目录增量

| 项目 | 主分支基线 | 纳入 #42 后 | 11 月 18 日整合后 |
|---|---:|---:|---:|
| Full 论文笔记 | 7 | 7 | 7 |
| Seed 论文笔记 | 109 | 113 | 119 |
| 基准目录行 | 39 | 43 | 45 |
| 声明台账事件 | 49 | 53 | 61 |
| 产品笔记 | 42 | 43 | 44 |
| 产品来源存档 | 41 | 42 | 43 |

新增 12 条台账事件中，6 条记录基准来源，6 条记录研究团队使用现有基准的具体协议。
5 月抓取基线为 989 篇，仓内有 988 个 stub 和 534 份既有 PDF。论文笔记、数据集记录数和基准目录行各有自己的统计口径。
本次核对的是文献、实现方发布记录和公开评测资产，产品运行与基准独立复现仍待开展。[论文索引](../papers/index.md) · [基准目录](../benchmarks/index.md) · [声明台账](../benchmarks/claims/claims.yaml)
