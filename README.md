<div align="center">

# awesome-agent-memory

**Long-term memory for LLM agents — a decision-driven reading list, 989-paper cross-list index, and living survey covering memory architectures, retrieval, consolidation, and forgetting.**

[中文](README_cn.md) · **English**

[![License](https://img.shields.io/badge/License-Apache_2.0-blue.svg)](LICENSE)
[![Papers](https://img.shields.io/badge/papers-989-brightgreen.svg)](papers/index.md)
[![PDFs](https://img.shields.io/badge/local_PDFs-534-orange.svg)](papers/pdfs/)
[![Products](https://img.shields.io/badge/products-10-purple.svg)](products/)
[![Surveys](https://img.shields.io/badge/meta_surveys-6-yellow.svg)](docs/meta-surveys.md)
[![Updated](https://img.shields.io/badge/updated-2026--05-lightgrey.svg)](docs/signals.md)

</div>

---

This repo is intentionally **narrow**. It is not a general AI/ML reading list.
Every entry should plausibly inform how an agent **remembers, forgets, retrieves,
or consolidates** information.

## What makes this different

| | Most awesome-lists | **awesome-agent-memory** |
|---|---|---|
| Goal | Coverage | Decision-driven curation |
| Per-paper note | Title + link | 7-section ResearchItem template |
| PDF availability | URL only, breaks over time | Local archive (`papers/pdfs/`) |
| Cross-list signal | None | Each stub records which of 9 sibling lists referenced it |
| Module mapping | None | Every full note maps to common memory-kernel modules ([`docs/taxonomy.md`](docs/taxonomy.md)) |
| Workflow | Read | Read → ImpactReport → Sandbox → ADR |

## Table of contents

1. [At a glance](#at-a-glance)
2. [Read first](#read-first)
3. [Repository layout](#repository-layout)
4. [How the loop works](#how-the-loop-works)
5. [Note status](#note-status)
6. [Adding an entry](#adding-an-entry)
7. [License / archival policy](#license--archival-policy)
8. [Origin / maintenance](#origin--maintenance)

## At a glance

```text
989 unique papers   ← scraped from 9 sibling awesome-lists, deduped
988 paper stubs     ← auto-generated cross-list coverage under papers/stubs/
534 local PDFs      ← open-redistribution sources, gated by signal / year / code link
 10 product notes   ← Mem0, Letta, Zep, Graphiti, Cognee, LangMem, ...
  9 archive pages   ← markdown snapshots for auditability
  7 full paper notes + 2 seed paper notes
  6 meta-surveys    ← 2025-12 ~ 2026-05 indexed in docs/meta-surveys.md
  1 living survey   ← docs/agent-memory-survey.md
```

**Top-6 cross-list papers** (referenced by 6 / 9 sibling awesome-lists):
[MAGMA](papers/stubs/magma-a-multi-graph-based-agentic-memory-architecture-for.md) ·
[Mem0](papers/mem0-paper.md) ·
[MemGen](papers/stubs/memgen-weaving-generative-latent-memory-for-self-evolving.md) ·
[Memory-R1](papers/stubs/memory-r1-enhancing-large-language-model-agents-to-manage.md) ·
[MIRIX](papers/stubs/mirix-multi-agent-memory-system-for-llm-based-agents.md) ·
[O-Mem](papers/stubs/o-mem-omni-memory-system-for-personalized-long-horizon-self.md)

## Read first

If this is your first visit, use these entry points in order:

1. [`docs/README.md`](docs/README.md) — map of the documentation set.
2. [`docs/agent-memory-survey.md`](docs/agent-memory-survey.md) — the living survey and current maintainer synthesis.
3. [`docs/taxonomy.md`](docs/taxonomy.md) — the shared vocabulary for forms, functions, dynamics, persistence, and curation.
4. [`papers/index.md`](papers/index.md) — the 989-paper cross-list index, sorted by maturity signals.
5. [`docs/products-landscape.md`](docs/products-landscape.md) — product notes grouped by domain and audience.

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
| [`docs/research-radar.md`](docs/research-radar.md) | Generic Radar workflow: Paper → ResearchItem → ImpactReport → sandbox → ADR. |
| [`docs/information-sources.md`](docs/information-sources.md) | 10-category source catalog with a dedicated zh-CN section. |
| [`docs/related-work.md`](docs/related-work.md) | 9 sibling awesome-list repos with positioning vs each. |
| [`docs/products-landscape.md`](docs/products-landscape.md) | Agent-memory products by **domain × audience**. |
| [`docs/signals.md`](docs/signals.md) | Reverse-chrono 2026 H1 release / comparison / blog log. |

### Per-item notes

| Path | Contents |
|---|---|
| [`papers/`](papers/) | 7 full paper notes, 2 seed notes, and master [`index.md`](papers/index.md). |
| [`papers/stubs/`](papers/stubs/) | 988 auto-generated stubs (cross-list scrape output). |
| [`papers/pdfs/`](papers/pdfs/) | 534 archived PDFs (~1.8 GB). See archival policy. |
| [`papers/_scrape/`](papers/_scrape/) | Reproducibility artifacts: scrape script + dedup JSON. |
| [`products/`](products/) | 10 product notes (Mem0, Letta, Zep, Graphiti, …). |
| [`products/archives/`](products/archives/) | Markdown snapshots of canonical product pages. |
| [`docs/ymem-binding/`](docs/ymem-binding/) | Project-specific bindings from the maintainer's [Ymem](https://github.com/Snseam/Ymem) kernel; safe to ignore if you don't use Ymem. |

## How the loop works

```text
paper or product
    ↓
ResearchItem note (papers/ or products/)
    ↓
classification against docs/taxonomy.md
    ↓
ArchitectureImpactReport (impact-reports/)
    ↓
sandbox experiment (in your kernel repo)
    ↓
ADR (in your kernel repo)
    ↓
graduated to main, or rejected
```

The external survey index and our living survey reflect the current
understanding; the per-item notes are the raw material; the impact reports
are how candidates are evaluated; the ADR (in your kernel repo) is where
decisions are recorded.

## Note status

Most paper notes are **stubs**: just enough frontmatter (title, arXiv ID,
year, source list, optional local PDF link, `status: stub`) plus a one-line
context snippet, generated from the cross-list scrape. They exist so that:

1. The Radar has 100% coverage of what the 9 sibling lists track.
2. Cross-list reference count gives a *maturity* signal for which stubs to
   upgrade first.

Status labels:

| Status | Meaning |
|---|---|
| `stub` | Auto-generated or lightly generated coverage entry. Useful for discovery, not for architectural claims. |
| `seed` | Human-started note with enough structure to track, but still missing a full read or complete evidence pass. |
| `full` | Human-read ResearchItem with the seven-section template and memory-module mapping. |
| `working-notes` | Exploratory product or essay notes that are intentionally not yet normalized as a full ResearchItem. |

A stub becomes a **full** note when a human reads the paper and fills the
seven-section template:

```text
1. 问题陈述           Problem
2. 核心 claim         Central thesis
3. 方法 / 框架        Method
4. 评估 / benchmark   Evaluation
5. 决策相关性          ★ Decision relevance (memory-module mapping)
6. 优劣 / 注意事项    Pros / cons
7. 待跟进             Follow-ups
```

**Only full notes should be cited as evidence in an ArchitectureImpactReport.**

## Adding an entry

Per-item full notes must include, at minimum:

- title · source (arXiv ID / conference / blog URL) · date
- domain — one of `memory | retrieval | graph | agent | eval | compression | UI | security`
- core claim · method summary · required assumptions · benchmarks used
- evidence level (`weak | medium | strong`)
- code available (yes/no + link) · license · cost/complexity estimate
- **decision relevance** — which memory-kernel modules this would affect
  (see [`docs/taxonomy.md`](docs/taxonomy.md))

See [`docs/research-radar.md`](docs/research-radar.md) for the full schema
and naming conventions.

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

**Product page snapshots** (`products/archives/`) are research backups,
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
entry points remain product-neutral.

---

> *Notes are authored by the maintainer. Some stubs and first drafts were
> accelerated with LLM tooling; every full note is grounded in the actual
> PDF or product page that was read, not in unverified secondary summaries.*

<div align="center">

**[Survey](docs/agent-memory-survey.md)** ·
**[Docs map](docs/README.md)** ·
**[Papers index](papers/index.md)** ·
**[Products landscape](docs/products-landscape.md)** ·
**[Signals](docs/signals.md)** ·
**[中文版](README_cn.md)**

</div>
