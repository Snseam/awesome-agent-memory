# Security Policy

`awesome-agent-memory` is a public research and evidence repository, not a
production service. Security and privacy issues still matter because the repo can
contain archived source pages, PDFs, public claims about memory systems, and
workflow scripts that contributors may run locally.

## Supported Versions

There are no released versions. Security reports should target the `main` branch
and any open pull request that introduces the issue.

## Reporting A Vulnerability

Do not open a public issue for sensitive vulnerabilities or exposed private data.
Use GitHub's private vulnerability reporting if it is enabled for the repository.
If it is not enabled, contact the repository owner through a private channel and
include:

- a short description of the issue;
- reproduction steps or affected files;
- potential impact;
- suggested mitigation if known.

## What To Report Privately

Use a private channel for:

- committed secrets, tokens, private keys, or confidential documents;
- raw agent transcripts, personal notes, or customer data that were published by
  mistake;
- archived PDFs or source snapshots that appear to violate redistribution terms;
- malicious links, poisoned archives, or scripts that could affect contributors'
  local machines;
- vulnerability details that would make exploitation easier before a fix is
  available.

Use a normal issue or pull request for public documentation errors, stale product
claims, broken links, or benchmark-classification disagreements that do not
expose sensitive information.

## Sensitive Data

Do not commit:

- API keys, tokens, passwords, or private keys;
- private notes or personal records;
- customer or company confidential data;
- raw agent transcripts that have not been reviewed for public release.

If sensitive data is committed, rotate affected secrets first, then remove the
data from the repository and history as appropriate. If the issue is a
redistribution or privacy problem rather than a secret, remove or rewrite the
affected artifact and preserve only the public canonical URL when possible.
