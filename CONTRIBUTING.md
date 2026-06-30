# Contributing

Thanks for taking an interest in awesome-agent-memory.

This repository is a decision-driven reading list, living survey, and research
radar for long-term memory in LLM agents. The highest-value contributions make
the evidence base clearer, more auditable, and easier to use for memory-kernel
decisions.

## Before Opening A PR

- Check the README and `docs/README.md` for current scope.
- Keep changes small and focused.
- Prefer updating canonical docs or existing notes over adding another long
  working note.
- Do not add new dependencies or automation without explaining why they are
  necessary.
- Do not commit private data, credentials, proprietary source, or unreviewed raw
  conversation logs.
- Do not add PDFs unless the source permits redistribution; keep the canonical
  URL in the corresponding note.

## Contribution Types

Most contributions should fit one of these lanes:

- Paper note: upgrade a `papers/stubs/` entry into a full `papers/` note, or fix
  metadata in `papers/index.md`.
- Product note: add or refresh a `products/` note, with an archive under
  `products/archives/` when the source page is important or likely to drift.
- Benchmark evidence: add or refresh a benchmark note and record claim usage in
  `benchmarks/claims/claims.yaml`.
- Source map: improve `docs/information-sources.md`, `docs/related-work.md`, or
  `docs/signals.md`.
- Synthesis: update docs only after the underlying note, source, or ledger entry
  supports the claim.

## Good First Contributions

- Upgrade an existing `papers/stubs/` entry into a `papers/` full note after
  reading the source paper.
- Add or refresh a product note in `products/` and, when appropriate, a
  markdown snapshot in `products/archives/`.
- Add or refresh a benchmark note in `benchmarks/` and record observed usage in
  `benchmarks/claims/claims.yaml`.
- Improve `docs/information-sources.md`, `docs/related-work.md`, or
  `docs/products-landscape.md` with sourced entries.
- Draft an `impact-reports/` entry for a full note that materially affects
  memory-kernel architecture.
- Identify privacy, provenance, or auditability risks.

## Evidence Expectations

Full paper and product notes should preserve the ResearchItem shape described in
`docs/research-radar.md`:

- include title, source, date, domain, core claim, method summary, assumptions,
  benchmarks, evidence level, code/license status, and cost/complexity;
- map the note to one or more memory modules from `docs/taxonomy.md` or, for
  Ymem-specific metadata, `docs/ymem-binding/taxonomy-modules.md`;
- separate direct evidence from maintainer inference;
- keep unverified claims marked as `check`, `seed`, or follow-up work instead of
  presenting them as settled.

Benchmark notes should preserve the BenchmarkItem shape in
`docs/research-radar.md`, and every score, product comparison, critique, or
reproduction claim should have a ledger event in
`benchmarks/claims/claims.yaml`. Do not reclassify a vendor blog, product page,
or affiliated paper result as independent reproduction.

For every evidence-bearing change:

- include the canonical source URL and access date when the note format supports
  it;
- separate direct evidence, vendor claims, affiliated evaluation, independent
  reproduction, and maintainer inference;
- keep uncertain items marked as `check`, `seed`, or follow-up work;
- update the smallest canonical surface first, then update summaries that depend
  on it;
- keep quoted external text short and use summaries for the rest.

## Verification

Run the repository verifier before opening a PR:

```bash
ruby scripts/verify_memory_refresh.rb
```

If you add new tracked data files, make sure they are tracked before relying on
count checks. For documentation-only changes, also review changed markdown links
and headings directly.

## Commit Messages

Prefer commit messages that explain why a change exists, not only what changed.
For larger decisions, include short trailers such as:

```text
Constraint: <external constraint>
Rejected: <alternative> | <reason>
Confidence: <low|medium|high>
Scope-risk: <narrow|moderate|broad>
Tested: <verification performed>
Not-tested: <known gap>
```

## Pull Requests

PR descriptions should include:

- the problem being solved;
- the chosen approach;
- the evidence class and source type when the change adds or promotes claims;
- verification performed;
- known risks or follow-up work.
