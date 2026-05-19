---
title: Meta-surveys index
date: 2026-05-19
status: working-spec
language: zh-CN
---

# Meta-surveys

agent memory 领域的"综述的综述"。**deep note 已经写在 `papers/` 里**;本页只
是单页索引,方便快速比对每篇 survey 的切入角度。

`survey/agent-memory-survey.md` 是**我们自己**维护的活综述(读者画像:Ymem
设计者),与本页列出的外部 survey 互补:外部 survey 求覆盖,我们的 survey 求
"对 Ymem 决策有用"。

## 索引表

| Survey | 出处 | 日期 | 一句话核心 | Deep note |
|---|---|---|---|---|
| **Memory in the Age of AI Agents** | arXiv 2512.13564 | 2025-12 → 2026-01 v2 | Forms × Functions × Dynamics 三轴 taxonomy | [`papers/memory-in-the-age-of-ai-agents.md`](papers/memory-in-the-age-of-ai-agents.md) |
| **Memory for Autonomous LLM Agents** | arXiv 2603.07670 | 2026-03 | write–manage–read 循环 + temporal-scope × substrate × control-policy 三维分类 | [`papers/memory-for-autonomous-llm-agents-survey.md`](papers/memory-for-autonomous-llm-agents-survey.md) |
| **From Storage to Experience** | arXiv 2605.06716 | 2026-05 | Storage → Reflection → Experience 三阶段记忆演化 | [`papers/from-storage-to-experience.md`](papers/from-storage-to-experience.md) |
| **Toward Mnemonic Sovereignty** | arXiv 2604.16548 | 2026-04 | cross-session poisoning / 越权访问 / 状态污染的威胁模型 | [`papers/mnemonic-sovereignty.md`](papers/mnemonic-sovereignty.md) |
| **A Survey on Lifelong LLM Agents** | qianlima-lab(TPAMI 2026 配套)| 2026 H1 | 终身学习 + agent 的交叉视角;catastrophic forgetting 与 dream consolidation | (待写 stub → 升级)|
| **LLM Agent Memory: A Unified Representation–Management Perspective** | OpenReview | 2025 H2 | 表达层 vs 管理层的二分法 | (待写 stub → 升级)|

## 三个主流 taxonomy 的对照

下表对应 [`taxonomy.md`](taxonomy.md) §"与其他 taxonomy 的对照"小节,详见那里。
本页只做一句话指引:

- **2512.13564** 的 `Forms × Functions × Dynamics` → Forms 映射 Ymem 的存储层
  (`semantic-dedup` / `parser-chunker`);Functions 映射 read path
  (`retriever-reranker` / `context-packer`);Dynamics 映射 write path
  (`dream-consolidator` / `memorydiff-generator`)。**这条对齐最干净,首推。**
- **2603.07670** 的 `temporal-scope × substrate × control-policy` →
  temporal-scope 与 `valid_from / valid_to` 字段对应;substrate 与底层 store
  选型对应;control-policy 与 dream / diff / supersede 的策略对应。
- **TsinghuaC3I** 的 `Persistence × Curation` → Persistence ≈ Ymem 存储层;
  Curation ≈ write path 的 `consolidate / dedup / diff`。

## 我们的 survey 与外部 survey 的分工

| 维度 | 外部 surveys | 本仓 `survey/` |
|---|---|---|
| 读者画像 | 学界 / 广义 NLP 研究者 | Ymem 设计者 + zhione 工程师 |
| 覆盖 | 求全 | 求"能进入 ADR" |
| 体例 | 学术综述,citation 完备 | living doc,可随时改 |
| 评估 | 整理 benchmark 数字 | 评估**对 Ymem 模块的影响** |
| 更新节奏 | 半年一次 v2 | 阅读时同步改写 |

外部 survey 是"输入",我们的 survey 是"输出层"。本页的索引让任何架构讨论
都能在两类 survey 之间快速跳转。
