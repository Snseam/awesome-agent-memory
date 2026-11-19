---
title: GoodMem
type: product
source: https://goodmem.ai/
date: "2026-09-15"
date_basis: public-source review; not an asserted product release date
date_first_seen: "2026-09-15"
last_revised: "2026-11-18"
domain: memory
business_model: proprietary self-hosted binary + managed cloud
core_claim: persistent memory spaces and retrieval for context reuse across agent sessions
method_summary: application-selected content -> server-side parsing and chunking -> embeddings -> retrieval and optional reranking
required_assumptions:
  - A deployed instance, configured models, spaces, and authorized credentials are available.
  - The application or agent chooses what to retain and when to retrieve it.
benchmark_used: no benchmark evaluated or reproduced for this note
evidence_level: medium
evidence_class: vendor-documented product behavior; affiliated contributor review
code_available: proprietary binary server; public client integrations are linked below
license: GoodMem Free Binary License v1.0 for the server; client licenses are separate
cost_complexity: self-hosting requires operations and model resources; managed cloud has service charges
memory_modules:
  - ingest-adapter
  - parser-chunker
  - retriever-reranker
  - interface
  - security-privacy
decision_relevance: study service-backed memory with explicit write policy, retrieval, and workload-level access control
status: seed
archive: archives/goodmem-overview.md
contributor_affiliation: Amin Ahmad, founder of PAIR Systems, the company behind GoodMem
---

# GoodMem

## 1. Positioning and inclusion boundary

