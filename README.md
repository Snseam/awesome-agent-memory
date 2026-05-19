# awesome-agent-memory

A curated, continuously updated reading list and survey for **agent memory**
research and engineering. Maintained primarily to support
[Ymem](https://github.com/Snseam/Ymem) algorithm iteration, but published as a
public resource because the same information is useful to anyone building
memory systems for AI agents.

This repo is intentionally narrow. It is not a general AI/ML reading list.
Every entry should plausibly inform how an agent remembers, forgets, retrieves,
or consolidates information.

## Index

- [`survey/agent-memory-survey.md`](survey/agent-memory-survey.md) —
  the living literature review. The single document that gets rewritten as the
  field moves. Read this first.
- [`papers/`](papers/) — one Markdown note per paper, structured by the
  `ResearchItem` schema (see [`research-radar-spec.md`](research-radar-spec.md)).
- [`products/`](products/) — one Markdown note per relevant product, library,
  or engineering blog post (Mem0, Letta, Zep, Claude Dreams, Karpathy's LLM
  Wiki idea, etc.).
- [`taxonomy.md`](taxonomy.md) — how research and products map onto kernel
  modules (ingest, retrieval, consolidation, evaluation, …). Drives experiment
  planning in Ymem.
- [`research-radar-spec.md`](research-radar-spec.md) — the workflow that turns
  an external paper or product into a sandboxed Ymem experiment and eventually
  an ADR.
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

The survey reflects the current understanding; the per-item notes are the raw
material; the impact reports are how candidates are evaluated; the ADR (in the
Ymem repo) is where decisions are recorded.

## Adding an entry

Per-item notes must include, at minimum:

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
- relevance to Ymem

See [`research-radar-spec.md`](research-radar-spec.md) for the full schema and
naming conventions.

## Sister repos

- [Ymem](https://github.com/Snseam/Ymem) — the agent memory kernel that
  consumes outputs from this repo.
- [ZhiOne](https://github.com/Snseam/zhione) — the first host app built on
  Ymem.

## License

The notes and survey content are released under the Apache License 2.0
(same as the sister repos). Quoted excerpts from external papers and articles
remain the property of their respective authors and are used under fair
use / fair dealing for commentary and research purposes.
