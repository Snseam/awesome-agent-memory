---
title: Agent-memory cost-savings landscape
date: 2026-06-30
status: seed
language: zh-CN
---

# Agent-memory cost-savings landscape

本页是 agent memory 的成本专题入口,专门跟踪能减少 token、在线 LLM 调用、
延迟、存储/图构建成本或人工维护成本的论文、算法、代码实现和产品实践。

这个板块不做排行榜。它只回答三个问题:

1. 哪些 memory 设计声称或证明能省成本?
2. 省的是哪一种成本,代价是什么?
3. 当前仓库里应该把它当成强证据、候选线索,还是 vendor self-claim?

## Reading rules

| Rule | Why |
|---|---|
| 把 `token reduction`、`API cost`、`latency`、`compute`、`storage/indexing cost` 分开记录 | 同样叫省成本,可能发生在完全不同路径。 |
| 区分 paper evaluation、affiliated evaluation、vendor self-report、independent reproduction | 产品自报可以作为实践信号,不能当独立结论。 |
| 每个成本 claim 都要同时看质量指标 | 省 token 但丢 recall、temporal reasoning 或 provenance,不是可直接采用的设计。 |
| API/pricing 相关结论必须带日期 | 模型价格、prompt caching、context-window 价格和输入/输出倍率会变。 |
| 进入 ImpactReport 前优先升级本页的 stub-only 条目 | stub 只证明发现覆盖,不能支撑架构决策。 |

## Cost levers

| Lever | Saves | Representative evidence | Implementation shape | Main caveat |
|---|---|---|---|---|
| Full-history replacement | 输入 token、API cost、长上下文延迟 | [`Mem0 paper`](../papers/mem0-paper.md), [`Fact-based memory vs long-context`](../benchmarks/fact-based-memory-vs-long-context.md), [`ConvoMem`](../benchmarks/convomem.md) | 抽取 facts / user profile / task state,检索后只装配相关片段 | full-context 在部分 recall 任务仍可能更准;break-even 依赖价格和轮数。 |
| Structured distillation | 长期 profile token、重复事实、上下文膨胀 | [`Structured Distillation`](../papers/stubs/structured-distillation-for-personalized-agent-memory-11.md), DimMem external candidate, TencentDB L0-L3 分层 | 把长交互压成 structured memory,再按 scope/context 召回 | 容易丢 provenance、冲突和少数长尾事实;需要审计轨迹。 |
| Budgeted retrieval / tier routing | 每次 query 的检索、rerank、LLM reasoning 成本 | [`BudgetMem`](../papers/stubs/budgetmem-learning-query-aware-budget-tier-routing-for.md), [`A2RAG`](../papers/stubs/a2rag-adaptive-agentic-graph-retrieval-for-cost-aware-and.md), [`LightMem`](../papers/lightmem-agent-memory.md) | 轻量 tier 先答简单查询,困难查询再升级到 graph / agentic retrieval / larger model | router 训练、难例识别和 fallback 失败会把质量风险藏起来。 |
| Offline / SLM consolidation | 热路径大模型调用、在线延迟 | [`LightMem`](../papers/lightmem-agent-memory.md), [`Agent Memory systems`](../papers/agent-memory-systems-characterization.md) | 用 small language model 或离线 worker 做写入、整理、consolidation | freshness、错误累积和小模型质量要被持续测量。 |
| Phase-aware systems profiling | 选型时的隐藏成本 | [`Agent Memory systems`](../papers/agent-memory-systems-characterization.md), [`MEMAUDIT`](../papers/stubs/memaudit-an-exact-package-oracle-evaluation-protocol-for.md) | 把 construction / retrieval / generation / write budget 分账 | 画像必须用真实 query volume、更新频率和 tenant pattern 重跑。 |
| Productized context offloading | coding-agent 长任务上下文、人工整理成本 | [`OpenViking`](../products/openviking.md), [`TencentDB Agent Memory`](../products/tencentdb-agent-memory.md), [`Mem0`](../products/mem0.md), Searchat external implementation | context DB、memory API server、分层 artifact、agent/tool 接入 | 大多是产品或关联方数字,要继续标注为 vendor self-report。 |

## Evidence inventory

### Promotion gates

本页中的候选项只有通过下面 gate 后,才能进入 ImpactReport 或架构实验:

| Gate | Required evidence before promotion |
|---|---|
| Paper gate | local note 从 `stub` 升级到 `seed` 或 `full`,并记录 source date、method summary、benchmark setup、limitations。 |
| Code gate | canonical repo 可访问,license 明确,核心实现路径可定位,不是只停留在 README claim。 |
| Metric gate | 同时记录 cost metric 和 quality metric;只给 token reduction、不给 recall/task success 的条目不能作为采用理由。 |
| Reproduction gate | 明确 `affiliated_eval`、`vendor_self_report` 或 `independent_reproduction`;没有第三方设置时不得写成独立结论。 |
| Pricing gate | 涉及 API cost / break-even 的条目必须写明模型、价格日期、prompt caching/context-window 假设。 |

