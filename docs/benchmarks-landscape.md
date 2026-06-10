---
title: Benchmarks landscape — agent memory evaluation by capability and evidence
date: 2026-06-11
status: seed
language: zh-CN
---

# Benchmark 全景:按能力 × 证据等级

这页回答一个具体问题:**agent memory 领域哪些 benchmark 最常被论文和产品拿来
互相衡量?这些使用是论文评测、厂商自报、独立复现,还是仅仅 survey 提及?**

数据源是 [`../benchmarks/`](../benchmarks/) 和
[`../benchmarks/claims/claims.yaml`](../benchmarks/claims/claims.yaml)。本页不
做混合总榜,因为 LoCoMo、LongMemEval、ConvoMem、BEAM 等 benchmark 的任务、
模型、judge 和样本量不可直接平均。

## A. 分类地图

| 领域 | Benchmark | 主要测什么 | 当前证据状态 |
|---|---|---|---|
| 长程对话记忆 | [`LongMemEval`](../benchmarks/longmemeval.md) | information extraction / knowledge update / temporal / abstention | full,多产品自报引用 |
| 长程对话记忆 | [`LoCoMo`](../benchmarks/locomo.md) | factual recall / temporal / causal / multi-session | seed,产品横评最常见 |
| 对话记忆规模曲线 | [`ConvoMem`](../benchmarks/convomem.md) | long-context vs block extraction vs RAG crossover | full,同时批评 LongMemEval/LoCoMo |
| agent 记忆能力维度 | [`MemoryAgentBench`](../benchmarks/memoryagentbench.md) | retrieval / test-time learning / long-range / forgetting | seed,适合定义能力轴 |
| 百万 token 规模 | [`BEAM`](../benchmarks/beam.md) | 1M/10M 长尺度记忆退化 | candidate,目前主要来自 Mem0 自报 |
| 真实交互 / persona | RealMem / CloneMem / KnowMe-Bench / PersonaMem-v2 | real-world memory, identity continuity, companion personalization | candidate,先列入 backlog |
| agent 任务 / 多 agent | LoCoBench-Agent / MemoryArena / MemBench | coding agent, shared memory conflict, write/manage 评测 | candidate,需升级 source note |

## B. 初始交叉统计

这些计数来自 seed ledger,只用于指导下一轮精读优先级。

### B1. Raw mentions / usage events

| Benchmark | Raw events | Notes |
|---|---:|---|
| LongMemEval | 5 | origin + Mem0 + Hindsight + Hy-Memory + ConvoMem critique counted by event type |
| LoCoMo | 7 | origin + Mem0 paper/blog + Zep + Graphiti mention + MemoryOS + ConvoMem critique counted by event type |
| ConvoMem | 2 | origin + baseline comparison |
| BEAM | 2 | Mem0 BEAM 1M / 10M vendor claims |
| MemoryAgentBench | 2 | origin + survey mention |
| PersonaMem-v2 | 2 | Hy-Memory + TencentDB Agent Memory self-claims |
| MemBench | 1 | survey mention |
| MemoryArena | 1 | survey mention |

### B2. Evaluation uses / baseline comparisons

| Benchmark | Eval-use events | Evidence class |
|---|---:|---|
| LoCoMo | 1 | Mem0 paper affiliated evaluation; useful for paper analysis, not independent reproduction |
| ConvoMem | 1 | Origin paper baseline comparison against Mem0-style RAG; useful for protocol/crossover analysis |

### B3. Vendor claims

| Benchmark | Vendor-claim events | Actors |
|---|---:|---|
| LoCoMo | 3 | Mem0 blog, Zep, MemoryOS |
| LongMemEval | 3 | Mem0 blog, Hindsight, Hy-Memory |
| BEAM | 2 | Mem0 BEAM 1M and 10M self-reports |
| PersonaMem-v2 | 2 | Hy-Memory, TencentDB Agent Memory |

### B4. Independent reproductions

| Benchmark | Independent reproduction events | Notes |
|---|---:|---|
| LongMemEval / LoCoMo / BEAM / PersonaMem-v2 | 0 | Hindsight claims external reproduction, but no normalized independent source is in this repo yet |
| ConvoMem | 0 | Current rows are origin-paper protocol and baseline comparison, not third-party reruns |

### B5. Product-used benchmarks

| Benchmark | Products currently using/claiming it | Evidence class |
|---|---|---|
| LoCoMo | Mem0, Zep, MemoryOS; Graphiti appears via Zep foundation note | vendor / affiliated claims, no normalized independent reproduction in repo |
| LongMemEval | Mem0, Hindsight, Hy-Memory | vendor claims, Hindsight claims external reproduction but source not normalized |
| BEAM | Mem0 | vendor self-claim only |
| PersonaMem-v2 | Hy-Memory, TencentDB Agent Memory | vendor self-claim only |

### B6. Paper-origin reuse

| Benchmark | Reuse events outside origin | Reuse shape |
|---|---:|---|
| LoCoMo | 6 | Mem0 paper/blog, Zep, Graphiti foundation mention, MemoryOS, ConvoMem critique |
| LongMemEval | 4 | Mem0 blog, Hindsight, Hy-Memory, ConvoMem critique |
| BEAM | 2 | Mem0 vendor claims, source note still candidate |
| PersonaMem-v2 | 2 | Hy-Memory and TencentDB Agent Memory vendor claims |
| MemoryAgentBench | 1 | Survey mention only |

### B7. Independent or methodological pressure

| Benchmark | Pressure source | Interpretation |
|---|---|---|
| LongMemEval | ConvoMem critique | sample-size and filler-source critique, not a rerun |
| LoCoMo | ConvoMem critique | small-conversation-count critique, not a rerun |
| ConvoMem | own baseline comparison | strong protocol for cost/accuracy crossover, but synthetic data and Mem0-only RAG baseline caveat |

## C. What Counts As Evidence

| Evidence class | Use in this repo |
|---|---|
| `primary_pdf` | Can support benchmark protocol claims when the local note is full or source is directly cited. |
| `primary_product_page` | Can support "vendor claims X"; cannot support independent performance conclusions. |
| `archived_page` | Audit mirror for a product claim; not an independent source. |
| `independent_report` | Needed before a claim becomes independent reproduction. |
| `survey_mention` | Useful for discovery and prioritization, not score/ranking evidence. |

## D. Next Upgrade Queue

1. Upgrade LoCoMo from seed to full because it is the most product-used
   benchmark in current notes.
2. Upgrade BEAM source before using Mem0's 1M/10M claims in any decision.
3. Upgrade PersonaMem-v2 because TencentDB Agent Memory and Hy-Memory both cite
   PersonaMem-style claims.
4. Promote MemoryArena and MemBench if multi-agent conflict or write/manage
   evaluation becomes a kernel priority.
5. Add independent reproduction rows only when the source gives enough setup
   detail to distinguish reruns from marketing summaries.

## E. Maintenance Contract

- New benchmark protocol -> add or update `../benchmarks/<slug>.md`.
- New product score -> add a `vendor_claim` event, not a leaderboard row.
- New paper rerun -> add `uses_for_eval` or `baseline_comparison`.
- New third-party rerun -> add `independent_reproduction`.
- New methodological objection -> add `critique`.
- Any chart or "most used" statement must show `independence_class`.
