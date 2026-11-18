---
title: "StaleBench: Isolating Stale Retrieval in Agent Memory, and Pricing the Fix"
benchmark_id: stalebench
name: StaleBench
aliases:
  - StaleBench
status: seed
origin_type: paper_origin
origin_source: https://arxiv.org/abs/2611.19752
first_public_date: 2026-11-15
domain: temporal_memory_retrieval_and_retention
modality: text
task_grain: current_value_query_over_chronological_fact_versions
capability_axes:
  - stale_retrieval
  - temporal_supersession
  - context_contamination
  - entity_resolution
  - retention_cost
dataset_size: "892 changing fact keys across 9 relations, 424 validation and 468 test queries, 8 released configurations"
data_nature: templated_real_TempLAMA_Wikidata_facts_with_paraphrase_and_alias_controls
metrics:
  - current_at_1
  - stale_rate
  - miss_rate
  - current_at_5
  - contamination_at_5
  - slots
  - reader_accuracy
judge_type: source_defined_current_ids_and_normalized_reader_answer_containment
code_available: "yes, frozen evaluator, baselines, builders, and experiment scripts"
data_available: "yes, versioned JSONL statements, queries, keys, alias inventories, and cached outputs"
license: "paper CC BY 4.0, code Apache-2.0, core data and cached outputs CC0-1.0, natural alias inventories CC BY-SA 4.0"
known_limitations:
  - "Current means valid in the final year of the 2010–2020 source window."
  - "Core queries cover single-valued changing facts in nine English relation templates."
  - "Alias and paraphrase controls are constructed, with natural-alias variants separately released."
  - "Reader scoring uses normalized containment and depends on context/date presentation."
  - "Findings of EACL 2027 acceptance is author-reported future venue metadata."
canonical_sources:
  - https://arxiv.org/abs/2611.19752
  - https://arxiv.org/html/2611.19752v1
  - https://github.com/thenexuslab/stalebench-release
confidence: high
memory_modules:
  - evaluator-benchmark
  - retriever-reranker
last_revised: 2026-11-18
---

# StaleBench

## Identity and evidence classification

The exact paper title is **StaleBench: Isolating Stale Retrieval in Agent Memory, and Pricing the Fix**, by **S M Mahbub Murshed**. Its first public arXiv version is **2611.19752v1, November 15, 2026**. The inspected record has one version and lists cs.CL, cs.AI, and cs.IR. Its comments claim acceptance to **Findings of EACL 2027**. That is author-reported future acceptance as of this note's November 18, 2026 cutoff. A published ACL Anthology proceedings record was not verified. [Paper metadata](https://arxiv.org/abs/2611.19752)

`paper_origin` identifies the newly introduced retention/retrieval evaluation protocol. TempLAMA and Wikidata supply the upstream facts. Protocol evidence is `primary_paper` and the authors' system comparisons are `affiliated_evaluation`. The August radar's unlinked “StaleBench” mention has unresolved identity. Deduplication against the worktree and PR #42 at `cc4186d9b7774fe76fe0a0ca7163a8b3f9f97549` found no benchmark record for canonical ID 2611.19752. [Paper, §3](https://arxiv.org/html/2611.19752v1#S3)

Three names require distinct catalog identities. This record covers **StaleBench, 2611.19752**. Existing repository records cover **STALE: Can LLM Agents Know When Their Memories Are No Longer Valid?, 2605.06527**, and **When Stale Constraints Go Unchecked, 2608.25553**. The November paper's canonical ID establishes the identity used here. [StaleBench](https://arxiv.org/abs/2611.19752) [STALE](https://arxiv.org/abs/2605.06527) [Stale constraints](https://arxiv.org/abs/2608.25553)

## Scale and source data

