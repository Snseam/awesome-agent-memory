---
title: MemGPT
type: product
source: https://arxiv.org/abs/2310.08560
date_first_seen: 2023-10
domain: agent-runtime
business_model: OSS (论文 + 开源参考实现)
license: Apache 2.0(参考实现 letta-ai/letta,作为后继版本继承)
memory_modules:
  - retriever-reranker
  - dream-consolidator
status: full
last_revised: 2026-05-19
archive: archives/memgpt-overview.md
---

# MemGPT

## 1. 一句话定位

MemGPT(Packer 等, 2023)是把**操作系统的层次化内存隐喻**搬到 LLM 的开山论文
与参考实现,提出 LLM 通过 function call 自己"page in / page out"上下文。

## 2. 是什么 / 做什么

论文 **"MemGPT: Towards LLMs as Operating Systems"**(arXiv:2310.08560)的核心
论点:LLM 的 context window 类似 OS 的主内存,有限且昂贵;应该有一个"外部
内存 + 中断驱动的控制流"来管理超出 context 的内容。

具体机制:

- **Primary memory** — LLM 当前 context window 中的活跃内容
- **External memory** — 主 context 之外的持久存储
- **Function-call paging** — LLM 通过显式 function call(类似 OS 的 syscall)
  在两层之间移动信息
- **Interrupts** — 框架用中断管理 LLM 与用户之间的控制流

评测领域:文档分析(超过 base 模型 context 长度)、多 session 对话
(展示长期记忆与反思能力)。

作者:Charles Packer, Sarah Wooders, Kevin Lin, Vivian Fang, Shishir G.
Patil, Ion Stoica, Joseph E. Gonzalez(UC Berkeley)。

参考实现起初叫 `MemGPT`,2024 后期更名为 **Letta**(letta-ai/letta),作为
公司化产品继续演进(详见 [`letta.md`](letta.md))。

## 3. 关键技术选择

- **架构**:OS-style 层次化内存,而非"vector store + RAG"扁平模型
- **记忆 unit**:论文用 main context / archival memory / recall memory 三类;
  参考实现把它做成 **memory block**(persona / human / archival)
- **检索**:走 agent 自己调用的 tool(`memory_search` 等),而不是
  框架隐式注入
- **consolidation**:论文未做 dream-style 离线整理;参考实现里靠 agent 自身
  在对话中维护
- **eval 形态**:文档 QA + 多 session chat,而不是结构化 fact recall

## 4. 决策相关性 / Decision relevance

- **对照点**:MemGPT 是"显式 memory tool 调用"这一派的奠基,直接影响了
  memory kernel 选择"显式 ingest / retrieve / consolidate API"而非隐式中间件的
  决定
- **借鉴点**:
  - **memory block 分类**(persona / human / archival)对应到
    `MemoryRecord.kind`(profile / session / fact / procedure / trace)
  - **tool-call paging** 提示:agent 能主动决定"该读哪一段"比框架强塞
    更可解释
  - 把记忆与控制流挂钩(中断模型)指出 host-app 侧需要的事件接口
- **互补点**:MemGPT 把 memory 与 agent runtime 绑得紧;memory kernel 只做 library,
  控制流由 host app 管
- **不重叠 / 竞争点**:作为论文 MemGPT 是先行思想,不与本仓视角下的 kernel 竞争;作为
  产品其后继 Letta 才是直接对位(见 letta.md)

## 5. 适用 / 不适用场景

- **适用**:研究 long-context 替代方案、tool-style memory 的来源参考;
  说服团队"显式 memory ops 比隐式注入更可控"时的引用
- **不适用**:作为 production library 直接使用 — 原始 MemGPT 仓库已让位于
  Letta,该用 Letta;论文实现的 eval 范围有限,不适合作为通用 benchmark

## 6. 注意事项 / 风险

- **历史定位**:这是 2023 年的论文,产品形态早已演化(Letta),引用时需要
  把"论文 MemGPT"和"今日 Letta"区分开
- **数据规模**:原论文 eval 规模相对小,不能用来回答 2026 年的大规模长期
  记忆问题
- **page in/out 类比的边界**:OS 内存有明确的工作集与局部性假设,LLM 的
  attention 模式与之差异不可忽视,类比是启发不是证明
- **可比 benchmark**:论文使用的 eval set 与 LoCoMo / LongMemEval 不直接
  可比

## 7. 进一步阅读

- archive: [`archives/memgpt-overview.md`](archives/memgpt-overview.md)
- 论文:https://arxiv.org/abs/2310.08560
- 后继产品:[`letta.md`](letta.md) / https://github.com/letta-ai/letta

---

> *Ymem 项目对本笔记决策相关性的具体绑定见
> [`../ymem-binding/relevance-index.md`](../ymem-binding/relevance-index.md)。*
