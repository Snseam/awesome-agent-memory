---
title: JiuwenMemory
type: product
source: https://github.com/openJiuwen-ai/agent-memory
date_first_seen: 2026-11-13
domain: agent-memory-layer
business_model: OSS
license: Apache-2.0
memory_modules:
  - ingest-adapter
  - dream-consolidator
  - retriever-reranker
  - policy-privacy
status: seed
last_revised: 2026-11-16
archive: archives/jiuwen-memory-overview.md
---

# JiuwenMemory

## 1. 一句话定位

JiuwenMemory is an open-source memory layer for agents with hierarchical,
temporal, document, and MCP-oriented control surfaces.

## 2. 2026-11 release signal

The official `v0.2.1` release dated 2026-11-13 describes hierarchical memory
with parent summaries and expandable evidence, schema-temporal and entity-axis
retrieval, background tree construction, document memory, MCP access, and
context-aware query rewriting. The release notes indicate that several of
these features are opt-in and preserve prior behavior by default.

## 3. Evidence boundary

The release page and repository support product-behavior and licensing claims.
They do not support maturity, quality, security, or benchmark superiority.

## 4. Decision relevance

- `dream-consolidator`: background hierarchy construction is an explicit
  consolidation path.
- `retriever-reranker`: schema-temporal and entity-axis retrieval expose
  multiple retrieval dimensions.
- `policy-privacy`: the repository and release should be checked further for
  authorization and audit semantics before deployment conclusions.

## 5. Caveats

No code audit, data audit, independent reproduction, or runtime test was
performed in this weekly refresh.

## Sources

- Release: https://github.com/openJiuwen-ai/agent-memory/releases/tag/v0.2.1
- Repository: https://github.com/openJiuwen-ai/agent-memory
