# Impact reports

Impact reports are the bridge between a full ResearchItem and a concrete
memory-kernel decision. They should be written only when a paper or product note
is strong enough to affect architecture, experiments, or an ADR.

This directory is intentionally empty except for this guide until the first
candidate needs review. Do not cite `stub` notes as evidence here; upgrade the
source note to `full` first.

## Minimal template

```markdown
# <short title>

## Source
- ResearchItem: ../papers/<slug>.md or ../products/<slug>.md
- Status: full

## Problem
- What memory-kernel problem this candidate addresses.

## Affected modules
- ingest-adapter | parser-chunker | semantic-dedup | retriever-reranker |
  context-packer | dream-consolidator | memorydiff-generator |
  evaluator-benchmark | security-privacy

## Evidence
- Benchmark, product behavior, implementation detail, or source-page evidence.

## Costs and risks
- Implementation cost:
- Runtime cost:
- Privacy/provenance risk:
- Maintenance risk:

## Recommendation
- ignore | monitor | prototype | adopt_as_plugin | consider_core_change
```