未通过 gate 的条目只能用于 discovery、watchlist 或实验候选,不能直接支持
`adopt_as_plugin`、`consider_core_change` 或产品排名。

### Stronger local anchors

| Item | Current repo status | Cost-saving relevance | Evidence boundary |
|---|---|---|---|
| [`Mem0 paper`](../papers/mem0-paper.md) | full note | 把 full-context 26k token / conversation 对照 Mem0 1.7k、Mem0g 3.6k;论文声称 p95 latency 和 token cost 明显低于 full-context。 | 论文来自 Mem0 作者,是 affiliated evidence;LOCOMO 样本小。 |
| [`Fact-based memory vs long-context`](../benchmarks/fact-based-memory-vs-long-context.md) | candidate benchmark note | 直接比较 fact-based memory 和 long-context inference 的 accuracy、cumulative API cost、break-even turns。 | stub-quality source note;pricing assumptions time-sensitive。 |
| [`ConvoMem`](../benchmarks/convomem.md) | full benchmark note | 提供 1k-3M token 可调 context 下的 accuracy/cost/latency crossover 视角。 | synthetic data;不要把"前 150 个 conversations 不需要 RAG"泛化到所有产品。 |
| [`LightMem agent memory`](../papers/lightmem-agent-memory.md) | seed paper note | 用 SLM 负责 retrieval、writing、offline consolidation,强调 bounded online cost 和低延迟路径。 | seed 质量;需补 PDF/code/license 细读。 |
| [`Agent Memory systems characterization`](../papers/agent-memory-systems-characterization.md) | seed paper note | 把 memory construction、retrieval、generation 作为系统成本画像对象。 | seed 质量;尚未复核 profiling harness 细节。 |

### 2026-08 current-source additions

| Item | Current repo status | Cost-saving relevance | Evidence boundary |
|---|---|---|---|
| [`ContextPilot`](../papers/contextpilot-proactive-context-management.md) | seed paper note | Proactive context management combines planning, long-term memory, and soft offloading for long-horizon tasks. | seed quality;reported gains and code path need full read. |
| [`EARM`](../papers/earm-experience-amortized-reranking.md) | seed paper note | Reuses query-memory relevance scores through matrix completion to reduce repeated LLM reranking. | seed quality;cost/quality trade-off and cache invalidation need extraction. |
| [`KOPE`](../papers/kope-experience-graph-memory.md) | seed paper note | Experience graph memory for kernel optimization claims lower search effort and better reuse of past optimization attempts. | seed quality;domain-specific and not direct conversational memory evidence. |
| [`CaSKG`](../papers/caskg-skill-graph-retrieval.md) | seed paper note | Skill-graph retrieval can constrain multi-agent communication/search overhead. | seed quality;skill graph construction cost and task coverage need full read. |
| [`GraphMemix`](../papers/graphmemix-evidence-forests.md) | seed paper note | Evidence forests suggest a bounded graph-memory alternative for retrieval and reasoning over multimodal evidence. | seed quality;claims remain paper-origin until normalized. |

### Candidate papers and code paths to upgrade

| Item | Local anchor | External source checked 2026-06-30 | Why it belongs here | Upgrade path |
|---|---|---|---|---|
| BudgetMem | [`stub`](../papers/stubs/budgetmem-learning-query-aware-budget-tier-routing-for.md) | <https://arxiv.org/abs/2602.06025> and <https://github.com/ViktorAxelsen/BudgetMem> | query-aware budget-tier routing:按查询难度选择不同 memory processing tier。 | 升级为 full note;记录 code license、router training、LoCoMo/LongMemEval/HotpotQA 设置。 |
| Structured Distillation for Personalized Agent Memory | [`stub`](../papers/stubs/structured-distillation-for-personalized-agent-memory-11.md) | <https://arxiv.org/abs/2603.13017> and <https://github.com/Process-Point-Technologies-Corporation/searchat> | 论文声称 11x token reduction with retrieval preservation,并有 Searchat 代码实现。 | 复核 compression ratio、MRR 设置、是否保存 provenance/conflict。 |
| MEMAUDIT | [`stub`](../papers/stubs/memaudit-an-exact-package-oracle-evaluation-protocol-for.md) | <https://arxiv.org/abs/2605.02199> | budgeted long-term memory writing 的 evaluator,可约束"省空间但不乱写"。 | 升级 benchmark/evaluator note;明确 package oracle 和 storage budget。 |
| A2RAG | [`stub`](../papers/stubs/a2rag-adaptive-agentic-graph-retrieval-for-cost-aware-and.md) | <https://arxiv.org/abs/2601.21162> | cost-aware adaptive Graph-RAG,只在需要时触发更贵的 graph/verification 路径。 | 判断是否属于 agent memory core 还是 Graph-RAG 相邻方法。 |
| DimMem | external candidate | <https://arxiv.org/abs/2605.15759>, <https://github.com/ChowRunFa/DimMem> | dimensional structuring + Qwen3-4B extractor,报告 LoCoMo per-query token cost reduction。 | 新建 paper stub/full note 前要避开旧 radar 中错误 DimMem arXiv ID。 |
| LIGHTMEM: Lightweight and Efficient Memory-Augmented Generation | [`stub`](../papers/stubs/lightmem-lightweight-and-efficient-memory-augmented.md) | <https://arxiv.org/abs/2510.18866> | adjacent memory-augmented generation cost method,不是同名 ACL 2026 LightMem。 | 如纳入,必须 disambiguate name collision。 |

