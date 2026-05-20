---
title: Ymem decision-relevance index for deep notes
date: 2026-05-19
status: working-spec
language: zh-CN
---

# Decision-relevance 索引

awesome-agent-memory 的每篇 deep note(`papers/*.md` 或 `products/*.md`,
`status: full`)末尾都有一节 **"决策相关性 / Decision relevance"**,讨论
"如果你在做 memory kernel,这篇东西意味着什么"。这一节使用通用术语
(`ingest-adapter`、`retriever-reranker`、`dream-consolidator` 等模块名;
`MemoryRecord` / `MemoryDiff` / `MemoryResult` 等 schema 类型名)。

本仓发起方 **Ymem** 项目维护一份与这些通用术语对应的**具名模块清单**:
[`taxonomy-modules.md`](taxonomy-modules.md)。Ymem 团队读 deep notes 的
"决策相关性"小节时,把里面的通用模块名直接 1:1 映射到 Ymem 模块清单 ——
就形成了对 Ymem 决策的具体启发。

> 如果你不维护 Ymem,本页可以跳过 —— deep notes 本身的"决策相关性"已经
> 对你有意义。

## 1. `memory_modules:` 字段的读法

deep notes 的 frontmatter 长这样:

```yaml
memory_modules:
  - retriever-reranker
  - semantic-dedup
```

字段值取自 [`taxonomy-modules.md`](taxonomy-modules.md) 的 Ymem 模块清单。
**对外**:这些名字本身是通用的,任何 memory kernel 都能套用。
**对 Ymem**:笔记里只要列了 `retriever-reranker`,Ymem 的 retrieve 路径就
应该在下一次 ImpactReport 评审里考虑这篇论文。

## 2. 19 篇 deep note 速查

### Papers

| 笔记 | 主要 memory_modules | Ymem 影响一句话 |
|---|---|---|
| [`memory-in-the-age-of-ai-agents`](../../papers/memory-in-the-age-of-ai-agents.md) | parser-chunker / retriever-reranker / dream-consolidator | Forms × Functions × Dynamics 三轴是 Ymem 读写离线三路径的最干净对照,可作为 Ymem 文档的"如果用学界术语怎么说"参考 |
| [`memory-for-autonomous-llm-agents-survey`](../../papers/memory-for-autonomous-llm-agents-survey.md) | dream-consolidator / memorydiff-generator | `temporal-scope × substrate × control-policy` 三维与 Ymem 的 `valid_*` 字段、底层 store、diff 策略 1:1 对齐;**control-policy** 一词应被 Ymem 内部正式采用 |
| [`from-storage-to-experience`](../../papers/from-storage-to-experience.md) | dream-consolidator / memorydiff-generator | Storage → Reflection → Experience 三阶段是 Ymem v0(Storage)→ v1(Reflection,off-line consolidate)→ v2(Experience,自主使用 memory)演进路径的隐喻 |
| [`mnemonic-sovereignty`](../../papers/mnemonic-sovereignty.md) | security-privacy | **P0**:Ymem `security-privacy` 模块的设计依据;cross-session poisoning / 越权访问 / 状态污染三类威胁全部要落到 Ymem schema 与策略层 |
| [`mem0-paper`](../../papers/mem0-paper.md) | retriever-reranker / dream-consolidator / evaluator-benchmark | Mem0 ECAI 2025 横评是 Ymem v0 评估基线设计的直接对照;single-pass hierarchical extraction 与 multi-signal retrieval 两条算法值得 Ymem 沙盒复现 |
| [`convomem`](../../papers/convomem.md) | evaluator-benchmark | 对话记忆 benchmark;考虑加入 Ymem EvalCase suite,与 LongMemEval 互补 |
| [`longmemeval`](../../papers/longmemeval.md) | evaluator-benchmark / retriever-reranker | 经典基线;Ymem v0 必跑 |
| [`locomo`](../../papers/locomo.md) | evaluator-benchmark | 长对话基线;Mem0 横评的主战场,Ymem 沙盒应能跑通同样配置 |
| [`memoryagentbench`](../../papers/memoryagentbench.md) | evaluator-benchmark | 四类能力划分(accurate retrieval / test-time learning / long-range understanding / selective forgetting)直接进入 Ymem 评估维度表 |

