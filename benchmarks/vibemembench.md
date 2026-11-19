---
title: "VibeMemBench: Evaluating Memory Systems for Coding Agents on Real Repository Coding Tasks"
benchmark_id: vibemembench
name: VibeMemBench
aliases:
  - VibeMemBench
status: seed
origin_type: paper_origin
origin_source: https://arxiv.org/abs/2609.23570
first_public_date: 2026-09-20
domain: repository_coding_agent_memory
modality: text
task_grain: paired_repository_target_seed
capability_axes:
  - cross_task_experience_reuse
  - memory_construction
  - experience_retrieval
  - downstream_coding_utility
dataset_size: "111 targets, 90 repositories, 3634 history trajectories, 9 languages"
data_nature: real_repository_tasks_with_offline_outcome_selected_experience
metrics:
  - resolved
  - paired_resolved_difference
  - targets_resolved_four_of_four_seeds
  - solver_input_tokens_per_run
  - solver_output_tokens_per_run
  - agent_steps_per_run
judge_type: executable_tests
code_available: "yes, public harness and scripts, evaluated memory-system adapters omitted"
data_available: "yes, public Hugging Face target parquet and 3634 history files"
license: "paper CC BY 4.0, code Apache-2.0, dataset card declares Apache-2.0, upstream repository rights require separate review"
known_limitations:
  - "Targets are selected for positive reference-solver memory uplift after oracle-assisted screening."
  - "History release includes target trajectories, so causal filtering is required before ingestion."
  - "Reported token accounting excludes memory-side consumption."
  - "The four evaluated memory-system adapters are not included in the code release."
canonical_sources:
  - https://arxiv.org/abs/2609.23570
  - https://arxiv.org/html/2609.23570v1
  - https://github.com/AlibabaResearch/DAMO-ConvAI/tree/main/VibeMemBench
  - https://huggingface.co/datasets/Tongyi-ConvAI/VibeMemBench
confidence: high
memory_modules:
  - evaluator-benchmark
  - retriever-reranker
last_revised: 2026-11-18
---

# VibeMemBench

## Identity and evidence classification

