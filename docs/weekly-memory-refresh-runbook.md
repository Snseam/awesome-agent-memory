---
title: Weekly Memory Refresh Runbook
date: 2026-06-24
status: working-spec
language: zh-CN
---

# Weekly Memory Refresh Runbook

This runbook turns the manual memory-radar refresh into a repeatable Codex job.
It is intentionally conservative: automation reduces missed signals, but every
accepted item must still be grounded in primary evidence.

## 1. Weekly Objective

The Codex App owns the schedule:

- recommended local automation name: `awesome-agent-memory weekly radar refresh`;
- cadence: weekly cron, Monday 09:00 in the user's local timezone;
- workspace: `<repo-root>`;
- execution environment: isolated Codex worktree;
- base ref: fetch and start from the latest `origin/main`;
- output gate: create a PR only when verified changes exist.

Each weekly run should refresh `awesome-agent-memory` across four evidence
surfaces:

- papers: new arXiv, OpenReview, ACL Anthology, and major-conference entries;
- products: official memory product docs, release notes, and product pages;
- GitHub / lists: repositories, benchmark lists, and companion survey repos as
  discovery signals only;
- benchmarks: protocol notes, claims-ledger events, adjacent baselines, and
  source mismatches.

The job must end in exactly one of two states:

- a ready pull request with verified docs/evidence changes; or
- a no-change weekly report that explains the search scope and why nothing was
  promoted.

Do not merge the PR automatically. Do not create an empty PR.

## 2. Source Targets

Use official and primary sources first.

| Lane | Primary targets | Notes |
|---|---|---|
| Papers | arXiv, OpenReview, ACL Anthology, conference pages for ICLR / ICML / NeurIPS / ACL / EMNLP / COLM | Prefer paper pages, PDFs, official code, and conference metadata over summaries. |
| Products | AWS, Google, Microsoft, Cloudflare, OpenAI, Anthropic, Letta, Mem0, Zep, Graphiti, LangGraph / LangMem, Redis, Tencent, Alibaba, Oracle | Vendor pages support product-behavior claims, not independent performance conclusions. |
| GitHub / lists | GitHub repos, GitHub topics, release pages, FeishuLuo-style companion lists, MCP catalogs | Discovery only. Stars and README prose are weak signals until checked against source docs or papers. |
| Benchmarks | benchmark papers, dataset cards, official repositories, independent reproductions | Separate origin protocol, vendor claim, affiliated eval, independent reproduction, and critique. |

## 3. Subagent Plan

Use up to six Codex subagents. Keep prompts bounded and ask each subagent for
candidate rows plus evidence URLs and rejection rationale.

| Subagent | Responsibility | Output |
|---|---|---|
| `researcher/papers` | Search current paper sources for agent-memory and memory-benchmark updates. | Candidate papers with title, date, venue/source, URL, why relevant, and likely landing file. |
| `researcher/products` | Search official product docs/blogs/release notes. | Product candidates, official source URLs, product capability summary, evidence class. |
| `researcher/github-benchmarks` | Search GitHub projects, benchmark lists, and survey companion repos. | Discovery candidates only, with license/activity/readme evidence and primary-source follow-up links. |
| `explore/repo-map` | Inspect this repository for existing entries, aliases, counts, and landing files. | Duplicate-risk map and exact files that need updates. |
| `verifier/source-check` | Re-check candidate URLs, dates, titles, evidence class, and availability. | Verified / needs-verification / inaccessible decisions with source URLs. |
| `critic/relevance-review` | Score relevance and evidence strength. | `must-add`, `update-existing`, `watchlist`, `adjacent`, and `reject` lists. |

The main agent owns integration. It must not delegate final classification or
README count synchronization.

## 4. Promotion Rules

Use the smallest durable change that preserves provenance.

| Decision | Meaning | Required landing |
|---|---|---|
| `must-add` | Directly relevant memory paper/product/benchmark with primary source. | Add or update note plus the relevant landscape/index/ledger entry. |
| `update-existing` | Existing entry needs date, source, venue, evidence, or caveat repair. | Update the existing note and every aggregate that depends on it. |
| `watchlist` | Relevant but evidence, accessibility, or implementation status is not strong enough. | Mention in radar/discovery log only; do not count as a core item. |
| `adjacent` | Useful context, but not first-class agent memory by itself. | Keep out of core counts unless a memory source uses it as a baseline. |
| `reject` | Duplicate, mislabeled, inaccessible, generic, or out of scope. | Record reason in the relevant discovery/radar document when the item is likely to recur. |

Hard rules:

- Primary paper/product pages beat survey lists, GitHub stars, screenshots, and
  third-party summaries.
- Long-context-only benchmarks, generic agent frameworks, and prompt-cache
  systems do not enter core memory counts by default.
- Source mismatch is a blocker. Use the canonical title and URL, or reject the
  mismatched pairing.
- Vendor claims remain vendor or affiliated evidence unless an independent
  reproduction gives enough setup detail.

## 5. Integration Checklist

For each accepted item, update all linked surfaces:

- papers: `papers/index.md`, a full/seed note or existing stub, and radar docs;
- products: `products/*.md`, optional archive, `docs/products-landscape.md`,
  `docs/product-discovery-log.md`, `docs/signals.md`, and README counts;
- benchmarks: `benchmarks/index.md`, `benchmarks/*.md`,
  `benchmarks/claims/claims.yaml`, and `docs/benchmarks-landscape.md`;
- synthesis: `docs/memory-radar-YYYY-MM.md` or current radar file when the run
  changes weekly decisions;
- public map: `README.md`, `README_cn.md`, and `docs/README.md` when counts or
  entry points change.

If no item is promoted, do not create a documentation-only noise PR. Produce a
weekly report with searched sources, watchlist items, rejects, and blockers.

## 6. PR Contract

Create a branch named `codex/weekly-memory-radar-YYYY-MM-DD` from the latest
`origin/main` inside the automation worktree. If the worktree starts from a
stale base, fetch first and recreate or rebase the branch before editing.

The automation should leave the worktree intact when a PR is created so follow-up
review fixes can continue on the same branch. If no changes are promoted, report
the no-change result and leave no branch-only noise behind.

The PR body must include:

- accepted additions;
- updated existing entries;
- watchlist items;
- adjacent/rejected items;
- source mismatches;
- verification commands and results;
- known gaps such as full external link crawl or full-paper reads not done.

Use the repository's Lore commit protocol for the commit message. Do not merge
the PR automatically.

## 7. Verification

Always run:

```bash
ruby scripts/verify_memory_refresh.rb
git diff --check
```

Also run a targeted source reachability check for canonical URLs added or
changed in the weekly run. This can be `curl -L -s -o /dev/null -w ...` or an
equivalent browser/API check.

Before creating the PR, run a final `code-reviewer` pass over the diff. The
review must explicitly check:

- duplicate papers/products/benchmarks and alias confusion;
- README / README_cn / index / landscape / ledger count sync;
- evidence class wording in `benchmarks/claims/claims.yaml`;
- discovery sources not promoted to primary evidence;
- adjacent/watchlist/reject decisions recorded when needed.
