---
title: Claude Dreams — offline memory consolidation
source: https://platform.claude.com/docs/en/managed-agents/dreams
date: 2026 (ongoing)
domain: memory
memory_modules:
  - dream-consolidator
  - memorydiff-generator
evidence_level: medium (production product, no public benchmark numbers)
code_available: no (proprietary)
license: proprietary
status: seed
last_revised: 2026-07-27
---

# Claude Dreams

## Core idea

Agent 工作时写 memory 是局部和增量的。长期会积累重复、矛盾、过期条目。Dreams
作为离线 job,读取 memory store 和过去 sessions,**生成一个新的整理后 memory
store**。原输入 store 不被直接修改,便于审核和丢弃。

## 2026-06 product note

Anthropic/Claude 侧需要分开看两条线:

- **Claude Code memory**:官方 docs 将 `CLAUDE.md`、repo-local `MEMORY.md` 和 auto
  memory 文档化,并给出 Claude Code v2.1.59+ 的 auto memory 要求。它是 coding-agent
  host memory,对本仓产品全景的 Coding & Dev agents 类更直接。
- **Claude app memory**:release notes 显示 consumer/team app memory 扩展到更多 plan,
  但它更像 chat-app vendor memory,不等同于 agent memory platform。

本文件继续保留 Dreams/offline consolidation 的 architecture signal;Claude Code memory
后续可单独拆成产品 note,如果公开 docs 稳定且与 `CLAUDE.md`/`MEMORY.md` 形成清晰
agent-memory lifecycle。

## Architectural takeaways

```text
Agent 使用 ContextPack
-> 产生 trace / session transcript
-> offline dream job 整理知识
-> merge duplicates / resolve stale / find contradictions / surface insights
-> 生成候选 MemoryDiff
-> 人审或规则门控后进入 canonical layer
```

## Decision relevance

这是 memory kernel `consolidate` API 设计的**直接参考来源**。kernel 采纳了 Dreams 的核
心原则:

1. **不就地 mutate**:整理产物是 `MemoryDiff[]` 候选,canonical store 由 host
   app 决定是否接受
2. **离线**:`consolidate` 不在 retrieve 的热路径上
3. **可审计**:每个 diff 必须能解释依据

不采纳的部分:

- Dreams 是 Anthropic 内部产品形态,kernel 不绑定到任何 LLM 提供商
- Dreams 的生成模型是黑盒;kernel 倾向于把"规则检测 + LLM 辅助"两层分开,规则
  层可解释

## Open questions

- Dreams 在生产中如何处理生成失败 / 部分 diff 的回滚?
- Dreams 的 trigger 是定时还是事件驱动?对 `consolidate` API 形态有影响。

## Notes

### 2026-07 platform memory-store update

Claude Platform 2026-07 release notes 增加 `agent-memory-2026-07-22` beta header。
该 header 改变 memory-store list 语义:server-defined stable order、`depth` 取值
限制、`path_prefix` segment matching、cursor 不兼容旧 header,并要求 SDK 对
memory-store calls 使用新 header。该更新属于 Managed Agents memory-store API 行为,
与 Dreams/offline consolidation 相邻但不等同。

本仓暂不拆新产品 note:Claude Dreams 仍记录 offline consolidation architecture
signal;memory-store API 后续如公开更多 lifecycle / store schema / governance docs,
再考虑拆分为 Claude Managed Agents Memory。

---

> *Ymem 项目对本笔记决策相关性的具体绑定见
> [`../docs/ymem-binding/relevance-index.md`](../docs/ymem-binding/relevance-index.md)。*
