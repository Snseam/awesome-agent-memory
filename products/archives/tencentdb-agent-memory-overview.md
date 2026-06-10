---
source_url: https://cloud.tencent.com/product/agm
source_repo: https://github.com/Tencent/TencentDB-Agent-Memory
fetched: 2026-05-31
purpose: research backup; canonical sources are the URLs above
---

# TencentDB Agent Memory — snapshot

## Positioning

Tencent Cloud presents Agent Memory as a managed memory service for agents. It is
intended to preserve business knowledge and user/context continuity across
sessions, long-running tasks, and multi-task agent workflows.

## Product Claims

- L0-L3 progressive memory architecture: raw conversation, key information,
  scenario summaries, and user persona.
- Embedding + dual retrieval for semantic and keyword recall.
- Global memory resource management and visual administration.
- Context offloading for long tasks; the product page reports token reduction
  and completion-rate improvements from Tencent lab tests dated 2026-04.

## Open-Source Repo Snapshot

`Tencent/TencentDB-Agent-Memory` describes a local-first implementation using
layered artifacts:

- L0 conversation records
- L1 atomic memories
- L2 Markdown scenario blocks
- L3 persona profile
- Mermaid task canvas for short-term context offloading

Repository metadata fetched 2026-05-31: roughly 4.4k stars, 370 forks, latest
release `v0.3.6` published 2026-05-28.

## Evidence Boundary

Performance numbers are official self-reported claims unless separately
reproduced. The cloud product and OSS repo should be evaluated as related but
distinct delivery forms.
