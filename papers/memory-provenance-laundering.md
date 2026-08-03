---
title: Memory Provenance Laundering in LLM Agents
arxiv_id: 2607.29167
source: arXiv:2607.29167
date: 2026-07
domain: security_privacy
core_claim: |
  Long-term memory consolidation can rewrite low-trust observations into
  apparently trusted user history or workflow support. The paper frames this as
  provenance laundering and proposes a non-amplification firewall for persistent
  memory.
evidence_level: medium
code_available: check
license: check
memory_modules:
  - policy-privacy
  - ingest-adapter
  - memorydiff-generator
  - audit-ui
status: seed
last_revised: 2026-08-03
urls:
  - https://arxiv.org/abs/2607.29167
---

# Memory Provenance Laundering in LLM Agents

## Problem statement

Persistent memory lets untrusted observations survive across sessions. The
arXiv abstract identifies a failure mode where consolidation rewrites external
observations as trusted history while preserving the downstream action trigger.

## Core claim

The paper argues that filters, sanitizers, and tool guards do not by themselves
enforce source authority after a fact has been consolidated into memory. The
proposed non-amplification firewall is decision-relevant because it treats
source authority as a memory-lifecycle invariant.

## Decision relevance

- `policy-privacy`:memory records need source-authority metadata that survives
  extraction and consolidation.
- `memorydiff-generator`:diff review should expose authority upgrades, not only
  textual changes.
- `audit-ui`:review surfaces should make source laundering visible before a
  persistent record affects action selection.

## Caveats

Seed quality only. Do not use any attack success rate, defense result, or
benchmark claim until the PDF and setup are fully mapped.

## Sources

- arXiv:https://arxiv.org/abs/2607.29167

---

> *Ymem project binding: see
> [`../docs/ymem-binding/relevance-index.md`](../docs/ymem-binding/relevance-index.md).*
