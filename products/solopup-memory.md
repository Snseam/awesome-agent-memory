---
title: SoloPup Memory
type: product
source: https://github.com/OakcoderX/solopup-memory
source_revision: 6664b3a37c33ea7272dd550592538f5c11c43c38
date_first_seen: 2026-11-01
last_revised: 2026-11-22
domain: coding-agent-memory
business_model: OSS plugin
license: MIT
evidence_class: product_behavior
status: seed
core_claim: A DeepSeek Harness plugin can retain source-linked text preferences and project decisions across sessions.
method_summary: Native writes and automatic capture feed scoped stores. Lexical search exposes current and historical records. Managed projections track source withdrawal.
required_assumptions: A compatible DSH host, local store and configured model route for write review.
benchmark_used: none assessed
cost_complexity: Local storage and configured model calls for review or capture.
memory_modules:
  - ingest-adapter
  - retriever-reranker
  - memorydiff-generator
archive: archives/solopup-memory-overview.md
---

# SoloPup Memory

SoloPup gives DeepSeek Harness (DSH) a dedicated text-memory plugin. Its public beta can admit a source, recall a current decision, expose a correction's history and withdraw a tracked source. The source and package evidence below supports a Tier A **seed** for host-specific memory. [Prerelease](https://github.com/OakcoderX/solopup-memory/releases/tag/v0.26.0-beta.3) · [Source and package record](archives/solopup-memory-overview.md)

## What persists

- **Write and scope.** Native writes check citations against owner messages and require an approved validation result. Automatic capture can also propose records. Pending proposals stay outside effective memory. Personal preferences can be global, while decisions can be scoped to a project. [Write validation](https://github.com/OakcoderX/solopup-memory/blob/6664b3a37c33ea7272dd550592538f5c11c43c38/native-write-validation.mjs#L8-L44) · [Documented lifecycle](https://github.com/OakcoderX/solopup-memory/blob/6664b3a37c33ea7272dd550592538f5c11c43c38/README.en.md#L98-L105)
- **Read and correct.** Markdown stores the index and topic text. Local ledgers keep evidence and revisions. The plugin ranks text by lexical overlap and exposes current and historical views. A captured replacement must identify one exact predecessor in the same scope. The model's interpretation of the correction still needs review. Paraphrases and cross-language queries can miss. [Storage and retrieval limits](https://github.com/OakcoderX/solopup-memory/blob/6664b3a37c33ea7272dd550592538f5c11c43c38/README.en.md#L129-L137) · [Lexical ranker](https://github.com/OakcoderX/solopup-memory/blob/6664b3a37c33ea7272dd550592538f5c11c43c38/retrieval.mjs#L14-L42) · [Revision check](https://github.com/OakcoderX/solopup-memory/blob/6664b3a37c33ea7272dd550592538f5c11c43c38/capture-revision.mjs)
- **Withdraw.** A SQLite coordinator tracks source withdrawals across managed projections. Withdrawal can stop when a different source supports the same effective text. The plugin reapplies withdrawal controls during reviewed restore. Original chats, remote provider copies and external backups have separate lifecycles. A Markdown-only export omits the ledgers and coordinator needed for recovery. [Withdrawal implementation](https://github.com/OakcoderX/solopup-memory/blob/6664b3a37c33ea7272dd550592538f5c11c43c38/withdrawal.mjs) · [Storage boundaries](https://github.com/OakcoderX/solopup-memory/blob/6664b3a37c33ea7272dd550592538f5c11c43c38/README.en.md#L129-L135)

## Evidence and open questions

The package declares Node 24.9 or later and DSH `>=0.2.1-rc.0 <0.3.0`. Native writes need model approval. A missing review route leaves the candidate uncertain. The maintainer reported real-model fresh-chat recall on macOS for the submitted `0.21.0-beta.2`. The Linux example uses a fictional message and stubbed approval in separate Node processes. Recall quality across languages, behavior when the model misreads a source, and withdrawal after a real restore still need independent testing. [Package manifest](https://github.com/OakcoderX/solopup-memory/blob/6664b3a37c33ea7272dd550592538f5c11c43c38/package.json#L207-L210) · [Earlier macOS host check](https://github.com/OakcoderX/solopup-memory/blob/6664b3a37c33ea7272dd550592538f5c11c43c38/RELEASE.md#L90-L99) · [Scripted-host example](https://github.com/OakcoderX/solopup-memory/blob/6664b3a37c33ea7272dd550592538f5c11c43c38/README.en.md#L83-L96) · [Host and storage limits](https://github.com/OakcoderX/solopup-memory/blob/6664b3a37c33ea7272dd550592538f5c11c43c38/README.en.md#L129-L137)
