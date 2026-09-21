---
source_url: https://github.com/vectorize-io/hindsight
fetched: 2026-09-21
purpose: research backup; canonical is the URL above
---

# Hindsight — snapshot

## Positioning

Hindsight positions itself as an agent memory system that learns over time, not
only a conversation-history recall layer.

## Product Shape

The repo provides:

- Docker server and UI
- Python and TypeScript clients
- LLM wrapper for automatic memory capture/retrieval
- embedded Python mode
- APIs around retain, recall, and reflect

It targets conversational agents, per-user memory, and open-ended autonomous
task agents.

## Metadata

Repository metadata fetched 2026-05-31: `vectorize-io/hindsight` had roughly
15.2k stars, 857 forks, MIT license, and latest release `v0.7.1` published
2026-05-28.

## Evidence Boundary

The README presents LongMemEval benchmark claims and says some results were
reproduced by research collaborators. This snapshot still treats the comparison
table as project-reported evidence unless the reproduction artifact is reviewed
directly.

## 2026-09-21 release snapshot

The official `v0.10.0` release adds batched document embeddings, the
`o200k_base` tokenizer, improved handling for oversized retained items, a
per-bank text-search toggle, knowledge-base export in transfers, and
coding-agent import fixes. These are product-behavior signals, not independent
quality evidence.

Source: https://github.com/vectorize-io/hindsight/releases/tag/v0.10.0
