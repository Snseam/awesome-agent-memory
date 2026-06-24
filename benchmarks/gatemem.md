---
title: GateMem — memory governance in multi-principal shared-memory agents
benchmark_id: gatemem
name: GateMem
aliases:
  - GATEMEM
status: seed
origin_type: paper_origin
origin_source: https://arxiv.org/abs/2606.18829
first_public_date: 2026-06
domain: shared_memory_governance
modality: text
task_grain: multi_principal_long_horizon_episode
capability_axes:
  - utility
  - access_control
  - active_forgetting
dataset_size: 91 episodes / 2,218 hidden checkpoints
data_nature: synthetic_long_form_multi_party_episodes
metrics:
  - task_utility
  - leakage
  - deletion_compliance
  - memory_governance_score
judge_type: structured_judging
code_available: yes
data_available: yes
license: MIT code; dataset license check
known_limitations:
  - seed note; protocol, leaderboard, and dataset license require full read
canonical_sources:
  - https://arxiv.org/abs/2606.18829
  - https://rzhub.github.io/GateMem/project.html
  - https://github.com/rzhub/GateMem
  - https://huggingface.co/datasets/Ray368/GateMem
  - https://rzhub.github.io/GateMem/
confidence: medium
memory_modules:
  - evaluator-benchmark
  - policy-privacy
  - retriever-reranker
last_revised: 2026-06-24
---

# GateMem

## What It Measures

GateMem evaluates shared-memory agents where multiple principals write into and
query a common memory pool. It jointly tests:

- legitimate long-horizon utility after state updates;
- access control across contextual authorization boundaries;
- active forgetting after explicit deletion requests.

## Dataset / Scale

The arXiv abstract and project page describe medical, office, education, and
household domains, with 91 long-form multi-party episodes and 2,218 hidden
checkpoints. The code repository and Hugging Face dataset are public; dataset
license and split details still need a full read.

## Protocol

GateMem is important because it rejects the single-user private-memory assumption
that dominates older memory benchmarks. It treats memory quality as governance:
an agent must remember enough to help the requester, avoid leaking memories to
the wrong requester, and honor deletion.

## Metrics and Judging

The seed sources name utility, access-control violation, active-forgetting
failure, and a combined Memory Governance Score. Judge implementation details
are not yet mapped in this repo.

## Baselines and Reported Results

Only the paper-origin benchmark event is logged in `claims/claims.yaml`.
Normalized metrics, baselines, reported scores, and leaderboard submissions
still require a full read.

## Validity / Contamination / License Caveats

- Code and dataset are public; dataset license and full data card details require
  verification.
- Multi-principal policy setups may be hard to compare across systems unless
  scope, role, and deletion semantics are normalized.

## Comparability Notes

Compare GateMem with MemoryAgentBench selective forgetting and LongMemEval
abstention/update axes, but do not average its access-control results with
single-user recall benchmarks.

## Related Papers

- Paper:https://arxiv.org/abs/2606.18829
- Project page:https://rzhub.github.io/GateMem/project.html
- Code:https://github.com/rzhub/GateMem
- Dataset:https://huggingface.co/datasets/Ray368/GateMem
- Leaderboard:https://rzhub.github.io/GateMem/

## Impact Use

- `policy-privacy`:first-class benchmark candidate for scoped recall and access control.
- `evaluator-benchmark`:candidate for Ymem shared-memory governance tests.
- Ready for ImpactReport:no, upgrade from seed after full read.
