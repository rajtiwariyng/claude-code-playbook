# Security Policy

## What This Repository Is

This repository contains **Markdown documentation and two PowerShell maintenance scripts**. It ships no application code, no dependencies, and no runtime. There is no service to compromise and no package to poison.

That narrows the realistic threat surface to three things, listed below.

## Reporting a Vulnerability

Report privately through [GitHub's security advisory flow](https://github.com/rajtiwariyng/claude-code-playbook/security/advisories/new). Do not open a public issue for anything in the first two categories below.

You can expect an acknowledgement within 7 days and a resolution or a stated plan within 30.

## In Scope

| Category | Example | Severity |
| --- | --- | --- |
| **Committed secrets** | An API key, token, or credential in any file, including an example or test fixture | Critical |
| **Guidance that creates a vulnerability** | An entry recommending a control that is bypassable, or example code with an injection flaw | High |
| **Malicious content in a script** | Anything in `scripts/` that does more than it claims | High |
| **A prompt that induces unsafe action** | An entry whose prompt would lead a reader to disable a safeguard or exfiltrate data | High |

The second category is the one that matters most here. This repository publishes security guidance, and **wrong security guidance is worse than none**, because it is trusted and acted on. Treat a defective `quality/security/` entry as a real vulnerability report.

## Out of Scope

| Not a vulnerability here | Where it belongs |
| --- | --- |
| A bug in Claude Code itself | [anthropics/claude-code](https://github.com/anthropics/claude-code/issues) |
| A vulnerability in a linked third-party tool | That project's disclosure process |
| A broken link, typo, or formatting defect | A normal [issue](https://github.com/rajtiwariyng/claude-code-playbook/issues) |
| Disagreement with a security recommendation | An issue, with the reasoning — we want that argument in public |

The last row matters. A recommendation you believe is wrong is worth debating openly, and a public issue produces a better outcome than a private report. Reserve private disclosure for cases where publishing the detail would help an attacker before we can fix it.

## If a Secret Is Committed

Anyone can act on this without waiting for a maintainer.

1. **Revoke the credential immediately.** Rotation is cheap; a live leaked key is not. Do this before anything else.
2. Report it privately using the advisory flow above.
3. Do not open a public issue, and do not push a commit whose message names the secret.

Removing a secret from the latest commit does not remove it from history. Assume any committed credential is compromised from the moment it was pushed, regardless of how quickly it was deleted.

## Guarantees We Do Not Make

This repository documents patterns. It is not a security product.

- Following an entry here does not make a system secure. Entries are a floor and a checklist, not a substitute for review by someone accountable for the system.
- Entries under [`prompts/industries/`](prompts/industries/) reference regulation. They are **not legal advice** and do not replace professional sign-off.
- Guidance is verified against official sources at the time of writing and re-verified each minor release. Between releases it can go stale. Cited sources are the authority, not this repository.

## Related

- [prompts/quality/security/](prompts/quality/security/) — the security guidance this policy protects the quality of
- [docs/Output-Standards.md](docs/Output-Standards.md#security-standard) — the security baseline every entry enforces
- [docs/Installation.md](docs/Installation.md#authentication) — credential handling when setting up Claude Code
- [CONTRIBUTING.md](CONTRIBUTING.md) — the review standards that catch most of this before merge
- [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md) — conduct in reports and reviews

## References

- [OWASP Top 10](https://owasp.org/Top10/) — the baseline this repository teaches
- [GitHub security advisories](https://docs.github.com/en/code-security/security-advisories) — the reporting mechanism
- [CVE program](https://www.cve.org/) — vulnerability disclosure records
- [Claude Code documentation](https://docs.claude.com/en/docs/claude-code) — upstream product security
