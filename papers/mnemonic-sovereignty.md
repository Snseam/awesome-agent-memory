---
title: Mnemonic Sovereignty — Toward a Security & Governance Framework for Agent Memory
arxiv_id: 2604.16548
source: arXiv:2604.16548
date: 2026-04
domain: security
core_claim: |
  agent memory 必须被作为一类一等公民的安全客体管理,沿 Write / Store /
  Retrieve / Execute / Share / Forget 六阶段生命周期 × Integrity /
  Confidentiality / Availability / Governance 四目标的矩阵建立可形式化验证的
  "记忆主权"primitive。
evidence_level: medium
code_available: 未在 PDF 中明确说明
license: (未在 PDF 中明确说明)
local_pdf: pdfs/mnemonic-sovereignty.pdf
memory_modules:
  - security-privacy
  - dream-consolidator
  - memorydiff-generator
  - ingest-adapter
  - audit-ui
status: full
last_revised: 2026-05-19
---

# Mnemonic Sovereignty(arXiv 2604.16548)

## 问题陈述

Zehao Lin / Chunyu Li / Kai Chen(MemTensor)2026 年 4 月放出的 63 页综述。
PDF 第 1 章直接挑明:**主流 agent memory 论文(MemGPT、MemoryBank、Mem0、
MemOS、Collaborative Memory、CoALA)都把 memory 当成一个加速 retrieval 的工
具,而没人把它当成一个需要受治理的资产**。一旦 agent 被攻击、被监管追责、被
要求"删除某个用户的全部痕迹",现有 memory 系统几乎全部无招。作者把这套缺失
的工程能力命名为 **mnemonic sovereignty(记忆主权)**。

## 核心 claim

提出 **生命周期 × 目标** 矩阵:

- **6 阶段生命周期**:Write / Store / Retrieve / Execute / Share / Forget。
- **4 目标**:Integrity(写入不被篡改)、Confidentiality(读取不越权)、
  Availability(可用、可恢复)、Governance(合规、可审计、可追溯)。

并给出 5 个**可测试的 sovereignty primitive**(§4):

- **WA — Write Authentication**:写入路径必须 provenance 可验。
- **PV — Provenance Verification**:任一 memory item 可追溯到原始 trace。
- **PS — Provenance Selection**:retrieve 时按 provenance 过滤。
- **RB — Right of Being-forgotten**:可证明的删除。
- **VF_ε — Verifiable Forgetting (ε-statistical)**:基于 Hoeffding 不等式,
  用 n 个 probe 验证遗忘的统计可信度;PDF §5 给出参数:ε = 0.01、95% 置信下
  需 n ≈ 300 probe。

§6 给出 9 个**架构原语**(本 radar 抄录主要 6 项):Provenance ledger、
Capability-based access、Memory firewall、Forget oracle、Cryptographic
attestations、Audit trail。

## 方法 / 框架

PDF 的方法侧亮点有两块:

1. **跨学科桥接**(§3)— 把认知神经科学的四个现象引入:source-monitoring
   error(记忆来源混淆)、reconsolidation(每次 recall 都可能被改写)、
   social contagion(多 agent 间记忆污染)、confidence inflation(反复
   retrieval 会让置信度虚高)。这四个对 LLM agent 的 attack surface 直接对
   应:tool-poisoning、prompt-injection、cross-agent leakage、retrieve-
   amplified hallucination。

2. **架构对比**(§7)— 把 MemGPT / MemoryBank / Mem0 / MemOS / Collaborative
   Memory / CoALA 在 9 个 primitive 上打分,结论是**没有任何现有系统覆盖
   全部 primitive**;Mem0 在 Provenance ledger 上有 partial(因其 ADD /
   UPDATE / DELETE op),但 Forget oracle、Cryptographic attestation 几乎全
   部为 0。

## 评估 / benchmark

本身不提出 benchmark,但 VF_ε(verifiable forgetting)给出了**可量化的评估
协议**:在 stored memory 上 inject n 个 probe,删除后用同一 retrieval 接口
查询;若回想率高于 ε 即认为 forget 失败。这是 `security-privacy` 模块
可以直接实现的第一个测试套件。

## 决策相关性 / Decision relevance

- **把 `security-privacy` 列为 kernel-side 模块**,正是因为本论文揭示
  的主权缺口;taxonomy.md 末尾已经显式记录"主流三套 taxonomy 都不覆盖,本
  论文单独追踪"。
- **WA / PV / PS** 三条直接落到 `MemoryRecord` 的 `provenance` 字段与
  `ingest-adapter` 的 provenance 校验上。
- **RB / VF_ε** 是 `dream-consolidator` 的 forget 策略必须满足的合约,
  且为 `audit-ui`(host 侧)提供测试基线。
- §7 的 9-primitive 表可以作为 kernel 自评检查表:每发布一个版本应填一行,标
  注 covered / partial / not-yet。

## 优劣 / 注意事项

优势:
- 是 2026 H1 唯一一篇把"安全与治理"作为一等问题处理的 agent memory 论文;
  62 页扎实,引用面横跨认知科学、密码学、数据库审计。
- VF_ε 给出的统计-可验证遗忘协议是少见的**可执行 spec**。
- 跨学科 §3 章节是写 ImpactNote 的好素材,可作为对外宣传 `security-
  privacy` 必要性的文献支撑。

注意事项 / fabrication 风险:
- 9 architectural primitives 中至少 3 个(Cryptographic attestation、
  Forget oracle、Memory firewall)在工业界尚无成熟实现,引用时不应给出
  "已被验证有效"的暗示。
- VF_ε 的 n ≈ 300 是基于 Hoeffding 上界的 worst-case 估计,实际部署中可能
  显著更低或更高,实现时应自行做 power analysis,不能直接抄 300。
- §7 的对比表带作者主观打分,引用时应保留"according to Lin et al."的
  归因。

## 待跟进

- 实现一个 minimal VF_ε 测试 harness,挂到 `evaluator-benchmark` 的
  security 子套件下(v1 目标)。
- 跟踪 MemOS、Collaborative Memory 等 PDF 中提到的 system,补 stub。
- §3 跨学科四现象与 ConvoMem(papers/convomem.md)的 changing-facts /
  abstention category 有内在联系,值得做横向 ImpactNote。

---

> *Ymem 项目对本笔记决策相关性的具体绑定见
> [`../ymem-binding/relevance-index.md`](../ymem-binding/relevance-index.md)。*
