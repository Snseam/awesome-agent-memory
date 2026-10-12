---
title: 2026-10-12 Memory Radar refresh
date: 2026-10-12
status: current-source-refresh
language: zh-CN
---

# 2026-10-12 Memory Radar refresh

本页记录 2026-10-12 的 weekly radar refresh。主 agent 从 `origin/main`
commit `56dd2728eb76a9577c7ccc621c298e3c4273c204` 创建分支
`codex/weekly-memory-radar-2026-10-12`。本轮把 2026-10-05 到 2026-10-12
期间新增且通过 primary-source 检查的变化单独提升；2026-09-28 与
2026-10-05 的未合并 weekly PR 只作为去重上下文,不在本分支重复导入。

## 执行模型

| Lane | 角色 | 输出 |
|---|---|---|
| papers | bounded researcher + main agent | arXiv current-window search and direct page checks |
| products | bounded researcher + main agent | official release notes, docs, and product pages |
| GitHub/benchmarks | bounded researcher + main agent | discovery-only repositories, lists, and benchmark signals |
| repo-map | main agent | counts, connected surfaces, duplicate risks, and pending PR overlap |
| source-check | main agent | canonical URL, date, title, and accessibility checks |
| relevance-review | main agent | final must-add / update-existing / watchlist / adjacent / reject decisions |

The requested bounded lanes were attempted. A Spark repo-map subagent failed
because that model is unavailable for the current account, so repository mapping
was completed locally.

## Must-add / update-existing

### Papers

| Action | Item | Why it matters | Local anchor |
|---|---|---|---|
| must-add | Capability-Driven Self-Evolution of Agent Memory | capability-specific evolution makes memory policy improvements and regressions visible instead of hiding them inside one aggregate score | [`../papers/capability-driven-self-evolution-agent-memory.md`](../papers/capability-driven-self-evolution-agent-memory.md) |
| must-add | Persistent Memory in Multi-Agent LLM Inference | null-result methodology shows when persistent-memory ablations are underpowered or structurally unable to benefit from recall | [`../papers/persistent-memory-multi-agent-inference-cost.md`](../papers/persistent-memory-multi-agent-inference-cost.md) |
| must-add | Test-Time Memory Construction | defers memory construction to query time, making construction itself a runtime policy surface | [`../papers/test-time-memory-construction.md`](../papers/test-time-memory-construction.md) |
| must-add | From Retrieval to Reconstruction | shifts dialogue memory from top-k retrieval toward provenance-aware temporal state reconstruction | [`../papers/from-retrieval-to-reconstruction-cognitive-memory.md`](../papers/from-retrieval-to-reconstruction-cognitive-memory.md) |
| must-add | Event-Centric Query-Aware Graph Memory | combines event-indexed atomic memory with query-scoped working-memory graph assembly | [`../papers/event-centric-query-aware-graph-memory.md`](../papers/event-centric-query-aware-graph-memory.md) |
| must-add | Relevance Is Not Sufficiency | makes sufficient evidence-set construction a retrieval/evaluation target beyond topical relevance | [`../papers/relevance-not-sufficiency-evidence-gap.md`](../papers/relevance-not-sufficiency-evidence-gap.md) |
| must-add | MINDSET | pairs immutable episodes with evolving schemas for stale/current conversational state | [`../papers/mindset-schema-evolution-conversational-memory.md`](../papers/mindset-schema-evolution-conversational-memory.md) |
| must-add | Gated Memory | promotes admission control as a first-class memory formation layer | [`../papers/gated-memory-admission-controlled-formation.md`](../papers/gated-memory-admission-controlled-formation.md) |
| must-add | The Right Memory in the Wrong Context | verifies whether retrieved memory is admissible for the current prompt, namespace, and task context | [`../papers/right-memory-wrong-context-admissibility.md`](../papers/right-memory-wrong-context-admissibility.md) |
| must-add | DAEDALUS | uses self-generated tasks and traces to bootstrap procedural or heuristic agent memory | [`../papers/daedalus-self-generated-task-memory.md`](../papers/daedalus-self-generated-task-memory.md) |
| must-add | Beyond Corrected Memory | tests whether multi-agent execution remains consistent after shared memory is corrected | [`../papers/beyond-corrected-memory-execution-consistency.md`](../papers/beyond-corrected-memory-execution-consistency.md) |

### Products

