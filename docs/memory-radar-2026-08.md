---
title: 2026-08 Memory Radar refresh
date: 2026-08-03
status: current-source-refresh
language: zh-CN
---

# 2026-08 Memory Radar refresh

本页记录 2026-08-03 的 weekly radar refresh。主 agent 从最新 `origin/main`
创建 `codex/weekly-memory-radar-2026-08-03`,并用 paper/product/GitHub discovery
子 agent 做候选检索。所有 GitHub/list/catalog 信号只作为 discovery;最终收录只依赖
primary paper/product sources。

注意:2026-07-27 周更 PR `#18` 仍未合并到 `origin/main`,其中 Databricks Managed
Agent Memory、Memora 和多条 7 月论文 seed 已在开 PR 中。本轮不重复这些 PR `#18`
条目,只记录相对当前 `origin/main` 的新候选和官方产品行为更新。

## 执行模型

| Lane | 角色 | 输出 |
|---|---|---|
| papers/conferences | `researcher` + main agent | arXiv primary paper 候选与 duplicate 风险 |
| products/platforms | `researcher` | 官方产品文档、release notes、changelog |
| GitHub/benchmarks | `researcher` | repo/list/dataset discovery signals only |
| repo-map | `explore` | counts、landing files、现有条目和别名风险 |
| source/relevance review | main agent + later reviewer | must-add / update-existing / watchlist / adjacent / reject |

## Must-add / update-existing

### Papers and benchmarks

| Action | Item | Why it matters | Local anchor |
|---|---|---|---|
| must-add | Zero-Mem | 把 memory write/read path 的 LLM 调用成本单独提出,要求评估 memory operations 的 token/latency 开销 | [`../papers/zero-mem-zero-token-memory-operations.md`](../papers/zero-mem-zero-token-memory-operations.md) |
| must-add | Memory Provenance Laundering | 说明 consolidation 可能把低可信 observation 洗成高可信 user/workflow history,补 source-authority 生命周期维度 | [`../papers/memory-provenance-laundering.md`](../papers/memory-provenance-laundering.md) |
| must-add | MemHarness | 从 replay 走向 reconstructed memory,要求检索结果匹配当前 decision state 而不是只看语义相似度 | [`../papers/memharness-memory-reconstructed-not-replayed.md`](../papers/memharness-memory-reconstructed-not-replayed.md) |
| must-add | Filesystem-Based Memory | 把 Markdown/file-tree memory 作为真实 agent substrate,强调组织漂移、冲突、过期和可持续性 | [`../papers/filesystem-based-memory-llm-agents.md`](../papers/filesystem-based-memory-llm-agents.md) |
| must-add | MemSecBench | 追踪 memory poisoning 从持久化到后续 action consequence 再到 selective repair | [`../benchmarks/memsecbench.md`](../benchmarks/memsecbench.md) |
| must-add | Setoka | 个性化 agent 评测从显式事实召回扩展到异构数据上的层级用户理解 | [`../benchmarks/setoka.md`](../benchmarks/setoka.md) |

### Products

| Action | Product | Why it matters | Local anchor |
|---|---|---|---|
| update-existing | Google Agent Platform Memory Bank | 官方 setup docs 继续把 topics、TTL、自定义配置和 Agent Runtime read/write 集成作为 Memory Bank 使用面;仍只支持 product behavior claim | [`../products/google-memory-bank.md`](../products/google-memory-bank.md) |
| update-existing | Mem0 | 官方 changelog 出现 n8n / Zapier integration,说明 workflow automation memory 接入面扩大;不是架构或 benchmark 结论 | [`../products/mem0.md`](../products/mem0.md) |
| update-existing | Zep | 官方 changelog 给 graph node/edge valid-time 排序、opaque page token 和 `is_null` date filter,加强 temporal graph query control | [`../products/zep.md`](../products/zep.md) |
| update-existing | AWS AgentCore Memory | Bedrock Agents Classic maintenance-mode docs 与 AgentCore release notes 继续把 AgentCore memory 作为迁移/新建 agent runtime 能力面 | [`../products/aws-agentcore-memory.md`](../products/aws-agentcore-memory.md) |
| update-existing / watchlist | TencentDB Agent Memory | v2 beta/team memory 信号相关,但主 release 在 2026-07-21/22;本轮只记录为 watch/update signal,不升级性能 claims | [`../products/tencentdb-agent-memory.md`](../products/tencentdb-agent-memory.md) |
| update-existing | Hindsight | official `v0.8.6` release 增加 `list_memory_units` ingest-age filtering,作为 API surface / lifecycle 查询信号 | [`../products/hindsight.md`](../products/hindsight.md) |

