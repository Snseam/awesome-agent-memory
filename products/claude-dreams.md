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
last_revised: 2026-08-31
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

## 2026-08 product update

Anthropic's 2026-08-25 release notes add memory behavior for Claude Cowork and
the broader Claude app surface. The public product evidence says memory now
works across chat and Cowork cloud, Topics can be edited or deleted from
Settings > Memory, sensitive-topic memory is a separate opt-in, and default
enablement differs by plan: on for Free/Pro/Max and off by default for Team and
Enterprise.

This update is useful product-behavior evidence for memory governance and user
control. It does not disclose the Dreams implementation, and it should not be
treated as benchmark or architecture evidence beyond the documented product
surface.

> 来源:https://support.claude.com/en/articles/12138966-release-notes

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

(随产品迭代追踪)

---

> *Ymem 项目对本笔记决策相关性的具体绑定见
> [`../docs/ymem-binding/relevance-index.md`](../docs/ymem-binding/relevance-index.md)。*
