# Contributing

Thanks for taking an interest in ZhiOne.

The project is early. The highest-value contributions are precise product and
architecture improvements, small prototypes, and testable definitions of memory
behavior.

## Before Opening A PR

- Check the README and roadmap for current scope.
- Keep changes small and focused.
- Prefer updating canonical docs over adding another long working note.
- Do not add new dependencies without explaining why they are necessary.
- Do not commit private data, credentials, proprietary source, or unreviewed raw
  conversation logs.

## Good First Contributions

- Clarify MVP acceptance criteria.
- Propose memory operation contracts.
- Add evaluation fixtures for duplicate or stale context.
- Improve documentation structure.
- Identify privacy, provenance, or auditability risks.

## Development Expectations

When implementation begins:

- add focused tests with behavior changes;
- keep public APIs explicit;
- include SPDX license identifiers in source files where practical;
- document storage formats and migration risks;
- make local-first behavior the default.

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
- verification performed;
- known risks or follow-up work.
