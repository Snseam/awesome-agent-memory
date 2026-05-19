<div align="center">

# awesome-agent-memory

**A curated reading list, survey, and decision base for AI agent memory research.**

[中文](README_cn.md) · **English**

[![License](https://img.shields.io/badge/License-Apache_2.0-blue.svg)](LICENSE)
[![Papers](https://img.shields.io/badge/papers-980-brightgreen.svg)](papers/index.md)
[![PDFs](https://img.shields.io/badge/local_PDFs-125-orange.svg)](papers/pdfs/)
[![Products](https://img.shields.io/badge/products-10-purple.svg)](products/)
[![Surveys](https://img.shields.io/badge/meta_surveys-6-yellow.svg)](surveys.md)
[![Updated](https://img.shields.io/badge/updated-2026--05-lightgrey.svg)](signals.md)

</div>

---

> Built to support [Ymem](https://github.com/Snseam/Ymem) — an agent memory
> kernel — and published as a public resource for anyone building memory
> systems for AI agents.

This repo is intentionally **narrow**. It is not a general AI/ML reading list.
Every entry should plausibly inform how an agent **remembers, forgets, retrieves,
or consolidates** information.

## What makes this different

| | Most awesome-lists | **awesome-agent-memory** |
|---|---|---|
| Goal | Coverage | Driving Ymem decisions |
| Per-paper note | Title + link | 7-section ResearchItem template |
| PDF availability | URL only, breaks over time | Local archive (`papers/pdfs/`) |
| Cross-list signal | None | Each stub records which of 9 sibling lists referenced it |
| Module mapping | None | Every full note maps to `taxonomy.md` Ymem modules |
| Workflow | Read | Read → ImpactReport → Sandbox → ADR |

## Table of contents

1. [At a glance](#at-a-glance)
2. [Repository layout](#repository-layout)
3. [How the loop works](#how-the-loop-works)
4. [Stub vs full notes](#stub-vs-full-notes)
5. [Adding an entry](#adding-an-entry)
6. [License / archival policy](#license--archival-policy)
7. [Sister repos](#sister-repos)

## At a glance

```text
980 unique papers   ← scraped from 9 sibling awesome-lists, deduped
125 local PDFs      ← arXiv open-license, gated by >=3 cross-list refs
 10 product notes   ← Mem0, Letta, Zep, Graphiti, Cognee, LangMem, ...
  9 archive pages   ← markdown snapshots for auditability
  7 deep notes      ← full ResearchItem template, grounded in PDFs read
  6 meta-surveys    ← 2025-12 ~ 2026-05 indexed in surveys.md
  1 living survey   ← survey/agent-memory-survey.md
```

**Top-6 cross-list papers** (referenced by 6 / 9 sibling awesome-lists):
[MAGMA](papers/magma-a-multi-graph-based-agentic-memory-architecture-for.md) ·
[Mem0](papers/mem0-paper.md) ·
[MemGen](papers/memgen-weaving-generative-latent-memory-for-self-evolving.md) ·
[Memory-R1](papers/memory-r1-enhancing-large-language-model-agents-to-manage.md) ·
[MIRIX](papers/mirix-multi-agent-memory-system-for-llm-based-agents.md) ·
[O-Mem](papers/o-mem-omni-memory-system-for-personalized-long-horizon-self.md)

## Repository layout

### Concept files (top level)

| File | Purpose |
|---|---|
| [`survey/agent-memory-survey.md`](survey/agent-memory-survey.md) | **Our** living literature review. Read first. |
| [`surveys.md`](surveys.md) | Index of **external** meta-surveys (2025-12 ~ 2026-05). |
| [`taxonomy.md`](taxonomy.md) | Ymem module taxonomy + cross-walk to 3 external taxonomies. |
| [`research-radar-spec.md`](research-radar-spec.md) | Paper / product → ImpactReport → Ymem sandbox → ADR workflow. |
| [`information-sources.md`](information-sources.md) | 10-category source catalog with a dedicated zh-CN section. |
| [`related-work.md`](related-work.md) | 9 sibling awesome-list repos with positioning vs each. |
| [`products-landscape.md`](products-landscape.md) | Agent-memory products by **domain × audience**. |
| [`signals.md`](signals.md) | Reverse-chrono 2026 H1 release / comparison / blog log. |

### Per-item notes

| Path | Contents |
|---|---|
| [`papers/`](papers/) | ~990 paper notes (stubs + full). Master index in [`papers/index.md`](papers/index.md). |
| [`papers/pdfs/`](papers/pdfs/) | 125 archived PDFs (~500 MB). See archival policy. |
| [`papers/_scrape/`](papers/_scrape/) | Reproducibility artifacts: scrape script + dedup JSON. |
| [`products/`](products/) | 10 product notes (Mem0, Letta, Zep, Graphiti, …). |
| [`products/archives/`](products/archives/) | Markdown snapshots of canonical product pages. |
| [`impact-reports/`](impact-reports/) | `ArchitectureImpactReport` drafts (currently empty). |

## How the loop works

```text
paper or product
    ↓
ResearchItem note (papers/ or products/)
    ↓
classification against taxonomy.md
    ↓
ArchitectureImpactReport (impact-reports/)
    ↓
Ymem sandbox experiment
    ↓
ADR (in Ymem repo)
    ↓
graduated to Ymem main, or rejected
```

The external survey index and our living survey reflect the current
understanding; the per-item notes are the raw material; the impact reports
are how candidates are evaluated; the ADR (in the Ymem repo) is where
decisions are recorded.

## Stub vs full notes

Most paper notes are **stubs**: just enough frontmatter (title, arXiv ID,
year, source list, optional local PDF link, `status: stub`) plus a one-line
context snippet, generated from the cross-list scrape. They exist so that:

1. The Radar has 100% coverage of what the 9 sibling lists track.
2. Cross-list reference count gives a *maturity* signal for which stubs to
   upgrade first.

A stub becomes a **full** note when a human reads the paper and fills the
seven-section template:

```text
1. 问题陈述           Problem
2. 核心 claim         Central thesis
3. 方法 / 框架        Method
4. 评估 / benchmark   Evaluation
5. 与 Ymem 的关系      ★ Relevance to Ymem (taxonomy mapping)
6. 优劣 / 注意事项    Pros / cons
7. 待跟进             Follow-ups
```

**Only full notes can be cited in an ArchitectureImpactReport.**

## Adding an entry

Per-item full notes must include, at minimum:

- title · source (arXiv ID / conference / blog URL) · date
- domain — one of `memory | retrieval | graph | agent | eval | compression | UI | security`
- core claim · method summary · required assumptions · benchmarks used
- evidence level (`weak | medium | strong`)
- code available (yes/no + link) · license · cost/complexity estimate
- **relevance to Ymem** mapped to [`taxonomy.md`](taxonomy.md) modules

See [`research-radar-spec.md`](research-radar-spec.md) for the full schema
and naming conventions.

## License / archival policy

Notes and survey content are released under the [Apache License 2.0](LICENSE)
(same as the sister repos). Quoted excerpts from external papers and
articles remain the property of their respective authors and are used under
fair use / fair dealing for commentary and research purposes.

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

## Sister repos

| Repo | Role |
|---|---|
| [Ymem](https://github.com/Snseam/Ymem) | The agent memory kernel that consumes outputs from this repo. |
| [ZhiOne](https://github.com/Snseam/zhione) | The first host app built on Ymem. |

---

> *Notes are authored by the maintainer. Some stubs and first drafts were
> accelerated with LLM tooling; every full note is grounded in the actual
> PDF or product page that was read, not in unverified secondary summaries.*

<div align="center">

**[Survey](survey/agent-memory-survey.md)** ·
**[Papers index](papers/index.md)** ·
**[Products landscape](products-landscape.md)** ·
**[Signals](signals.md)** ·
**[中文版](README_cn.md)**

</div>