The core construction starts with **5,839 TempLAMA fact keys**, retains **900 single-valued in every source year**, then retains **892 whose value changes**. It covers **nine relations** over **2010–2020**. Consecutive years with the same value collapse into one statement interval. The deterministic fact-key hash split yields **424 validation facts/queries** and **468 test facts/queries**. The gold value is the source-defined value in the final year of the window. [Paper, §3.2](https://arxiv.org/html/2611.19752v1#S3.SS2) [Release datasheet, Composition and Collection](https://github.com/thenexuslab/stalebench-release/blob/724fccc1ec4caec10b937d7e63159b4f8da7e6e5/release/DATASHEET.md)

The frozen release manifest enumerates **eight configurations**. Counts below refer to released files at revision `724fccc1ec4caec10b937d7e63159b4f8da7e6e5`. Each query has a corresponding key/label record. The scale variants expand to all changing facts, including multi-valued cases, and therefore have a broader population than the core 892-fact protocol. [Release manifest, configs, splits, scale_filters, and scale_splits](https://github.com/thenexuslab/stalebench-release/blob/724fccc1ec4caec10b937d7e63159b4f8da7e6e5/release/manifest.json)

| Configuration | Validation queries | Test queries | Validation statements | Test statements |
| --- | ---: | ---: | ---: | ---: |
| anchored | 424 | 468 | 899 | 995 |
| anchor_free | 424 | 468 | 899 | 995 |
| anchor_free_natural | 424 | 468 | 899 | 995 |
| anchor_free_natural_fallback | 424 | 468 | 899 | 995 |
| full_corpus | 424 | 468 | 6,737 | 7,078 |
| full_corpus_anchor_free | 424 | 468 | 6,737 | 7,078 |
| scale | 2,746 | 2,904 | 14,721 | 15,809 |
| scale_anchor_free | 2,746 | 2,904 | 14,721 | 15,809 |

## Protocol

1. **Ingest chronological fact statements.** Timestamps are metadata. A value-agnostic query asks for the current value of a named subject/relation. Supersession is judged from the source's validity labels. An A→B→A recurrence is evaluated by value, so the earlier A can match the final current value. [Paper, §3.1](https://arxiv.org/html/2611.19752v1#S3.SS1)
2. **Control wording and subject anchors.** Statements use canonical clozes or paraphrases with probability `p`, with main `p = 0.5`. Alias probability `a` replaces the full subject anchor after its first mention. Anchored uses `a = 0`, anchor-free uses `a = 1`. Mechanical aliases, natural aliases, and natural aliases with fallback are separately materialized. [Paper, §§3.2–3.3](https://arxiv.org/html/2611.19752v1#S3.SS2) [Manifest parameters](https://github.com/thenexuslab/stalebench-release/blob/724fccc1ec4caec10b937d7e63159b4f8da7e6e5/release/manifest.json)
3. **Compare retrieval and retention under fixed tuning.** Baselines include BM25 and cosine store-all, timestamp reranking, recency weighting, FIFO, and keyer × retention comparisons. Keyers include threshold matching, gazetteer, fuzzy linking, LLM top-four selection, and oracle variants. Retention includes overwrite and temporal knowledge-graph invalidation/history. The primary encoder is all-MiniLM-L6-v2, with all-mpnet-base-v2 robustness checks. Tune on validation and report on test. [Paper, §4](https://arxiv.org/html/2611.19752v1#S4)
4. **Measure the downstream reader separately.** Each policy's own top-five context goes to qwen2.5:14b or glm-4.6, with and without the stored year surfaced. Hyperparameters are inherited from validation retrieval tuning. Correct/stale reader answers use normalized containment against the source's current/superseded values. The reader track uses the 468-query anchored test configuration and a closed-book control. [Paper, §5.3](https://arxiv.org/html/2611.19752v1#S5.SS3)

The deployed-system probe uses a **150-fact anchored sample** with Mem0, Graphiti, LangMem, and a reimplemented ERASE. Systems that rewrite or synthesize stored text need explicit scoring conventions because original-statement identity can be lost. This probe has a different unit and scoring boundary from the frozen ID-based retrieval track. [Paper, §5.4](https://arxiv.org/html/2611.19752v1#S5.SS4)

## Metrics and statistical protocol

| Metric | Definition |
| --- | --- |
| `current@1` | Top-one ID belongs to the queried fact's current-value ID set. |
| `stale_rate` | Top-one ID belongs to the queried fact and carries a superseded value. |
| `miss_rate` | Top-one fails both current and stale membership for the queried fact. |
| `current@5` | At least one current-value ID appears in the top five. |
| `contamination@5` | Both current and stale IDs for the queried fact appear in the top five. |
| `slots` | Final memory-store size, measured in the policy experiments. |
| Reader accuracy | Correct current-value answers under normalized containment, with stale-answer decomposition and date-display conditions declared. |

The frozen scorer returns `current@1`, `stale_rate`, `miss_rate`, `current@5`, `contamination@5`, and `n_queries` at default `k = 5`. It requires all gold queries and averages per-query indicators. Slots, costs, and reader outcomes are separate experiment measurements. Current/stale/miss top-one outcomes are mutually exclusive. [Paper, §3.1](https://arxiv.org/html/2611.19752v1#S3.SS1) [Frozen evaluator](https://github.com/thenexuslab/stalebench-release/blob/724fccc1ec4caec10b937d7e63159b4f8da7e6e5/release/evaluate.py)

Main test comparisons use **468 queries**, **95% bootstrap intervals**, four prespecified paired tests, sign-flip permutation tests, and Holm correction. The reported validation-tuned settings include timestamp rerank `k = 2` and threshold `τ = 0.60`. Rerank depth and scorer top-k are distinct parameters. [Paper, §5.1](https://arxiv.org/html/2611.19752v1#S5.SS1)

## Artifacts and licenses

The public repository was created November 15, 2026. The inspected revision is `724fccc1ec4caec10b937d7e63159b4f8da7e6e5`, dated November 15, 2026. It includes statement/query/key JSONL files, a datasheet, a manifest with row counts and recorded MD5 values, a frozen evaluator, reference baselines/submissions, alias inventories, and cached model outputs. The manifest reports **30,818 cached entries**. This note inspected source and release metadata without executing the evaluator. [Repository](https://github.com/thenexuslab/stalebench-release) [Pinned release](https://github.com/thenexuslab/stalebench-release/tree/724fccc1ec4caec10b937d7e63159b4f8da7e6e5/release) [Manifest](https://github.com/thenexuslab/stalebench-release/blob/724fccc1ec4caec10b937d7e63159b4f8da7e6e5/release/manifest.json)

File-specific licensing is material for reuse. The data-license declaration supplies the boundaries below. [LICENSE-DATA.md](https://github.com/thenexuslab/stalebench-release/blob/724fccc1ec4caec10b937d7e63159b4f8da7e6e5/LICENSE-DATA.md)

| Component | Declared license |
| --- | --- |
| Code, experiment scripts, evaluator, baselines | Apache-2.0 |
| Statement, query, key files, verbalization templates, mechanical `alias_inventory.json` | CC0 1.0 |
| `release/alias_inventory_natural.json` and `v2/out/alias_inventory_natural*.json` | CC BY-SA 4.0 |
| `release/llm_cache.jsonl.gz` and `results/` | CC0 1.0 |
| arXiv paper | CC BY 4.0 |

Core facts derive from Wikidata's CC0 data through TempLAMA, whose authors distribute it under Apache-2.0. Natural alias inventories also include Wikipedia redirect titles and carry the declared share-alike boundary. The datasheet's general CC0 statement and the citation file's coarse Apache field need this file-specific qualification. [Data licensing](https://github.com/thenexuslab/stalebench-release/blob/724fccc1ec4caec10b937d7e63159b4f8da7e6e5/LICENSE-DATA.md) [Paper license metadata](https://arxiv.org/abs/2611.19752)

## Comparability and limitations

“Current” means valid in the final year of the **2010–2020** source window. The core queried population excludes facts that are multi-valued in a source year. English templates cover nine relations, while paraphrase and mechanical-alias conditions introduce controlled wording and entity-resolution difficulty. Naturalistic dialogue transfer remains unestablished. [Paper, §3.2](https://arxiv.org/html/2611.19752v1#S3.SS2) [Datasheet, Uses and Risks](https://github.com/thenexuslab/stalebench-release/blob/724fccc1ec4caec10b937d7e63159b4f8da7e6e5/release/DATASHEET.md)

Current@1 and current@5 can conceal conflicting older versions in the reader's context. Contamination@5 makes that exposure measurable. Reader outcomes depend on the reader and whether dates are shown, and normalized containment has answer-matching limits. Keep configuration, retention policy, encoder/keyer, top-k, and reader/date condition attached to any result. Reported system comparisons remain affiliated evaluations. [Paper, §§5.1–5.4](https://arxiv.org/html/2611.19752v1#S5)
