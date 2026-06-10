---
title: Hy-Memory
type: product
source: https://hy-memory.com/
date_first_seen: 2026-05
domain: agent-memory-plugin
business_model: OpenClaw plugin / Hunyuan ecosystem
license: MIT (official site claim; source repository not resolved at fetch time)
memory_modules:
  - ingest-adapter
  - semantic-dedup
  - retriever-reranker
  - dream-consolidator
status: seed
last_revised: 2026-05-31
archive: archives/hy-memory-overview.md
---

# Hy-Memory

## 1. 一句话定位

Hy-Memory 是腾讯混元方向推出的 OpenClaw 共享记忆插件,主张把用户偏好、事实、
persona 与意图沉淀成可被多个 agent 共享的长期 memory core。

## 2. 是什么 / 做什么

官方站把 Hy-Memory 定位为基于腾讯混元高维认知记忆演化框架的 OpenClaw
shared memory plugin。它不是普通 chat history,而是把 raw traces、atomic
facts、identity profile、mind & intent 等层级合成一个 6-layer memory
kernel。

站点给出的安装入口是 OpenClaw marketplace:

- `openclaw plugins install openclaw-hy-memory --dangerously-force-unsafe-install`
- `openclaw hy-memory init`
- `openclaw gateway restart`
- `openclaw hy-memory status`

它通过 sidecar Python process 运行,默认向 OpenClaw pre-chat / post-chat
hook 暴露 auto-recall 与 auto-capture。

## 3. 关键技术选择

- **分层**:L1 raw traces、L2 atomic facts、L3 identity profile、L4-L6 mind
  & intent
- **写入**:对话后异步抽取事实与偏好
- **读取**:对话前自动 recall 并注入相关记录
- **存储**:示例配置使用 Chroma;每个 `userId` 是隔离的 memory namespace
- **模型依赖**:官方建议 Hunyuan 3.0 Preview 作为 extraction model,同时使用
  OpenAI-compatible API 和 BGE-M3 embedding

## 4. 决策相关性 / Decision relevance

- **对照点**:Hy-Memory 把"personalized multi-agent shared memory"作为显式
  产品目标,与单 agent session memory 不同。
- **借鉴点**:
  - pre-chat recall + post-chat async capture 是主流插件化 memory 的典型
    hook 设计。
  - `userId` 共享 namespace 对多 agent 记忆复用很直接。
  - 6-layer cognitive schema 可作为 persona / intent 层建模参考。
- **差异点**:当前更多是 OpenClaw 插件形态,不是通用 SDK;本仓 kernel 仍需
  维持 host-agnostic。

## 5. 适用 / 不适用场景

- **适用**:OpenClaw 用户;希望多个 agent 共享个人记忆;接受 Hunyuan/OpenAI
  compatible extraction pipeline 的长期协作 agent。
- **不适用**:非 OpenClaw runtime;强合规场景中不能接受 sidecar 执行权限;
  需要明确可审计 source repo 和 release provenance 的生产部署。

## 6. 注意事项 / 风险

- **代码来源边界**:截至 2026-05-31,官方站提供 GitHub Repository 链接位,
  但页面解析出的链接落到 GitHub 首页,未解析到具体仓库;因此本笔记只把官网
  与 OpenClaw 安装路径作为证据。
- **benchmark 自报**:LongMemEval / PersonaMem 数字来自官方站展示,尚未独立
  复现。
- **benchmark ledger**:LongMemEval 与 PersonaMem-v2 rows 见
  [`../benchmarks/claims/claims.yaml`](../benchmarks/claims/claims.yaml);
  其中 LongMemEval 记录为 [`../benchmarks/longmemeval.md`](../benchmarks/longmemeval.md),
  PersonaMem-v2 暂为 candidate。
- **安全开关**:安装命令需要 `--dangerously-force-unsafe-install`,说明插件会
  启动外部 Python sidecar,生产接入前必须做权限审计。

## 7. 进一步阅读

- archive: [`archives/hy-memory-overview.md`](archives/hy-memory-overview.md)
- 官方站:https://hy-memory.com/
- OpenClaw docs:https://memory.hunyuan.tencent.com/

---

> *Ymem 项目对本笔记决策相关性的具体绑定见
> [`../docs/ymem-binding/relevance-index.md`](../docs/ymem-binding/relevance-index.md)。*
