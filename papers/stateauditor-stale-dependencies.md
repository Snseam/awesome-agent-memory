---
title: "When Memory Updates but Behavior Does Not: Repairing Implicit Stale Dependencies in Personalized Agent Responses"
arxiv_id: 2608.01619
source: arXiv:2608.01619
date: 2026-08
domain: memory_update
core_claim: |
  Memory-augmented agents can store updated user state while still planning from
  stale dependencies; draft-side auditing can catch some hidden old-state use.
evidence_level: medium
code_available: check
license: check
memory_modules:
  - memorydiff-generator
  - policy-privacy
  - evaluator-benchmark
status: seed
last_revised: 2026-08-10
urls:
  - https://arxiv.org/abs/2608.01619
  - https://arxiv.org/abs/2605.06527
---

# StateAuditor / stale dependencies(arXiv 2608.01619)

## Problem statement

The paper builds on the STALE benchmark: an agent may know that stored user
state changed but still draft a response that depends on the outdated state.
This is hard to detect because the stale premise may be implicit rather than
written in the final response.

## Core claim

StateAuditor reverses the verification direction. It proposes old-to-new
transitions from timestamped evidence, pins quotations to memory entries, checks
chronology deterministically, and lets only verified transitions trigger repair
of the draft.

Reported STALE and HorizonBench gains are author-reported paper-origin claims.
The authors explicitly bound the claim and do not present it as a general-purpose
memory solution.

## Decision relevance

- `memorydiff-generator`:supersession should be tracked as verified transitions
  with provenance and chronology.
- `policy-privacy`:draft-time checks should audit hidden stale dependencies,
  not only explicit statements.
- `evaluator-benchmark`:benchmarks should distinguish memory update success
  from behavior adaptation success.

## Caveats

本地笔记是 seed 质量。The repository already has a STALE scrape stub for
arXiv:2605.06527; this note records the newer StateAuditor paper and keeps the
benchmark-origin STALE stub separate.

## Sources

- arXiv:https://arxiv.org/abs/2608.01619
- STALE benchmark stub source:https://arxiv.org/abs/2605.06527

---

> *Ymem 项目对本笔记决策相关性的具体绑定见
> [`../docs/ymem-binding/relevance-index.md`](../docs/ymem-binding/relevance-index.md)。*
