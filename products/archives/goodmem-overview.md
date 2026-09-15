---
source_url: https://goodmem.ai/
source_docs: https://docs.goodmem.ai/docs/reference/mcp/
source_access_control: https://docs.goodmem.ai/docs/how-to/access-control/service-identities/
source_key_model: https://docs.goodmem.ai/docs/concepts/api-keys-and-ceilings/
source_pricing: https://goodmem.ai/pricing
source_license: https://goodmem.ai/license
fetched: "2026-09-15"
archive_kind: authored summary of official sources, not a verbatim page capture
purpose: preserve reviewed product scope; canonical sources remain the URLs above
contributor_affiliation: Amin Ahmad, PAIR Systems / GoodMem
---

# GoodMem — official-source summary

## Positioning and behavior

GoodMem describes a persistent memory service for agent context across sessions.
Memory spaces hold application-selected content for semantic retrieval; ordinary
RAG and document Q&A are also supported uses. Ingestion retains source content
and creates indexed chunks according to the space's configuration.

The built-in REST-server MCP endpoint uses Streamable HTTP at `/mcp`. Its current
surface is read-only retrieval and diagnostics, marked early access. A separate
stdio adapter exposes broader operations.

Workloads can use human-provisioned service identities and scoped credentials.
Access depends on current authority and the key's fixed ceiling.

## Delivery and evidence boundary

The proprietary server is available for self-hosting under the GoodMem Free
Binary License v1.0, with managed cloud offered separately. Public integrations
do not imply that the server is open source.

This is an affiliated contributor's summary of vendor documentation, not an
independent implementation audit or benchmark. It establishes no automatic
consolidation, forgetting, or comparative quality result. See the
[product note](../goodmem.md) for source links, assumptions, and module mapping.
