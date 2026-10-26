---
title: Six-week memory radar consolidation and evidence follow-up
date: 2026-10-26
status: consolidated-source-review
evidence_class: maintainer_synthesis_or_inference
language: zh-CN
---

# 六期周报整合：重复、证据修正与下一步研究

本次将 2026-09-21 至 2026-10-26 的六期周报合为一个可审阅变更，并围绕其
生命周期、权限、遗忘和行为收益线索补充官方证据。它是资料库整合，不是产品
运行验收或独立 benchmark 复现。历史周报保留当时判断；本页记录整合后的状态。

## 1. 输入与覆盖

六个 PR 均从 `main` 的 `56dd272` 分出，并非依次累积。不能用最新一周的文件
覆盖前几周，也不能相加各分支 README 的总数。

| 原 PR | 固定输入 revision | 周报 | 保留的主要增量 |
|---|---|---|---|
| [#28](https://github.com/Snseam/awesome-agent-memory/pull/28) | `bed27b4622ea02e61cb3e9c5393eaba36a55f6e1` | [09-21](memory-radar-2026-09-21.md) | 6 篇 seed；Hindsight v0.10.0、OpenViking v0.4.21 |
| [#31](https://github.com/Snseam/awesome-agent-memory/pull/31) | `6e0fd4b2c2ae5476980c67e89457c3ed88c66b53` | [09-28](memory-radar-2026-09-28.md) | 10 篇 seed、8 个基准、Tablestore；PersonaAgent 元数据、产品边界及生命周期更新 |
| [#32](https://github.com/Snseam/awesome-agent-memory/pull/32) | `fc63adb508eec6547f0a1d1042f192c05c288dad` | [10-05](memory-radar-2026-10-05.md) | 6 篇 seed、3 个基准；Claude store、Letta、Hindsight、OpenViking |
| [#33](https://github.com/Snseam/awesome-agent-memory/pull/33) | `6af5b3c62f9c071c3e3230d8df99ef9639df5fd0` | [10-12](memory-radar-2026-10-12.md) | 11 篇 seed；Zep、Oracle |
| [#34](https://github.com/Snseam/awesome-agent-memory/pull/34) | `21bbfe05d0c7dda21875d8b2e04246c7b7c5225a` | [10-19](memory-radar-2026-10-19.md) | 3 篇 seed、Bemula/MemCut；Zep v4、Graphiti v0.31.0 |
| [#36](https://github.com/Snseam/awesome-agent-memory/pull/36) | `1c6d5a84dd82ec3e78bdf3ee1d26d3e8af4679be` | [10-26](memory-radar-2026-10-26.md) | MCCL、FrontierMemory、Mem0 时间控制 |

外部产品投稿 #26 GoodMem、#35 MoobFS 和开放 Issue 的收录决定不包含在本次整合。

## 2. 重复与冲突的处理

| 发现 | 处理 | 为什么 |
|---|---|---|
| 同一 `2607.05029` 有两份 FARMA/SENTINEL seed | 保留 [canonical note](../papers/forged-reasoning-attacks-agent-memory.md)，合入 `audit-ui` 与 rationale 来源审计，删除另一份 | 同一论文、同一方法；保留独有洞见，seed 总数减一 |
| Hindsight、OpenViking、Letta、Zep、Mem0 多周修改同一笔记 | 按日期保留不同版本的独立增量，折叠重复日期/来源 | 版本演进不是同内容重复；不能只留最后一周 |
| 五期重复修 Ruby/Psych `Date` 解析 | 保留一次兼容修复，同时保留 #31 别名检查 | 较新分支只有日期修复，不可覆盖较早的完整检查 |
| #31 别名解析漏读带换行的标量 | 修复标量读取、引号归一和空别名列表，加入失败路径回归用例 | 否则 alias 与另一文件 `name/title/id` 碰撞会漏报 |
| 共享 README、索引、日志和 claims ledger | 合并唯一条目后重算；按 `event_id` 保留完整记录 | 逐行拼接会制造重复表行、过期计数甚至 YAML 字段串接 |
| `MEMPROBE` 与 `MemProbe Stability-Plasticity` | 分别保留 | `2606.24595` 与 `2609.30558` 是不同工作 |
| `LongMemEval` 与 `LongMemEval-V2` | 分别保留 | 对话事实记忆与环境经验任务不同，不能按名称合并 |
| MemCut 的 paper 与 benchmark 笔记 | 保留两个视图并交叉引用 | 方法证据与评估协议分别归档；不是同层重复论文 |
| APDMem、EPGM、Interpreting at Write Time、MemCodex、Mem++ 题名 | 按 2026-10-26 官方标题/摘要修正 note 与 index，保留稳定路径 | EPGM 当前 v2 已更新；组织场景、检索收益与任务收益、版本控制推论分别收窄，未宣称全论文复核 |
| PersonaAgent 与 UMA 旧 stub | 原路径修正标题/会议/来源，保持 stub | 不增加第二篇论文，也不把元数据修正说成精读 |

六期新增 37 个 paper seed，跨周未发现同层重复。既有重复修正后为
`73 + 37 - 1 = 109` 个 seed，7 个 full 不变。989 是既有抓取基线，不能将其
称为包含全部手工补录的当前唯一论文数。

## 3. 根据整合内容拓展的证据

| 跟进项 | 落地 | 核清的边界 |
|---|---|---|
| [Graphiti v0.31.2](../products/graphiti.md) | 从“避免与 #34 重叠”的观察项提升为已有产品更新 | 删除 episode 时保留其他来源支持的事实；摘要重建失败可留旧值、属性不重建；reference server 无 caller auth，`group_id` 不是权限边界 |
| [Hindsight v0.10.3](../products/hindsight.md) | 补读写 tag scope、当前标签合并、document content-hash append 条件 | host/bank 授权仍必要；外部 store 并未因此获得通用 atomic CAS |
| [OpenViking v0.5.2](../products/openviking.md) | 补 compilation、WM/LTM、身份及 SDK 迁移 | WM 默认关闭仍可归档消息和抽取长期记忆；模糊旧身份目录不能假定自动无损迁移 |
| [Mem0 Platform](../products/mem0.md) | 修正“无审计/变更不可逆”旧表述，明确 history 与时间控制范围 | `MemoryClient` 文档不代表 OSS 等价；decay 是项目设置；history/reference date 不证明 rollback 或事务快照 |
| [WorldMemArena](../benchmarks/worldmemarena.md) | 新增 seed protocol | v2 PDF 与数据卡支持 461 样本，摘要页仍为 400；未推断 400→461 的版本演化；answer-only 缺阶段指标，MIT 代码与非商用数据许可分别记录 |
| [Ledger-QA](../benchmarks/ledger-qa.md) | 新增 seed protocol，修正 UMA stub | 30 个测试 stream 与公开 200 行训练数据分开；token-set EM 不等于数值相等；冻结测试资产及代码许可仍待核实 |
| [FrontierMemory](../benchmarks/frontiermemory.md) | 完善既有协议，不再增一条 origin event | 三次独立生成与每任务三次尝试分开；固定 task model/effort；gated corpus、LLM judge 与 hosted trace 缺口保持可见 |

以上来源均列于各 canonical note，核查日期为 2026-10-26。产品更新支持
`product_behavior`；基准原始论文支持协议及作者报告，不能转成独立产品排名。

## 4. Watchlist 状态转移

- MemCalib：09-21 观察项已在 09-28 收录；当前以 [benchmark note](../benchmarks/memcalib.md) 为准。
- Oracle：10-05 的公告观察项已在 10-12 补充产品行为；这不等于已验证企业治理效果。
- Graphiti v0.31.2：本次完成合并审查，原“等待 #34”的原因解除。
- UMA/Ledger-QA、WorldMemArena：补入有明确缺口的 seed 协议；不再笼统等待全部资料，许可、数据版本和复现仍未完成。
- ANOLISA 产品边界、Redis workshop 后续材料、其他 discovery-only harness 保持观察，未因周报整合自动升级。
- SAFE-Mem 的来源不匹配、GitHub stars/catalog 质量推断和缺少一级来源的内容仍不采纳。

## 5. 整合后的规模

| 项目 | 基线 | 本次净变化 | 当前 |
|---|---:|---:|---:|
| Full paper notes | 7 | 0 | 7 |
| Seed paper notes | 73 | +37 新增 −1 同论文去重 | 109 |
| Generated stubs / local PDFs | 988 / 534 | 仅 stub 元数据修正；无新增 PDF | 988 / 534 |
| Product notes / archives | 40 / 39 | +1 Tablestore note / +1 archive | 41 / 40 |
| Benchmark catalog rows | 23 | +14 周报协议 +2 跟进协议 | 39 |
| Claims ledger events | 33 | +14 周报 origin +2 跟进 origin | 49 |

Catalog 行含 candidate/stub-backed 条目；不是所有基准都已完成协议复核。新增
ledger events 记录来源与协议，不新增独立复现或归一化分数。`survey_only` 对应
现有 ledger 的 origin-only 分类，不表示论文是二手 survey。

## 6. 发散后的可执行研究问题

详见 [memory-lifecycle-evaluation.md](memory-lifecycle-evaluation.md)。该页把
分散的 release 和论文映射成五条有对照组、指标与失败信号的实验方向：

1. 相关、允许与足够：检索命中是否越权，证据是否足够支持回答。
2. 时间与并发：乱序事件、到期状态、retag 和 append 是否互相覆盖。
3. 遗忘与保留：删除后派生证据能否恢复秘密，存活知识是否误删。
4. 行为与成本：无记忆对照、迁移任务、独立生成和全链路成本能否支持收益判断。
5. 工作记忆与迁移：关闭 WM 后长期写入是否继续，身份归属能否保留。

八个最小 case 均为 **proposed / not executed**。先用合成 fixtures 确立
可判定结果，再决定是否投入公开协议的独立复现；不把研究计划写入成绩 ledger。

## 7. 验证与限制

本次对 60 个 canonical 目标执行 GET 可访问性检查，全部返回 HTTP 200；读取标题时发现的五处题名差异已进一步核对官方摘要并修正。可访问不等于全文、代码、许可或结果已经核实。

整合 PR 记录最终 staged tree 的 verifier、回归检查、diff 检查与独立审阅结果。原六期 PR 的本地通过记录保留为历史报告，不能替代整合后验证。

本次没有运行产品服务、完整 benchmark、数据库/provider 集成、全量外链爬取、
全论文精读或数据资产审计；新增笔记保持 seed。旧 archive 保留原抓取日期，并将
后续 release 记录标为补充，不能把历史正文说成重新抓取的完整当前产品描述。
