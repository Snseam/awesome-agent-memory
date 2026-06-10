---
title: Kinic
type: product
source: https://www.kinic.io/
date_first_seen: 2025
domain: personal-ai-memory
business_model: consumer app / browser plugin / tokenized datastore
license: proprietary
memory_modules:
  - ingest-adapter
  - retriever-reranker
  - security-privacy
status: seed
last_revised: 2026-05-31
archive: archives/kinic-overview.md
---

# Kinic

## 1. 一句话定位

Kinic 是一个个人 AI memory / personal vector database 产品,强调用户拥有和
控制自己的 bookmarks、emails、notes、documents,再把这些数据交给 AI agent
检索。

## 2. 是什么 / 做什么

Kinic 通过浏览器插件收集用户资料,包括 bookmarks、emails、notes 等,形成可
搜索的个人 memory。官网把它描述为"cryptographically secure, searchable
memory for AI"。

产品叙事里有两个重点:

- 用户自有 datastore,可更新/删除,用 biometric login 管理 key
- Kinic vector DB 运行在 Internet Computer,强调 tamper-proof 与 zero-knowledge
  privacy preserving technology

它也提出"AI Memory Economy":专家或创作者可以出租 / 分享自己的 AI memory
store。

## 3. 关键技术选择

- **存储**:个人 canister smart contract / Kinic vector DB
- **采集**:browser extension 一键写入
- **隐私**:cryptographic ownership、zero-knowledge、biometric key 管理
- **检索**:trusted AI-powered queries / vector database

## 4. 决策相关性 / Decision relevance

- **对照点**:Kinic 把 memory ownership 与可验证 datastore 结合,代表了
  web3 / verifiable AI memory 路线。
- **借鉴点**:
  - "memory store 可共享 / 可出租"提示 memory kernel 需要清晰的授权与
    provenance 边界。
  - browser plugin 作为 ingest adapter 很适合个人 memory bootstrapping。
  - tamper-proof datastore 是审计叙事的一个极端版本。
- **差异点**:blockchain/token 设计不是本仓 kernel 的默认方向,只能作为
  ownership / portability 对照。

## 5. 适用 / 不适用场景

- **适用**:个人 PKM、creator memory store、想要可验证数据所有权的用户。
- **不适用**:企业内部 agent memory;需要传统数据库和合规采购链路的团队;
  不接受 token / blockchain 基础设施的用户。

## 6. 注意事项 / 风险

- **技术栈偏窄**:Internet Computer 与 token 机制会限制主流企业采用。
- **产品成熟度**:官网显示插件已可用,完整 app 仍需继续跟踪。
- **合规复杂度**:把个人资料放进链上相关基础设施,需要单独评估隐私和删除权。

## 7. 进一步阅读

- archive: [`archives/kinic-overview.md`](archives/kinic-overview.md)
- 官方:https://www.kinic.io/
- Blog:https://www.kinic.io/blog/the-ai-memory-economy

---

> *Ymem 项目对本笔记决策相关性的具体绑定见
> [`../docs/ymem-binding/relevance-index.md`](../docs/ymem-binding/relevance-index.md)。*
