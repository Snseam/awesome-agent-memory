---
source_url: https://langchain-ai.github.io/langmem/
fetched: 2026-05-19
purpose: research backup; canonical is the URL above
---

# LangMem — snapshot

## What It Is

LangMem is a framework that lets AI agents learn and adapt through interactions over time. It provides tools to extract conversation insights, refine agent behavior via prompts, and maintain long-term memory across sessions.

## Core Capabilities

**Memory management tools:**
- Agents can record and search information during active conversations (the "hot path").
- Background processing extracts, consolidates, and updates knowledge.
- Works with any storage system and integrates natively with LangGraph's storage layer.

**Key features (as listed in docs):**
- Core memory API that works with any storage system.
- Memory management tools agents can use to record and search information.
- Background memory manager that automatically extracts, consolidates, and updates.
- Native integration with LangGraph's Long-term Memory Store.

## API Surface

Primary tools:
- `create_manage_memory_tool()` — stores relevant conversation details.
- `create_search_memory_tool()` — retrieves memories with similar content.
- `InMemoryStore` for development; `AsyncPostgresStore` for production persistence.

## LangGraph Integration

LangMem integrates natively with LangGraph's storage layer. Memory tools function inside any LangGraph application.

## Distribution & License

The fetched docs landing page does not specify hosting model, open-source status, or licensing for LangMem itself.