| Action | Product | Verified delta | Local anchor |
|---|---|---|---|
| update-existing | Zep | 2026-10 changelog expands node-summary writeback, reranks large auto-search candidate sets, and fixes identity-property matching across graphs | [`../products/zep.md`](../products/zep.md) |
| update-existing | Oracle AI Agent Memory | 2026-10 Oracle developer blog frames 26.8 Deep Data Security integration and audit requirements for enterprise memory; OCI Generative AI long-term memory stays adjacent context | [`../products/oracle-ai-agent-memory.md`](../products/oracle-ai-agent-memory.md) |

## Watchlist / adjacent / reject

| Decision | Item | Reason |
|---|---|---|
| watchlist | Redis 2026-10-21 agent-memory workshop | official event source with useful production-memory agenda, but future event material should not be promoted before the session or recording exists |
| watchlist | Google Gemini at Work 2026 / universal Gemini agent | official blog says Gemini carries memory, skills, and controls across Workspace, but it is high-level platform positioning rather than a Memory Bank note delta |
| watchlist | Letta 0.16.x release pages and MemFS docs | official memory/memfs signals, but latest visible release content mostly predates this weekly window or overlaps pending PR #32 context |
| watchlist | Alibaba ANOLISA v1.0 | Alibaba Cloud Community source describes `agent-memory` hybrid semantic search, consolidation, isolation, masking, and cross-session persistence; product boundary is distinct enough to need a later note/architecture pass |
| watchlist | MemPilot / HGP / category-conditioned retention | relevant arXiv memory papers, but multimodal, on-device, or short workshop scope needs a fuller pass before core promotion |
| watchlist | MCP reference memory server file locking | upstream PR #5037 adds cross-process locking for shared `MEMORY_FILE_PATH`; record as protocol/reference behavior, not product maturity or benchmark evidence |
| watchlist | memory benchmark/list GitHub repos | useful discovery sources, but README activity, stars, and list placement cannot support performance or quality claims |
| adjacent | AWS AgentCore Memory JSON payloads and GovCloud availability | official memory deltas are real but already captured in the existing AWS note from the prior refresh; current October AgentCore notes were gateway/identity/harness rather than new memory behavior |
| adjacent | Cloudflare Agents / MCP authorization changelog | relevant to agent infrastructure and identity, but not a new Cloudflare Agent Memory behavior update |
| adjacent | Gamma / MemTrial / virtual-context-memory | robotics, finance, or context-window-management scope rather than general durable user-agent memory |
| reject as performance evidence | GitHub projects, Reddit posts, third-party dashboards, and list placement | discovery only; no performance, maturity, or benchmark conclusion promoted from these sources |

## Source verification

| Source class | Checked | Result |
|---|---|---|
| arXiv direct pages | 2610.06361, 2610.07782, 2610.13348, 2610.11314, 2610.11920, 2610.09348, 2610.08586, 2610.11270, 2610.07309, 2610.08048, 2610.08101 | titles, dates, abstracts, and canonical IDs verified from arXiv pages or targeted reachability checks |
| Existing repository and pending weekly branches | `origin/main`, PR #31/#32 branches | current branch avoids re-importing 2026-09-28 and 2026-10-05 pending PR material |
| Official product pages | Zep changelog, Oracle blogs, Redis event page, Google Cloud blog, AWS/Alibaba/OpenAI/Cloudflare/Letta docs and releases | Zep and Oracle promoted as product-behavior updates; others retained as watchlist or adjacent where memory-specific delta was too weak or already covered |
| GitHub/list/community discovery | memory projects, benchmark lists, MCP/catalog/community mentions, MCP reference-server PR #5037 | used only for discovery or protocol-behavior tracking; no GitHub-only or community-only claim promoted |

## Evidence boundaries

- New paper notes are `seed`; no full-paper read, local PDF archive, code check,
  data check, or independent reproduction was completed.
- The PrisMem gains on BEAM-1M and LongMemEval-M remain author-reported
  paper-origin claims.
- The multi-agent persistent-memory null result is methodological pressure for
  benchmark design, not a general rejection of persistent memory.
- Product updates record official behavior only. Zep and Oracle changes do not
  support independent benchmark, security, or quality conclusions.
- Product and list sources stay in product-behavior, watchlist, adjacent, or
  discovery-only buckets.

## Trend synthesis

- Memory evolution work is moving from whole-system search toward capability
  taxonomies and regression-preserving policy updates.
- Cost-aware memory evaluation is becoming stricter: papers increasingly ask
  whether the benchmark regime can actually expose a recall benefit.
- Platform products continue to make governance, identity, and cross-agent
  handoff part of memory design; this week only Zep and Oracle had enough
  primary implementation detail for existing-note updates.

## Review notes

The connected surfaces now record 989 scraped papers plus eleven new 2026-10
seed paper notes from this branch. No benchmark catalog row, new product note,
product archive, or claims-ledger event was added.
