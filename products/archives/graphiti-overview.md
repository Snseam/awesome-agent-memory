---
source_url: https://github.com/getzep/graphiti
fetched: 2026-05-19
purpose: research backup; canonical is the URL above
---

# Graphiti — snapshot

## What is Graphiti?

Graphiti is an open-source framework for constructing and querying temporal context graphs for AI agents. It diverges from static knowledge graphs by tracking how facts change over time, maintaining provenance, and supporting both prescribed and emergent ontologies.

Its core innovation: treating facts as temporally valid statements. Rather than storing a fact as permanent, Graphiti records it with validity windows — when it became true and when it was superseded.

## Key Distinctions from Traditional RAG

- **Incremental updates**: New data integrates immediately without recomputing entire graphs.
- **Temporal queries**: Retrieve what is true now or what was true at any past moment.
- **Hybrid search**: Semantic embeddings + keyword (BM25) + graph traversal.
- **Provenance tracking**: Every derived fact traces back to source episodes.

## Core Concepts

A context graph has four primary elements:

1. **Entities (nodes)**: People, products, or concepts with evolving summaries.
2. **Facts/relationships (edges)**: Triplets with temporal validity windows.
3. **Episodes**: Raw ingested data, the ground truth.
4. **Custom types**: Developer-defined entity and edge types via Pydantic models.

### Temporal Tracking

Facts maintain both valid-time (when something is true in the world) and transaction-time (when it entered the system) information, enabling precise historical reconstruction.

## Supported Backends

- Neo4j 5.26+
- FalkorDB 1.1.2+
- Kuzu 0.11.2+
- Amazon Neptune (with OpenSearch Serverless)

## Installation

```bash
pip install graphiti-core
# With FalkorDB support
pip install graphiti-core[falkordb]
# With alternative LLM providers
pip install graphiti-core[anthropic,groq]
```

## License

Apache 2.0.
