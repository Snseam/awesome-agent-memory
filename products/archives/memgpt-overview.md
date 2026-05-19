---
source_url: https://arxiv.org/abs/2310.08560
fetched: 2026-05-19
purpose: research backup; canonical is the URL above. Letta (https://github.com/letta-ai/letta) is the production successor.
---

# MemGPT — snapshot

## Paper

**MemGPT: Towards LLMs as Operating Systems** (Packer et al., 2023; arXiv:2310.08560).

## Abstract

The paper addresses a fundamental limitation of LLMs — their constrained context windows. The authors propose that LLMs can be enhanced to handle extended interactions by borrowing concepts from traditional operating systems, enabling models to work with significantly more information than their native context allows.

## Key Contributions

### Virtual Context Management
The system draws on hierarchical memory in OSes, where data movement between fast and slow memory creates the illusion of expansive resources. MemGPT manages multiple memory tiers within the LLM's limited context window, using interrupts to manage control flow between itself and the user.

### Memory Architecture
- **Primary memory** — active context inside the LLM's window.
- **External memory** — overflow storage for managing longer interactions.

### Function-call-based paging
The LLM performs explicit memory operations through function calls, analogous to OS paging, moving information between active and external storage as needed.

## Evaluation Domains

1. **Document analysis** — processing documents that exceed the underlying model's context window.
2. **Multi-session chat** — conversational agents demonstrating retention, reflection, and dynamic evolution over extended interactions.

## Authors

Charles Packer, Sarah Wooders, Kevin Lin, Vivian Fang, Shishir G. Patil, Ion Stoica, Joseph E. Gonzalez.

## Production Successor — Letta

The MemGPT codebase evolved into **Letta** (https://github.com/letta-ai/letta), a stateful-agent platform maintained by Letta Inc. Letta exposes Letta Code (CLI) and the Letta API (Python/TypeScript SDKs), keeps the memory-block model (e.g. `human`, `persona`), and is Apache-2.0. As of May 2026: ~22.8k GitHub stars, latest release v0.16.8 (2026-05-14).
