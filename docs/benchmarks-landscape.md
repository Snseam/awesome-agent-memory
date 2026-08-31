---
title: Benchmarks landscape — agent memory evaluation by capability and evidence
date: 2026-06-24
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
| shared-memory governance | [`GateMem`](../benchmarks/gatemem.md) | utility / access control / active forgetting | seed,6 月新增治理 benchmark |
| 结构化记忆组织 | [`StructMemEval`](../benchmarks/structmemeval.md) | structure selection / state tracking / task-specific organization | seed,FeishuLuo survey 查漏后新增;primary arXiv + working-paper repo |
| 百万 token 规模 | [`BEAM`](../benchmarks/beam.md) | 1M/10M 长尺度记忆退化 | candidate,目前主要来自 Mem0 自报 |
| memory evaluator | [`MemoryRewardBench`](../benchmarks/memoryrewardbench.md) | reward model judging for long-term memory management | candidate,评估 reward models 而非 end-agent memory |
| memory vs long-context economics | [`Fact-based memory vs long-context`](../benchmarks/fact-based-memory-vs-long-context.md) | cost / accuracy / break-even turns | candidate,meta-protocol/成本分析,不是独立新数据集 |
| 真实交互 / persona | RealMem / CloneMem / KnowMe-Bench / PersonaMem-v2 | real-world memory, identity continuity, companion personalization | candidate,先列入 backlog |
| agent 任务 / 多 agent | LoCoBench-Agent / MemoryArena / MemBench | coding agent, shared memory conflict, write/manage 评测 | candidate,需升级 source note |
| evolving profile memory | [`DynamicMem`](../benchmarks/dynamicmem.md) | 15-month multi-app histories / profile reconstruction / temporal update | seed,origin paper logged; protocol/results not normalized |
| auditable memory artifact | [`MEMPROBE`](../benchmarks/memprobe.md) | hidden user-state recovery from memory stores / full-store vs top-k probing | seed,origin paper logged; protocol/results not normalized |
| memory-induced sycophancy | [`MemSyco-Bench`](../benchmarks/memsyco-bench.md) | whether retrieved memory should influence factual reasoning, conflicts, updates, and personalization | seed,origin paper logged; results/resources not normalized |
| multimodal deletion leakage | [`MemLeak`](../benchmarks/memleak.md) | residual recovery after deletion via correlated text and retained images | seed,origin paper logged; image/data/setup not normalized |
| baseline-control methodology | [`MemDelta`](../benchmarks/memdelta.md) | component-controlled memory-vs-RAG/full-context evaluation and write-path cost discipline | seed,methodology event logged; not an end-agent leaderboard |
| persistent memory injection | [`InjecMEM`](../benchmarks/injecmem.md) | memory injection / poisoned retrieval / cross-session safety | seed,origin paper logged; protocol/results not normalized |
| context compaction | [`Compaction Cliff`](../benchmarks/compaction-cliff.md) | rule retention / artifact retrieval / downstream compliance after compaction | seed,origin paper logged; protocol/results not normalized |
| inherited-memory freshness | [`Stale Constraints`](../benchmarks/stale-constraints.md) | supersession detection / freshness verification / budgeted rechecking | seed,origin paper logged; protocol/results not normalized |
| natural conversational memory use | [`MemUse`](../benchmarks/memuse.md) | direct QA vs natural memory integration in responses | seed,origin paper logged; deployment/protocol not normalized |
| benchmark platform | [`Agent Memory Leaderboard`](../benchmarks/agent-memory-leaderboard.md) | public benchmark registry and submission hub | candidate,repository discovered; governance not normalized |

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
| GateMem | 1 | origin paper logged; metrics/results not yet normalized |
| StructMemEval | 1 | origin paper logged; protocol/results not yet normalized |
| MemoryRewardBench | 1 | origin paper logged; evaluator benchmark only |
| Fact-based memory vs long-context | 1 | source-paper cost analysis over existing benchmarks |
| PersonaMem-v2 | 2 | Hy-Memory + TencentDB Agent Memory self-claims |
| MemBench | 1 | survey mention |
| MemoryArena | 1 | survey mention |
| DynamicMem | 1 | origin paper logged; metrics/results not yet normalized |
| MEMPROBE | 1 | origin paper logged; metrics/results not yet normalized |
| MemSyco-Bench | 1 | origin paper logged; memory-induced sycophancy protocol not yet normalized |
| MemLeak | 1 | origin paper logged; multimodal deletion-leakage protocol not yet normalized |
| MemDelta | 1 | methodology event logged; use for claims discipline, not direct benchmark ranking |
| InjecMEM | 1 | origin paper logged; persistent memory-injection threat model not yet normalized |
| Compaction Cliff | 1 | origin paper logged; compaction/rule-retention protocol not yet normalized |
| Stale Constraints | 1 | origin paper logged; inherited-memory freshness protocol not yet normalized |
| MemUse | 1 | origin paper logged; natural memory integration benchmark not yet normalized |
| Agent Memory Leaderboard | 1 | platform/repository discovery logged; governance and protocol not yet normalized |

### B2. Evaluation uses / baseline comparisons

| Benchmark | Eval-use events | Evidence class |
|---|---:|---|
| LoCoMo | 1 | Mem0 paper affiliated evaluation; useful for paper analysis, not independent reproduction |
| ConvoMem | 1 | Origin paper baseline comparison against Mem0-style RAG; useful for protocol/crossover analysis |
| Fact-based memory vs long-context | 1 | Source-paper comparison of fact-based memory against long-context inference; useful for cost/accuracy trade-off analysis, not independent reproduction |

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
| DynamicMem | 0 | Origin protocol only |
| MEMPROBE | 0 | Origin protocol only |

