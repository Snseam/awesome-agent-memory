---
title: ByteRover (formerly Cipher)
type: product
source: https://www.byterover.dev/
date_first_seen: 2026-06
domain: coding-agent-memory
business_model: source-available CLI + cloud/service positioning
license: Elastic License 2.0 (repo)
memory_modules:
  - ingest-adapter
  - semantic-dedup
  - retriever-reranker
  - policy-privacy
status: seed
last_revised: 2026-06-11
archive: archives/byterover-overview.md
---

# ByteRover

## 1. 一句话定位

ByteRover 是面向 autonomous coding agents 的 portable memory layer,前身/别名为
Cipher,通过 CLI、MCP 和项目 context tree 让多个 coding agents 共享长期上下文。

## 2. 是什么 / 做什么

GitHub 仓库标题直接写明 "The portable memory layer for autonomous coding agents
(formerly Cipher)"。它的核心定位不是普通笔记,而是把项目上下文、决策、代码活动和
agent 工作流沉淀为可跨 Claude Code、Codex、Cursor 等工具复用的 memory。

## 3. 关键技术选择

- **Context tree**:用项目级结构组织长期上下文。
- **CLI + MCP**:开发者通过 `brv` CLI 和 MCP 工具接入不同 coding agents。
- **Portable memory**:强调跨 agent/client 迁移,避免每个 IDE 自己孤立记忆。
- **Agent hooks**:适合 session start/stop、tool use 后写入和召回。

## 4. 决策相关性 / Decision relevance

- **对照点**:ByteRover 代表 coding-agent memory 的专门化路线,重点是项目上下文而
  非用户画像。
- **借鉴点**:context tree 比 flat vector chunks 更容易审阅和分层检索。
- **差异点**:source-available/云端路线与 OSS Apache/MIT 项目不同,需看许可和部署条款。

## 5. 适用 / 不适用场景

- **适用**:多人/多 agent 代码库协作;需要把决策、任务和文件关系保留下来的 coding
  agent 工作流。
- **不适用**:C 端 assistant memory;需要完全 permissive license 的基础设施产品。

## 6. 注意事项 / 风险

- **命名合并**:ByteRover / Cipher 应作为同一产品族记录。
- **许可**:Elastic License 2.0 不等于开源 permissive license。
- **claim 边界**:公开 benchmark/覆盖范围按厂商或仓库自述处理。

## 7. 进一步阅读

- archive: [`archives/byterover-overview.md`](archives/byterover-overview.md)
- Site:https://www.byterover.dev/
- GitHub:https://github.com/campfirein/byterover-cli
- Docs:https://docs.byterover.dev/connectors/overview

---

> *Ymem 项目对本笔记决策相关性的具体绑定见
> [`../docs/ymem-binding/relevance-index.md`](../docs/ymem-binding/relevance-index.md)。*
