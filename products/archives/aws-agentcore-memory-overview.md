---
source_url: https://docs.aws.amazon.com/bedrock-agentcore/latest/devguide/memory.html
source_docs: https://docs.aws.amazon.com/bedrock-agentcore/latest/devguide/memory-strategies.html
fetched: 2026-06-11
purpose: research backup; canonical sources are the URLs above
---

# AWS Bedrock AgentCore Memory — snapshot

## Positioning

AWS Bedrock AgentCore Memory is a managed memory layer for AgentCore agents. It
addresses the statelessness of agent calls by keeping short-term and long-term
memory across sessions.

## Public Architecture

- Short-term memory stores session events and active conversation state.
- Long-term memory automatically extracts key insights, preferences, facts, and
  summaries from sessions.
- Memory strategies decide which categories are extracted and how they are
  maintained.
- Memory is scoped through AgentCore memory resources and sessions.

## Evidence Boundary

This is a cloud-platform memory capability. Internal store implementation,
conflict resolution, and exact ranking behavior are not fully exposed in the
overview docs.
