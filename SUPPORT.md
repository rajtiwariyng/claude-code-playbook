# Support

Where to ask, so your question reaches someone who can answer it.

## Route Your Question

| Your question is about | Go to | Why |
| --- | --- | --- |
| **How Claude Code itself works** — flags, config, features, errors | [Official documentation](https://docs.claude.com/en/docs/claude-code) | Maintained upstream and authoritative. Anything we wrote would go stale |
| **A bug in the Claude Code CLI** | [anthropics/claude-code issues](https://github.com/anthropics/claude-code/issues) | We do not maintain the product |
| **An entry here that is wrong or stale** | [Open an issue](https://github.com/rajtiwariyng/claude-code-playbook/issues/new/choose) → *Entry defect* | This is the most valuable report we receive |
| **An entry that produced a poor result** | Same — *Entry defect* | Rare and useful. Include what you asked and what you got |
| **Proposing a new entry** | [Open an issue](https://github.com/rajtiwariyng/claude-code-playbook/issues/new/choose) → *New entry proposal* | Cheaper than a rejected pull request |
| **"How do I do X with this?"** | [Discussions → Q&A](https://github.com/rajtiwariyng/claude-code-playbook/discussions) | Questions are not defects, and the answer helps the next person |
| **Sharing a prompt or workflow that worked** | [Discussions → Show and tell](https://github.com/rajtiwariyng/claude-code-playbook/discussions) | |
| **Disagreeing with a recommendation** | [Discussions → Ideas](https://github.com/rajtiwariyng/claude-code-playbook/discussions) | We want that argument in public |
| **A security concern** | [SECURITY.md](SECURITY.md) | Private disclosure where it matters |

## Before You Ask

Two minutes here saves a round trip.

- Search [existing issues](https://github.com/rajtiwariyng/claude-code-playbook/issues?q=is%3Aissue) and [discussions](https://github.com/rajtiwariyng/claude-code-playbook/discussions).
- Check [docs/FAQ.md](docs/FAQ.md) — it covers the questions that come up most.
- If your output was poor, work through the diagnostic table in [docs/Prompting-Guide.md](docs/Prompting-Guide.md#iteration-diagnose-do-not-rephrase) first. Most cases resolve there.

## What Makes a Good Report

The difference between a report we can act on and one we cannot:

| Include | Not |
| --- | --- |
| The entry you used, by path | "one of the prompts" |
| What you asked, verbatim | A paraphrase |
| What you got, abbreviated but unedited | A description of how it felt |
| What you expected instead | "it was bad" |
| Your stack and anything unusual about the setup | — |

Redact anything confidential. Replace it with an obvious placeholder rather than rewriting it into something plausible — a sanitised report that no longer reflects the real input cannot be diagnosed.

## Response Times

This is a volunteer-maintained project. Targets, not guarantees:

| Type | Target |
| --- | --- |
| Factual correction acknowledged | 7 days |
| Factual correction released | 14 days |
| Pull request first review | 14 days |
| Discussion question | Best effort, no commitment |

Factual errors jump the queue regardless of everything else in flight. See [ROADMAP.md](ROADMAP.md#maintenance-commitments).

## What We Cannot Help With

- Debugging your application. This repository teaches process; it is not a consultancy.
- Claude Code account, billing, or access problems — those go to [Anthropic support](https://support.claude.com).
- Legal, medical, or financial questions arising from an [industry overlay](prompts/industries/). Those entries state their limits and require professional sign-off.

## Related

- [docs/FAQ.md](docs/FAQ.md) — the questions that come up most often
- [CONTRIBUTING.md](CONTRIBUTING.md) — how to contribute rather than ask
- [SECURITY.md](SECURITY.md) — private disclosure
- [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md) — expected conduct in all of the above
- [ROADMAP.md](ROADMAP.md) — what is planned, and what is out of scope

## References

- [Claude Code documentation](https://docs.claude.com/en/docs/claude-code)
- [Claude Code repository](https://github.com/anthropics/claude-code)
- [GitHub Discussions](https://docs.github.com/en/discussions)
