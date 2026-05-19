---
source_url: https://platform.claude.com/docs/en/managed-agents/dreams
fetched: 2026-05-19
purpose: research backup; canonical is the URL above
---

# Claude Dreams — snapshot

> Status: Research Preview (request-access). All Managed Agents API requests require the `managed-agents-2026-04-01` beta header. Dreams additionally require the `dreaming-2026-04-21` beta header.

Agents write to their memory stores incrementally during work, so over many sessions a store accumulates duplicates, contradictions, and stale entries. **Dreams** let Claude clean that up. A dream reads an existing memory store alongside past session transcripts and produces a new, reorganized memory store: duplicates merged, stale or contradicted entries replaced with the latest value, and new insights surfaced. The input store is never modified, so the output can be reviewed and discarded.

## How it works

A dream is an asynchronous job with two inputs:

- A pre-existing **memory store** (the store Claude verifies, dedupes, reorganizes).
- 1 to 100 **sessions** (past transcripts to mine for patterns and insights).

It produces another **output memory store**, separate from the input. The output store ID appears in `outputs[]` once status becomes `running`.

## Create a dream (Python example)

```python
dream = client.beta.dreams.create(
    inputs=[
        {"type": "memory_store", "memory_store_id": store_id},
        {"type": "sessions", "session_ids": [session_a, session_b]},
    ],
    model="claude-opus-4-7",
    instructions="Focus on coding-style preferences; ignore one-off debugging notes.",
)
print(dream.id)  # drm_01...
```

The response is the full `dream` resource with `status: "pending"`. Supported models during preview: `claude-opus-4-7`, `claude-sonnet-4-6`.

## Lifecycle

| status | meaning |
| --- | --- |
| `pending` | Successfully created and queued. |
| `running` | Pipeline is processing; `usage` updates as work progresses. |
| `completed` | Finished successfully; `outputs[]` is the new memory store. |
| `failed` | Pipeline terminated with an error; output store left as-is. |
| `canceled` | Run canceled; output store left as-is. |

Once running, the dream's `session_id` points at the underlying session executing the pipeline. That session can be streamed to observe reads and writes in real time. The session is archived (not deleted) when the dream reaches a terminal state.

## Use the output

When `status` reaches `completed`, the `memory_store` entry in `outputs[]` references a fully populated store — an ordinary memory store in the workspace. Review it via the Memory Stores API or the Console, then either:

- **Leverage it** — attach it to future sessions as a `memory_store` resource in place of (or alongside) the input store, or
- **Discard it** — delete or archive.

The dream itself never modifies its inputs. On `failed` or `canceled` the output store persists with whatever partial contents were written before stopping.

## Cancel and archive

- `cancel` moves a `pending` or `running` dream to `canceled`. Canceling completed/failed dreams returns 400.
- `archive` sets `archived_at` on a terminal-state dream; status unchanged. Archived dreams are excluded from default list responses. No unarchive.

## Errors

| `error.type` | When |
| --- | --- |
| `timeout` | Pipeline exceeded its runtime budget. |
| `internal_error` | Unclassified pipeline failure. |
| `memory_store_org_limit_exceeded` | Org hit memory-store cap while pipeline provisioned working storage. |
| `input_memory_store_too_large` | Input store exceeds pipeline size limit. |
| `input_memory_store_unavailable` | Input store archived/deleted mid-run. |
| `input_session_unavailable` | An input session archived/deleted mid-run. |

## Billing

Standard API token rates for the selected model; `usage` on the resource reports exact totals. Cost scales roughly linearly with the number and length of input sessions.

## Limits

| Limit | Value |
| --- | --- |
| Sessions per dream | 100 |
| `instructions` length | 4,096 characters |
| Supported models | `claude-opus-4-7`, `claude-sonnet-4-6` |