## Watchlist / adjacent / reject

| Decision | Item | Reason |
|---|---|---|
| watchlist | MemTX / MemTxn / ChronoMem | transactional commit、source-supported updates、semantic rollback 与 memory governance 强相关,但本轮避免一次性扩大 seed 数;下轮优先精读 |
| watchlist | MemLens / MemChain / Know It, Act on It / Beyond Retrieval Analytic Memory | 都是强候选,分别覆盖 interactive analytics、interpretable traces、preference utilization、multimodal analytic memory;先记录,等待 full source read |
| watchlist | Databricks Managed Agent Memory / Memora | 已在未合并 PR `#18` 中覆盖,本轮不重复写入当前分支 |
| watchlist | OWASP Agent Memory Guard / Mnemoverse MCP Memory / AMBIENT | GitHub/API/catalog discovery 相关,且 OWASP/Mnemoverse 有 primary follow-up;本轮未完成 product note 或 benchmark note source read |
| watchlist | Letta Memory Filesystem | 官方 changelog 页缺少可核验日期;功能相关但不按本周窗口升级 |
| watchlist | inspeximus / ai-memory-mcp / memgres / sqlite-graph-memory | GitHub-only 或 vendor/self-claimed benchmark 信号;先保留 discovery,不升级为产品/benchmark 证据 |
| adjacent | Microsoft Foundry Local Agentic Retrieval | 2026-07 release note 说 agentic memory management for long conversations,但与既有 Foundry Agent Service Memory surface 边界不清 |
| adjacent | HAM-VLN / TransMem / hidden-state memory items | 与 memory 有关,但偏 embodied navigation、hidden-state/context compression 或模型内部记忆,不是本轮 core agent-memory evidence |
| reject as performance evidence | GitHub stars, README benchmark numbers, vendor benchmark rows, catalog placement | 只能用于 discovery 或 vendor/product behavior,不能支持性能/质量结论 |
| source mismatch | no new mismatched canonical URL promoted | 本轮收录条目均使用直接 arXiv 或官方产品 URL;未把 search snippet 日期当作 source fact |

## Evidence gaps / next verification

| Item | Gap | Why not blocking |
|---|---|---|
| Zero-Mem / provenance laundering / MemHarness / filesystem memory | 尚未 full read PDF、code/data/license 和 exact setup | 本轮只登记 seed note,不登记 score claim |
| MemSecBench / Setoka | benchmark task construction、metrics、data provenance 和 reported result 未完整归一化 | claims ledger 只记录 origin protocol event |
| Product updates | official docs/changelog support product behavior only | 未写任何 independent benchmark、quality 或 superiority claim |
| PR `#18` overlap | open July 27 PR 未合并 | 本轮显式排除重复条目,避免 current-main 分支冲突扩大 |

## Trend synthesis

- **Memory governance is moving into transaction/provenance territory**:provenance
  laundering、MemSecBench、MemTX/MemTxn/ChronoMem watchlist 都把 memory 从"召回"
  推向 authority、commit、rollback、repair。
- **Memory cost needs write/read-path accounting**:Zero-Mem 和 MemDelta 类工作都说明
  final-answer tokens 不是 memory 系统总成本。
- **Human-editable substrates are becoming first-class**:filesystem memory 与
  Letta Memory Filesystem 信号共同强化 Markdown/file-tree memory 的工程现实性。
- **Personalization benchmarks are getting deeper**:Setoka 和 Know It, Act on It
  把个性化从事实召回推进到用户理解与行动使用。

## Review notes

- 收录项均要求 primary source:论文用 arXiv,产品用官方 docs / changelog / release notes。
- GitHub stars、README 性能数字、MCP catalog 和 awesome-list placement 只作 discovery。
- Author-reported benchmark results are paper-origin claims;vendor numbers are vendor claims。
- 本轮 benchmark catalog 从 21 行增至 23 行;paper seed notes 从 15 增至 19;product
  note count 不变,Hindsight 等只做 update-existing。
