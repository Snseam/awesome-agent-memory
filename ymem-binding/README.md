---
title: ymem-binding — project-specific bindings for the Ymem kernel
date: 2026-05-19
status: working-spec
language: zh-CN
---

# `ymem-binding/` — 这个子目录是什么

awesome-agent-memory 是一个**公开的** agent memory 阅读清单、综述和 Radar
工作流模板。它的根目录(`taxonomy.md` / `research-radar-spec.md` /
`survey/agent-memory-survey.md` 等)对任何在做 agent memory 系统的人都应该
有用,**不绑定任何具体产品**。

但本仓的发起方是 **[Ymem](https://github.com/Snseam/Ymem)** —— 一个我们自己
在维护的 agent memory kernel。Ymem 的某些**具体**绑定(模块名称、内部 schema、
立场、与 host app 的契约)是仓库里很多深读笔记 "决策相关性" 一节背后的
**默认坐标系**。

为了让公开仓面对外完全中性、同时不丢失这些有价值的绑定上下文,**所有 Ymem
特定内容都收纳到本子目录**:

```
ymem-binding/
├── README.md            ← 你在读的这个文件
├── taxonomy-modules.md   ← Ymem 模块定义 + 跨外部 taxonomy 对照
├── research-radar.md    ← Ymem 内部 Radar 工作流(沙盒、ADR 通道)
├── survey-stance.md     ← Ymem 立场与硬约束(从活综述抽出)
└── relevance-index.md   ← 19 篇 deep notes "决策相关性"小节导航
                          + memory_modules 字段如何在笔记里读
```

## 与公开仓的契约

- 根目录文档**不引用**本目录的术语。你完全可以无视 `ymem-binding/` 把
  awesome-agent-memory 当作通用 agent memory 阅读清单使用。
- 深读笔记(`papers/*.md` 与 `products/*.md`)中的 "决策相关性 / Decision
  relevance" 章节,讨论的是**通用** memory kernel 视角,模块名称
  (`ingest-adapter`、`retriever-reranker`、`dream-consolidator` 等)本身也
  是通用术语 —— 任何人都能套用。
- 笔记 frontmatter 里的 `memory_modules:` 字段值,出自一份具名的模块清单 ——
  这份清单就是 [`taxonomy-modules.md`](taxonomy-modules.md) 里的 Ymem 模块
  表。如果你不维护 Ymem,可以把它当作"一种合理的模块切分参考"。

## 为什么不直接独立成另一个仓库

短期看,把 Ymem 绑定和公开 awesome-list 放同一个仓便于一处更新、一处审核。
未来如果 awesome-agent-memory 成熟到需要独立社区运作,会评估把
`ymem-binding/` 抽成 Ymem 主仓的子目录。当前 v0.3 版本是中间形态。

## 贡献到本目录

- **改 [`taxonomy-modules.md`](taxonomy-modules.md)**:模块清单变化(新增 /
  弃用)→ 先发 issue 讨论,再发 PR。改完同步检查 deep notes 的
  `memory_modules:` 字段是否还合法。
- **改 [`research-radar.md`](research-radar.md)**:Radar 工作流变化 → Ymem
  团队内部 ADR 同步。
- **改 [`survey-stance.md`](survey-stance.md)**:Ymem 立场调整 → 同时更新
  Ymem 仓的 ADR(此仓只承载结论,理由在 Ymem 仓)。
- **改 [`relevance-index.md`](relevance-index.md)**:新增 deep note 时同步
  追加一行。

## 与 sister repos 的关系

| Repo | 角色 | 与本目录的接口 |
|---|---|---|
| [Ymem](https://github.com/Snseam/Ymem) | agent 记忆 kernel | 消费本仓 deep notes 的"决策相关性"小节;`taxonomy-modules.md` 在 Ymem 主仓 ADR 里被反向 cite |
| [ZhiOne](https://github.com/Snseam/zhione) | 首个基于 Ymem 的 host app | 只关心 Ymem 的 API,不直接消费本仓 |

ZhiOne 不直接读 awesome-agent-memory;它通过 Ymem 间接受益于这里整理的研究。
