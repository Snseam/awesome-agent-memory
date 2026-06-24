<div align="center">

# awesome-agent-memory

**Long-term memory for LLM agents — a decision-driven reading list, 989 scraped-paper index, current-source radar, and living survey covering memory architectures, retrieval, consolidation, and forgetting.**

[中文](README_cn.md) · **English**

[![License](https://img.shields.io/badge/License-Apache_2.0-blue.svg)](LICENSE)
[![Papers](https://img.shields.io/badge/papers-989-brightgreen.svg)](papers/index.md)
[![PDFs](https://img.shields.io/badge/local_PDFs-534-orange.svg)](papers/pdfs/)
[![Memory products](https://img.shields.io/badge/memory%20products-38-purple.svg)](products/)
[![Benchmarks](https://img.shields.io/badge/benchmarks-13-blueviolet.svg)](benchmarks/)
[![Surveys](https://img.shields.io/badge/meta_surveys-6-yellow.svg)](docs/meta-surveys.md)
[![Updated](https://img.shields.io/badge/updated-2026--06-lightgrey.svg)](docs/signals.md)

</div>


---

## Table of contents

1. [At a glance](#at-a-glance)
2. [Repository map](#repository-map)
3. [Read first](#read-first)
4. [Repository layout](#repository-layout)
5. [License / archival policy](#license--archival-policy)
6. [Origin / maintenance](#origin--maintenance)

## At a glance

| Area | Count | Entry point | What it is for |
|---|---:|---|---|
| Paper index | 989 scraped papers + 2026-06 manual radar additions | [`papers/index.md`](papers/index.md) | Searchable entry point for agent-memory papers; the 989 count is the 2026-05 scrape baseline. |
| Paper stubs | 988 stubs | [`papers/stubs/`](papers/stubs/) | Lightweight coverage records for papers not yet fully read. |
| Local PDFs | 534 files | [`papers/pdfs/`](papers/pdfs/) | Archived PDFs for stable reading and audit. |
| Full / seed notes | 7 full + 7 seed | [`papers/`](papers/) | Human-read paper notes and notes in progress. |
| Memory product notes | 38 notes | [`products/`](products/) | Notes on existing memory infrastructure and agent-memory products. |
| Page archives | 37 snapshots | [`products/archives/`](products/archives/) | Markdown snapshots for memory-product page auditability. |
| Benchmark catalog | 13 catalog rows | [`benchmarks/index.md`](benchmarks/index.md) | First-class benchmark records plus stub-backed candidate rows and a usage-claim ledger. |
| Survey docs | 1 living survey + 6 meta-survey records | [`docs/agent-memory-survey.md`](docs/agent-memory-survey.md) · [`docs/meta-surveys.md`](docs/meta-surveys.md) | Maintainer synthesis and survey tracking. |

## Repository map

```mermaid
flowchart LR
  R["README"] --> D["Docs map<br/>survey + taxonomy"]
  R --> P["Papers<br/>index + stubs + PDFs"]
  R --> PL["Memory products<br/>notes + page archives"]
  R --> B["Benchmarks<br/>protocols + claims ledger"]
  D --> IR["Impact reports<br/>evaluation template"]
  P --> IR
  PL --> IR
  B --> IR
  IR --> KD["Kernel decisions<br/>sandbox + ADR"]
  D -. "optional" .-> YB["Ymem binding"]
```

## Read first

If this is your first visit, use these entry points in order:

1. [`docs/README.md`](docs/README.md) — map of the documentation set.
2. [`docs/agent-memory-survey.md`](docs/agent-memory-survey.md) — the living survey and current maintainer synthesis.
3. [`docs/memory-radar-2026-06.md`](docs/memory-radar-2026-06.md) — latest current-source refresh across papers, products, GitHub projects, and reviewer decisions.
4. [`docs/taxonomy.md`](docs/taxonomy.md) — the shared vocabulary for forms, functions, dynamics, persistence, and curation.
5. [`papers/index.md`](papers/index.md) — the paper index, organized for scrape-baseline discovery and manual radar additions.
6. [`docs/benchmarks-landscape.md`](docs/benchmarks-landscape.md) — benchmark usage, evidence class, and cross-source statistics.
7. [`docs/products-landscape.md`](docs/products-landscape.md) — memory product notes grouped by domain and audience.
8. [`docs/product-memory-architectures.md`](docs/product-memory-architectures.md) — cross-product architecture patterns and diagrams.

## Repository layout

### Concept files (top level)

All concept docs now live under [`docs/`](docs/). Start with
[`docs/README.md`](docs/README.md) if you want the shortest map.

| File | Purpose |
|---|---|
| [`docs/README.md`](docs/README.md) | Documentation map: what to read first and where each concept lives. |
| [`docs/agent-memory-survey.md`](docs/agent-memory-survey.md) | A living literature review by the maintainer. |
| [`docs/meta-surveys.md`](docs/meta-surveys.md) | Index of **external** meta-surveys (2025-12 ~ 2026-05). |
| [`docs/taxonomy.md`](docs/taxonomy.md) | Generic agent-memory taxonomy: cross-walk of 3 external frameworks. |
| [`docs/research-radar.md`](docs/research-radar.md) | Generic Radar schema for ResearchItem and ImpactReport notes. |
| [`docs/memory-radar-2026-06.md`](docs/memory-radar-2026-06.md) | 2026-06 current-source refresh across papers, products, GitHub projects, and reviewer decisions. |
| [`docs/information-sources.md`](docs/information-sources.md) | 10-category source catalog with a dedicated zh-CN section. |
| [`docs/related-work.md`](docs/related-work.md) | Discovery-input attribution and scrape provenance. |
| [`docs/products-landscape.md`](docs/products-landscape.md) | Memory products by **domain × audience**. |
| [`docs/product-discovery-log.md`](docs/product-discovery-log.md) | Multi-agent product discovery log with Tier A / Tier B / reject decisions. |
| [`docs/product-memory-architectures.md`](docs/product-memory-architectures.md) | Cross-product memory architecture patterns and comparison diagrams. |
| [`docs/product-architecture-diagrams.md`](docs/product-architecture-diagrams.md) | Per-product Mermaid architecture diagrams for public product patterns. |
| [`docs/benchmarks-landscape.md`](docs/benchmarks-landscape.md) | Benchmark landscape by capability, usage type, and evidence independence. |
| [`docs/signals.md`](docs/signals.md) | Reverse-chrono 2026 H1 release / memory product / blog log. |

### Per-item notes

| Path | Contents |
|---|---|
| [`papers/`](papers/) | 7 full paper notes, 7 seed notes, and master [`index.md`](papers/index.md). |
| [`papers/stubs/`](papers/stubs/) | 988 auto-generated stubs for papers not yet fully read. |
| [`papers/pdfs/`](papers/pdfs/) | 534 archived PDFs (~1.8 GB). See archival policy. |
| [`papers/_scrape/`](papers/_scrape/) | Reproducibility artifacts: scrape script + dedup JSON. |
| [`products/`](products/) | 38 memory product notes (Mem0, Letta, Zep, Graphiti, EverOS, Redis Agent Memory Server, agentmemory, memsearch, …). |
| [`products/archives/`](products/archives/) | 37 Markdown snapshots of canonical memory product pages. |
| [`benchmarks/`](benchmarks/) | 13 benchmark catalog rows, including protocol notes and stub-backed candidate rows. |
| [`benchmarks/claims/`](benchmarks/claims/) | Event ledger for benchmark usage, vendor claims, critiques, and reproductions. |
| [`benchmarks/archives/`](benchmarks/archives/) | Optional source-page snapshots for benchmark pages, repos, or dataset cards. |
| [`docs/ymem-binding/`](docs/ymem-binding/) | Project-specific bindings from the maintainer's [Ymem](https://github.com/Snseam/Ymem) kernel; safe to ignore if you don't use Ymem. |

## License / archival policy

Notes and survey content are released under the [Apache License 2.0](LICENSE).
Quoted excerpts from external papers and articles remain the property of
their respective authors and are used under fair use / fair dealing for
commentary and research purposes.

**Locally archived PDFs** (`papers/pdfs/`) come from sources that explicitly
permit redistribution — arXiv perpetual non-exclusive license, CC-BY at ACL
Anthology, open OpenReview submissions, etc. If you find a PDF here whose
source restricts redistribution, please open an issue; we will remove it.
The canonical URL in the corresponding note's `urls` field remains the
authoritative source.

**Memory product page snapshots** (`products/archives/`) are research backups,
captured so that this repo's reasoning stays auditable when source pages
change or disappear. They are **not** re-published material; commercial
citation should always use the original URL in the snapshot's `source_url`
header.

## Origin / maintenance

This repo was started by the
[**Ymem**](https://github.com/Snseam/Ymem) project, but the top-level
documentation is intended to stay useful for any agent-memory kernel. Ymem
specific bindings — module names, maintainer stance, and internal benchmark
choices — live in [`docs/ymem-binding/`](docs/ymem-binding/) so the public
entry points remain project-neutral.

The paper index also uses a small set of public awesome-list repositories as
discovery inputs. Source attribution and scrape artifacts live in
[`docs/related-work.md`](docs/related-work.md) and
[`papers/_scrape/`](papers/_scrape/). These inputs are used for discovery only;
notes, survey synthesis, and maintainer judgments are maintained here.

---

> *Notes are authored by the maintainer. Some stubs and first drafts were
> accelerated with LLM tooling; every full note is grounded in the actual
> PDF or memory product page that was read, not in unverified secondary summaries.*

<div align="center">

**[Survey](docs/agent-memory-survey.md)** ·
**[Docs map](docs/README.md)** ·
**[Papers index](papers/index.md)** ·
**[Benchmarks](benchmarks/index.md)** ·
**[Memory products landscape](docs/products-landscape.md)** ·
**[Product architectures](docs/product-memory-architectures.md)** ·
**[Signals](docs/signals.md)** ·
**[中文版](README_cn.md)**

</div>
