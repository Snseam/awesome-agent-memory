---
title: Memory lifecycle evaluation — from weekly signals to falsifiable questions
date: 2026-10-26
status: proposed
evidence_class: maintainer_synthesis_or_inference
execution_status: not_executed
language: zh-CN
---

# 从周报信号到可证伪的记忆实验

本页把 2026-09-21 至 2026-10-26 的论文、产品和基准线索整理为实验提案。
**以下场景、优先级和验收条件是维护者综合判断，尚未执行。** 它不是新 benchmark、
产品排行榜或已验证的实现方案。产品 release 支持“上游记录了什么行为”；论文与
基准笔记中的原始结果也不等于独立复现。

共同问题是：**记忆在被写入、派生、检索、修正和删除后，是否仍保持正确的使用
边界，并确实改善后续任务？** 仅提高召回率，不能回答权限、过期状态、删后残留、
并发覆盖或成本是否可接受。

## 1. 把“相关、允许、足够”拆开验证

依据：[Audience-Bound Persistent Memory](../papers/audience-bound-persistent-memory.md)、
[retrieval admissibility](../papers/right-memory-wrong-context-admissibility.md)、
[evidence sufficiency](../papers/relevance-not-sufficiency-evidence-gap.md)，以及
[Hindsight](../products/hindsight.md) 的读写 tag scope 与
[Graphiti](../products/graphiti.md) 的分组路由边界。

**假设：** 检索最相关的记忆，既不保证允许向当前调用者暴露，也不保证足以回答。

- 场景：在同一 bank 放入个人私有事实、团队可读规则和另一团队的同主题事实。
  设计一个需两条已授权事实联合回答的问题；让未授权事实在语义上更相似。
  再把个人与团队事实合成为摘要，检查派生条目的受众是否扩大。
- 对照：固定模型、语料、embedding、候选数和上下文预算，比较 relevance-only
  检索、带明确授权判定的检索、以及授权后按证据完整性组装上下文。未经授权
  的对照只运行在合成数据沙盒，不连接真实用户资料。
- 指标：分别统计未授权条目进入工具响应、模型上下文和最终答案的次数；另记
  已授权证据集覆盖率、完整答案率、缺证据时的适当拒答率。不能只检查最终答案。
- 失败信号：最终答案正确但私有内容已进入模型上下文；`group_id` 被调用者任意
  更改即可越权；过滤后不足的证据被当作完整证据回答。

缺口：先明确授权 oracle、派生受众规则和 host 的鉴权实现。Graphiti reference
server 的路由参数不能充当访问控制；Hindsight 的 tag hooks 也不替代 bank 级策略。

## 2. 时间正确性与并发正确性需要不同的时钟和观察点

依据：[Mem0](../products/mem0.md) 的 Platform 时间控制、
[Hindsight](../products/hindsight.md) 的 consolidation/append 变更与
[MINTEval](../benchmarks/minteval.md) 的更新干扰任务。

**假设：** 能查历史不等于能回滚；保留当前标签的修复不等于所有后端具有原子 CAS。

- 时间场景：按“发生早、晚到达”的顺序导入两条相互更新的事实；区分 event time、
  ingestion time、查询 reference time。分别查询当前状态、指定历史窗口和到期条目，
  检查 expiry、supersession、物理删除各自的语义。
- 并发场景：用同步屏障停住 consolidation 的读取阶段，人工修改目标 observation
  标签，再恢复写入；另对同一 document 并发 append，并以另一 document 的独立
  写入作干扰。记录读到的版本、最终标签/内容、重试及错误。
- 对照：时间场景固定输入，仅改变导入顺序或 reference time；并发场景比较串行与
  指定交错顺序，分别记录 store-owned 和 external-store 路径，不能混成一个结果。
- 指标：当前/历史答案错误率、过期条目的意外曝光、标签回退、丢失 append、重复
  append、重试次数及延迟；每次保留操作序列与最终状态以便重放。
- 失败信号：并发写恢复了已移除的标签；无关文档写入使目标 append 丢失；把
  `history()` 展示的变更误报成可执行 rollback 或事务时间快照。

