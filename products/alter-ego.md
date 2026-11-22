---
title: Alter Ego
type: product
source: https://cloudalterego.cafeboon.com/
date_first_seen: 2026-11-18
last_revised: 2026-11-22
domain: personal-workflow-memory
business_model: hosted MCP connector
license: hosted implementation undisclosed
evidence_class: product_behavior
status: seed
core_claim: Connected assistants can save and reload user-controlled text files through a remote MCP connector.
method_summary: MCP tools select a context, read shared files, append journal entries and save durable rules to one linked storage provider.
required_assumptions: The user authorizes storage access and the client invokes the relevant tools.
benchmark_used: none assessed
cost_complexity: A hosted connector, an MCP client and user-controlled cloud storage. Operating costs were outside this review.
memory_modules:
  - ingest-adapter
  - context-packer
  - security-privacy
archive: archives/alter-ego-overview.md
---

# Alter Ego

Alter Ego is Cafe Boon's hosted connector for personal and project memory. Its documented write and read operations meet the Tier A seed criterion for portable memory. The unit of storage is a file the user can inspect, edit or remove in their own cloud account. [Publisher documentation](https://cloudalterego.cafeboon.com/docs.html) · [Dated source record](archives/alter-ego-overview.md)

## From one chat to the next

| Operation | Documented behavior |
|---|---|
| Save | `remember` appends a rule, profile detail or context note. A playbook can be saved as a file. |
| Recall | `start` loads rules, the profile, contexts and playbooks. Opening a context loads its README and recent journal lines. Other connected clients can request those same files. |
| Journal | Opening a context, listing files or reading a file can append the supplied question. The `log` tool appends a journal entry. A client can answer without invoking it. |
| Correct or remove | Users can edit or delete the backing files at their storage provider. Disconnecting or revoking the connector leaves those files in place. |

The maker's submission describes every question as automatically logged. The tool reference and troubleshooting guide support capture on relevant calls and describe how a missed journal entry can occur. Cross-client coverage and recall completeness are open questions. [Tool reference](https://cloudalterego.cafeboon.com/docs.html#tools) · [Troubleshooting](https://cloudalterego.cafeboon.com/docs.html#troubleshooting) · [Revocation](https://cloudalterego.cafeboon.com/docs.html#disconnect)

## Data boundaries

The publisher documents OneDrive and Dropbox app folders, Google Drive using `drive.file`, and Git repositories on GitHub or Azure DevOps. When several repositories are reachable, the connector asks which one to use. A selected repository identifies a destination. The actual authorization grant depends on the provider and account. [Storage setup](https://cloudalterego.cafeboon.com/docs.html#storage)

According to the November 20 privacy policy, file content passes through the hosted server during tool calls. The server retains encrypted provider tokens and an account usage record, and its administrator can in principle use the tokens. The policy gives the usage record a retention period of 24 months after last use, subject to earlier deletion on request. Recalled text also enters the AI provider's conversation. Effective grants, actual retention and downstream erasure were outside this static review. [Privacy policy](https://cloudalterego.cafeboon.com/privacy.html)

Cafe Boon's public MIT Git template is a separate local integration for Claude Code and Codex. It can share the file layout with the hosted connector. The template's license and local logging implementation establish evidence for that distribution only. [Template comparison](https://github.com/SebastiaanBoon/cloud-alter-ego/blob/3f8b3bb4bfe243dacef2903e27a3f569638b622f/README.md#L31-L44) · [Template license](https://github.com/SebastiaanBoon/cloud-alter-ego/blob/3f8b3bb4bfe243dacef2903e27a3f569638b622f/LICENSE)
