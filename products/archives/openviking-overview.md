---
source_url: https://volcengine-openviking.mintlify.app/
source_repo: https://github.com/volcengine/OpenViking
fetched: 2026-06-11
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