[GoodMem](https://goodmem.ai/) presents persistent memory infrastructure for
agents. Applications retain content in memory spaces and retrieve relevant
material across sessions. It also supports conventional RAG and document Q&A;
that overlap is part of the product's scope.

**Contributor inference:** the proposed agent-memory classification rests on
documented writing, recall, access control, and cross-session reuse. Automatic
fact extraction, consolidation, conflict resolution, and forgetting are not
established by the sources reviewed here. The application still determines what
is worth remembering.

## 2. Documented behavior

- **Storage and retrieval:** original content is retained, parsed, chunked using
  the space's configuration, and embedded. Retrieval returns chunks with source
  references. See the [product and ingestion description](https://goodmem.ai/pricing).
- **Built-in MCP:** the REST server exposes Streamable HTTP at `/mcp` on the same
  base URL. Its current tools cover retrieval and diagnostics; the interface is
  read-only and early access. The separate `@pairsystems/goodmem-mcp` stdio adapter
  exposes broader operations. See the [MCP reference](https://docs.goodmem.ai/docs/reference/mcp/).
- **Workload access:** humans provision service identities, grants, and scoped
  keys for automated workloads. See the [service identity guide](https://docs.goodmem.ai/docs/how-to/access-control/service-identities/).
  A scoped key limits requests to the intersection of the principal's current
  authority and the key's fixed ceiling. See [API keys and ceilings](https://docs.goodmem.ai/docs/concepts/api-keys-and-ceilings/).
- **Integration surfaces:** official [integration documentation](https://docs.goodmem.ai/docs/integrations/)
  and a public [LlamaIndex integration](https://github.com/PAIR-Systems-Inc/goodmem-llamaindex)
  provide entry points for application developers.

## 3. Deployment, license, and cost

The server is proprietary software distributed under the
[GoodMem Free Binary License v1.0](https://goodmem.ai/license). Free self-hosting
does not make the core open source. Managed cloud is a separate paid offering;
see [pricing](https://goodmem.ai/pricing). Client or integration licenses do not
change the server's license.

**Contributor inference:** self-hosting adds storage, inference, deployment, and
operational work. Hosting the service does not remove the need to select content,
configure access, and measure retrieval quality on the application's workload.

## 4. Architecture relevance and limits

The module mapping uses the repository's
[reference taxonomy](../docs/ymem-binding/taxonomy-modules.md): ingestion and
chunking feed retrieval; API/MCP form the interface; identities and scoped keys
form an access-control boundary. This is a contributor interpretation of public
documentation, not an assertion that GoodMem implements the Ymem modules.

The useful design question is how a host separates its memory-writing policy
from shared persistence and recall. Built-in read-only MCP alone does not provide
an end-to-end write lifecycle; writes require an authorized write-capable API,
SDK, or adapter. Automatic lifecycle behavior and production retrieval quality
remain follow-up evaluation topics.

## 5. Evidence and provenance

Sources were accessed on **2026-09-15 UTC**. Amin Ahmad, the contributor, is the
founder of PAIR Systems, the company behind GoodMem. This note summarizes vendor
documentation and labels contributor inferences. No independent reproduction,
performance ranking, or benchmark result is claimed. `medium` describes the
documented behavior evidence, not measured memory quality.

The [source summary](archives/goodmem-overview.md) preserves the reviewed scope
and canonical links without copying the source pages in full.

## 6. Verification and corrections — 2026-11-18

The September review above is preserved from [PR #26 at its submitted
revision](https://github.com/Snseam/awesome-agent-memory/blob/6a8891f35dada645746907078239551517015045/products/goodmem.md).
Its review date and Amin Ahmad's PAIR Systems affiliation remain the original
contributor provenance. The following findings describe first-party sources
checked on **2026-11-18**. The live documentation is unversioned, so these
findings are dated observations without an asserted server release version.

- **Hosted MCP scope.** The [MCP reference](https://docs.goodmem.ai/docs/reference/mcp/)
  specifies Streamable HTTP at the REST-root `/mcp` path. Its six tools are
  `goodmem_list_spaces`, `goodmem_list_memories`, `goodmem_retrieve`,
  `goodmem_read_memory`, `goodmem_list_retrieval_models`, and
  `goodmem_ping_inference`. The early-access surface offers retrieval and
  diagnostics. The September description of it as read-only concerns memory
  mutation. Retrieval can durably persist matching query logs when an
  administrator configures RetrieveMemory Query Logging. The separately
  documented stdio adapter has its own broader tool set.
- **Credential qualification.** The [key model](https://docs.goodmem.ai/docs/concepts/api-keys-and-ceilings/)
  distinguishes human `INHERIT_SUBJECT` keys without a ceiling from scoped
  keys. Service identities require scoped keys. The intersection of current
  authority and a fixed ceiling describes the scoped-key case used in the
  [service identity guide](https://docs.goodmem.ai/docs/how-to/access-control/service-identities/).
- **Pinned integration evidence.** The official LlamaIndex repository at
  [`18841008faf74ec6286d402c734fdbcf38cf91f9`, dated 2026-09-29](https://github.com/PAIR-Systems-Inc/goodmem-llamaindex/commit/18841008faf74ec6286d402c734fdbcf38cf91f9)
  documents `GoodMemDocumentIngestor`, `GoodMemRetriever`, and optional
  `GoodMemToolSpec` management tools in its [README](https://github.com/PAIR-Systems-Inc/goodmem-llamaindex/blob/18841008faf74ec6286d402c734fdbcf38cf91f9/README.md).
  Its [MIT license](https://github.com/PAIR-Systems-Inc/goodmem-llamaindex/blob/18841008faf74ec6286d402c734fdbcf38cf91f9/LICENSE)
  applies to that integration. The server's [GoodMem Free Binary License v1.0](https://goodmem.ai/license)
  remains a separate proprietary-binary license. This later integration pin
  supplements the September snapshot.

**Maintainer synthesis:** retain a core `seed` note for application-managed
persistent content and semantic recall across sessions. The simplest fair
integration is application-selected ingestion into an authorized space followed
by retrieval into a later agent context, using the documented API or a pinned
integration. This review establishes documented behavior only. Automatic memory
lifecycle behavior, independent retrieval quality, and workload-level operating
cost remain unverified. No installation or upstream commands were executed.
