<div align="center">

# awesome-agent-memory

**面向 AI agent 记忆研究的精选阅读清单、综述与决策面。**

**中文** · [English](README.md)

[![License](https://img.shields.io/badge/License-Apache_2.0-blue.svg)](LICENSE)
[![Papers](https://img.shields.io/badge/papers-980-brightgreen.svg)](papers/index.md)
[![PDFs](https://img.shields.io/badge/local_PDFs-125-orange.svg)](papers/pdfs/)
[![Products](https://img.shields.io/badge/products-10-purple.svg)](products/)
[![Surveys](https://img.shields.io/badge/meta_surveys-6-yellow.svg)](surveys.md)
[![Updated](https://img.shields.io/badge/updated-2026--05-lightgrey.svg)](signals.md)

</div>

---

> 服务于 [Ymem](https://github.com/Snseam/Ymem)(一个 agent 记忆 kernel)的
> 算法迭代,同时作为公开资源开放给所有正在为 AI agent 构建记忆系统的人。

本仓库**有意保持窄域**:不是通用 AI/ML 阅读清单。每一条目都应当对
"agent 怎样**记忆、遗忘、检索、整合**信息"有可解释的影响。

## 与同类 awesome-list 的不同

| | 一般 awesome-list | **awesome-agent-memory** |
|---|---|---|
| 目标 | 求覆盖 | 驱动 Ymem 决策 |
| 单篇笔记 | 标题 + 链接 | 七节 ResearchItem 模板 |
| PDF | 只留链接,链接坏掉就丢 | 本地存档(`papers/pdfs/`)|
| 跨仓信号 | 无 | 每个 stub 记录 9 个同生态 list 中哪些引用了它 |
| 模块映射 | 无 | 每个 full 笔记必须映射到 `taxonomy.md` 中的 Ymem 模块 |
| 工作流 | 读 | 读 → ImpactReport → 沙盒实验 → ADR |

## 目录

1. [一眼总览](#一眼总览)
2. [仓库结构](#仓库结构)
3. [工作流](#工作流)
4. [Stub 与 Full 笔记](#stub-与-full-笔记)
5. [新增 full 笔记的字段要求](#新增-full-笔记的字段要求)
6. [License 与存档策略](#license-与存档策略)
7. [与中文同行的关系](#与中文同行的关系)
8. [姊妹仓库](#姊妹仓库)
9. [贡献](#贡献)

## 一眼总览

```text
980 篇唯一论文     ← 9 个同生态 awesome-list 抓取去重
125 个本地 PDF     ← arXiv 开放协议,跨仓引用 ≥3 才入库
 10 个产品笔记     ← Mem0、Letta、Zep、Graphiti、Cognee、LangMem、…
  9 个页面快照     ← markdown 形式,便于审计
  7 个深读笔记     ← 七节模板,基于实际读过的 PDF
  6 个 meta-survey ← 2025-12 ~ 2026-05,见 surveys.md
  1 份活综述       ← survey/agent-memory-survey.md
```

**跨 9 仓引用 top-6**(每篇均被 6 / 9 个同生态 list 引用):
[MAGMA](papers/magma-a-multi-graph-based-agentic-memory-architecture-for.md) ·
[Mem0](papers/mem0-paper.md) ·
[MemGen](papers/memgen-weaving-generative-latent-memory-for-self-evolving.md) ·
[Memory-R1](papers/memory-r1-enhancing-large-language-model-agents-to-manage.md) ·
[MIRIX](papers/mirix-multi-agent-memory-system-for-llm-based-agents.md) ·
[O-Mem](papers/o-mem-omni-memory-system-for-personalized-long-horizon-self.md)

## 仓库结构

### 顶层概念文档

| 文件 | 用途 |
|---|---|
| [`survey/agent-memory-survey.md`](survey/agent-memory-survey.md) | **我们的**活综述。首选入口。 |
| [`surveys.md`](surveys.md) | **外部** meta-survey 索引(2025-12 ~ 2026-05)。 |
| [`taxonomy.md`](taxonomy.md) | Ymem 模块 taxonomy + 三套外部 taxonomy 的对照。 |
| [`research-radar-spec.md`](research-radar-spec.md) | 论文/产品 → ImpactReport → Ymem 沙盒 → ADR 工作流。 |
| [`information-sources.md`](information-sources.md) | 10 类信息源 catalog,含 zh-CN 独立节。 |
| [`related-work.md`](related-work.md) | 9 个同生态 awesome-list 与我们的差异。 |
| [`products-landscape.md`](products-landscape.md) | agent memory 产品按**领域 × 服务对象**全景。 |
| [`signals.md`](signals.md) | 2026 H1 反时序日志(release / comparison / blog)。 |

### 逐条笔记

| 路径 | 内容 |
|---|---|
| [`papers/`](papers/) | ~990 篇笔记(stub + full)。主索引 [`papers/index.md`](papers/index.md)。 |
| [`papers/pdfs/`](papers/pdfs/) | 125 个本地 PDF(~500 MB)。详见存档策略。 |
| [`papers/_scrape/`](papers/_scrape/) | 可复现产物:抓取脚本 + dedup JSON。 |
| [`products/`](products/) | 10 个产品笔记。 |
| [`products/archives/`](products/archives/) | 产品页面的 markdown 快照。 |
| [`impact-reports/`](impact-reports/) | `ArchitectureImpactReport` 草稿(当前为空)。 |

## 工作流

```text
论文 或 产品
    ↓
ResearchItem 笔记(papers/ 或 products/)
    ↓
对照 taxonomy.md 归类
    ↓
ArchitectureImpactReport(impact-reports/)
    ↓
Ymem 沙盒实验
    ↓
ADR(写在 Ymem 仓内)
    ↓
进入 Ymem 主线 或 归档
```

外部 survey 索引和我们的活综述反映当前理解面;逐条笔记是原材料;
ImpactReport 是评估通道;最终 ADR(在 Ymem 仓)记录决策。

## Stub 与 Full 笔记

大多数论文笔记是 **stub**:只有 frontmatter(标题、arXiv ID、年份、source 仓
列表、可选本地 PDF 链接、`status: stub`)加一行上下文,由跨仓抓取自动产出。
它们的存在意义是:

1. 让 Radar 对 9 个同生态 list 追踪的内容做到 100% 覆盖;
2. 跨仓引用次数提供"成熟度"信号,告诉我们 stub 升级的优先级。

stub 在有人通读论文后填完七节模板,升级为 **full** 笔记:

```text
1. 问题陈述
2. 核心 claim
3. 方法 / 框架
4. 评估 / benchmark
5. 与 Ymem 的关系      ★ taxonomy 映射
6. 优劣 / 注意事项
7. 待跟进
```

**只有 full 笔记可以在 ArchitectureImpactReport 中被引用。**

## 新增 full 笔记的字段要求

- title · source(arXiv ID / 会议 / 博文 URL)· date
- domain —— `memory | retrieval | graph | agent | eval | compression | UI | security` 之一
- core claim · method summary · required assumptions · benchmarks used
- evidence level(`weak | medium | strong`)
- code available(yes/no + 链接)· license · cost/complexity 估算
- **relevance to Ymem** 必须映射到 [`taxonomy.md`](taxonomy.md) 中的模块

完整 schema 与命名约定见 [`research-radar-spec.md`](research-radar-spec.md)。

## License 与存档策略

笔记与综述内容以 [Apache 2.0](LICENSE) 协议发布(与 sister repos 一致)。
**引用自外部论文与文章的摘录**仍归原作者所有,本仓在 fair use / fair dealing
框架下出于研究评议目的使用。

**本地存档 PDF**(`papers/pdfs/`)均来自允许 redistribute 的来源 ——
arXiv perpetual non-exclusive license、ACL Anthology 的 CC-BY、OpenReview
开放投稿等。若发现本仓某 PDF 的源协议禁止 redistribute,请开 issue,
我们会撤下;对应笔记 `urls` 字段中的 canonical URL 仍是权威来源。

**产品页面快照**(`products/archives/`)是研究备份,用以让本仓的推理在源
页面变更或消失后仍可审计。它们**不是**重新发布材料;商用引用请以快照 header
中的 `source_url` 为准。

## 与中文同行的关系

- [IAAR-Shanghai/Awesome-AI-Memory](https://github.com/IAAR-Shanghai/Awesome-AI-Memory)
  是中文社区目前 agent memory 覆盖最全的双语 awesome-list。我们引用它的条目
  作为 cross-list 信号源(详见 [`related-work.md`](related-work.md))。
  **差异**:我们的每条 ResearchItem 都标注 Ymem 模块映射,并且围绕"驱动 Ymem
  决策"组织,不追求百科式覆盖。
- 完整中文社区信息源(知乎 / B 站 / 公众号 / 小红书 / 中文 awesome 仓)单独
  成节,见 [`information-sources.md`](information-sources.md) §6。

## 姊妹仓库

| Repo | 角色 |
|---|---|
| [Ymem](https://github.com/Snseam/Ymem) | agent 记忆 kernel,消费本仓的输出。 |
| [ZhiOne](https://github.com/Snseam/zhione) | 首个基于 Ymem 的 host app。 |

## 贡献

参见 [`CONTRIBUTING.md`](CONTRIBUTING.md) 与 [`CODE_OF_CONDUCT.md`](CODE_OF_CONDUCT.md)。简言之:

- **新论文** → 先在 `papers/` 加 stub(或升级已有 stub 到 full),然后看是否
  值得写 ImpactReport。
- **新产品** → 在 `products/` 加笔记并存档页面到 `products/archives/`,再
  决定是否需要进入 [`products-landscape.md`](products-landscape.md)。
- **新信息源** → 加进 [`information-sources.md`](information-sources.md)
  对应的类目。
- **新 awesome-list** → 加进 [`related-work.md`](related-work.md) 并讨论差异。

---

<div align="center">

**[活综述](survey/agent-memory-survey.md)** ·
**[Papers 索引](papers/index.md)** ·
**[产品全景](products-landscape.md)** ·
**[信号日志](signals.md)** ·
**[English](README.md)**

</div>

> *本仓内容由仓库维护者人工撰写,部分 stub 与初稿借助 LLM 工具加速生成;每条
> full 笔记都基于实际的 PDF / 产品页面 grounded,不引用未经验证的二手摘要。*
