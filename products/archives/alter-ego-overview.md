---
title: Alter Ego hosted connector source record
source: https://cloudalterego.cafeboon.com/docs.html
date: 2026-11-22
type: authored-source-summary
---

# Alter Ego source record

SebastiaanBoon identifies as the maker and proposed the hosted connector as a discovery lead on November 17 UTC (November 18 in Shanghai). We reviewed the publisher's pages on November 22. The hosted service did not expose an implementation revision in the materials reviewed. The public Git revision `3f8b3bb4` identifies the companion template. [Issue #43](https://github.com/Snseam/awesome-agent-memory/issues/43) · [Hosted documentation](https://cloudalterego.cafeboon.com/docs.html) · [Template revision](https://github.com/SebastiaanBoon/cloud-alter-ego/blob/3f8b3bb4bfe243dacef2903e27a3f569638b622f/README.md#L31-L44)

| Source examined | What it establishes |
|---|---|
| Product and intentional-save guides | The published file layout separates rules, profile, client or project contexts, journals and playbooks. Users can request an explicit save. [File layout](https://cloudalterego.cafeboon.com/what-it-remembers.html) · [Saving instructions](https://cloudalterego.cafeboon.com/save-instructions.html) |
| Hosted tool and troubleshooting references | The connector reads and writes through tool calls. The publisher describes missed logging when a client answers without calling the tool. [Tools](https://cloudalterego.cafeboon.com/docs.html#tools) · [Missed calls](https://cloudalterego.cafeboon.com/docs.html#troubleshooting) |
| Privacy policy, dated November 20 | The publisher describes content transit, retained token and account data, and separate storage-provider and AI-provider handling. [Privacy policy](https://cloudalterego.cafeboon.com/privacy.html) |
| Template README, installer and license | The local integration uses Claude Code hooks and a Codex turn-completion callback. The installer describes user-wide configuration and commit/PR attribution changes. We inspected it as text. [Installer](https://github.com/SebastiaanBoon/cloud-alter-ego/blob/3f8b3bb4bfe243dacef2903e27a3f569638b622f/tools/install.py#L5-L17) · [License](https://github.com/SebastiaanBoon/cloud-alter-ego/blob/3f8b3bb4bfe243dacef2903e27a3f569638b622f/LICENSE) |

This is a publisher-documentation seed for explicit save and reuse. The project supplied no independent evidence here for universal logging, permission enforcement or deletion from past conversations. [Product note](../alter-ego.md)
