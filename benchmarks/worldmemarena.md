---
title: "WorldMemArena: multimodal memory lifecycle diagnosis"
benchmark_id: worldmemarena
name: WorldMemArena
aliases: []
status: seed
origin_type: paper_origin
origin_source: https://arxiv.org/pdf/2605.29341v2
first_public_date: 2026-05
domain: multimodal_memory_lifecycle
modality: text_and_images
task_grain: multi_session_task_with_checkpoint_qa
capability_axes:
  - memory_writing
  - update_and_interference_handling
  - evidence_retrieval
  - downstream_memory_use
dataset_size: "461 samples; 24,258 QA pairs; 150-sample small subset"
data_nature: synthetic_lifelong_states_and_agent_trajectories
metrics:
  - memory_recall
  - update_handling
  - interference_rejection
  - retrieval_recall_and_ndcg
  - qa_correctness_f1_bleu
judge_type: llm_judge_plus_lexical_and_evidence_metrics
code_available: yes
data_available: yes
license: MIT code; CC-BY-NC-4.0 dataset
known_limitations:
  - arXiv abstract landing page says 400 while v2 PDF and dataset card say 461
  - answer-only baselines do not expose session-level memory metrics
  - origin results are not independently reproduced
  - dataset files and upstream asset rights have not been locally audited
canonical_sources:
  - https://arxiv.org/abs/2605.29341
  - https://arxiv.org/pdf/2605.29341v2
  - https://github.com/UCSB-AI/WorldMemArena/blob/15ea25b723d9c4fb35e8062037aec6a5601e4442/README.md
  - https://huggingface.co/datasets/LCZZZZ/WorldMemArena
confidence: medium
memory_modules:
  - evaluator-benchmark
  - retriever-reranker
last_revised: 2026-10-26
---

# WorldMemArena

## What It Measures

WorldMemArena separates writing, maintenance, retrieval, and use of memory in
multimodal multi-session tasks. Lifelong scenarios evolve personal or project
state; agent scenarios retain observations, actions, and feedback. The paper
reports stage annotations and checkpoint QA, enabling failure localization
rather than inference from final answer accuracy alone.

## Dataset / Scale and Source Discrepancy

The [v2 PDF](https://arxiv.org/pdf/2605.29341v2), dated 2026-06-01, states 461
samples in its abstract and dataset section. The official dataset card agrees:
203 GUI, 220 embodied, 18 project, and 20 personal samples, totaling 24,258 QA
pairs and 15,595 images. The code exposes a 150-sample small subset.

The [arXiv landing-page abstract](https://arxiv.org/abs/2605.29341) still says
400. This note records the disagreement and uses the PDF/card count; it does
not infer a verified 400-to-461 release history. Pin data revision and selected
sample IDs before comparing runs. No dataset download or row-level audit was
performed here.

## Protocol and Comparability

The implementation supports memory pipelines, long-context models, and agent
harnesses. Memory pipelines report session-level writing/update/interference
metrics and checkpoint QA. `BaseModel-*` and `Harness-*` use `answer_only` mode:
they report QA outcomes but omit session-level memory metrics. Missing metrics
must not be treated as zero or used for a cross-paradigm lifecycle ranking.

The paper's maintenance criterion requires keeping updated information and
removing or overwriting its obsolete version. This is a task-specific freshness
criterion, not proof of secure deletion from backups or derived artifacts.

## Evidence and License Boundaries

The repository declares MIT for code; the dataset card declares CC-BY-NC-4.0
for data. These are separate permissions. Upstream asset rights remain an audit
item. Reported evaluations are paper-origin evidence, not independent reruns.
Judge, model, split, and adapter configuration must accompany any result.

## Impact Use

- `evaluator-benchmark`: diagnose where multimodal memory loses useful evidence.
- Ready for ImpactReport: no; verify data revision, licensing, adapters and judge
  settings, then run a controlled evaluation.

## Sources

- Paper and protocol: https://arxiv.org/pdf/2605.29341v2
- Source inconsistency: https://arxiv.org/abs/2605.29341
- Pinned implementation guide: https://github.com/UCSB-AI/WorldMemArena/blob/15ea25b723d9c4fb35e8062037aec6a5601e4442/README.md
- Dataset card and license: https://huggingface.co/datasets/LCZZZZ/WorldMemArena