### B7. Independent or methodological pressure

| Benchmark | Pressure source | Interpretation |
|---|---|---|
| LongMemEval | ConvoMem critique | sample-size and filler-source critique, not a rerun |
| LoCoMo | ConvoMem critique | small-conversation-count critique, not a rerun |
| ConvoMem | own baseline comparison | strong protocol for cost/accuracy crossover, but synthetic data and Mem0-only RAG baseline caveat |
| Compaction Cliff | origin benchmark | stresses whether context compression preserves rules and artifacts, not a third-party rerun |
| Stale Constraints | origin benchmark | stresses verification of inherited memories after constraints change, not a third-party rerun |
| MemUse | origin benchmark | stresses natural conversational memory integration beyond direct QA, not a third-party rerun |

## B8. 2026-08 Current-Source Intake

The 2026-08-31 refresh adds five benchmark-layer signals. They are all seed or
candidate records; no leaderboard scores or paper-reported numbers are promoted.

| Decision | Candidate | Handling | Caveat |
|---|---|---|---|
| add | [`InjecMEM`](../benchmarks/injecmem.md) | Memory-injection security benchmark. | Full attack variants, defenses, and released resources still need normalization. |
| add | [`Compaction Cliff`](../benchmarks/compaction-cliff.md) | Context compaction / rule-retention benchmark. | AgentArtifactCorpus and Knowledge Triage setup need full read. |
| add | [`Stale Constraints`](../benchmarks/stale-constraints.md) | Inherited-memory freshness / supersession benchmark. | Zenodo artifact and verification-budget details not yet mapped. |
| add | [`MemUse`](../benchmarks/memuse.md) | Conversational natural-integration benchmark. | Deployment design, released data, and judge setup need extraction. |
| watchlist | [`Agent Memory Leaderboard`](../benchmarks/agent-memory-leaderboard.md) | Public benchmark-platform candidate. | GitHub activity is discovery evidence; rankings are not used. |

## C. What Counts As Evidence

| Evidence class | Use in this repo |
|---|---|
| `primary_pdf` | Can support benchmark protocol claims when the local note is full or source is directly cited. |
| `primary_product_page` | Can support "vendor claims X"; cannot support independent performance conclusions. |
| `archived_page` | Audit mirror for a product claim; not an independent source. |
| `independent_report` | Needed before a claim becomes independent reproduction. |
| `survey_mention` | Useful for discovery and prioritization, not score/ranking evidence. |

## D. FeishuLuo Survey Intake (2026-06-24)

The [FeishuLuo companion list](https://github.com/FeishuLuo/Evolving-LLM-Agent-Memory-Survey)
for **From Storage to Experience** is useful as a discovery source, but it is not
primary evidence. This intake keeps source classes explicit before any row
enters the catalog.

| Decision | Candidate | Handling | Caveat |
|---|---|---|---|
| add | [`StructMemEval`](../benchmarks/structmemeval.md) | Core structured-memory benchmark candidate. | Primary source is arXiv 2602.11243; supplementary repo calls it a working paper. |
| add | [`MemoryRewardBench`](../benchmarks/memoryrewardbench.md) | Evaluator benchmark for memory-management reward models. | Not direct end-agent memory quality. |
| add | [`Fact-based memory vs long-context`](../benchmarks/fact-based-memory-vs-long-context.md) | Meta-protocol for cost/accuracy comparison against long-context inference. | Not a standalone new dataset; pricing assumptions drift. |
| adjacent | HELMET(arXiv 2410.02694) | Keep out of core catalog unless a memory paper/product uses it as a baseline. | General long-context benchmark. |
| watchlist | arXiv 2510.17132 | Track only under the primary title, "Do LLMs Recognize Your Latent Preferences?" | Feishu row title is mismatched; do not import as "LLM Self-Awareness via Internal Circuits." |
| reject label | "LLM Self-Awareness via Internal Circuits" / 2510.17132 | Reject the title/link pairing as-is. | Likely intended self-awareness paper is a different arXiv ID. |

## E. Next Upgrade Queue

1. Upgrade StructMemEval because it is the most direct new benchmark for memory
   structure selection and organization.
2. Upgrade LoCoMo from seed to full because it is the most product-used
   benchmark in current notes.
3. Upgrade BEAM source before using Mem0's 1M/10M claims in any decision.
4. Upgrade PersonaMem-v2 because TencentDB Agent Memory and Hy-Memory both cite
   PersonaMem-style claims.
5. Upgrade MemoryRewardBench only when reward-model judging becomes an evaluator
   priority.
6. Promote MemoryArena and MemBench if multi-agent conflict or write/manage
   evaluation becomes a kernel priority.
7. Upgrade DynamicMem if evolving user-profile memory becomes a product or kernel
   evaluation priority.
8. Upgrade MEMPROBE if auditable memory artifact quality or over-retention
   becomes a kernel evaluation priority.
9. Upgrade GateMem if shared-memory governance or enterprise scoped recall becomes
   a kernel priority.
10. Upgrade InjecMEM, Compaction Cliff, Stale Constraints, and MemUse if
   memory-security, compaction, freshness, or conversational-integration gates
   become evaluation priorities.
11. Add independent reproduction rows only when the source gives enough setup
   detail to distinguish reruns from marketing summaries.

## F. Maintenance Contract

- New benchmark protocol -> add or update `../benchmarks/<slug>.md`.
- New product score -> add a `vendor_claim` event, not a leaderboard row.
- New paper rerun -> add `uses_for_eval` or `baseline_comparison`.
- New third-party rerun -> add `independent_reproduction`.
- New methodological objection -> add `critique`.
- Any chart or "most used" statement must show `independence_class`.
