---
title: 2026-09-07 Memory Radar refresh
date: 2026-09-07
status: current-source-refresh
language: zh-CN
---

# 2026-09-07 Memory Radar refresh

本页记录 2026-09-07 的 weekly radar refresh。主 agent 从最新 `origin/main`
创建 `codex/weekly-memory-radar-2026-09-07`。由于 PR #16-#20 和 #22 仍未合入,
本轮避免重复收录这些 open weekly PR 已覆盖的 July/August 条目,只把 9 月新 primary
source 和少量产品官方更新落地。

所有 GitHub/list/catalog 信号只作为 discovery;最终收录只依赖 primary
paper/product sources。

## 执行模型

| Lane | 角色 | 输出 |
|---|---|---|
| papers/conferences | `researcher` + main agent | arXiv / OpenReview / conference 候选与 duplicate 风险 |
| products/platforms | `researcher` + main agent | 官方产品文档、release notes、changelog |
| GitHub/benchmarks | `researcher` | repo/list/dataset discovery signals only |
| repo-map | main agent | counts、landing files、现有条目和别名风险 |
| source/relevance review | main agent + later reviewer | must-add / update-existing / watchlist / adjacent / reject |

## Must-add / update-existing

### Papers and benchmarks

| Action | Item | Why it matters | Local anchor |
|---|---|---|---|
| must-add | Agent Memory Authorization Laundering | 把 persistent memory 明确作为 authorization policy surface,要求 permission / revocation 有 source-backed transition record | [`../papers/agent-memory-authorization-laundering.md`](../papers/agent-memory-authorization-laundering.md) |
| must-add | EAL-Bench | 衡量记忆写入错误是否导致 downstream unauthorized action,补足 action-grounded memory governance benchmark | [`../benchmarks/eal-bench.md`](../benchmarks/eal-bench.md) |
| must-add | Agent Zero Memory | 把 memory-gated exploration 和 compiler-friendly traces 做成 agent 自适应优化路径,适合作为 code-agent memory 参考 | [`../papers/agent-zero-memory.md`](../papers/agent-zero-memory.md) |
| must-add | Prospective Memory SLM-Shaped / PIS | 把 deferred intention 作为 typed lifecycle state tracking,提示 memory 不只是 retrospective facts | [`../papers/prospective-memory-slm-shaped.md`](../papers/prospective-memory-slm-shaped.md) |
| must-add | CAPTURE | 把 preference drift、temporary context shift、ambiguity、memory poisoning 区分开,补 personalization-security tradeoff | [`../papers/capture-preference-drift-memory-poisoning.md`](../papers/capture-preference-drift-memory-poisoning.md) |
| must-add | SkillGLoW | 把 textual skill memory 从 single document / flat pool 推进到 procedural-family consolidation 和 commit gate | [`../papers/skillglow-procedural-family-skill-consolidation.md`](../papers/skillglow-procedural-family-skill-consolidation.md) |
| must-add | MemoryLACE | lifecycle-aware memory maintenance,把 update/delete/retrieve 的 record lifecycle 变成核心方法面 | [`../papers/memorylace-lifecycle-aware-consolidation.md`](../papers/memorylace-lifecycle-aware-consolidation.md) |
| must-add | RuleMem | active rule memory 把规约/偏好从 passive recall 推向在线规则发现与更新 | [`../papers/rulemem-active-rule-memory.md`](../papers/rulemem-active-rule-memory.md) |
| must-add | Compact-Memory | 面向 2k-5k prompt budget 的 online clustering + atom-aware packing,进入 cost-savings lane | [`../papers/compact-memory-llm-agents.md`](../papers/compact-memory-llm-agents.md) |
| must-add | Forgetting Without Restarting | execution-state unlearning 明确把 session memory、tool traces、planner state 纳入遗忘边界 | [`../papers/execution-state-unlearning.md`](../papers/execution-state-unlearning.md) |
| must-add | UTILMEM | 检验 agent 是否真正利用 memory evidence,而不只是检索到相关片段 | [`../benchmarks/utilmem.md`](../benchmarks/utilmem.md) |
| must-add | ICM-Bench | 把 persona/identity memory 推进到 multimodal long-video recurring identity setting | [`../benchmarks/icm-bench.md`](../benchmarks/icm-bench.md) |

### Products

| Action | Product | Why it matters | Local anchor |
|---|---|---|---|
| update-existing | AWS Bedrock AgentCore Memory | 2026-08/09 release notes 增加 direct long-term-memory ingestion、flexible namespaces、JSON payloads 和 GovCloud availability | [`../products/aws-agentcore-memory.md`](../products/aws-agentcore-memory.md) |
| update-existing | Alibaba Bailian Memory Library | 长期记忆(新) API 进入商业化计费,并公开 Pro/Lite 检索、metadata、CRUD、去重与用户画像 schema | [`../products/alibaba-bailian-memory.md`](../products/alibaba-bailian-memory.md) |
| update-existing | Graphiti | `v0.30.1` / `mcp-v1.1.0` 修复 Neo4j custom database routing/search,影响 self-hosted temporal KG memory 的 tenant correctness | [`../products/graphiti.md`](../products/graphiti.md) |

