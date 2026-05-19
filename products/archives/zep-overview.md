---
source_url: https://www.getzep.com
fetched: 2026-05-19
purpose: research backup; canonical is the URL above
---

# Zep — snapshot

## Product Positioning

Zep is a context-engineering and agent memory platform. Its premise: "Agents fail without the right context." Beyond chat memory, it assembles relevant context from multiple data sources so developers can build personalized, fast, and reliable agents with minimal code.

## Core Architecture: Temporal Knowledge Graph

Zep uses a temporal context graph that evolves continuously with user interactions.

- **Fact invalidation**: When information changes, outdated facts are invalidated automatically while temporal validity ranges are preserved.
- **Entity extraction**: Entities and relationships are extracted from ingested data.
- **Persistent context**: State changes are captured across time with full provenance for agent reasoning.

## Core Features

### Memory Layer
- Ingests chat history, JSON business data, documents, and app events.
- Builds a unified context graph across sources.
- Real-time updates as data changes.

### Graphiti (open-source foundation)
- Zep's temporal context graph library is open source on GitHub.
- It is the foundational component for building real-time context graphs.

### Knowledge Graph & Graph RAG
- Customizable entity types and relationship models for domain-specific precision.
- Simple APIs for automatic context generation, with direct graph access for advanced users.
- Supports create/update/search over entities and relationships.

## APIs & SDKs

- "Three lines of code" to production.
- Language support: Python, TypeScript, Go.
- Framework-agnostic.
- JSON, text, and message ingestion formats.

Python example:

```python
response = client.thread.add_messages(
    thread_id=thread_id,
    messages=messages,
    return_context=True,
)
```

## Performance & Efficiency

- Sub-200ms P95 retrieval latency.
- Claimed 80.32% accuracy on LoCoMo with single-shot retrieval.
- Multiple configuration options trade off accuracy, latency, and tokens.

## Hosting Model

Cloud platform with a free tier (no credit card required). Enterprise deployments available.

## Compliance & Security

- SOC 2 Type II.
- HIPAA compliance.

## Target Users

- Developers shipping context-engineering features without building infrastructure.
- Engineering leaders deploying personalized agents in days rather than months.
- Enterprise teams that need compliance and scale.

## Domain Templates

Pre-built domain templates: Sales & Marketing, Customer Support, E-commerce, Education, Healthcare. Each ships with custom entity models (lead preferences, decision timelines, budget ranges, etc.).
