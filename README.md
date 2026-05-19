# awesome-agent-memory

[中文](README_cn.md) | **English**

A curated, continuously updated reading list and survey for **agent memory**
research and engineering. Maintained primarily to support
[Ymem](https://github.com/Snseam/Ymem) algorithm iteration, but published as a
public resource because the same information is useful to anyone building
memory systems for AI agents.

This repo is intentionally narrow. It is not a general AI/ML reading list.
Every entry should plausibly inform how an agent remembers, forgets, retrieves,
or consolidates information.

## Index

Top-level concept files:

- [`survey/agent-memory-survey.md`](survey/agent-memory-survey.md) —
  our **living literature review**. Single document, rewritten as the field
  moves. Read this first if you want our take.
- [`surveys.md`](surveys.md) — index of **external** meta-surveys
  (2025-12 ~ 2026-05) and a one-page taxonomy cross-walk.
- [`taxonomy.md`](taxonomy.md) — Ymem module taxonomy + the cross-walk
  table mapping three external taxonomies onto Ymem modules.
- [`research-radar-spec.md`](research-radar-spec.md) — the workflow that turns
  an external paper or product into a sandboxed Ymem experiment and eventually
  an ADR.
- [`information-sources.md`](information-sources.md) — 10-category catalog of
  where new agent-memory work shows up (with a zh-CN community section).
- [`related-work.md`](related-work.md) — the 9 sibling
  awesome-list repositories we cross-reference, with our positioning vs each.
- [`products-landscape.md`](products-landscape.md) — agent-memory products by
  **domain × audience** (Mem0 / Letta / Zep / Cognee / OpenAI / Anthropic /
  IDE agents / PKM / etc.).
- [`signals.md`](signals.md) — reverse-chronological log of 2026 H1 releases,
  comparisons, blog posts, papers, and incidents worth tagging.

Per-item notes:

- [`papers/`](papers/) — ~990 paper notes. A handful are deep ResearchItem
  notes (`status: full`); the rest are stubs (`status: stub`) auto-generated
  from a cross-list scrape of 9 sibling awesome-lists. See
  [`papers/index.md`](papers/index.md) for the master index sorted by year
  and cross-list reference count.
- [`papers/pdfs/`](papers/pdfs/) — locally archived PDFs (~120 papers, ~500MB).
  See **License / archival policy** below.
- [`papers/_scrape/`](papers/_scrape/) — reproducibility artifacts: the
  scrape + dedup script and its JSON output. Not notes; safe to ignore unless
  you want to refresh the stub queue.
- [`products/`](products/) — one Markdown note per relevant product, library,
  or engineering blog post (Mem0, Letta, Zep, Graphiti, Cognee, LangMem,
  MemGPT, OpenAI memory, Claude Dreams, Karpathy's LLM Wiki idea, …).
- [`products/archives/`](products/archives/) — markdown snapshots of product
  pages and blog posts (research backup; canonical sources are the URLs in
  each snapshot header).
- [`impact-reports/`](impact-reports/) — drafts of
  `ArchitectureImpactReport` for candidate techniques under evaluation.

## How the loop works

```text
paper or product
  -> ResearchItem note (papers/ or products/)
  -> classification against taxonomy.md
  -> ArchitectureImpactReport (impact-reports/)
  -> Ymem sandbox experiment
  -> ADR (in Ymem repo)
  -> graduated to Ymem main or rejected
```

The external survey index and our living survey reflect the current
understanding; the per-item notes are the raw material; the impact reports
are how candidates are evaluated; the ADR (in the Ymem repo) is where
decisions are recorded.

## Stub vs full notes

Most paper notes are **stubs**: just enough frontmatter (title, arXiv ID,
year, source list, optional local PDF link, status: stub) plus a one-line
context snippet, generated from cross-list scrape. They exist so that:

1. The Radar has 100% coverage of what the 9 sibling lists track,
2. Cross-list reference count gives a "maturity" signal for which stubs to
   upgrade first.

A stub becomes a **full** note when a human reads the paper and writes the
seven-section template (problem / claim / method / eval / **Relevance to
Ymem** / pros-cons / follow-ups). Only full notes can be cited in an
ArchitectureImpactReport.

## Adding an entry

Per-item full notes must include, at minimum:

- title
- source (arXiv ID, conference, blog URL, …)
- date
- domain (one of: memory, retrieval, graph, agent, eval, compression, UI,
  security)
- core claim
- method summary
- required assumptions
- benchmarks used
- evidence level (weak, medium, strong)
- code available (yes/no, link)
- license
- cost/complexity estimate
- **relevance to Ymem** (mapped to `taxonomy.md` modules)

See [`research-radar-spec.md`](research-radar-spec.md) for the full schema and
naming conventions.

## License / archival policy

Notes and survey content are released under the Apache License 2.0
(same as the sister repos). Quoted excerpts from external papers and articles
remain the property of their respective authors and are used under fair
use / fair dealing for commentary and research purposes.

**Locally archived PDFs** under `papers/pdfs/` come from sources that
explicitly permit redistribution (arXiv perpetual non-exclusive license,
CC-BY at ACL Anthology, open OpenReview submissions, etc.). If you find a
PDF here whose source restricts redistribution, please open an issue and
we will remove it; the canonical URL in the corresponding note's
`urls` field remains the authoritative source.

**Product page snapshots** under `products/archives/` are research backups,
captured to make this repo's reasoning auditable even when source pages
change or disappear. They are **not** re-published material; commercial
citation should always use the original URL in the snapshot's `source_url`
header.

## Sister repos

- [Ymem](https://github.com/Snseam/Ymem) — the agent memory kernel that
  consumes outputs from this repo.
- [ZhiOne](https://github.com/Snseam/zhione) — the first host app built on
  Ymem.
