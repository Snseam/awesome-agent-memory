---
source_url: https://docs.oracle.com/en/database/oracle/agent-memory/26.4/agmea/about.html
fetched: 2026-06-11
purpose: research backup; canonical source is the URL above
---

# Oracle AI Agent Memory — snapshot

## Positioning

Oracle AI Agent Memory provides a persistent memory layer for enterprise AI
agents on Oracle AI Database.

## Public Architecture

- Short-term memory uses thread context cards and conversation summaries to keep
  recent turns, task state, and intermediate progress.
- Long-term memory uses `add` and `search` workflows for user preferences,
  learned rules, and facts from earlier interactions.
- Oracle positions AI Database as the converged foundation for vector, graph,
  JSON, and transactional memory needs.
- The docs mention MCP Server integration and external framework use.

## Evidence Boundary

Oracle explicitly places authentication, authorization, and correct memory
scoping responsibility on the integrating application.
