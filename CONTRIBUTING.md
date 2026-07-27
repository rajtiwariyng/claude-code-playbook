# Contributing to Claude Code Playbook

Thank you for considering a contribution. This repository is reviewed against the same standards it teaches, so this document is worth reading in full before you open a pull request.

## Table of Contents

- [Principles for Contributors](#principles-for-contributors)
- [Ways to Contribute](#ways-to-contribute)
- [Before You Start](#before-you-start)
- [Folder Ownership](#folder-ownership)
- [The Ten-Section Entry Structure](#the-ten-section-entry-structure)
- [Writing Standards](#writing-standards)
- [Sourcing and Factual Accuracy](#sourcing-and-factual-accuracy)
- [Cross-Referencing](#cross-referencing)
- [Pull Request Process](#pull-request-process)
- [Review Criteria](#review-criteria)
- [Common Rejection Reasons](#common-rejection-reasons)
- [Local Setup](#local-setup)
- [References](#references)

---

## Principles for Contributors

1. **Depth over breadth.** One excellent entry beats five thin ones. We would rather have forty entries people trust than four hundred people skim.
2. **Improve before you add.** If a topic is already covered, strengthen the existing entry instead of creating a near-duplicate.
3. **Show the reasoning.** A prompt without its rationale is not a contribution to a playbook — it is a snippet.
4. **Write for the reader six months from now**, who has none of your context and is under deadline pressure.

## Ways to Contribute

| Contribution | Effort | Start with |
| --- | --- | --- |
| Fix a typo, broken link, or factual error | Minutes | Open a PR directly, no issue needed |
| Improve an existing entry's example or checklist | An hour | Open a PR, explain the gap in the description |
| Add a new playbook entry | Half a day | Open an issue first using the **New entry proposal** template |
| Add a new folder or domain group | Discussion | Open an issue; this changes the taxonomy and needs agreement |
| Report an entry that produced a bad result | Minutes | Open an issue using the **Entry defect** template, include the transcript shape |

> [!TIP]
> Reports of entries that *did not work* are among the most valuable contributions here, and the rarest. If an entry produced a weak result, say so — include what you asked, what you got, and what you expected.

## Before You Start

Run through this list. It prevents most rejected pull requests.

- [ ] I searched [prompts/README.md](prompts/README.md) and confirmed this topic has no existing entry.
- [ ] I read the [folder ownership rules](#folder-ownership) and know which folder owns this topic.
- [ ] I read two or three existing entries in the target folder to match the voice.
- [ ] I can cite an official source for every factual claim I plan to make.
- [ ] I have actually run this prompt against a real project, not just drafted it.

## Folder Ownership

The domain grouping under `prompts/` exists to prevent duplication. Several topics could plausibly live in two places; the table below is the tiebreaker. **When a topic falls under two folders, the owning folder holds the full entry and the other folder links to it.**

| Ambiguous topic | Owner | Non-owner does |
| --- | --- | --- |
| Marketing page for a product | `web/landing-pages` | `web/websites` links to it |
| Multi-page brochure or corporate site | `web/websites` | — |
| Internal data-heavy interface | `web/dashboards` | `web/websites` links to it |
| Visual and interaction design decisions for any surface | `web/ui-ux` | Every `web/` entry links to it rather than restating design rules |
| React patterns used inside a Next.js app | `frontend/react` | `frontend/nextjs` links to it and covers only framework-specific concerns (routing, rendering strategy, server components) |
| REST or GraphQL contract design | `backend/api` | Framework folders link to it and cover only framework-specific implementation |
| Schema, indexing, migrations | `backend/database` | Framework folders link to it |
| Traditional search optimisation | `growth/seo` | — |
| Optimisation for AI answer engines | `growth/geo` | `growth/seo` links to it; the two must not restate each other's tactics |
| Written long-form content | `growth/blogs` | `growth/seo` links to it |
| Cross-platform mobile concerns | `mobile/cross-platform` | `mobile/flutter` links to it and covers only Flutter-specific concerns |
| Slide-based deliverables of any kind | `business/presentations` | `business/company-profile` and `business/sales` link to it |
| Priced, scoped client offer | `business/proposal` | `business/sales` links to it |
| Security topics of any kind | `quality/security` | Every other folder links to it rather than restating security rules |
| Performance topics of any kind | `quality/performance` | Every other folder links to it |
| Accessibility topics of any kind | `quality/accessibility` | Every other folder links to it |

`quality/` is deliberately authoritative. Security, performance, and accessibility guidance restated across twenty folders will drift out of sync within a release. It lives in one place and is referenced everywhere.

### Adding a new folder

Open an issue first. A new folder needs to answer:

1. What topic does it own that no existing folder owns?
2. Which existing entries move into it?
3. What is the first entry you will write in it?

A folder with one entry and no plan for a second is a file in the wrong place.

## The Ten-Section Entry Structure

Every file under `prompts/` uses these ten sections, in this order, with no omissions and no additions above them. Start from [templates/prompt-template.md](templates/prompt-template.md).

| # | Section | Requirement |
| --- | --- | --- |
| 1 | `## Purpose` | One paragraph. What this accomplishes and the outcome it produces. |
| 2 | `## When to Use` | Bullet list of triggering signals, plus an explicit "use something else when" list. |
| 3 | `## Inputs Required` | Table with `Input`, `Required`, `Notes` columns. Mark optional inputs honestly. |
| 4 | `## Workflow` | Numbered stages. Each stage must be independently verifiable. |
| 5 | `## Claude Prompt` | Fenced block. Placeholders as `{{UPPER_SNAKE_CASE}}`. Copy-paste ready. |
| 6 | `## Expected Output` | The shape of a correct result, specific enough to detect a wrong one. |
| 7 | `## Quality Checklist` | Task-list checkboxes. Objective, pass/fail, no "is it good?" items. |
| 8 | `## Common Mistakes` | Table with `Mistake`, `Why it happens`, `Fix`. Minimum three rows. |
| 9 | `## Example` | A concrete filled-in run with realistic inputs and abbreviated output. **Must declare its provenance** — see below. |
| 10 | `## Advanced Version` | The higher-effort variant, and when the extra cost is justified. |

### Example provenance is mandatory

Every `## Example` opens with one of exactly two labels. There is no third option and no unlabelled example.

| Label | Means | You may write |
| --- | --- | --- |
| `> **Provenance:** real run.` | You executed this against a real project | "The review found…", "this surfaced…", measured results |
| `> **Provenance:** constructed.` | Inputs and output are written to demonstrate the pattern | What the prompt *does*, why each part is there, what to check |

**A constructed example must never claim an observation.** No "effect observed", no before/after comparison, no "in testing this produced". Those are empirical claims, and an empirical claim without a run behind it is a fabrication regardless of how plausible it is.

Constructed examples are legitimate and often clearer — they can isolate the pattern without a real project's noise. What is never legitimate is letting a reader believe a constructed illustration was measured.

> [!IMPORTANT]
> This is the rule most likely to get a pull request rejected, and the one this repository has itself violated. Version 1.0.0 shipped an example claiming "Effect observed" with no run behind it. It was caught in review and corrected. Assume your draft has the same defect until you have checked it.

Every file then closes with `## Related` and `## References`.

> [!WARNING]
> "All ten sections present" is a structural check, not a quality bar. A `Common Mistakes` table with three invented rows fails review. Write from observed failures.

## Writing Standards

Full rules live in [docs/Style-Guide.md](docs/Style-Guide.md). The essentials:

| Rule | Detail |
| --- | --- |
| Voice | Second person, present tense, active voice. "Run the audit", not "The audit should be run". |
| Headings | One H1 per file. Title Case for H1 and H2, sentence case below. |
| Tables | Use them for anything with parallel structure. Prose lists of three or more attributes belong in a table. |
| Code blocks | Always language-tagged. Mark illustrative snippets explicitly. |
| Placeholders | `{{UPPER_SNAKE_CASE}}` only, inside prompt blocks only. |
| Callouts | GitHub alerts only: `NOTE`, `TIP`, `IMPORTANT`, `WARNING`, `CAUTION`. Maximum three per file. |
| Line length | No hard wrap. Let the renderer handle it. |
| Filenames | `kebab-case.md`. The filename should match the H1 in meaning. |

## Sourcing and Factual Accuracy

This is where contributions most often fail review.

- **Version numbers, API shapes, CLI flags, pricing, and limits must be cited** to official documentation, with the date checked noted if the value is volatile.
- **Do not cite a blog post for a fact the vendor documents.** Blog posts are acceptable for technique and opinion, never for specification.
- **Benchmarks require methodology.** "40% faster" without hardware, dataset, and measurement method is not a claim we publish.
- **Unverifiable claims get labelled.** If something is your experience rather than documented behaviour, write "In practice…" and say so.
- **Never invent an example transcript** and present it as a real run. If you are constructing an illustration, the Example section should say the inputs are illustrative.

See [docs/Research-Framework.md](docs/Research-Framework.md) for the sourcing hierarchy this repository uses.

## Cross-Referencing

Cross-references are what turn a folder of files into a knowledge base.

- Every entry ends with a `## Related` section linking at least two other entries.
- Link to the **owning** folder for shared concerns rather than restating them.
- Use relative links (`../quality/security/owasp-top-10.md`), never absolute GitHub URLs, for in-repo targets.
- When you add an entry, update `prompts/README.md` and the parent folder's `README.md`. A pull request that adds a file without indexing it is incomplete.

## Pull Request Process

1. **Fork and branch.** Branch names: `entry/<folder>-<topic>`, `docs/<topic>`, `fix/<short-description>`.
2. **Make the change.** One logical change per pull request. Ten new entries in one PR cannot be reviewed properly.
3. **Update the indexes.** `prompts/README.md`, the folder `README.md`, and `CHANGELOG.md` under `## [Unreleased]`.
4. **Self-review the diff.** Read it as a stranger would. Most problems are visible on a second pass.
5. **Open the PR** using the template. Describe what changed, why, and how you verified it.
6. **Respond to review.** Maintainers review against the criteria below; expect substantive feedback on first contributions.

Commits should be readable. `Add OWASP Top 10 audit entry` is useful; `update` is not. Conventional Commit prefixes are welcome but not required.

## Review Criteria

Maintainers evaluate every entry against these questions:

| Dimension | Question |
| --- | --- |
| **Necessity** | Does this cover something no existing entry covers? |
| **Correctness** | Is every factual claim sourced and current? |
| **Completeness** | Are all ten sections present and substantive? |
| **Actionability** | Could a competent stranger execute this without asking follow-up questions? |
| **Verifiability** | Does the Quality Checklist actually discriminate good output from bad? |
| **Honesty** | Are the Common Mistakes real, and does the Example reflect a genuine run? |
| **Consistency** | Does it read like the rest of the repository? |
| **Maintainability** | When the underlying tool changes, is it obvious what needs updating? |

## Common Rejection Reasons

| Reason | What to do instead |
| --- | --- |
| Duplicates an existing entry | Improve the existing entry; link from your folder if the topic spans two |
| Generic prompt with no reasoning | Add Purpose, Workflow, and Expected Output that are specific to the task |
| Checklist items are subjective | Rewrite as pass/fail. "Contrast ratio ≥ 4.5:1" not "colours look accessible" |
| Fabricated or uncited facts | Cite the official source, or remove the claim |
| Example is obviously synthetic | Run the prompt for real, or label the example as illustrative |
| Restates security/performance/a11y rules | Link to the owning `quality/` entry |
| Adds a file without indexing it | Update `prompts/README.md` and the folder index |
| Voice does not match the repository | Read three neighbouring entries and revise |

## Local Setup

No build step. The repository is Markdown, rendered by GitHub.

```bash
git clone https://github.com/rajtiwariyng/claude-code-playbook.git
cd claude-code-playbook
```

Optional local checks, if you have Node.js available:

```bash
# Lint Markdown against the repository's rules
npx markdownlint-cli2 "**/*.md"

# Find broken relative links
npx markdown-link-check README.md
```

Configuration lives in [.markdownlint.json](.markdownlint.json). Editor defaults are in [.editorconfig](.editorconfig).

## Related

- [README.md](README.md) — repository overview and entry points
- [docs/Style-Guide.md](docs/Style-Guide.md) — the full writing standard
- [docs/Output-Standards.md](docs/Output-Standards.md) — what "production-ready" means here
- [templates/prompt-template.md](templates/prompt-template.md) — the canonical entry skeleton
- [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md) — expected conduct in issues and reviews

## References

- [Contributor Covenant 2.1](https://www.contributor-covenant.org/version/2/1/code_of_conduct/)
- [Keep a Changelog 1.1.0](https://keepachangelog.com/en/1.1.0/)
- [Conventional Commits 1.0.0](https://www.conventionalcommits.org/en/v1.0.0/)
- [GitHub alert syntax](https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax#alerts)
