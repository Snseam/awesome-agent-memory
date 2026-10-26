---
source_url: https://volcengine-openviking.mintlify.app/
source_repo: https://github.com/volcengine/OpenViking
fetched: 2026-06-11
release_snapshot_added: 2026-09-21
authored_update: 2026-10-26
purpose: research backup; canonical sources are the URLs above
---

# OpenViking — snapshot

## Positioning

OpenViking is an open-source context database for AI agents. It unifies memory,
resources, and skills through a filesystem paradigm and provides hierarchical
context loading plus semantic retrieval.

## Public Architecture

- Virtual filesystem with `viking://` URIs.
- L0/L1/L2 layers: abstracts, overviews, and full details loaded on demand.
- Directory recursive retrieval with intent analysis, directory positioning, and
  fine exploration.
- Session management extracts six memory categories: profile, preferences,
  entities, events, cases, and patterns.
- Integrations include OpenClaw, OpenCode, Claude Desktop, and MCP.

## Evidence Boundary

OpenClaw completion and token-cost improvements on the docs page are vendor-
claimed benchmark results. OpenViking should be described as a context database
with first-class memory, not as a pure memory layer.

## 2026-09-21 release snapshot

This dated addition supplements the original snapshot; earlier sections retain
the original fetch date and were not recaptured in this release pass.

Official releases `v0.4.21` and Python SDK `0.1.12` add or strengthen Hermes,
MiMo/MiMoCode, and WorkBuddy integrations, provide a standalone Hermes memory
provider, and include storage, queue, locking, retrieval, MCP, and local
vector-store reliability work.

Sources:

- https://github.com/volcengine/OpenViking/releases/tag/v0.4.21
- https://github.com/volcengine/OpenViking/releases/tag/python-sdk%400.1.12

## 2026-10-26 authored release update

The v0.5.2 release adds compile version history/scheduling and privacy-tree
operations. Working Memory summaries default off, but raw-message archival and
long-term memory extraction continue. LangChain packaging and ambiguous older
peer-identity directories require migration attention. This is an authored
release summary, not a recapture of the original docs or independent privacy,
durability, or migration acceptance evidence.

Source: https://github.com/volcengine/OpenViking/releases/tag/v0.5.2
