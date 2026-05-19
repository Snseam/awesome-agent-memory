---
source_url: https://mem0.ai/blog
fetched: 2026-05-19
purpose: research backup; canonical is the URL above
---

# Mem0 — April 2026 algorithm v2 release snapshot

Fetch note: the Mem0 blog index lists a post titled **"State of AI Agent Memory 2026: Benchmarks, Architectures & Production Gaps"** dated April 1, 2026 (path `./blog/state-of-ai-agent-memory-2026`). It is the closest match to an "April 2026 algorithm v2 announcement" — Mem0's 2026 algorithm performance and the two named architectural improvements (single-pass extraction; multi-signal retrieval) are described inside that post. No separate post titled "algorithm v2" was found on the blog index at fetch time.

The full content of that post is preserved in [`mem0-blog-state-of-2026.md`](mem0-blog-state-of-2026.md). The salient April-2026 release facts are:

- Date: April 1, 2026.
- Two named architectural changes:
  - **Single-pass hierarchical extraction** — agent-generated facts get equivalent weight to user statements; coverage expands.
  - **Multi-signal retrieval** — parallel scoring across semantic similarity, BM25, and entity matching unified into one ranked result set.
- Reported gains on LoCoMo: **temporal reasoning +29.6**, **multi-hop +23.1**.
- Headline benchmark numbers:

| Benchmark | Score | Tokens/Query |
|-----------|-------|--------------|
| LoCoMo | 91.6 | 6,956 |
| LongMemEval | 93.4 | 6,787 |
| BEAM (1M) | 64.1 | 6,719 |
| BEAM (10M) | 48.6 | 6,914 |

If Mem0 later publishes a dedicated "algorithm v2" announcement page, replace this archive with that fetched content. Until then, the State-of-2026 post is the authoritative public source.
