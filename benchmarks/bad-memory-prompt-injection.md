---
title: Bad Memory — prompt-injection risk from persistent agent memory
benchmark_id: bad-memory-prompt-injection
name: Bad Memory
aliases:
  - Bad Memory
status: seed
origin_type: paper_origin
origin_source: https://arxiv.org/abs/2607.14611
first_public_date: 2026-07
domain: memory_security
modality: text
task_grain: persistent_memory_prompt_injection
capability_axes:
  - memory_file_integrity
  - persistent_prompt_injection
  - multi_session_attack
  - memory_update_defense
data_nature: sandboxed_synthetic_workspace
metrics:
  - attack_success_rate
  - payload_persistence
judge_type: check
code_available: check
data_available: check
license: check
known_limitations:
  - seed note; sandbox setup, systems, model versions, and released package need full read
canonical_sources:
  - https://arxiv.org/abs/2607.14611
confidence: medium
memory_modules:
  - evaluator-benchmark
  - policy-privacy
  - ingest-adapter
last_revised: 2026-07-20
---

# Bad Memory

## What It Measures

Bad Memory evaluates prompt-injection risks introduced by persistent memory
files, behavioral preferences, and knowledge bases in agentic systems. It is
directly relevant to coding-agent memory because the paper studies planted
payloads that can influence future sessions through durable memory state.

## Protocol

The arXiv abstract describes a sandboxed synthetic workspace and evaluations
over Claude Code and OpenAI Codex-style systems. It distinguishes difficulty in
getting an agent to overwrite its own memory from the risk of payloads already
present in persistent memory files. Full workspace construction, adversarial
goals, judge prompts, released package, and model-version details need a deeper
read.

## Baselines and Reported Results

No normalized scores are logged here. Reported attack success and payload
persistence remain paper-origin claims until the setup is mapped and compared.

## Comparability Notes

Compare with MemPoison and memory-poisoning trajectory-forensics work on threat
model, not raw attack success. Bad Memory is especially useful for file-backed
agent memory and coding-agent memory systems.

## Related Papers

- Paper:https://arxiv.org/abs/2607.14611

## Impact Use

- `policy-privacy`:candidate protocol for protecting persistent memory updates
  and file-backed memory state.
- `ingest-adapter`:tests whether untrusted content can cross into durable
  memory.
- Ready for ImpactReport:no, upgrade after full protocol read.
