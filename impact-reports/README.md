# Impact reports

Impact reports are the bridge between a full ResearchItem or BenchmarkItem and a
concrete memory-kernel decision. They should be written only when a paper,
product, or benchmark note is strong enough to affect architecture,
experiments, or an ADR.

This directory is intentionally empty except for this guide until the first
candidate needs review. Do not cite `stub` notes as evidence here; upgrade the
source note to `full` first. Benchmark score claims also need a matching event
in `../benchmarks/claims/claims.yaml`, so vendor claims and independent
reproductions do not get mixed.

## Minimal template

```markdown
# <short title>

## Source
- ResearchItem or BenchmarkItem: ../papers/<slug>.md, ../products/<slug>.md,
  or ../benchmarks/<slug>.md
- Status: full
- Claims ledger refs: ../benchmarks/claims/claims.yaml#<event_id> when benchmark
  usage or score claims are part of the evidence.

## Problem
- What memory-kernel problem this candidate addresses.

## Affected modules
- ingest-adapter | parser-chunker | semantic-dedup | retriever-reranker |
  context-packer | dream-consolidator | memorydiff-generator |
  evaluator-benchmark | publisher | interface | audit-ui | security-privacy
- If this list drifts, use ../docs/ymem-binding/taxonomy-modules.md as the
  source of truth.

## Evidence
- Benchmark, product behavior, implementation detail, or source-page evidence.
- Keep vendor self-report, affiliated evaluation, critique, and independent
  reproduction in separate bullets.

## Costs and risks
- Implementation cost:
- Runtime cost:
- Privacy/provenance risk:
- Maintenance risk:

## Recommendation
- ignore | monitor | prototype | adopt_as_plugin | consider_core_change
```
