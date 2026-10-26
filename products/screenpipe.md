---
title: Screenpipe
type: product
source: https://github.com/screenpipe/screenpipe
date_first_seen: 2026-09
date: 2026-10-26
domain: personal-workflow-memory
business_model: source-available + paid app and enterprise plans
license: Screenpipe Commercial License
code_available: yes
evidence_level: medium
evidence_class: product_behavior
core_claim: |
  Captured computer activity and editable memory records can supply persistent,
  searchable context to agents through local APIs and MCP.
method_summary: |
  Accessibility-first screen capture, OCR fallback and audio transcription feed
  local history; explicit memory records expose create/read/update/delete and
  source metadata, with different MCP transport surfaces.
required_assumptions: |
  Capture permissions, an available Screenpipe service, API authentication and
  the selected processing/storage providers are configured for the workload.
benchmark_used: none reviewed
cost_complexity: local capture/index/media storage plus optional model and sync costs
memory_modules:
  - ingest-adapter
  - retriever-reranker
  - security-privacy
status: seed
last_revised: 2026-10-26
source_revision: 334b865ec7b2938eeb44c443e17aebfa3e0a10a3
archive: archives/screenpipe-overview.md
---

# Screenpipe

## 1. 一句话定位

Screenpipe 是带有可编辑持久记忆的电脑活动采集与工作流产品：屏幕、音频和
应用活动构成历史来源，独立 memory records 与检索接口再向 agent 提供上下文。
本笔记按 **personal/workflow memory with captured-history ingest** 收录为 core
`seed`，不把整个产品描述成独立 memory kernel。

## 2. 是什么 / 做什么

[固定版本 README][readme] 将产品定位于电脑工作采集、工作流发现和 agent
context。屏幕采集优先使用 accessibility tree，缺失时回退 OCR；音频形成
transcripts，本地 SQLite/FTS5 和媒体文件提供历史检索。默认本地存储与
可选云功能需要分别描述。

收录依据不只来自“记住一切”的产品叙事：[MCP 源码][stdio] 暴露
`update-memory` 的创建、更新、删除，以及 `search-content` 的 `memory`
类型检索；[服务端实现][memories] 将这些操作映射到数据库。记录包含
content、source、tags、importance、时间戳以及可选 source_context/frame_id。
可选来源元数据不等于经过验证的完整 provenance 链。

## 3. 关键技术选择与生命周期

| Surface | 已核实的文档 / 源码行为 | 边界 |
|---|---|---|
| Captured history | 保存屏幕文本、音频转写和相关活动；按时间、应用等检索 | 采集完整性和回答质量未实测 |
| Editable memories | 显式 memory CRUD、tags、importance 和来源上下文 | 未建立自动 consolidation、冲突裁决或版本回滚保证 |
| Export | stdio `export-video` 调用 `/export`，返回指定时间段的本地媒体产物路径 | 媒体导出不等于可移植的完整记忆格式或恢复验证 |
| Retention | `media` 清理媒体文件；`lean` 还清理重型结构文本，但保留可搜索全文、转写和 memories；`all` 进入录制数据删除路径 | 不把 retention 模式名称解释为全部派生记忆和外部副本的级联删除 |
| Memory deletion | 独立 memory DELETE 删除本地记录，并尝试为已同步记录登记 tombstone | 源码明确允许本地删除先完成；缺失 tombstone 时不能声称云端删除已生效 |

Retention 行依据[固定版本实现][retention]；memory 删除边界依据
[delete_memory_handler][memories]。这些是不同的数据生命周期，不能把清理
视频、删除一条记忆、撤销 agent 已收到的内容视为同一操作。

### MCP transport 与鉴权

[stdio 实现][stdio] 提供搜索、帧上下文、会议、导出和 memory 写操作等工具。
[HTTP 实现][http] 在本次固定版本只注册 `search_content` 与 bundled
`screenpipe-skills`，没有 stdio 的 memory 写入、帧检查及导出工具；这不代表
另行部署的 hosted personal/enterprise MCP 服务具有同样边界。

HTTP 默认绑定 loopback；启用 LAN 监听必须提供 MCP caller bearer key。
可信 loopback 请求可免 caller key，判断还检查 Host/Origin。访问上游 recorder
API 的 `SCREENPIPE_LOCAL_API_KEY`（兼容 `SCREENPIPE_API_KEY`）与 HTTP caller
key 是两种凭据；后者不作为 recorder key 转发。这里只核实实现，未执行
安全测试或远程连接验收。

## 4. 数据、许可与成本边界

