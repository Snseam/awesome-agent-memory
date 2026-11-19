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

## Verification addendum — 2026-11-18

The `fetched: "2026-09-15"` field dates the affiliated contributor's original
summary, preserved from [PR #26's submitted archive](https://github.com/Snseam/awesome-agent-memory/blob/6a8891f35dada645746907078239551517015045/products/archives/goodmem-overview.md).
This addendum records a separate **2026-11-18** review. The live vendor pages
are unversioned. Their current contents cannot establish what those pages said
in September or identify a particular server release.

The [hosted MCP reference](https://docs.goodmem.ai/docs/reference/mcp/)
confirms `/mcp` at the REST root and six early-access retrieval and diagnostic
tools. The original read-only wording concerns memory mutation. Configured
RetrieveMemory Query Logging can durably log matching MCP retrievals. The
separate `@pairsystems/goodmem-mcp` stdio adapter is documented as exposing a
broader tool set. Write-capable ingestion must use an appropriately authorized
API, SDK, or adapter.

The [API key model](https://docs.goodmem.ai/docs/concepts/api-keys-and-ceilings/)
distinguishes human `INHERIT_SUBJECT` keys without ceilings from scoped keys.
[Service identities](https://docs.goodmem.ai/docs/how-to/access-control/service-identities/)
require scoped keys, whose effective authority is bounded by both the subject's
current authority and the key's fixed ceiling.

The public LlamaIndex integration is pinned to
[`18841008faf74ec6286d402c734fdbcf38cf91f9`](https://github.com/PAIR-Systems-Inc/goodmem-llamaindex/tree/18841008faf74ec6286d402c734fdbcf38cf91f9),
a commit dated **2026-09-29**. Its [README](https://github.com/PAIR-Systems-Inc/goodmem-llamaindex/blob/18841008faf74ec6286d402c734fdbcf38cf91f9/README.md)
provides source-reference evidence for ingestion, retrieval, and optional
management tools. Its [MIT license](https://github.com/PAIR-Systems-Inc/goodmem-llamaindex/blob/18841008faf74ec6286d402c734fdbcf38cf91f9/LICENSE)
is distinct from the server's [GoodMem Free Binary License v1.0](https://goodmem.ai/license).
The pinned integration postdates the original review and supplies additional
November evidence.

**Maintainer synthesis:** the documented application-selected write and recall
path supports the bounded core-seed classification in the [product note](../goodmem.md).
The contributor's affiliation remains disclosed. Vendor documentation and public
integration source establish scope, with independent reproduction, benchmark
quality, automatic consolidation, conflict handling, and forgetting still
unverified. This review used source reads only.