## Watchlist / adjacent / reject

| Decision | Item | Reason |
|---|---|---|
| watchlist | HitMem | embodied 3D scene memory and stale representation handling are relevant, but the source is robotics/3D memory rather than general LLM-agent memory |
| watchlist | ECCBench | useful efficiency/compression/calibration framing for VLM memory, but not yet an agent-memory benchmark in this repo's core sense |
| watchlist | Fresh Memory, Stale Plans / Invalidation Contracts / Memory Trust Gap | strong memory-safety framing, but needs full source read before promoting into paper notes |
| watchlist | MutMem-V2 / Indirect Poisoning / Stage-Wise Utility-Risk | useful poisoning/governance pressure; keep for security-lane upgrade instead of this bounded radar |
| watchlist | LOCOMO-CONV / AMB / AML | relevant benchmark-platform discovery, but overlaps open August PR coverage and needs de-dup normalization |
| watchlist | OWASP Agent Memory Guard / Mnemosyne / Exocortex / inite / ZenBrain | GitHub/product discovery only; no primary product or paper note promoted this run |
| watchlist | Cloudflare Think harness | interesting platform harness signal; still overlaps Cloudflare Agent Memory and is not a separate memory product note |
| watchlist | PM-Bench follow-up | PIS depends on PM-Bench, but PM-Bench normalization is already covered by an open August weekly PR, so this branch does not duplicate the benchmark catalog row |
| update-deferred | Claude / TencentDB Agent Memory / Mem0 / Google / Microsoft / OpenAI / Redis / Letta | Either already covered by open PRs or no stronger current primary-source delta was verified for this branch |
| adjacent | RLEA vehicle-routing agent memory | domain-specific optimization-agent memory module; useful signal but not first-class long-term memory evidence |
| reject as performance evidence | arXiv abstracts, vendor blogs, GitHub stars, and README benchmark numbers | 可作为 discovery 或 author/vendor evidence,不能写成 independent reproduction |

## Evidence gaps / next verification

| Item | Gap | Why not blocking |
|---|---|---|
| September paper notes | 尚未 full read PDF、code/data/license、leaderboard 和 exact setup | 本轮只登记 seed note / benchmark-origin event,不登记 normalized scores |
| EAL-Bench | task construction、labels、released resources 和 safeguards setup 未 full read | benchmark catalog 只记录 origin protocol 和 action-safety pressure |
| AWS / Alibaba / Graphiti product updates | 官方文档和 upstream release 支持 product behavior only | 未写任何 independent benchmark 或 superiority claim |
| Open PR overlap | PR #16-#20 和 #22 仍未合入,其中 #19/#20/#22 已覆盖大量 August paper/benchmark/product 项 | 本轮使用独立 `2026-09-07` radar 文件并避免 duplicate rows |

## Trend synthesis

- **Authorization is now a memory-layer concern**:EAL-Bench 把 permission、restriction、
  revocation 的 memory fidelity 直接连到 downstream action safety。
- **Prospective memory is separating from retrospective recall**:PIS 把 deferred
  intention 管成 typed lifecycle store,为 reminders/tasks/commitments 类 agent
  memory 提供独立评估方向。
- **Personalization security is moving beyond provenance-only rules**:CAPTURE
  强调 preference drift 与 poisoning 的不确定性和澄清策略。
- **Procedural memory needs admission gates**:SkillGLoW 的 family consolidation
  把 skill memory 从"越积越多"推进到 transfer + non-degradation gate。
- **Cost-aware context packing remains a live method lane**:Compact-Memory 把
  atom-aware packing 和 online clustering 放到 tight prompt budget 下评估。
- **Multimodal identity memory is becoming benchmarkable**:ICM-Bench 把 recurring
  identity、跨时间关系和 multimodal evidence binding 放到同一评测面。
- **Managed memory products are expanding governance surfaces**:AWS namespaces /
  GovCloud、Alibaba Pro/Lite memory API 和 Graphiti database routing fix 都说明平台
  memory 正从功能展示走向 scope、pricing、tenant isolation、CRUD 和 operator workflow。

## Review notes

- 收录项均要求 primary source:论文用 arXiv,产品用官方 docs / release notes / how-to。
- GitHub stars、README 性能数字、MCP catalog 和 awesome-list placement 只作 discovery。
- Author-reported benchmark results are paper-origin claims;vendor numbers are vendor claims。
- 本轮 benchmark catalog 从 21 行增至 24 行;paper seed notes 从 15 增至 24;product
  note count 不变。