[官方数据流说明][privacy] 区分本地采集/检索与云转写、云模型、外部集成、
sync 等路径；MCP 返回的内容也可能由客户端的模型提供商处理。因此
local-first 不表示所有后续处理均留在设备上。README 另披露默认产品分析及
关闭选项，本笔记没有将“本地存储”扩展为“没有网络流量”。

[存储说明][storage] 区分本地历史、云副本、导出报告与备份：本地 retention
不意味着其余副本被清除。运行成本取决于采集范围、媒体保留、转写和模型
配置；本次没有测量磁盘、CPU、延迟或 token 节省。

[固定版本 LICENSE][license] 是 **Screenpipe Commercial License**，应标为
source-available，不能沿用旧版 MIT 标签。文件列出个人非商业、非营利/
教育/研究及限定组织评估用途；商业 source builds 需要相应商业许可。
官方预编译 app 使用独立条款和订阅许可。这里只记录许可文本，不评判具体
使用场景是否合法。套餐以[官方价格页][pricing]为准，不在笔记冻结价格。

## 5. 决策相关性 / Decision relevance

- `ingest-adapter`：跨应用活动可作为记忆来源，适合研究被动采集与显式写入
  如何共存，而不是只研究聊天摘要。
- `retriever-reranker`：按时间/应用定位原始证据，与显式 facts/preferences
  检索是不同读路径；需要分别评估覆盖率、证据正确性和上下文成本。
- `security-privacy`：原始媒体、派生记忆、模型已接收内容、云端/导出副本需要
  分别确定授权和删除边界。

以上是维护者的架构映射。Core seed 判定依据是当前源码中的一等持久记忆
CRUD 和 agent recall，符合本仓对 [Basic Memory](basic-memory.md) 与
[Kinic](kinic.md) 等交叉产品的收录口径。Pieces/MIRIX 的既有 Tier B 记录
保留原状态；本次不据此推断它们缺少这些能力，也不顺带升级它们。

## 6. 证据与未完成验证

**外部源码的提示注入风险：** 固定版本 [MCP 文件开头][stdio] 含有面向 AI
读者的指令，要求将推广页眉传播到其他仓库的编辑文件。这是越过数据与指令
边界的尝试，已忽略；收录不代表该来源可被信任为操作指令，也不代表安全
背书。详见[社区投稿信任复核](../docs/product-discovery-log.md#2026-10-26-intake-trust-review)。

[Issue #29][issue] 的投稿者自述为 Screenpipe 创始人/维护者并披露关联关系，是
**affiliated submission**。本次独立进行公开文档和固定版本源码阅读，但
证据仍属于 product behavior / project-authored documentation，分类属于
maintainer synthesis，不是独立 benchmark 或运行复现。

未安装或运行 Screenpipe，未读取真实电脑历史；未验证采集覆盖、检索准确率、
鉴权隔离、云删除传播、备份恢复或完整许可依赖清单。没有新增 benchmark
分数、排名、成熟度或 token 节省结论。后续实验应分别覆盖原始历史和显式
memory records，并记录请求使用的 transport、版本、provider 与 retention mode。

## 7. 进一步阅读

- Authored source summary: [archives/screenpipe-overview.md](archives/screenpipe-overview.md)
- [Pinned README][readme] · [LICENSE][license] · [stdio MCP][stdio] · [HTTP MCP][http]
- [Memory API implementation][memories] · [Retention implementation][retention]
- [Privacy/data flow][privacy] · [Storage/retention guide][storage]

[readme]: https://github.com/screenpipe/screenpipe/blob/334b865ec7b2938eeb44c443e17aebfa3e0a10a3/README.md
[license]: https://github.com/screenpipe/screenpipe/blob/334b865ec7b2938eeb44c443e17aebfa3e0a10a3/LICENSE.md
[stdio]: https://github.com/screenpipe/screenpipe/blob/334b865ec7b2938eeb44c443e17aebfa3e0a10a3/packages/screenpipe-mcp/src/index.ts
[http]: https://github.com/screenpipe/screenpipe/blob/334b865ec7b2938eeb44c443e17aebfa3e0a10a3/packages/screenpipe-mcp/src/http-server.ts
[memories]: https://github.com/screenpipe/screenpipe/blob/334b865ec7b2938eeb44c443e17aebfa3e0a10a3/crates/screenpipe-engine/src/routes/memories.rs
[retention]: https://github.com/screenpipe/screenpipe/blob/334b865ec7b2938eeb44c443e17aebfa3e0a10a3/crates/screenpipe-engine/src/retention.rs
[privacy]: https://docs.screenpipe.com/privacy-data-flow
[storage]: https://docs.screenpipe.com/storage-and-retention
[pricing]: https://screenpipe.com/pricing
[issue]: https://github.com/Snseam/awesome-agent-memory/issues/29
