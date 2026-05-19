---
title: Ymem module taxonomy for research mapping
date: 2026-05-08
revised: 2026-05-18
status: working-spec
language: zh-CN
---

# Ymem 模块 taxonomy

每条 `ResearchItem`(`papers/*.md`、`products/*.md`)在写完后,应该至少标注一个
所影响的 Ymem 模块。这份文档列出当前承认的模块名,便于 ImpactReport 聚合与
后续 radar 自动归类。

## 模块列表

| 模块 | 责任 | 典型研究/产品 |
|---|---|---|
| `ingest-adapter` | 把外部源(对话、文件、API 输出)转成 `MemoryRecord` | host-app 侧,但 schema 由 Ymem 定义 |
| `parser-chunker` | 把原始内容切分成语义单元,记录 provenance | LongChunker 类工作 |
| `semantic-dedup` | 检测语义重复并合并 / 选择 canonical 表述 | clustering, MinHash, embedding sim |
| `retriever-reranker` | 在线读路径:候选检索 + 重排 | BM25/FTS + dense + LLM rerank,Agentic RAG |
| `context-packer` | 在预算内组装结果,标注 why-used、omitted、conflicts(host-app 边界对象,kernel 只产出原料) | host 侧概念,但 kernel 提供 `MemoryResult` |
| `dream-consolidator` | 离线生成 `MemoryDiff` 候选(merge / supersede / archive / new_insight) | Claude Dreams, MemoryT1 |
| `memorydiff-generator` | 把检测结果落成可审核 diff | — |
| `evaluator-benchmark` | EvalCase 数据格式与回归套件 | LongMemEval, MemoryAgentBench, LoCoMo |
| `publisher` | host 侧概念:llms.txt / skill.md / wiki view | host 侧,不在 Ymem |
| `interface` | host 侧概念:CLI / MCP / SDK | host 侧,不在 Ymem |
| `audit-ui` | host 侧概念:why-used / diff review UI | host 侧,不在 Ymem |
| `security-privacy` | provenance、tool-poisoning 防护、敏感字段策略 | — |

## 使用方式

在论文/产品笔记的 frontmatter 或 body 顶部:

```yaml
ymem_modules:
  - retriever-reranker
  - semantic-dedup
```

或在 body 中:

```markdown
**Ymem modules affected**: `retriever-reranker`, `semantic-dedup`
```

ImpactReport 必须使用本文档列出的模块名;若发现新模块概念,先在此文档 PR 增加,
再写 ImpactReport。

## host-side vs kernel-side

并非所有模块都属于 Ymem。`context-packer` / `publisher` / `interface` /
`audit-ui` 都是 host-app(目前是 ZhiOne)的责任。但 radar 仍然追踪这些模块的
研究,因为:

1. host 侧的需求会反推 Ymem 输出的形状(例如 `MemoryResult` 需要带 omitted /
   conflicts 字段以支持 ContextPack);
2. host 侧的真实 trace 是 Ymem benchmark 的重要补充。

ImpactReport 应明确标注 `affected_modules` 是 kernel-side 还是 host-side,
避免把 host 侧改造硬推进 Ymem。
