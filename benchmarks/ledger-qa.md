---
title: "Ledger-QA: accumulated state tracking for memory agents"
benchmark_id: ledger-qa
name: Ledger-QA
aliases:
  - LedgerQA
status: seed
origin_type: paper_origin
origin_source: https://aclanthology.org/2026.emnlp-main.1299/
first_public_date: 2026-02
domain: accumulated_state_tracking
modality: text
task_grain: multi_session_ledger_question_answering
capability_axes:
  - incremental_state_maintenance
  - update_aggregation
  - query_agnostic_memory_reuse
dataset_size: "v2 evaluation: 30 streams over nine session horizons; training release: 200 rows"
data_nature: synthetic_dialogue_and_structured_transactions
metrics:
  - llm_judged_correctness
  - normalized_token_set_exact_match
  - token_f1
  - rouge_l
judge_type: DeepSeek-V3.2_main_and_Qwen3-30B-A3B-Instruct-2507_supplementary
code_available: yes
data_available: public_training_release_and_test_generator
license: Apache-2.0 training-data metadata; test artifact and code license need verification
known_limitations:
  - synthetic bookkeeping is a diagnostic task rather than general personal-memory validation
  - paper evaluation uses only three to five streams per horizon
  - public training data is not the frozen paper test split
  - README Apache-2.0 badge is not a verified repository-wide license grant
  - origin-author results and model cards are not independent reproductions
canonical_sources:
  - https://aclanthology.org/2026.emnlp-main.1299/
  - https://arxiv.org/html/2602.18493v2
  - https://github.com/ictnlp/unified-memory-agent/blob/90f8d900481bf16693d17d9bc7f4dcc76c7afd4b/README.md
  - https://huggingface.co/datasets/dp66/ledger-qa-train
confidence: medium
memory_modules:
  - evaluator-benchmark
  - memorydiff-generator
last_revised: 2026-10-26
---

# Ledger-QA

## What It Measures

Introduced with UMA, Ledger-QA tests accumulated state derived from synthetic
dialogues and aligned transactions, rather than finding an existing answer
span. It complements [MINTEval](minteval.md) without duplicating that benchmark.

## Protocol and Scale

ArXiv v2 Table 7 lists three to five streams at each of nine horizons
(2–500 sessions), totaling 30. Distinguish UMA-Generalist's transfer setting
from Ledger-QA-trained UMA-Specialist; comparisons include full-context, RAG,
and memory agents. No author-reported score is promoted as independent evidence.

## Metrics and Judging

Appendix K's lexical normalization removes ASCII punctuation, potentially
changing decimals and negative numbers. Its EM compares token sets, not raw
numeric equality. Report judge and lexical metrics separately; preserve the
normalization implementation with each result.

## Artifact and License Boundaries

The [pinned README](https://github.com/ictnlp/unified-memory-agent/blob/90f8d900481bf16693d17d9bc7f4dcc76c7afd4b/README.md)
provides evaluation code, a test-data generation route, and a link to
[`dp66/ledger-qa-train`](https://huggingface.co/datasets/dp66/ledger-qa-train).
That training-data card declares Apache-2.0 but provides no substantive dataset
description. A frozen test release matching the paper was not verified.

The README displays an Apache-2.0 badge, but no root license file was found in
the inspected repository tree. Do not treat that badge, bundled dependencies'
licenses, or a model-card license as a verified grant for all code and data.

## Impact Use

- `evaluator-benchmark`: distinguish incremental state maintenance from finding
  an existing answer span.
- Ready for ImpactReport: no; freeze test generation and arithmetic scoring,
  verify artifact terms, and rerun matched baselines first.

## Sources

- Official publication: https://aclanthology.org/2026.emnlp-main.1299/
- Versioned protocol, Table 7 and Appendix K: https://arxiv.org/html/2602.18493v2
- Pinned code/setup: https://github.com/ictnlp/unified-memory-agent/blob/90f8d900481bf16693d17d9bc7f4dcc76c7afd4b/README.md
- Training data: https://huggingface.co/datasets/dp66/ledger-qa-train
