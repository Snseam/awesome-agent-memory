# awesome-agent-memory

**中文** | [English](README.md)

一份持续更新的 **agent memory**(智能体记忆)论文与工程实践阅读清单与综述。
主要用于支撑 [Ymem](https://github.com/Snseam/Ymem) 记忆 kernel 的算法迭代,
同时作为公开资源开放给所有正在为 AI agent 构建记忆系统的人。

本仓库**有意保持窄域**:不是通用 AI/ML 阅读清单。每一条目都应当对"agent 怎样
记忆、遗忘、检索、整合信息"有可解释的影响。

## 索引

**顶层概念文档**:

- [`survey/agent-memory-survey.md`](survey/agent-memory-survey.md) ——
  我们的**活综述**。这是一份会随着领域演进不断重写的文档,首选入口。
- [`surveys.md`](surveys.md) —— **外部** meta-survey 索引(2025-12 ~ 2026-05),
  附 taxonomy 对照速查表。
- [`taxonomy.md`](taxonomy.md) —— Ymem 模块 taxonomy,加上三套主流外部 taxonomy
  到 Ymem 模块的对照表。
- [`research-radar-spec.md`](research-radar-spec.md) —— Radar 流程:从外部论文
  或产品到 Ymem 沙盒实验再到 ADR 的完整工作流。
- [`information-sources.md`](information-sources.md) —— 10 大类信息源 catalog,
  含 zh-CN 中文社区独立节。
- [`related-work.md`](related-work.md) —— 9 个同生态 awesome-list 仓库,以及
  我们与它们各自的定位差异。
- [`products-landscape.md`](products-landscape.md) —— agent memory 产品全景,按
  **领域 × 服务对象** 二维分类(Mem0 / Letta / Zep / Cognee / OpenAI / Anthropic /
  IDE agent / PKM / …)。
- [`signals.md`](signals.md) —— 2026 H1 反时序日志(release / comparison / blog /
  paper / talk / incident)。

**逐条笔记**:

- [`papers/`](papers/) —— ~990 篇论文笔记。少量是深读 ResearchItem
  (`status: full`);其余是 stub(`status: stub`),由跨 9 仓 awesome-list 抓取
  去重自动生成。主索引按年倒序 + 跨仓引用次数排序见
  [`papers/index.md`](papers/index.md)。
- [`papers/pdfs/`](papers/pdfs/) —— 本地存档 PDF(~120 篇,~500MB)。版权说明
  见下文 **License / 存档策略**。
- [`papers/_scrape/`](papers/_scrape/) —— 可复现产物:抓取 + 去重脚本与 JSON
  输出。不是笔记,无须阅读,但允许下次增量更新 stub 队列。
- [`products/`](products/) —— 每个相关产品 / 库 / 工程博文一条笔记
  (Mem0、Letta、Zep、Graphiti、Cognee、LangMem、MemGPT、OpenAI memory、
  Claude Dreams、Karpathy 的 LLM Wiki 设想等)。
- [`products/archives/`](products/archives/) —— 产品页面与博文的 markdown 快照
  (研究备份;商用引用以快照 header 中的 `source_url` 为准)。
- [`impact-reports/`](impact-reports/) ——
  `ArchitectureImpactReport` 草稿,记录候选技术的评估过程。

## 工作流

```text
论文或产品
  → ResearchItem 笔记(papers/ 或 products/)
  → 对照 taxonomy.md 归类
  → ArchitectureImpactReport(impact-reports/)
  → Ymem 沙盒实验
  → ADR(写在 Ymem 仓内)
  → 进入 Ymem 主线 或 归档
```

外部 survey 索引和我们自己的活综述反映当前理解面;逐条笔记是原材料;
ImpactReport 是评估通道;最终 ADR(在 Ymem 仓)记录决策。

## Stub 与 Full 笔记的区别

大多数论文笔记是 **stub**:只有 frontmatter(标题、arXiv ID、年份、source 仓
列表、可选本地 PDF 链接、`status: stub`)加一行上下文,由跨仓抓取自动产出。
它们的存在意义是:

1. 让 Radar 对 9 个同生态 list 追踪的内容做到 100% 覆盖;
2. 跨仓引用次数提供 "成熟度" 信号,告诉我们 stub 升级的优先级。

stub 在有人通读论文并写完七节模板(问题 / claim / 方法 / 评估 /
**Ymem 关联** / 优劣 / 待跟进)后升级为 **full** 笔记。**只有 full 笔记
可以在 ArchitectureImpactReport 中被引用**。

## 新增 full 笔记的字段要求

- title
- source(arXiv ID、会议、博文 URL 等)
- date
- domain(memory / retrieval / graph / agent / eval / compression / UI /
  security 之一)
- core claim(一句话核心论点)
- method summary(方法概要)
- required assumptions(前置假设)
- benchmarks used(评测)
- evidence level(weak / medium / strong)
- code available(yes/no + 链接)
- license
- cost/complexity 估算
- **relevance to Ymem**(必须映射到 `taxonomy.md` 模块)

完整 schema 与命名约定见 [`research-radar-spec.md`](research-radar-spec.md)。

## License / 存档策略

笔记与综述内容以 Apache 2.0 协议发布(与 sister repos 保持一致)。**引用自
外部论文与文章的摘录**仍归原作者所有,本仓在 fair use / fair dealing 框架下
出于研究评议目的使用。

**本地存档 PDF**(`papers/pdfs/`)均来自允许 redistribute 的来源(arXiv
perpetual non-exclusive license、ACL Anthology 的 CC-BY、OpenReview 开放投稿
等)。若发现本仓某 PDF 的源协议禁止 redistribute,请开 issue,我们会撤下;
对应笔记 `urls` 字段中的 canonical URL 仍是权威来源。

**产品页面快照**(`products/archives/`)是研究备份,用以让本仓的推理在源页面
变更或消失后仍可审计。它们**不是**重新发布材料;商用引用请以快照 header
中的 `source_url` 为准。

## 与中文同行的关系

- [IAAR-Shanghai/Awesome-AI-Memory](https://github.com/IAAR-Shanghai/Awesome-AI-Memory):
  中文社区 agent memory 覆盖最全的双语 awesome-list,目前我们引用它的条目作
  cross-list 信号源(详见 [`related-work.md`](related-work.md))。
  我们与它的差异:**每条 ResearchItem 都标注 Ymem 模块映射,且围绕"驱动 Ymem
  决策"组织**,而不是百科式覆盖。
- 完整中文社区信息源(知乎 / B 站 / 公众号 / 小红书 / 中文 awesome 仓)单独成节,
  见 [`information-sources.md`](information-sources.md) §6。

## 一句话核心

> 我们做的不是 awesome list,而是一份**能驱动 Ymem 架构演进**的输入面。

## 姊妹仓库

- [Ymem](https://github.com/Snseam/Ymem) —— agent 记忆 kernel,消费本仓的输出。
- [ZhiOne](https://github.com/Snseam/zhione) —— 首个基于 Ymem 的 host app。

## 贡献

参见 [`CONTRIBUTING.md`](CONTRIBUTING.md) 与 [`CODE_OF_CONDUCT.md`](CODE_OF_CONDUCT.md)。

简言之:

- **新论文** → 先在 `papers/` 加 stub(或升级已有 stub 到 full),然后看是否值得
  写 ImpactReport
- **新产品** → 先在 `products/` 加笔记并存档页面到 `products/archives/`,再决定是否
  需要进入 [`products-landscape.md`](products-landscape.md)
- **新信息源** → 加进 [`information-sources.md`](information-sources.md) 对应的类目
- **新 awesome-list** → 加进 [`related-work.md`](related-work.md) 并讨论差异

> *本仓内容由仓库维护者人工撰写,部分 stub 与初稿借助 LLM 工具加速生成;每条
> full 笔记都基于实际的 PDF / 产品页面 grounded,不引用未经验证的二手摘要。*