缺口：先固定每个适配器的时态契约与后端能力。Mem0 时间文档的 Platform 范围、
project-level decay 设置和 OSS 支持范围应分开记录，不推断 API 等价。

## 3. 从删除对象拓展到删除派生证据，同时保留无关知识

依据：[Bemula](../benchmarks/bemula.md)、[MemCut](../benchmarks/memcut.md) 与
[Graphiti](../products/graphiti.md) v0.31.2 的 episode 删除及摘要重建边界。

**假设：** 直接记录不可检索，不代表秘密不能从残存摘要、关系或属性中恢复。

- 场景：两个 episode 共同支持一个事实，其中一个还含合成秘密。先删一个 episode，
  再删最后一个；另注入摘要重建失败。检查事实保留、provenance、摘要及属性的状态。
  使用旁路 QA 测试剩余证据能否重构秘密，再检查不相关事实是否仍可用。
- 对照：同一初始状态下比较无删除、仅直接对象删除和产品声明支持的完整删除流程。
  正常 API 检索与沙盒中有授权的存储检查分开报告，后者不能伪装成普通攻击者能力。
- 指标：直接记录残留、正常检索恢复、可访问派生证据恢复、无关知识保留，以及删除
  后重新明确写入同一事实的可学习性；以秘密/请求为单位报告，不平均成单一“遗忘分”。
- 失败信号：删掉唯一来源后秘密仍在摘要中；重建失败被隐藏成删除成功；删掉共享
  来源时连无关的存活事实也丢失。

缺口：明确承诺覆盖的存储对象、日志、备份和副本范围，以及故障时的可见性策略。
Graphiti 的重建失败可能保留旧摘要，entity attributes 不随之重建；这应成为测例，
不能把 release 修复概括成完整安全擦除。Bemula/MemCut 的原始协议和许可仍需分别审查。

## 4. 将事实召回与后续行为收益、迁移和总成本分开

依据：[MCCL](../papers/mccl-memory-centric-continual-learning.md)、
[FrontierMemory](../benchmarks/frontiermemory.md) 与
[Persistent Memory in Multi-Agent Inference](../papers/persistent-memory-multi-agent-inference-cost.md)。

**假设：** 记得更多事实可能不改善动作；任务本来不需要历史时，无收益也不能证明
记忆普遍无效。一次任务重试不是一次独立的记忆构建实验。

- 场景：从固定训练轨迹构建记忆，冻结后测三个互不混淆的任务组：原技能保留、
  规则改变后的适应、未见任务的迁移。另设当前输入已含全部证据的负对照任务。
- 对照：同一 task model、版本、reasoning effort、工具、任务与解题预算，比较无记忆、
  固定预算原始历史/RAG、候选记忆；先保持策略不变，再单独测记忆管理策略变化。
  更换生成模型或扩大预算必须另设实验组，不能归因给记忆机制。
- 指标：逐任务成功/失败、旧技能回退、变更后错误动作、迁移成功，以及整个生命周期
  的 token、模型调用、存储、延迟和费用。写入/构建成本与每次查询成本分别列出，再按
  明确复用次数摊销；不给不同任务或不同预算的结果做混合排行榜。
- 重复性：分别记录独立 memory-generation run 和同一 memory artifact 下的 task
  attempt；保存 artifact hash、任务版本、失败轨迹、judge 配置和随机种子。报告
  配对差异及其不确定性，不能把同一记忆上的重试当作独立样本扩大证据量。
- 失败信号：只在召回指标上提高；换了更强 task model 后才出现收益；构建成本被遗漏；
  训练轨迹泄露测试答案；一个偶然成功的 memory artifact 被当作稳定提升。

缺口：FrontierMemory 是 Letta-origin、离线生成、15 个下游任务的协议，语料访问有
条件，三个 APEX verifier 使用 LLM judge。采用其任务前需核查语料条款、任务许可和
公开运行轨迹；本页不把上述扩展实验称为官方 FrontierMemory 协议或完整复现。

## 5. 把工作记忆开关、长期写入与身份迁移作为组合场景

