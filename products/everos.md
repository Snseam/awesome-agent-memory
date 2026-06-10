---
title: EverOS (EverMind / EverMemOS)
type: product
source: https://evermind.ai/everos
date_first_seen: 2026-06
domain: memory-os
business_model: OSS + cloud
license: Apache 2.0 (GitHub repo / product page claim)
memory_modules:
  - ingest-adapter
  - parser-chunker
  - semantic-dedup
  - retriever-reranker
  - dream-consolidator
status: seed
last_revised: 2026-06-11
archive: archives/everos-overview.md
---

# EverOS

## 1. 一句话定位

EverOS 是 EverMind 推出的 agent memory operating system,把多模态输入、Profile /
Episodic / Skill 记忆、self-evolving skill consolidation 和 MCP/agent 集成放在
同一个可云端或自托管的 memory layer 里。

## 2. 是什么 / 做什么

公开页面把 EverOS 描述为跨 agent、跨平台的 memory layer,兼容 Claude Code、
Codex、OpenClaw、Hermes、MCP、OpenAI SDK 与 Anthropic SDK。它的核心写入路径
是 "one call stores messages, images, and docs",然后自动抽取并打标签。

EverMind / EverOS / EverMemOS 在本仓合并为一个产品族:EverMemOS 是论文/研究线索,
EverOS 是当前产品入口,EverMind 是厂商品牌。

## 3. 关键技术选择

- **记忆类型**:Profile、Episodic、Skill 三类是公开页面的一等概念。
- **Skill self-evolution**:任务执行轨迹先成为 Case,重复成功路径再离线蒸馏为
  Skill memories。
- **多模态 memory ingestion**:PDF、image、docs、excel、slides、URL 等都进入
  同一 memory 管线。
- **可携带性**:公开页面强调 Markdown export、cloud 与 self-host 切换。
- **接口**:MCP / Claude Code / Codex / OpenClaw / Hermes 是主要入口。

## 4. 决策相关性 / Decision relevance

- **对照点**:EverOS 把 procedural memory / skill memory 放到产品叙事中心,比
  单纯 fact memory 更接近长期 agent 能力积累。
- **借鉴点**:Case -> Skill 的离线蒸馏路径适合对照 `dream-consolidator` 与
  `memorydiff-generator`。
- **差异点**:当前公开资料仍以产品页和 GitHub README 为主,内部 schema、冲突
  解决和安全边界需要继续观察。

## 5. 适用 / 不适用场景

- **适用**:需要跨 coding agent 共享长期记忆;希望 memory 能沉淀成 procedure /
  skill 的 agent 团队;希望自托管又保留云端路径的开发者。
- **不适用**:只需要普通 RAG;不能接受 LLM 自动抽取/蒸馏黑箱的强审计场景。

## 6. 注意事项 / 风险

- **benchmark 自报**:93%+ accuracy、p95 <500ms、~10x cost 等来自官方页面,在本仓
  只作为 vendor-claimed signal。
- **命名合并**:EverOS / EverMind / EverMemOS 不应拆成多个产品条目,否则会重复计数。
- **实现边界**:Apache 2.0 与 Markdown export 是强信号,但云端 control plane 的
  可审计性仍需实际部署验证。

## 7. 进一步阅读

- archive: [`archives/everos-overview.md`](archives/everos-overview.md)
- 官方:https://evermind.ai/everos
- GitHub:https://github.com/EverMind-AI/EverOS

---

> *Ymem 项目对本笔记决策相关性的具体绑定见
> [`../docs/ymem-binding/relevance-index.md`](../docs/ymem-binding/relevance-index.md)。*
