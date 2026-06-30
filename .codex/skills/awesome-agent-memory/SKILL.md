---
name: awesome-agent-memory
description: "Use when comparing an external project, codebase, algorithm, product, startup, or research direction against the awesome-agent-memory evidence base for agent-memory fit, gaps, risks, benchmarks, product analogs, or implementation guidance."
---

# Awesome Agent Memory

## Overview

Use this repository as a decision-grade evidence base for evaluating an external project, codebase, algorithm, product, or research direction against the current agent-memory field. The goal is not to maintain this repo; it is to map the user's object onto known memory architectures, product patterns, benchmark protocols, evidence gaps, and implementation risks.

Keep every recommendation traceable to a canonical evidence class. Do not invent new labels when an existing class fits.

## Start Here

First separate the two workspaces:

| Root | Meaning | How to resolve |
| --- | --- | --- |
| `TARGET_ROOT` | The user's project, codebase, product docs, algorithm notes, or research artifact being evaluated | Use the current workspace when it is the user's object, or the path/URL/file they provide |
| `AAM_ROOT` | The `awesome-agent-memory` evidence repository checkout | Use this repo when already inside it; otherwise locate an awesome-agent-memory checkout or ask for its path before reading repo evidence |

Do not treat `README.md`, `docs/`, `papers/`, `products/`, or `benchmarks/` as evidence paths until `AAM_ROOT` is known. When working from another repository, prefix evidence reads with `AAM_ROOT`.

Then extract the user's object from `TARGET_ROOT`:

| User object | Extract |
| --- | --- |
| Codebase or algorithm | memory write/read path, storage model, retrieval/ranking, consolidation, forgetting, personalization, evaluation hooks |
| Product or startup | target user, memory promise, workflow surface, retention/control model, competitive set, buyer risk |
| Research idea | claimed novelty, task setting, baselines, datasets, metrics, expected failure modes |
| Architecture proposal | memory modules, data lifecycle, provenance, privacy, latency/cost envelope, observability |

Minimum input gate: inspect at least one concrete path, URL, document, code file, design note, README, product page, or architecture description from the user before giving a verdict. If the user only gives a vague description, ask for the smallest missing artifact and do not judge from a vague description.

Then read only the repo lane that can answer the comparison:

| Task | First files |
| --- | --- |
| Field overview | `README.md`, `docs/README.md`, `docs/agent-memory-survey.md`, `docs/taxonomy.md` |
| Architecture fit | `docs/product-memory-architectures.md`, `docs/product-architecture-diagrams.md`, relevant `products/*.md` |
| Product positioning | `docs/products-landscape.md`, `docs/product-discovery-log.md`, relevant `products/*.md` and `products/archives/*.md` |
| Research or algorithm comparison | `papers/index.md`, relevant `papers/*.md`, `docs/research-radar.md` |
| Evaluation plan | `docs/benchmarks-landscape.md`, `benchmarks/index.md`, `benchmarks/claims/claims.yaml` |
| Recent signals | latest `docs/memory-radar-*.md`, `docs/signals.md`, `docs/information-sources.md` |
| Memory-kernel module mapping | `docs/ymem-binding/README.md`, `docs/ymem-binding/taxonomy-modules.md` |

## Workflow

1. State the comparison target in one sentence: what the user is building or evaluating and what decision they need.
2. Resolve `TARGET_ROOT` and `AAM_ROOT`, then inspect the minimum user artifact before making claims.
3. Build a lightweight feature map: memory type, lifecycle, storage, retrieval, update policy, personalization, privacy/governance, evaluation, and product surface.
4. Search `AAM_ROOT` for matching papers, products, benchmarks, and synthesis pages. Prefer `rg` over broad reading.
5. Compare against the closest evidence-backed analogs. Separate exact matches, partial analogs, missing evidence, and out-of-scope similarities.
6. Evaluate fit and risks using explicit criteria: novelty, technical soundness, product differentiation, implementation complexity, evaluation readiness, and evidence strength.
7. Produce guidance: what to keep, what to change, what to test next, which benchmark or paper/product note to inspect, and what claims the user should avoid making.

If current product claims, APIs, releases, pricing, or policies affect the judgment, browse official or primary sources before treating them as current.

## Evidence Rules

Allowed evidence classes:

| Evidence class | Can support | Must not support by itself |
| --- | --- | --- |
| `primary_paper` | Method, benchmark protocol, reported setup, author-reported results | Independent product performance or broad market claims |
| `paper_stub` | Discovery coverage and candidate relevance | Method claims, architecture recommendations, or benchmark conclusions without upgrading the stub |
| `product_behavior` | What a product page, product note, or archived page says or offers | Independent reproduction, objective superiority, or durability claims |
| `vendor_benchmark_claim` | Vendor-reported or affiliated benchmark claims under the actor's setup | Independent benchmark evidence |
| `affiliated_evaluation` | Labeled comparison under the actor's setup | Independent benchmark evidence |
| `independent_reproduction_or_critique` | Narrow claim with setup and comparability notes | Broader conclusions than the reproduction or critique tested |
| `maintainer_synthesis_or_inference` | Prioritization, taxonomy, architecture judgment, or explicitly labeled inference | Direct evidence unless linked to an underlying source |

Keep uncertain matches labeled as `strong match`, `partial match`, `weak analogy`, `watchlist`, or `needs verification`. Do not turn vendor positioning, affiliated benchmark pages, or product marketing into independent evidence.

## Output Shape

For a concise review, use:

```markdown
## Verdict
[1-3 sentence judgment tied to the user's decision]

## Fit Map
| Dimension | User object | Closest AAM evidence (path + section/heading/line when available) | Evidence class (allowed value above) | Confidence | Assessment |
| --- | --- | --- | --- | --- | --- |

## Comparable References
- `AAM repo path` + section/heading/line when available, or URL: why it matters; evidence class; confidence

## Gaps And Risks
- [risk]: supporting AAM repo path + section/heading/line when available, evidence class, confidence, and impact

## Recommendations
- [action]: why, source-backed rationale with AAM path/section/heading/line when available, next validation, expected signal
```

When citing repository evidence, use the narrowest stable locator available: file path first, then section or heading, and line number when the tool output provides one.

For deeper work, add a benchmark plan, product positioning matrix, architecture delta, or paper-to-implementation checklist.

## Common Mistakes

- Over-reading the repo before extracting the user's concrete memory surface.
- Comparing only against products when the real issue is an evaluation or algorithm claim.
- Treating local stubs, watchlist items, vendor claims, or affiliated benchmarks as strong evidence.
- Giving generic agent-memory advice without naming the closest repo evidence.
- Saying a project is novel before checking product notes, paper notes, and benchmark claims.

## Avoid

- Do not edit repository evidence files unless the user explicitly asks to maintain the repo.
- Do not commit secrets, private code, proprietary records, or unreviewed raw transcripts from the user's project.
- Do not force every project into Ymem-specific terminology; use `docs/ymem-binding/` only when module mapping is useful.
- Do not claim market or benchmark superiority without independent evidence.
