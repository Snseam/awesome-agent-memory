---
source_url: https://help.aliyun.com/zh/model-studio/memory-library
source_api: https://help.aliyun.com/zh/model-studio/long-term-memory-2-0
fetched: 2026-06-11
purpose: research backup; canonical sources are the URLs above
---

# Alibaba Cloud Bailian Memory Library — snapshot

## Positioning

Alibaba Cloud Model Studio / Bailian documents a memory library and long-term
memory API for extracting, storing, retrieving, and injecting user memory in
agent applications.

## Public Architecture

- Historical dialogue is processed into memory fragments and user profiles.
- Developers call APIs such as `AddMemory` and `SearchMemory`.
- Retrieval results are injected into prompts by the application.
- The docs describe open API integration and shared memory libraries across
  applications.

## Evidence Boundary

This is a cloud managed API. Internal extraction, merge, conflict resolution,
and ranking behavior are not fully public.
