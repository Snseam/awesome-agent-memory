---
title: TencentDB Agent Memory
type: product
source: https://github.com/TencentCloud/TencentDB-Agent-Memory
date_first_seen: 2026-04
domain: agent-memory
business_model: OSS + Tencent Cloud service
license: Other / repo license file (GitHub metadata); Tencent Cloud service proprietary
memory_modules:
  - ingest-adapter
  - parser-chunker
  - semantic-dedup
  - retriever-reranker
  - dream-consolidator
  - audit-ui
status: seed
last_revised: 2026-08-03
archive: archives/tencentdb-agent-memory-overview.md
---

# TencentDB Agent Memory

## 1. 一句话定位

TencentDB Agent Memory 是腾讯云数据库团队推出的 agent 记忆底座:云上产品
强调企业级记忆管理,开源仓库强调本地可运行的 L0-L3 分层长期记忆与短期
context offloading。

## 2. 是什么 / 做什么

官方产品页把它描述为"Agent 记忆服务",面向跨会话、长周期、多任务 agent,
提供自动写入、分层沉淀、按需召回、治理增强和全局资源管理。底层云产品基于
Tencent Cloud VectorDB。

开源仓库当前 canonical GitHub URL 为 `TencentCloud/TencentDB-Agent-Memory`;
早期笔记中的 `Tencent/TencentDB-Agent-Memory` 应作为历史/别名处理。仓库把重点放在本地可 inspect 的
记忆流水线:

- **L0 Conversation**:原始会话与引用
- **L1 Atom**:抽取后的原子记忆
- **L2 Scenario**:面向场景的 Markdown block
- **L3 Persona**:可追溯到 scenario 的用户画像
- **Context offloading**:用 Mermaid task canvas 压缩短期任务状态

截至 2026-06-29 查询,GitHub canonical repo 可访问为 `TencentCloud/TencentDB-Agent-Memory`。
活跃度、release 和 license 仍按 GitHub/vendor source 处理,不作为质量结论。

## 3. 关键技术选择

- **存储**:本地默认 SQLite + sqlite-vec;路线图同时支持 Tencent Cloud VectorDB
- **召回**:keyword / embedding / hybrid,RRF 融合
- **分层记忆**:conversation -> atom -> scenario -> persona
- **短期上下文**:Mermaid canvas 保留任务状态,原始 payload 通过 `result_ref`
  / `node_id` 追溯
- **接入**:OpenClaw plugin、Hermes Gateway adapter、agent tools
  `tdai_memory_search` / `tdai_conversation_search`

## 3.1 2026-08 watch/update signal

2026-08-03 周更复核到 TencentDB Agent Memory v2 beta / team memory 方向的官方和
仓库信号:team memory 将 Chat Memory、Skill、Wiki/Link Graph、CodeGraph 等作为可
复用资产,并暴露 owner/version/status、sharing/equipping 以及 private/team/
restricted/agent ACL 可见性。由于主 release 时间在 2026-07-21/22,本轮只作为
update/watchlist 信号记录;README 或云文章里的准确率/token claims 仍按 vendor
self-report,不升级为独立 benchmark evidence。

## 4. 决策相关性 / Decision relevance

- **对照点**:它把"可调试记忆"作为核心卖点,不像纯 vector DB 只返回相似度列表。
- **借鉴点**:
  - 分层 artifact 全部可读(L2 Markdown、L3 persona.md、Mermaid canvas),
    对 `audit-ui` 和 provenance 设计有直接参考价值。
  - short-term offloading 与 long-term persona 形成闭环,适合对比
    `dream-consolidator` / `memorydiff-generator` 的边界。
  - hybrid recall 的可配置项可作为 retriever-reranker 的产品化参考。
- **差异点**:腾讯方案默认更 opinionated,直接规定 memory pyramid;本仓的
  kernel 目标仍偏 host-neutral schema + diff。

## 5. 适用 / 不适用场景

- **适用**:OpenClaw/Hermes 生态;需要本地可审计 memory artifacts 的 agent;
  长任务中上下文膨胀明显、需要 offload 的工具 agent。
- **不适用**:只需要轻量 SDK 的 SaaS prototype;不想接受 L0-L3 固定结构的
  host app;需要成熟商业 SLA 但无法使用腾讯云的海外部署。

## 6. 注意事项 / 风险

- **license metadata 不统一**:GitHub API 显示 `Other`;仓库页面底部显示
  license 链接,引用前应以仓库 `LICENSE` 文件为准。
- **benchmark 自报**:产品页声称 PersonaMem 与 token 降低数据,目前按官方
  自测处理,不当作独立复现。
- **benchmark ledger**:PersonaMem-v2 row 见
  [`../benchmarks/claims/claims.yaml`](../benchmarks/claims/claims.yaml);
  benchmark note 暂在 [`../benchmarks/index.md`](../benchmarks/index.md) 以
  candidate 收录。
- **云产品与 OSS 边界**:腾讯云 Agent Memory 与开源本地实现不是同一交付
  形态,文档引用时需要分清。

## 7. 进一步阅读

- archive: [`archives/tencentdb-agent-memory-overview.md`](archives/tencentdb-agent-memory-overview.md)
- 腾讯云产品页:https://cloud.tencent.com/product/agm
- GitHub:https://github.com/TencentCloud/TencentDB-Agent-Memory
- Releases:https://github.com/TencentCloud/TencentDB-Agent-Memory/releases
- Historical GitHub alias:https://github.com/Tencent/TencentDB-Agent-Memory

---

> *Ymem 项目对本笔记决策相关性的具体绑定见
> [`../docs/ymem-binding/relevance-index.md`](../docs/ymem-binding/relevance-index.md)。*
