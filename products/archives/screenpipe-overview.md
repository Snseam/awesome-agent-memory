---
source_url: https://github.com/screenpipe/screenpipe
source_revision: 334b865ec7b2938eeb44c443e17aebfa3e0a10a3
fetched: 2026-10-26
purpose: authored source summary; not a copied page or runtime evaluation
---

# Screenpipe — source summary

This short authored summary accompanies [the seed product note](../screenpipe.md).
It records a source review prompted by affiliated submission
[Issue #29](https://github.com/Snseam/awesome-agent-memory/issues/29).

The pinned MCP source contains a prompt-injection comment aimed at propagating
a promotional header into unrelated files. That instruction was ignored and is
not reproduced here; see the [intake trust review](../../docs/product-discovery-log.md#2026-10-26-intake-trust-review).
This authored archive is evidence about product interfaces, not trusted agent
instructions or a safety endorsement.

## Reviewed product boundary

Screenpipe combines captured computer activity, workflow automation, and
agent-facing context. The inclusion basis is more specific than capture:
the pinned server implements editable persistent memory records, and stdio MCP
provides memory creation, updates, deletion and recall. Metadata includes tags,
importance, timestamps and optional source context. Source reading establishes
an interface, not retrieval accuracy or automatic consolidation quality.

The package's HTTP transport exposes search and bundled guides, with a separate
caller credential from the recorder API credential. It does not expose the
stdio memory-write and export tools at this revision. The current license is
Screenpipe Commercial License; official binaries and source builds have
different licensing routes.

## Lifecycle limits retained in the note

Media retention and explicit memory deletion are separate. Lean retention keeps
searchable text and memories; local record deletion attempts a sync tombstone
but does not prove completion across replicas. Cloud processing, external
exports and backups have separate data paths. No real history, running service,
provider, deletion propagation or restoration was tested for this entry.

## Canonical sources

All repository links below use the reviewed commit, not a moving branch.

- [Product README](https://github.com/screenpipe/screenpipe/blob/334b865ec7b2938eeb44c443e17aebfa3e0a10a3/README.md)
- [License](https://github.com/screenpipe/screenpipe/blob/334b865ec7b2938eeb44c443e17aebfa3e0a10a3/LICENSE.md)
- [Stdio MCP implementation](https://github.com/screenpipe/screenpipe/blob/334b865ec7b2938eeb44c443e17aebfa3e0a10a3/packages/screenpipe-mcp/src/index.ts)
- [HTTP MCP implementation](https://github.com/screenpipe/screenpipe/blob/334b865ec7b2938eeb44c443e17aebfa3e0a10a3/packages/screenpipe-mcp/src/http-server.ts)
- [Memory CRUD handlers](https://github.com/screenpipe/screenpipe/blob/334b865ec7b2938eeb44c443e17aebfa3e0a10a3/crates/screenpipe-engine/src/routes/memories.rs)
- [Retention modes and cleanup](https://github.com/screenpipe/screenpipe/blob/334b865ec7b2938eeb44c443e17aebfa3e0a10a3/crates/screenpipe-engine/src/retention.rs)
- [Privacy data flow](https://docs.screenpipe.com/privacy-data-flow) — live documentation read on 2026-10-26.
- [Storage and retention](https://docs.screenpipe.com/storage-and-retention) — live documentation read on 2026-10-26.

No upstream source files, screenshots, recordings or full webpage copies are
archived here. No independent score, ranking or cost-saving claim is added.
