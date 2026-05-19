---
source_url: https://help.openai.com/en/articles/8983136-what-is-the-memory-feature
fetched: 2026-05-19
purpose: research backup; canonical is the URL above
---

# OpenAI ChatGPT memory — snapshot

Fetch returned: HTTP 403 Forbidden on both the help center article and the announcement page (https://openai.com/index/memory-and-new-controls-for-chatgpt/). Canonical URLs above remain the source of truth.

## Summary based on widely-known public information (verify against canonical pages)

ChatGPT memory is a per-account feature that lets ChatGPT remember information from prior conversations and apply it to future ones. Key points commonly reported by OpenAI:

- Memory was first announced in February 2024 and rolled out broadly to ChatGPT Plus users through 2024; later expanded with "reference chat history" in April 2025.
- ChatGPT either remembers items the user explicitly asks it to remember or extracts likely-useful long-term facts on its own.
- Users can view, edit, and delete individual memories in **Settings → Personalization → Memory**.
- Users can clear all memories or turn memory off entirely.
- "Temporary Chat" mode bypasses memory: the conversation is not stored and does not contribute to or read from memory.
- Memory is per-account and does not cross users.
- Availability and exact controls differ across Free / Plus / Pro / Team / Enterprise / EDU tiers.

## Assistants API (related platform surface)

OpenAI's Assistants API exposes a `Thread` primitive that persists messages across runs, and `file_search` / `code_interpreter` built-in tools. Threads are the closest first-party "memory" abstraction for developers building on the OpenAI platform; longer-term semantic memory across threads is typically built on top by the developer (vector store + retrieval). For canonical detail see https://platform.openai.com/docs/assistants/how-it-works.

> Both canonical pages returned 403 during the 2026-05-19 fetch; treat the above as background, not as a verbatim citation.
