---
title: Karpathy — LLM Wiki / personal AI memory pattern
source: 多来源(Karpathy 个人访谈、X 帖、Obsidian 社区整理)
date: 2026-05-07
domain: memory
ymem_modules:
  - ingest-adapter
  - semantic-dedup
  - publisher
evidence_level: medium (concept / workflow, no benchmark)
code_available: no
license: n/a
status: working-notes
language: zh-CN
origin: 原 zhione/docs/research/karpathy-obsidian-memory-2026-05-07.md,2026-05-18 迁入本仓
---

# Karpathy 关于个人化 AI 记忆、Obsidian 与 LLM Wiki 的研究记录

## Relevance to Ymem(2026-05-18 补充)

Karpathy 的 LLM Wiki 模式

```text
raw sources -> LLM-maintained wiki -> human / agent reads wiki
```

对 Ymem 的影响:

- Wiki 层是"比 raw sources 更干净、可 lint、可审计的中间表示" —— 这对应
  Ymem 的 canonical memory(去重 + provenance + valid-time)
- Obsidian 是 human-facing shell,**不是** memory kernel 本身 —— 强化了
  Ymem(kernel)与 ZhiOne(host app)的边界
- "LLM 维护 wiki"的角色对应 Ymem `consolidate`:产 diff 候选而非就地改文档
- ZhiOne 相比 Karpathy LLM Wiki 需要补充的能力(semantic dedup、provenance、
  memory type gating、valid time / confidence / trust 等)正好是 Ymem 的责任
  范围

下文为 2026-05-07 的原始研究记录,保留备查。

---


## 1. 本轮搜索目标

用户提出：之前 Karpathy 对个人化 AI 记忆，以及如何联合 Obsidian，有专门的文章和访谈，需要搜索和阅读。

本轮优先寻找一手材料，其次参考社区整理和访谈式解读。重点不是泛泛讨论 Obsidian，而是理解 Karpathy 如何把：

- 个人知识库
- 本地 Markdown 文件
- Obsidian
- LLM 维护的 wiki
- personal AI memory

组合成一种新的知识工作流。

## 2. 主要一手来源

### 2.1 LLM Wiki

来源：[Andrej Karpathy, LLM Wiki, GitHub Gist, 2026-04-04](https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f)

这是本轮最重要的材料。Karpathy 在这里提出的不是普通 RAG，而是一种由 LLM 持续维护的 Markdown wiki 工作流。

核心结构可以概括为：

```text
raw sources -> LLM-maintained wiki -> Obsidian / human / agent reads wiki
```

关键目录和文件：

```text
raw/       原始材料，不修改，作为事实来源
wiki/      LLM 维护的 Markdown 知识层
index.md   wiki 内容目录，帮助定位知识页
log.md     ingest / query / lint 等操作记录
CLAUDE.md  给 LLM 的操作协议和维护规范
```

Karpathy 的核心比喻可以理解为：

```text
Obsidian 是 IDE
LLM 是程序员
Wiki 是代码库
```

也就是说，wiki 不是人手工维护的笔记集合，而是 LLM 按照协议不断编译、重构、更新的知识代码库。Obsidian 负责提供人类友好的浏览、编辑和 graph view。

### 2.2 Obsidian / file-over-app 软件哲学