### Products

| 笔记 | 主要 memory_modules | Ymem 影响一句话 |
|---|---|---|
| [`claude-dreams`](../../products/claude-dreams.md) | dream-consolidator | "consolidate 只产 diff,不直接 mutate" 这条硬约束就来自 Claude Dreams 的设计;[`survey-stance.md`](survey-stance.md) §1.1 |
| [`karpathy-llm-wiki`](../../products/karpathy-llm-wiki.md) | publisher (host-side) / context-packer | LLM Wiki 的 "host-app 主动维护 + agent 读取" 模式启发 Ymem `MemoryResult` 的形状 |
| [`letta`](../../products/letta.md) | (multiple) | Ymem **不做** agent runtime;Letta 是反面对照,提醒边界 |
| [`mem0`](../../products/mem0.md) | retriever-reranker / dream-consolidator | 直接对标产品;Ymem 应能在 Mem0 用例上做到等价或更好 |
| [`zep`](../../products/zep.md) | (KG 相关) | temporal KG 路线代表;Ymem v0 不绑死图谱但 schema 需兼容 |
| [`graphiti`](../../products/graphiti.md) | (KG 相关) | Zep 的开源底座;`MemoryRecord` 是否能映射到 Graphiti 的 entity/edge 是兼容性测试 |
| [`cognee`](../../products/cognee.md) | (KG + ontology) | ontology-first 路线;Ymem 暂不走这条 |
| [`langmem`](../../products/langmem.md) | retriever-reranker | LangChain 系的 memory primitive;host-app 集成参考 |
| [`memgpt`](../../products/memgpt.md) | dream-consolidator (forerunner) | Letta 的前身论文;`dream-consolidator` 的早期形态启发 |
| [`openai-memory`](../../products/openai-memory.md) | (多) | 大厂内建对照面;Ymem 必须能在不依赖 OpenAI 服务的前提下达到类似 UX |

## 3. 维护

新增 deep note 时**同步更新本页**:在对应表格里追加一行,填出 `memory_modules`
值与 Ymem 影响一句话。

如果某 deep note 升级 / 降级了它对 Ymem 的影响判断,改本页对应一句话即可
(具体论证写在 deep note 自己的"决策相关性"小节)。

## 4. Ymem 在产品全景里的位置

(从根 [`../products-landscape.md`](../products-landscape.md) v0.2 §C 抽出。)

Ymem **不是产品**,是给 host-app(如 ZhiOne)用的 memory kernel。它最直接
对照根 landscape A1 中的 **Mem0 OSS / Letta / Graphiti** —— 这三者都把自己
定位为"被 host 嵌入"。

差异:

- **比 Mem0 多一层**:Mem0 直接处理 raw conversation;Ymem 假设 host 已经
  做了 conversation → `MemoryRecord` 的转换。这让 Ymem 更纯,host 更重。
- **比 Letta 少一层**:Letta 是 agent runtime + memory;Ymem 只是 memory,
  不管 agent loop。host 要自己跑 agent。
- **比 Graphiti 更 schema-driven**:Graphiti 提供 KG primitives;Ymem 提供
  `MemoryRecord` + `MemoryDiff` + `MemoryResult` 三件套,KG 是可选 enricher
  而非核心数据模型。

## 5. 与 Ymem 主仓的对接

Ymem 仓内的 ADR 引用本仓 ImpactReport / deep notes 时,建议格式:

```text
[ymem-binding/relevance-index.md#papers] 把这篇笔记标为 `security-privacy` P0,
所以本 ADR 引入 mnemonic-sovereignty 的威胁模型作为 Ymem `security-privacy`
模块 v0 的最小设计依据。
```

这种 cite 方式让 Ymem 决策的 traceability 闭环 ——
任何人读 Ymem ADR 都能反查回这一页,然后跳到具体 deep note,再跳到原 PDF。
