---
title: Benchmark claims ledger
date: 2026-06-11
status: seed
language: zh-CN
---

# Benchmark Claims Ledger

`claims.yaml` records each observed use of a benchmark by a paper, product note,
archive, blog, leaderboard, or independent report. The ledger is intentionally
event-based: a benchmark can be strong as a protocol while a particular product
score remains a vendor self-claim.

Path values in `source_id` and `evidence_refs` are repository-root-relative
when they point to local files.

## Required Fields

Each event must include:

- `event_id`
- `benchmark_id`
- `source_kind`
- `source_id`
- `source_date`
- `actor`
- `actor_type`
- `usage_type`
- `reported_metrics`
- `experimental_setup`
- `reproduction_status`
- `independence_class`
- `evidence_refs`
- `extract_confidence`

## Classification Rules

- `originates_benchmark`: the source introduces the benchmark protocol or
  dataset.
- `uses_for_eval`: the source runs or reports an evaluation on the benchmark.
- `baseline_comparison`: the source compares multiple systems on the benchmark.
- `vendor_claim`: a vendor-controlled source reports a score or improvement.
- `independent_reproduction`: an unaffiliated party reruns or reproduces enough
  of the setup to compare.
- `critique`: methodological criticism without a documented rerun.
- `survey_mention`: survey or planning mention only; count separately from
  actual evaluation use.

## Counting Rules

- Count one benchmark once per source document per `usage_type`.
- Do not double-count a product note and its archive unless they contain
  distinct claims.
- Do not merge aliases unless `benchmarks/index.md` lists them under the same
  `benchmark_id`.
- Do not average scores across different models, splits, judges, or context
  budgets.
- Keep vendor self-claims and independent reproductions in separate tables.

## Validation Checklist

Before using ledger rows in a landscape table:

1. Every `benchmark_id` appears in [`../index.md`](../index.md).
2. Every event has at least one `evidence_refs` entry.
3. Every event with `reported_metrics` has `reproduction_status` and
   `independence_class`.
4. ConvoMem critiques of LongMemEval/LoCoMo are `critique`, not
   `independent_reproduction`.
5. Mem0 blog/product rows are `vendor_self_report` and `self_claim`.
6. Stub-only evidence remains `candidate` or `survey_mention`.