来源：[Karpathy on Obsidian, 2024-02-24 原帖镜像](https://bird.makeup/%40karpathy/1761467904737067456)

Karpathy 对 Obsidian 的兴趣不只是“好用的笔记软件”，而是它代表了一种软件哲学：

- 数据是本地 Markdown 文件
- 应用只是文件之上的编辑和渲染层
- 可以用 Git、脚本、插件、LLM 等任意工具组合
- 没有强锁定，用户始终拥有文件

这对 ZhiOne 很关键，因为 ZhiOne 的近期路线也不应该先替代 Obsidian / VS Code / Markdown，而是作为旁路索引和记忆内核运行。

### 2.3 Append-and-review note

来源：[The append-and-review note, 2025-03-19](https://karpathy.bearblog.dev/the-append-and-review-note/)

这篇文章体现了 Karpathy 在个人记忆系统上的另一个重要偏好：极简、低摩擦、持续 review。

他的早期工作流可以概括为：

```text
所有想法 append 到同一个 note 顶部
定期 review
重要内容被重新带回顶部
不重要内容自然下沉
```

这里的重点不是复杂分类，而是减少维护成本。对 ZhiOne 的启发是：memory 系统不能靠用户长期手动整理来成立，必须把大部分 bookkeeping 交给系统，同时保留人类 review / approve / override 的通道。

## 3. Karpathy 方法的核心判断

### 3.1 不是每次从 raw docs 做 RAG

普通 RAG 常见路径是：

```text
raw documents -> retrieve chunks -> answer
```

Karpathy 的 LLM Wiki 更像：

```text
raw documents -> compile / update wiki -> query wiki
```

差异在于：知识不是每次临时拼出来，而是被持续整理成一个可浏览、可维护、可 lint 的中间层。

### 3.2 Wiki 是中间表示，不是最终应用

LLM Wiki 的 wiki 层类似编译产物：

- 比 raw sources 更干净
- 比最终回答更稳定
- 可以反复更新
- 可以被人检查
- 可以被 Agent 读取

这和 ZhiOne 讨论中的 canonical memory layer / Context Engine 非常接近。

### 3.3 Obsidian 的价值是 human-facing shell

Obsidian 在这套模式里不是 memory kernel 本身，而是一个成熟的人类界面：

- 浏览 Markdown
- 看链接和 graph view
- 手动修正
- 作为本地文件工作流的一部分

这说明 ZhiOne 近期不必先做大而全 UI。可以先输出或维护 Markdown 视图，让 Obsidian 承担 human-first 展示层。

### 3.4 需要操作协议

Karpathy 的 `CLAUDE.md` / schema 思路说明，LLM 维护知识库必须有明确协议。否则 LLM 会随意摘要、重复创建页面、丢失来源、混淆新旧信息。

对 ZhiOne 来说，这对应一套更正式的 memory operation contract：

```text
ingest
query
update
merge
supersede
expire
lint
audit
```

## 4. 与 ZhiOne 的关系

Karpathy 的方法是 ZhiOne 的强相关先例，但二者的层级不同。

### 4.1 Karpathy LLM Wiki 解决的问题

它主要解决：

- 如何把 raw sources 编译成持续维护的 Markdown wiki
- 如何让 LLM 帮人维护个人知识库
- 如何结合 Obsidian 作为浏览和编辑界面
- 如何避免每次查询都从原始文档重新理解

可以概括为：

```text
personal knowledge compilation pattern
```

### 4.2 ZhiOne 想进一步解决的问题

ZhiOne 更偏底层 Agent Memory Kernel，需要进一步覆盖：

- semantic dedup
- provenance
- memory type gating
- valid time / confidence / trust
- participation control
- context budget management
- Context Pack API
- audit UI
- multi-agent shared memory
- memory abstain / mute / deprioritize
- benchmark and regression loop

可以概括为：

```text
local agent memory governance layer
```

## 5. 对 ZhiOne 的直接启发

### 5.1 近期不要先做复杂 UI

优先做本地 sidecar / CLI / MCP / Markdown output。人类可视层先借 Obsidian、VS Code、普通 Markdown 预览。

### 5.2 先有 schema，再谈智能

ZhiOne 的最小可用版本必须先定义清楚：

- 输入是什么
- 记忆单位是什么
- 来源如何保存
- 更新如何发生
- 重复如何合并
- 过期如何表达
- Agent 如何请求上下文
- 为什么某条记忆被使用如何解释

### 5.3 Wiki 可以作为第一种 human-facing view

ZhiOne 的 canonical layer 不一定一开始就是完整数据库。可以先用 Markdown wiki / generated memory pages 作为可审计输出：

```text
canonical memory store -> generated wiki view -> Obsidian
```

或者在更轻的 MVP 中：

```text
raw files -> indexed memory events -> context packs + generated audit markdown
```

### 5.4 Lint / audit 是核心能力，不是附属功能

Karpathy 把 wiki health check 纳入流程。ZhiOne 应该把下面能力作为核心：

- 重复检测
- 来源缺失检测
- 冲突检测
- 过期信息检测
- 未使用高权重记忆检测
- 不该参与却被使用的记忆检测

### 5.5 人类角色是 curator / reviewer

人不应该长期手动维护所有 memory 页面。合理分工是：

```text
人类：选择来源、给方向、审批关键变更、裁决冲突
LLM / ZhiOne：提取、去重、更新、生成视图、记录 trace
```

## 6. Karpathy 方法的缺口

这些缺口也是 ZhiOne 的机会。

### 6.1 缺少完整 memory governance

LLM Wiki 更像知识编译系统，还不是完整记忆治理系统。它没有系统化处理：

- memory mode
- scope gating
- type gating
- should_use_memory
- memory abstain
- mute outside scope
- participation side effects

### 6.2 缺少标准 Context Pack API

LLM Wiki 适合被人和 LLM 读取，但没有抽象成标准接口：

```text
RetrievalRequest -> RetrievalResponse -> ContextPack
```

ZhiOne 如果要服务 Claude Code、OpenClaw、Codex、cowork 类本地 Agent，就需要这个接口层。

### 6.3 去重仍偏 wiki 层

Karpathy 的 wiki 可以减少 raw sources 重复理解，但 semantic dedup、supersede、expire、merge 仍需要更明确的数据模型。

### 6.4 多 Agent 记忆共享没有充分展开

LLM Wiki 更像个人知识库模式。ZhiOne 需要考虑多个 Agent 共享同一套本地记忆时的：

- 权限
- scope
- session trace
- agent-specific scratch
- shared semantic memory
- conflict resolution

## 7. 建议写入 ZhiOne 后续路线

可以把 Karpathy LLM Wiki 放在 ZhiOne 文档中的“开源/思想近邻”章节，定位如下：

```text
Karpathy LLM Wiki 是一个优秀的 personal knowledge compilation pattern：
它证明了 raw sources -> LLM-maintained Markdown wiki -> Obsidian 的工作流可行。

ZhiOne 在此基础上进一步下沉：
从 wiki compilation 走向 local agent memory kernel，
重点解决 memory governance、context packing、participation control 和 multi-agent access。
```

## 8. 可转化为产品原则

1. 文件优先，不急着替代用户工作流。
2. Obsidian 可以先作为展示层，而不是竞品。
3. LLM 维护的 Markdown wiki 可以作为早期 canonical view。
4. 所有 AI 写入必须可追溯。
5. 所有长期记忆必须可 lint。
6. 记忆进入回答前必须经过 scope / type / budget / mode gating。
7. 人类负责 review 和裁决，系统负责 bookkeeping。
8. 最小产品先证明“减少重复读取且提高可追溯性”，不要一开始做完整 memory OS。

## 9. 参考链接

- [LLM Wiki - Andrej Karpathy GitHub Gist](https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f)
- [Karpathy on Obsidian - 原帖镜像](https://bird.makeup/%40karpathy/1761467904737067456)
- [The append-and-review note](https://karpathy.bearblog.dev/the-append-and-review-note/)