依据：[OpenViking](../products/openviking.md) v0.5.2 的 Working Memory、长期
抽取和迁移说明；它们是产品文档行为，尚无本仓独立运行结果。

**假设：** 关闭上下文摘要不能用来推断长期记忆停止写入；检索成功不能证明迁移后
记录仍属于正确用户。

- 场景：在同一合成会话上对比 Working Memory 开/关，分别观察原始消息归档、
  长期抽取、checkpoint/摘要和下一会话召回。再迁移带 mixed-script 用户名和
  模糊旧目录归属的样本；归属未决的样本应显式隔离等待决定。
- 对照：固定版本、抽取器和输入，只改变 WM 开关；迁移前后用相同授权矩阵、
  record IDs、内容校验值与受众做逐项比对。迁移测试和正常新增测试分开记录。
- 指标：各写入层是否发生、跨会话可用性、归属变化、记录丢失/重复和跨用户曝光。
- 失败信号：以 WM 关闭误标“无长期采集”；迁移自动猜测身份导致串户；调用入口
  的密钥限制被当成所有下游数据访问都已经授权。

缺口：需要可复现的旧版 fixture、升级路径和明确归属策略。此方向不替代完整的
备份恢复、隐私审计或 SDK 集成验收。

## 公共协议的接入边界

合成 fixture 用来定位错误；扩大规模时，按待证问题选择协议，不把所有数据集拼成总分。

| 待证问题 | 可进一步核查的协议 | 采用前必须固定的边界 |
|---|---|---|
| 累积状态是否算对、更新是否保留 | [Ledger-QA](../benchmarks/ledger-qa.md) | 分开 Generalist transfer 与 Specialist 训练；公开 200 行训练集不等于冻结测试集；原协议 EM 的标点清理/token-set 比较不等于数值相等，另加算术 oracle 时须标注为自定义诊断 |
| 写入、维护、检索、使用哪一阶段失效 | [WorldMemArena](../benchmarks/worldmemarena.md) | v2 PDF/数据卡为 461，landing abstract 为 400；固定 revision 与子集；answer-only 基线缺少阶段指标不能补零；CC-BY-NC-4.0 数据许可与 MIT 代码许可分开 |
| 轨迹生成的记忆是否改善下游任务 | [FrontierMemory](../benchmarks/frontiermemory.md) | 正式提交要求三次独立生成、每 run 每任务三次尝试；基础设施缺 reward 与任务失败分开；hosted receipt 不等于完整轨迹和网络隔离证据 |

上述协议都仍是 seed 笔记。使用可见代码或通过本地 smoke check，不等于取得冻结
测试集、完成独立复现或获得官方榜单验收。

## 最小实验集与执行顺序

以下是本页建议的工作顺序，**不是已安排或已经运行的任务**。先用合成数据建立
可判定结果的 fixtures，再决定是否投入大型公开 benchmark。

| 优先级 | 最小 case | 必须留下的证据 | 进入下一步的条件 |
|---|---|---|---|
| P0 | A1：相似但未授权；A2：已授权但证据不足 | 授权 oracle、工具响应、模型上下文、最终答案 | 能区分曝光失败、证据不足和回答错误 |
| P0 | D1：多来源/最后来源删除；D2：重建失败 | 删除前后对象与 provenance、恢复问答、无关事实控制 | 删除承诺范围和失败状态明确可观察 |
| P1 | T1：乱序事件与到期；C1：retag/append 交错 | 时间契约、操作序列、后端路径、最终状态 | 可重放且不混淆历史可见性与回滚 |
| P1 | U1：无记忆配对任务 + 不需历史的负对照 | 模型/预算、memory artifact、逐任务轨迹、全链路成本 | 存在可检验的记忆收益机会，且能分离模型/预算混杂 |
| P2 | M1：WM 开关 × 身份迁移 | 分层写入记录、迁移归属表、授权前后比对 | 有明确目标产品版本及受支持迁移 fixture |

每组先产出协议和失败样例；执行后才按 [Research Radar](research-radar.md) 写
ImpactReport，记录实验环境、观察结果和适用边界。没有执行证据时保持 `proposed`，
不新增 benchmark 成绩、独立复现或产品成熟度结论。
