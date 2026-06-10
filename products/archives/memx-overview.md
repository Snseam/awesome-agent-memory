---
source_url: https://memx.me/
source_repo: https://github.com/memxlab/memx
fetched: 2026-05-31
purpose: research backup; canonical sources are the URLs above
---

# MemX — snapshot

## Positioning

MemX is a local-first long-term memory system for AI assistants. It emphasizes a
single local file, no cloud account, no tracking, and no sync server.

## Architecture Claims

- Single libSQL file for storage.
- Vector search and keyword search with Reciprocal Rank Fusion.
- Re-ranking based on semantic similarity, recency, retrieval frequency, and
  explicit importance.
- Low-confidence queries return no result rather than a weak memory match.
- Works with OpenAI-compatible embedding APIs, including local options.

## Metadata

Repository metadata fetched 2026-05-31: `memxlab/memx` had roughly 2 stars and
Apache 2.0 metadata. The product site described v0.1.0 as open source under MIT,
so the license should be verified from the repository before reuse.

## Evidence Boundary

This is an early project with small benchmarks. It is tracked as a local-first
design signal, not a mature production memory framework.
