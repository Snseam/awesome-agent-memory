---
title: Related work — sibling agent-memory awesome-lists
date: 2026-05-19
status: working-spec
language: zh-CN
---

# 同生态 awesome-list

这页只做"引用 + 定位"。每条 entry 回答三个问题:
**它是什么 / 它和我们什么关系 / 我们从它身上拿什么**。

笔记内容由我们独立撰写(避免二手摘要风险),只引用源仓库名、条目元数据
(标题、arXiv ID、年份)以及 ReadMe 章节结构。

## 关键差异

awesome-agent-memory 与下面 9 个 list 都不一样的地方:

1. **每条 ResearchItem 必须映射到 [`taxonomy.md`](taxonomy.md) 的 memory
   kernel 模块**。别家是论文清单,我们是"决策驱动的输入面"。
2. **从知识 → ImpactReport → ADR → kernel 主线** 是 awesome-list 的反操作。
   别家追求覆盖,我们追求"能进入设计 ADR"。
3. **PDF 与 markdown 快照都本地存档**(`papers/pdfs/` 与
   `products/archives/`)。别家通常只留链接,链接坏掉就丢了。
4. **zh-CN 友好**:笔记和 schema 用中文,但 PDF / 引用 / 源元数据保持原始
   英文。**不复制** IAAR-Shanghai 的 zh-CN 笔记体例。

## 9 个 awesome-list

| Repo | 维护者 | 主轴 / 体例 | 与我们的差异 | 借鉴点 |
|---|---|---|---|---|
| `IAAR-Shanghai/Awesome-AI-Memory` | 上海 IAAR | 双语 zh-CN/en,综述式长 README(~590KB),Apache 2.0 | 他们做"百科";我们做"决策依据" | zh-CN 词条命名;**中文综述读者画像** |
| `TsinghuaC3I/Awesome-Memory-for-Agents` | 清华 C3I 实验室 | `Persistence × Curation` 二维分类,月更,MIT | 他们的分类轴是论文学派;我们的轴是 kernel 模块 | **Curation** 维度(write→manage→read 类比) |
| `Shichun-Liu/Agent-Memory-Paper-List` | Shichun Liu(学生维护) | 配套 survey "Memory in the Age of AI Agents" 的引用清单 | 我们直接深读它的 survey | 用作 survey 引用对齐 |
| `TeleAI-UAGI/Awesome-Agent-Memory` | 中电信 AI 实验室 | 偏 MLLM(视觉记忆 / 多模态对话) | 我们目前不重 MLLM | **MLLM 记忆条目** 单列,作 v1+ 扩展线索 |
| `AgentMemoryWorld/Awesome-Agent-Memory` | 社区(无机构挂名) | 自称 up-to-date,更新频繁但条目筛选不严 | 噪声大 | **新条目早信号源**,作为 §1 的补充 |
| `qianlima-lab/awesome-lifelong-llm-agent` | qianlima-lab | TPAMI 2026 survey 配套,**lifelong** 视角 | lifelong / continual learning 与 `dream-consolidator` 类模块强相关 | **catastrophic forgetting** 与 dream consolidation 的论文 lineage |
| `DEEP-PolyU/Awesome-GraphMemory` | 香港理工 DEEP lab | 专注 graph-based memory(KG / temporal KG / GraphRAG) | 我们目前不绑死 graph,但 Zep/Graphiti 是关键产品 | **GraphRAG 系列论文** 一网打尽 |
| `VoltAgent/awesome-ai-agent-papers` | VoltAgent 公司 | 2026 agent 主流论文集大成,广 | 范围 > memory,需要按关键词过滤 | **agent runtime / planning 与 memory 的交叉**条目 |
| `NirDiamant/Agent_Memory_Techniques` | Nir Diamant(个人)| 30 个 runnable Jupyter notebook,教程性质 | 我们不做教程,但**有 runnable code** 是宝贵的实证 | **notebook 实现作为 prototype 起点** |

## 入库流程

新条目入库前用 [`papers/_scrape/scrape.py`](papers/_scrape/scrape.py) 跑一遍交叉对照:
某条目是否已经被 ≥ N 个 list 引用,可以作为"成熟度"启发式
(N≥3 → 强 candidate 深读;N=1 → stub 即可)。
跨仓引用次数 top-N 见 [`papers/index.md`](papers/index.md) 顶部统计。

## 不收录什么

- **不收录纯 RAG 综述**(除非明确讨论"记忆 vs 检索"的边界)
- **不收录纯 long-context 论文**(除非讨论 memory abstraction)
- **不收录 LLM 个性化但不涉及持久记忆的工作**(persona prompt ≠ memory)
- **不收录 cognitive science / neuroscience 类比**(除非有可落地的算法 claim)

这些边界本身也是 agent memory 产品的边界:它不是 RAG、不是 long-context、
不是 persona,而是"agent 的状态持久与演进"。
