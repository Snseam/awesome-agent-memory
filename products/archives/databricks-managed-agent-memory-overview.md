---
title: Databricks Managed Agent Memory source snapshot
source: https://learn.microsoft.com/en-us/azure/databricks/agents/agent-memory/managed-memory
date: 2026-07-27
status: archive-summary
---

# Databricks Managed Agent Memory source snapshot

This archive summary records the official Microsoft Learn / Azure Databricks
page checked during the 2026-07-27 weekly radar refresh.

- The page marks Managed agent memory as Beta.
- Managed memory gives agents long-term memory across conversations.
- Memory stores are Unity Catalog securables; entries are scoped and path-shaped.
- Documented examples show direct memory-entry REST APIs and OpenAI-compatible
  conversation binding through the Databricks OpenAI client.
- The page warns that scope is the user isolation boundary and should be set in
  trusted code, not by the model.
- Documented access controls include create, read, write, and manage privileges
  for memory stores.

Evidence class: official product documentation. It supports product-behavior and
governance-surface claims only.
