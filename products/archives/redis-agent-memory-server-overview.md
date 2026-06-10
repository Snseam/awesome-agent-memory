---
source_url: https://redis.github.io/agent-memory-server/
source_repo: https://github.com/redis/agent-memory-server
fetched: 2026-06-11
purpose: research backup; canonical sources are the URLs above
---

# Redis Agent Memory Server — snapshot

## Positioning

Redis Agent Memory Server is documented as a production-ready memory system for
AI agents and applications, with REST API, MCP, and client SDK interfaces.

## Public Architecture

- Two-tier memory system: working memory for session-scoped state and long-term
  memory for persistent preferences, facts, and important information.
- Search modes include semantic, keyword, and hybrid search.
- Filters include time, topics, entities, users, and sessions.
- Management features include automatic extraction, contextual grounding,
  deduplication, editing, authentication, background processing, and multi-
  tenancy.

## Evidence Boundary

Production-ready language and operational maturity are official claims. Actual
delete/export/audit semantics should be validated in deployment.
