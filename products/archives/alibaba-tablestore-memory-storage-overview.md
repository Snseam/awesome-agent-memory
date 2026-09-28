---
source_url: https://www.alibabacloud.com/help/en/tablestore/memory-storage-service-sub-product-test/memory-storage-overview
source_management: https://www.alibabacloud.com/help/en/tablestore/memory-storage-service-sub-product-test/manage-memory-stores
source_dream: https://www.alibabacloud.com/help/en/tablestore/memory-storage-service-sub-product-test/memory-consolidation-dream
fetched: 2026-09-28
purpose: research backup; canonical sources are the URLs above
---

# Alibaba Cloud Tablestore Memory Storage Service - source snapshot

Official Tablestore pages displayed a 2026-09-24 update date when checked on
2026-09-28. This note preserves a short paraphrase of their product behavior,
not a copy of the pages or an independent implementation test.

## Public surface

- AgentStorage memory stores accept messages or directly managed files. Message
  stores can emit structured memories, read-only generated files, or both.
- `AddMemories` persists raw messages and extracts long-term units asynchronously;
  `SearchMemories` combines semantic/text search with optional rerank and source
  evidence. Structured units support list/get/update/delete APIs.
- Scope names application, tenant, agent, and run. The docs disagree on whether
  `tenantId` is required in retrieval, so omit/default behavior remains unknown.
- Writable file memory has paths, versions, and conditional update behavior.
  Dream supports structured-memory proposals and automatic/plan modes, while
  file Dream writes to an output scope automatically.

## Evidence boundary

The pages are official product documentation. Scale, token-saving, and benchmark
figures are Alibaba claims; extraction accuracy and durability were not tested.
This is separate from the Model Studio Bailian Memory Library API and is not a
blanket alias for AgentLoop or Agent Run Memory Store.