The exact paper title is **VibeMemBench: Evaluating Memory Systems for Coding Agents on Real Repository Coding Tasks**. Authors, in order, are Liyang Fan, Yingcheng Shi, Yongbin Li, Chenghao Sun, Xin Chen, Xander Xu, Hu Wei, Shiwen Ni, Min Yang, and Jieping Ye. The first public arXiv version is **2609.23570v1, September 20, 2026**. The inspected record has one version. Its primary category is cs.SE, with cs.CL also listed. This note uses the arXiv preprint as the publication identity. [Paper metadata](https://arxiv.org/abs/2609.23570)

`paper_origin` identifies the origin of this evaluation protocol. SWE-rebench V2 supplies the upstream repository tasks. Protocol claims have evidence class `primary_paper`, while the authors' comparisons have evidence class `affiliated_evaluation`. The November 16 radar already listed VibeMemBench as a coding-memory backfill lead. Deduplication against the worktree and PR #42 at `cc4186d9b7774fe76fe0a0ca7163a8b3f9f97549` found no benchmark record for this title or canonical ID. [Construction, §§3.1–3.3](https://arxiv.org/html/2609.23570v1#S3)

## Scale and evaluation unit

The benchmark contains **111 coding targets from 90 repositories**, with **3,634 completed agent history trajectories** spanning **nine languages**. Targets include bug fixes, features, interface changes, and configuration work. Targets in the same repository can share eligible histories. The released language counts are below. [Paper, §3.1](https://arxiv.org/html/2609.23570v1#S3.SS1) [Dataset card, Counts](https://huggingface.co/datasets/Tongyi-ConvAI/VibeMemBench/blob/11164976b4f920cdb0d0cd570ca572e49acea1e8/README.md#counts)

| Language | Targets | History trajectories |
| --- | ---: | ---: |
| Python | 56 | 2,043 |
| JavaScript | 16 | 503 |
| Go | 12 | 263 |
| Rust | 10 | 185 |
| TypeScript | 5 | 383 |
| Kotlin | 4 | 170 |
| Swift | 4 | 47 |
| Java | 2 | 34 |
| PHP | 2 | 6 |
| Total | 111 | 3,634 |

The experimental unit is a **target × seed**, paired between memory-off and memory-on conditions. Four seeds produce **444 target-seed runs per condition**. Executable tests determine the binary resolved outcome. [Paper, §4.1 and Table 1](https://arxiv.org/html/2609.23570v1#S4.SS1)

## Protocol

1. **Construct useful historical experience offline.** SIEVE first validates the source gold patch against tests, then screens earlier same-repository histories using shared files, directories, and cleaned identifiers followed by LLM repair-pattern judging. Target gold information participates in offline screening. Target-aware distillation receives the target problem and historical problems, trajectories, and final patches. Runtime retrieval, distillation, and solver context exclude target gold and test patches. [Paper, §3.2](https://arxiv.org/html/2609.23570v1#S3.SS2)
2. **Select and freeze the reference experience.** The reference setting uses deepseek-v4-flash with MiniSWEAgent and four seeds per condition. For each target, select the finite shortlisted memory combination with the largest memory-on minus memory-off resolved share. Retain a target only when reference memory-off resolution is below one and its best observed uplift is positive. Freeze the chosen combination before transfer evaluation. [Paper, §3.3](https://arxiv.org/html/2609.23570v1#S3.SS3)
3. **Pair downstream coding runs.** Hold solver, prompt, tools, sandbox, resource/context limits, order, and aggregation fixed across the memory conditions. Declare the write procedure, retrieval trigger, insertion location, and truncation policy. The frozen-experience layer transfers to five held-out solvers with four seeds each, with an irrelevant-memory control on three solvers. [Paper, §§3.4–3.5](https://arxiv.org/html/2609.23570v1#S3.SS4)
4. **Measure the memory system's delivery gap.** The second layer evaluates Mem0, SimpleMem, MemoryOS, and A-MEM. Each ingests eligible historical trajectories and retrieves one top-ranked experience before target execution. Three solvers and four systems yield **12 solver/system pairings**. The reported setup uses deepseek-v4-flash for extraction and Qwen3-Embedding-4B embeddings. [Paper, §3.5](https://arxiv.org/html/2609.23570v1#S3.SS5)

The release's causal rule requires the same repository and a strictly smaller trailing issue number in `instance_id`. **The history directory includes targets' own trajectories.** Ingestion must apply this filter before building memory, including before offline summaries or indexes. The release operationalizes chronology with issue numbers. [Dataset card, Causal rule](https://huggingface.co/datasets/Tongyi-ConvAI/VibeMemBench/blob/11164976b4f920cdb0d0cd570ca572e49acea1e8/README.md#causal-rule)

## Metrics and uncertainty

- **Resolved** is the mean binary test-passing outcome across the 444 runs in a condition. The paired effect is memory-on minus memory-off Resolved, expressed in percentage points.
- **95% confidence intervals** use a percentile bootstrap with **10,000 resamples of the 111 targets**, keeping each target's four seeds together.
- **4/4** counts targets resolved in all four seeds.
- **Input tokens/run, output tokens/run, and steps/run** are solver-side means. Reported token accounting excludes memory-side token consumption. Wall-clock latency and API prices are outside these reported comparisons.

These definitions come from §4.1 and Table 1. No benchmark runs or independent reproduction were performed for this note. [Paper, §4.1](https://arxiv.org/html/2609.23570v1#S4.SS1)

## Artifacts and licenses

The public code directory contains the harness/scripts, README files, assets, and an **Apache-2.0** license. The inspected directory revision is `7152cf96809b45343ccc1caf7115a7d3fa43f956`, dated October 19, 2026. The README says the adapters used for the four evaluated memory systems are omitted, so reproducing those comparisons requires implementing the adapters. [Code and release README](https://github.com/AlibabaResearch/DAMO-ConvAI/tree/7152cf96809b45343ccc1caf7115a7d3fa43f956/VibeMemBench) [Code license](https://github.com/AlibabaResearch/DAMO-ConvAI/blob/7152cf96809b45343ccc1caf7115a7d3fa43f956/VibeMemBench/LICENSE)

The Hugging Face dataset was created **October 19, 2026** and its inspected revision is `11164976b4f920cdb0d0cd570ca572e49acea1e8`, last modified October 19, 2026. The public, ungated API lists **3,634 history files** and `test.parquet`. The card specifies **111 targets**, approximately **1 MB** of targets and **2.2 GB** of histories. It declares **Apache-2.0** for the dataset. The GitHub README's “coming soon” wording is stale relative to this available dataset release. Artifact inspection covered the API inventory and dataset card, without downloading the complete history corpus or executing the harness. [Dataset](https://huggingface.co/datasets/Tongyi-ConvAI/VibeMemBench) [Dataset API](https://huggingface.co/api/datasets/Tongyi-ConvAI/VibeMemBench) [Pinned dataset card](https://huggingface.co/datasets/Tongyi-ConvAI/VibeMemBench/blob/11164976b4f920cdb0d0cd570ca572e49acea1e8/README.md)

The arXiv paper carries **CC BY 4.0**. Code and dataset declarations should be recorded separately from the rights in upstream repository contents and patches. Their source repositories retain their applicable license boundaries. [Paper license metadata](https://arxiv.org/abs/2609.23570) [Dataset license declaration](https://huggingface.co/datasets/Tongyi-ConvAI/VibeMemBench/blob/11164976b4f920cdb0d0cd570ca572e49acea1e8/README.md)

## Comparability and limitations

The population is outcome-enriched through oracle-assisted screening and positive reference-uplift selection. The reference argmax can amplify seed noise. Frozen transfer avoids selecting a fresh winning experience for each evaluation solver, while retaining the selected target population. These conditions limit generalization to arbitrary repository tasks. [Paper, §3.3 and §6](https://arxiv.org/html/2609.23570v1#S3.SS3) [Limitations](https://arxiv.org/html/2609.23570v1#S6)

The benchmark lacks gold retrieval-relevance labels. Its headline coding effect combines memory construction, retrieval, insertion, and the solver's ability to use the delivered experience. Solver coverage is budget-limited, and the resource columns omit memory-side costs. Treat reported comparisons as affiliated results under the declared harness and accounting. [Paper, §§3.5, 4.1, and 6](https://arxiv.org/html/2609.23570v1#S3.SS5)