### Product and practice signals

| Product / implementation | Local anchor | Cost-saving mechanism | Evidence boundary |
|---|---|---|---|
| Mem0 | [`product note`](../products/mem0.md), [`paper note`](../papers/mem0-paper.md) | ADD/UPDATE/DELETE/NOOP memory ops,scope filtering,只把检索到的 memory 放回 prompt。 | 产品和论文都与 vendor 相关;claims ledger 仍按 affiliated/vendor 读。 |
| TencentDB Agent Memory | [`product note`](../products/tencentdb-agent-memory.md) | L0 Conversation / L1 Atom / L2 Scenario / L3 Persona + short-term context offloading。 | token reduction 和 PersonaMem claim 是官方自测。 |
| OpenViking | [`product note`](../products/openviking.md) | L0/L1/L2 hierarchical context loading,filesystem-style context DB,减少长期任务直接塞 full context。 | benchmark/token 数字按 vendor-claimed 处理;它是 context database,不只是 memory layer。 |
| Searchat | external implementation | structured persistent memory + retrieval-preserving distillation implementation. | 当前仓库没有 product note;先作为 code path,不是产品结论。 |

## Code / implementation index

| Code path | Source | What to inspect for cost-saving practice | Local status |
|---|---|---|---|
| BudgetMem | <https://github.com/ViktorAxelsen/BudgetMem> | module budget tiers、RL router、LoCoMo/LongMemEval/HotpotQA data prep、cost-aware objective。 | local paper stub only。 |
| Searchat | <https://github.com/Process-Point-Technologies-Corporation/searchat> | structured persistent memory pipeline、distillation/retrieval preservation、release maturity。 | external only。 |
| DimMem | <https://github.com/ChowRunFa/DimMem> | Qwen3-4B extractor、dimension schema、reported LoCoMo token reduction setup。 | external only;needs new local note。 |
| Mem0 | <https://github.com/mem0ai/mem0> | ADD/UPDATE/DELETE/NOOP memory ops、scope filtering、host SDK API、graph optional path。 | local product + full paper note。 |
| TencentDB Agent Memory | <https://github.com/TencentCloud/TencentDB-Agent-Memory> | L0-L3 artifact pipeline、context offloading、local SQLite/sqlite-vec path。 | local product note。 |
| OpenViking | <https://github.com/volcengine/OpenViking> | L0/L1/L2 context loading、filesystem-style context DB、MCP/OpenClaw integration。 | local product note。 |

## Method checklist for a cost-saving memory experiment

1. 定义成本维度:input tokens、output tokens、LLM calls、retrieval calls、p95 latency、
   storage/indexing、human review time 至少选一个主指标。
2. 建 full-context baseline,并记录当前模型价格和 prompt caching 状态。
3. 同时跑质量指标:recall、temporal reasoning、multi-hop、preference consistency、
   abstention 或 task success。
4. 给 memory 写路径分账:extract、dedup、merge/update、delete/forget、offline
   consolidation、index refresh。
5. 给读路径分账:embedding、candidate retrieval、rerank、graph traversal、context
   packing、final generation。
6. 对 vendor claim 使用 `vendor_self_report` / `self_claim` 语言,不要写成 independent
   reproduction。
7. 若方法牺牲 provenance、valid time、delete/export 或 human review,必须把治理成本写进
   caveat。

## ImpactReport use policy

| Evidence status | Allowed use |
|---|---|
| full local note + ledger row where needed | 可进入 ImpactReport evidence;仍需列出 cost / quality / risk 三类指标。 |
| seed local note | 可提出 `monitor` 或 `prototype` 建议;不可单独支持 core change。 |
| stub-only paper | 只能列为 discovery gap 或 upgrade candidate。 |
| external-only code path | 只能列为 implementation path to inspect;不能当成本效果证据。 |
| vendor self-report | 只能写成 vendor claim;除非有独立复现,不得和 paper/independent rows 合并。 |

## Current gaps

| Gap | Why it matters |
|---|---|
| BudgetMem、Structured Distillation、MEMAUDIT、A2RAG 仍是 stub-only | 它们是最像"成本专题"的论文,但还不能直接用于 ImpactReport。 |
| DimMem 尚无本地 note | 外部 source 看起来相关,但需要先加入纸面证据和正确 arXiv ID。 |
| 产品 claims 没有独立复现 | Mem0、TencentDB、OpenViking 都适合做实践样本,但不能直接排名。 |
| API-pricing drift | cost break-even 需要随模型价格、缓存、context window 和输入/输出倍率重算。 |

## Next refresh queries

- `agent memory cost token reduction`
- `agent memory budgeted retrieval`
- `runtime agent memory budget routing`
- `long context vs memory API cost`
- `structured distillation personalized agent memory`
- `context database AI agents token cost`
