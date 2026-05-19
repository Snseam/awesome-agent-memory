# Security Policy

ZhiOne is designed around local knowledge, personal memory, and agent context.
Security and privacy issues should be treated seriously even before production
code exists.

## Supported Versions

There is no released version yet. Security reports should target the `main`
branch.

## Reporting A Vulnerability

Do not open a public issue for sensitive vulnerabilities or exposed private data.
Use GitHub's private vulnerability reporting if it is enabled for the repository.
If it is not enabled, contact the repository owner through a private channel and
include:

- a short description of the issue;
- reproduction steps or affected files;
- potential impact;
- suggested mitigation if known.

## Sensitive Data

Do not commit:

- API keys, tokens, passwords, or private keys;
- private notes or personal records;
- customer or company confidential data;
- raw agent transcripts that have not been reviewed for public release.

If sensitive data is committed, rotate affected secrets first, then remove the
data from the repository and history as appropriate.
