---
title: PowerMem
type: product
source: https://github.com/oceanbase/powermem
date_first_seen: 2026-06
domain: memory-api-server
business_model: OSS / OceanBase ecosystem
license: Apache 2.0
memory_modules:
  - ingest-adapter
  - semantic-dedup
  - retriever-reranker
  - dream-consolidator
status: seed
last_revised: 2026-06-11
archive: archives/powermem-overview.md
---

# PowerMem

## 1. 一句话定位

PowerMem 是 OceanBase 生态的 persistent, self-evolving AI memory plugin,面向
coding agents、MCP clients、SDK/API servers 和多后端本地/云存储。

## 2. 是什么 / 做什么

仓库 README 把 PowerMem 描述为结合 vector、full-text、graph retrieval、LLM-driven
memory extraction、Ebbinghaus-style time decay、Experience + Skill distillation、
multi-agent isolation、user profiles 和 multimodal signals 的 agent memory 系统。

## 3. 关键技术选择

- **Experience + Skill distillation**:用两层结构把经历沉淀成可复用技能。
- **4-way hybrid retrieval**:README 提到 hybrid retrieval,并提供 LOCOMO/AppWorld
  benchmark 复现目录。
- **多接口**:Python SDK、CLI、HTTP API、MCP server、dashboard、IDE/agent plugins。
- **多后端**:OceanBase/seekdb/Postgres/SQLite 等配置路径。

## 4. 决策相关性 / Decision relevance

- **对照点**:PowerMem 与 EverOS 一样把 skill/procedural memory 放到产品核心,但
  更偏工程插件/API server。
- **借鉴点**:CLI + MCP + HTTP + dashboard 的多入口组合适合观察 memory server 的
  开发者体验。
- **差异点**:benchmark 和性能 claim 需要从 `benchmark/` 独立复现后才能当实证。

## 5. 适用 / 不适用场景

- **适用**:需要给 Claude Code、Codex、Cursor、OpenClaw 等 IDE/agent 加长期记忆;
  希望本地/服务器多部署形态共存的团队。
- **不适用**:只需要用户级偏好 store;不希望引入 LLM 自动 distillation 的强审计产品。

## 6. 注意事项 / 风险

- **benchmark 自报**:LOCOMO/AppWorld 数字和改善幅度来自官方 README,本仓标为
  vendor-claimed,待独立复现。
- **生态复杂度**:多后端和多插件提高灵活性,也增加运维/版本验证成本。
- **数据治理**:需要实测 delete/export/audit 行为。

## 7. 进一步阅读

- archive: [`archives/powermem-overview.md`](archives/powermem-overview.md)
- GitHub:https://github.com/oceanbase/powermem
- Site:https://www.powermem.ai/

---

> *Ymem 项目对本笔记决策相关性的具体绑定见
> [`../docs/ymem-binding/relevance-index.md`](../docs/ymem-binding/relevance-index.md)。*
