---
source_url: https://blog.cloudflare.com/introducing-agent-memory/
source_docs: https://developers.cloudflare.com/agents/concepts/conversation-state-and-memory/
fetched: 2026-06-11
purpose: research backup; canonical sources are the URLs above
---

# Cloudflare Agent Memory — snapshot

## Positioning

Cloudflare documents memory as part of its Agents platform. The docs separate
conversation history from context memory, while the Agent Memory announcement
positions memory as what turns a stateless LLM call into a persistent,
context-aware agent.

## Public Architecture

- Conversation history persists messages and tool calls in a tree-structured
  history backed by a Session Provider, defaulting to SQLite.
- Context memory is injected into the system prompt and can be read-only,
  writable short-form, searchable, or loadable as Skills.
- Writable context can auto-wire to a SQLite-backed provider.
- Searchable context can use the built-in FTS5 provider or an external provider.

## Evidence Boundary

The Session memory API is documented as experimental. Agent Memory availability
should be treated as private beta / early platform capability unless Cloudflare
documents GA status later.
