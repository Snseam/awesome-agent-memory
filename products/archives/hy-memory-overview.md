---
source_url: https://hy-memory.com/
fetched: 2026-05-31
purpose: research backup; canonical is the URL above
---

# Hy-Memory — snapshot

## Positioning

Hy-Memory is presented as an OpenClaw shared memory plugin based on Tencent
Hunyuan's high-dimensional cognitive memory evolution framework. It is designed
to let multiple agents query a centralized long-term memory core.

## Core Architecture

The public site describes a six-layer memory kernel:

- L1 raw traces
- L2 atomic facts
- L3 identity profile
- L4-L6 mind and intent layers

The plugin recalls relevant memory before chat processing and captures new facts
asynchronously after model output.

## Deployment Shape

The documented installation path is through OpenClaw:

```bash
openclaw plugins install openclaw-hy-memory --dangerously-force-unsafe-install
openclaw hy-memory init
openclaw gateway restart
openclaw hy-memory status
```

The site indicates a Python sidecar process, Chroma vector store, OpenAI-style
LLM/embedding configuration, and Hunyuan 3.0 Preview as the recommended
extraction model.

## Evidence Boundary

The page claims MIT licensing and links to a GitHub repository slot, but the
resolved link did not expose a concrete repository at fetch time. Benchmark
numbers shown on the site are treated as vendor claims.
