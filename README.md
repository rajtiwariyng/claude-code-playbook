# Claude Code Playbook

> A production-grade knowledge base for driving [Claude Code](https://docs.claude.com/en/docs/claude-code) across real software, design, business, and documentation work.

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](CONTRIBUTING.md)
[![Docs](https://img.shields.io/badge/docs-Getting%20Started-blue.svg)](docs/Getting-Started.md)

This is not a prompt dump. It is a **playbook**: every entry carries the reasoning behind it, the workflow it belongs to, the output you should expect, and the checks that tell you whether the result is good enough to ship.

---

## Table of Contents

- [Why This Exists](#why-this-exists)
- [Who This Is For](#who-this-is-for)
- [Quick Start](#quick-start)
- [Repository Map](#repository-map)
- [How a Playbook Entry Is Structured](#how-a-playbook-entry-is-structured)
- [Core Principles](#core-principles)
- [Choosing the Right Entry Point](#choosing-the-right-entry-point)
- [Conventions](#conventions)
- [Contributing](#contributing)
- [Project Status](#project-status)
- [References](#references)

---

## Why This Exists

Most "awesome prompt" repositories fail for the same three reasons.

| Failure mode | What it looks like | How this repo answers it |
| --- | --- | --- |
| **No reasoning** | A wall of prompt text with no explanation of *why* it is shaped that way | Every entry opens with **Purpose** and **When to Use**, so you can tell whether it applies before you paste it |
| **No workflow** | A single prompt pretending to solve a multi-stage problem | Every entry has a **Workflow** section that breaks the task into ordered, verifiable stages |
| **No acceptance criteria** | You get output, but no way to judge it | Every entry ships a **Quality Checklist** and **Common Mistakes**, so "done" is defined before you start |

A prompt is the cheapest part of the work. The expensive parts are knowing which task you are actually doing, sequencing it correctly, and recognising a bad result. This repository is about those parts.

## Who This Is For

- **Engineers** using Claude Code for feature work, refactoring, reviews, debugging, and infrastructure.
- **Agencies and consultancies** producing client-facing sites, decks, proposals, and audits at volume.
- **Technical writers** standardising documentation output across a team.
- **Founders and solo builders** who need senior-level process without a senior-level team.
- **Teams standardising AI usage** who want a reviewable, version-controlled definition of "how we prompt here."

## Quick Start

```bash
# 1. Clone the playbook
git clone https://github.com/rajtiwariyng/claude-code-playbook.git
cd claude-code-playbook

# 2. Read the two documents that change how everything else lands
#    docs/Getting-Started.md   - orientation, 15 minutes
#    docs/Prompting-Guide.md   - the prompting model this repo assumes
```

Then pick your first task:

| I want to... | Start here |
| --- | --- |
| Set up Claude Code correctly on a real project | [docs/Installation.md](docs/Installation.md) |
| Understand how to prompt well | [docs/Prompting-Guide.md](docs/Prompting-Guide.md) |
| Give Claude a persistent role and standards | [prompts/core/system/](prompts/core/system/) |
| Research a topic before building | [prompts/core/research/](prompts/core/research/) |
| Plan a feature before writing code | [prompts/core/planning/](prompts/core/planning/) |
| Build a website or landing page | [prompts/web/](prompts/web/) |
| Review or harden an existing codebase | [prompts/quality/](prompts/quality/) |
| Produce a deck, proposal, or company profile | [prompts/business/](prompts/business/) |
| Bootstrap a document from a known-good skeleton | [templates/](templates/) |
| Verify work before shipping | [checklists/](checklists/) |

> [!TIP]
> If you only read one page before using this repository seriously, read [docs/Thinking-Framework.md](docs/Thinking-Framework.md). It explains how to allocate reasoning effort, which is the single highest-leverage habit when working with Claude Code.

## Repository Map

```text
claude-code-playbook/
├── docs/            # How to use Claude Code well. Read these first.
├── prompts/         # The playbook itself, grouped by domain.
│   ├── core/        # system, research, planning, documentation
│   ├── business/    # company-profile, presentations, sales, proposal
│   ├── web/         # websites, landing-pages, dashboards, ui-ux
│   ├── frontend/    # react, nextjs
│   ├── backend/     # laravel, nodejs, api, database
│   ├── cms-commerce/# wordpress, shopify, medusajs
│   ├── infrastructure/ # docker, nginx, aws, cloudflare
│   ├── quality/     # security, performance, accessibility, testing, debugging
│   ├── growth/      # seo, geo, blogs
│   ├── mobile/      # mobile, flutter
│   ├── media/       # images, videos
│   └── industries/  # vertical-specific adaptations
├── templates/       # Fill-in-the-blank skeletons for documents and configs
├── examples/        # Complete worked runs: input, transcript shape, output
├── checklists/      # Pre-flight and pre-ship verification lists
├── frameworks/      # Reusable mental models (RESEARCH, PLAN, SHIP, ...)
├── snippets/        # Small reusable prompt fragments and CLAUDE.md blocks
└── assets/          # Diagrams, licensing notes, and image sourcing policy
```

**Why the grouping?** The original brief specified a flat list of 38 folders. Flat lists stop scaling at roughly a dozen entries, and several of the proposed folders overlap enough to attract duplicate content. Every folder name from the brief is preserved — they are simply nested under a domain group, with a flat A–Z index in [prompts/README.md](prompts/README.md). See [CONTRIBUTING.md](CONTRIBUTING.md#folder-ownership) for the ownership rules that keep overlapping topics from duplicating.

## How a Playbook Entry Is Structured

Every file under `prompts/` uses the same ten sections, in the same order. This is enforced in review.

| Section | Answers |
| --- | --- |
| **Purpose** | What this accomplishes, in one paragraph |
| **When to Use** | The signals that make this the right entry — and when to reach for something else |
| **Inputs Required** | What you must gather before starting, as a table with a required/optional column |
| **Workflow** | Ordered stages, each independently verifiable |
| **Claude Prompt** | The copy-paste block, with `{{PLACEHOLDERS}}` marked |
| **Expected Output** | The shape of a correct result, so you can spot a wrong one |
| **Quality Checklist** | Objective pass/fail criteria |
| **Common Mistakes** | Failure modes observed in practice, with fixes |
| **Example** | A concrete, filled-in run |
| **Advanced Version** | The higher-effort variant for high-stakes work |

The canonical skeleton is [templates/prompt-template.md](templates/prompt-template.md). New entries start by copying it.

## Core Principles

These are non-negotiable across every file in the repository.

1. **Never fabricate facts.** If a version number, API shape, price, or benchmark is not verified, it is labelled as an assumption or omitted. See [docs/Research-Framework.md](docs/Research-Framework.md).
2. **Prefer official sources.** Vendor documentation over blog posts, specifications over summaries. Link the primary source.
3. **Research before writing.** Output produced without grounding is a draft, not a deliverable.
4. **State assumptions separately.** Assumptions live in their own labelled section so a reviewer can attack them directly.
5. **Accessibility by default.** WCAG 2.2 AA is the floor, not an enhancement request.
6. **Performance by default.** Core Web Vitals budgets are set before implementation, not measured after.
7. **Security by default.** Untrusted input is validated, secrets are never inlined, and authorisation is checked at the boundary.
8. **Production-ready only.** No pseudo-code presented as an implementation, no `// TODO: handle errors`.

> [!IMPORTANT]
> Principles 1–4 are about honesty and 5–8 are about craft. When output conflicts with a principle, the principle wins — including when that means telling the user the task cannot be completed as specified.

## Choosing the Right Entry Point

Not every task needs a heavyweight workflow. Match the effort to the stakes.

| Stakes | Example | Approach |
| --- | --- | --- |
| **Low** — reversible, local | Rename a variable, draft an internal note | Ask directly. No playbook entry needed. |
| **Medium** — affects a shipped surface | Add an API endpoint, write a landing page | One playbook entry, run its Quality Checklist |
| **High** — hard to reverse, external | Schema migration, security posture, investor deck | Research entry → Planning entry → build entry → relevant checklist |
| **Critical** — irreversible or regulated | Payment flow, auth system, published financials | Full chain, plus a second pass with an adversarial review prompt |

[docs/AI-Agent-Workflow.md](docs/AI-Agent-Workflow.md) covers how to chain entries into multi-stage runs and where to place human review gates.

## Conventions

| Convention | Rule |
| --- | --- |
| Placeholders | `{{UPPER_SNAKE_CASE}}` inside prompt blocks |
| File naming | `kebab-case.md`, one topic per file |
| Headings | One `#` H1 per file; Title Case for H1/H2, sentence case below |
| Code blocks | Always language-tagged, always runnable or explicitly marked illustrative |
| Links | Relative for in-repo, absolute for external, no bare URLs in prose |
| Callouts | GitHub alerts (`> [!NOTE]`, `> [!TIP]`, `> [!IMPORTANT]`, `> [!WARNING]`) |
| Cross-references | Every file ends with **Related** and **References** sections |

Full rules: [docs/Style-Guide.md](docs/Style-Guide.md).

## Contributing

Contributions are welcome, and reviewed against the same standards the content teaches.

- Read [CONTRIBUTING.md](CONTRIBUTING.md) before opening a pull request.
- New prompt entries must use [templates/prompt-template.md](templates/prompt-template.md) and complete all ten sections.
- Entries that duplicate an existing topic will be redirected to improving that entry instead.
- Factual claims need a citable source. "It works on my machine" is a valid observation, not a documented behaviour.

## Project Status

Active. Versioned with [Semantic Versioning](https://semver.org/); see [CHANGELOG.md](CHANGELOG.md) for release history and [ROADMAP.md](ROADMAP.md) for planned work.

This repository documents patterns for using Claude Code. It is an independent community project and is not affiliated with or endorsed by Anthropic. Claude Code's own behaviour, flags, and configuration are documented at [docs.claude.com](https://docs.claude.com/en/docs/claude-code) — treat that as the source of truth when it disagrees with anything here, and please [open an issue](../../issues) so we can correct it.

## References

- [Claude Code documentation](https://docs.claude.com/en/docs/claude-code) — official product documentation
- [Claude Code repository](https://github.com/anthropics/claude-code) — issues and releases
- [Claude Docs](https://docs.claude.com) — API, models, and platform documentation
- [Semantic Versioning 2.0.0](https://semver.org/)
- [Keep a Changelog 1.1.0](https://keepachangelog.com/en/1.1.0/)
- [WCAG 2.2](https://www.w3.org/TR/WCAG22/) — accessibility conformance standard
- [OWASP Top 10](https://owasp.org/Top10/) — web application security risks

---

Licensed under the [MIT License](LICENSE).
