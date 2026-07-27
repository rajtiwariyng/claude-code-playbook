# Changelog

All notable changes to this project are documented in this file.

The format is based on [Keep a Changelog 1.1.0](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning 2.0.0](https://semver.org/).

## Versioning Policy

This repository ships documentation, not executable software, so the semantic version applies to the **contract a reader relies on**:

| Change | Bump |
| --- | --- |
| Removing a playbook entry, renaming a folder, or changing the ten-section entry structure | **Major** |
| Adding a new entry, folder, framework, or checklist | **Minor** |
| Correcting facts, fixing links, clarifying wording, improving examples | **Patch** |

Anything that breaks an existing deep link is a major change. Links into this repository are treated as a public API.

---

## [Unreleased]

### Added

- `scripts/audit.ps1` — enforces the published standards mechanically: heading structure,
  required sections, the ten-section entry contract, code-fence tagging and nesting, callout
  budget, avoid-list wording, terminology, file naming, and whitespace.
- `scripts/README.md` — what each check enforces and which document it comes from.
- `.github/workflows/audit.yml` — runs the link checker, the standards audit, and markdownlint
  on every push and pull request.
- `SECURITY.md` — disclosure policy, scoped to what this repository actually is. Names defective
  security guidance as an in-scope vulnerability, because wrong security guidance is worse than
  none.
- Style-Guide: a section defining what the avoid-list bans do *not* cover, and an explicit table
  of which files are exempt from the `Related`/`References` requirement.
- README: a `Related` section, an audit status badge, a contribution routing table, and a
  Mermaid diagram contrasting a prompt list with a playbook entry.
- `SUPPORT.md` — routes each kind of question to the place that can answer it, and states what
  makes a report actionable. Completes GitHub's community standards checklist.
- `CITATION.cff` — citable metadata for anyone referencing this in documentation or training.
- `.github/CODEOWNERS` — review required on the standards, the enforcement scripts, the
  taxonomy index, and the security guidance. Changing those changes every file downstream.
- `.github/dependabot.yml` — monthly updates for the pinned GitHub Actions. A repository with
  no application dependencies still has supply-chain surface in its workflow.
- `.github/DISCUSSION_TEMPLATE/` — Q&A and Show and tell templates. The Show and tell template
  requires a "where it does not work" answer, which is what separates a contribution from an
  advertisement.
- `docs/Publishing.md` — the Pages, Wiki, Discussions, releases, and labels decisions, recorded
  so they can be argued with rather than rediscovered.
- `_config.yml` — optional Jekyll configuration for GitHub Pages. Not enabled by any workflow.
- `checklists/release.md` — the pre-tag checklist, including the accuracy checks a script
  cannot make.
- `assets/screenshots/README.md` — capture specification and a pre-commit safety checklist.
  No placeholder images are committed, deliberately.

### Changed

- **Renamed `prompts/mobile/mobile/` to `prompts/mobile/cross-platform/`.** The domain grouping
  collided with the original folder name and produced a path that read as a mistake.
- **Callout budget now scales with document length** — roughly one per 75 lines, minimum three,
  maximum six. The previous flat cap of three was written for entries and was wrong for a
  300-line reference document.
- **Scoped the `Related`/`References` requirement to content files.** `CHANGELOG.md` and
  `CODE_OF_CONDUCT.md` follow external standards whose structure is more valuable than internal
  consistency.

### Fixed

- **Nested code fence in `prompts/core/system/technical-writer.md`** — a three-backtick block
  inside another three-backtick block terminated early, so roughly twenty lines of the example
  rendered as live headings and tables on GitHub instead of as sample output.
- Seven headings in `docs/FAQ.md` carried trailing full stops, violating the repository's own
  no-trailing-punctuation rule.
- 45 files were missing a final newline.
- Filler wording in `README.md`, `docs/Getting-Started.md`, and
  `prompts/web/websites/saas-website.md`.
- `prompts/README.md` was missing its `References` section; `README.md` was missing `Related`.
- `ROADMAP.md` listed the link checker and structure validator as planned after both had shipped.

---

## [1.0.0] - 2026-07-27

Initial public release.

### Added

**Repository foundation**

- `README.md` with repository map, core principles, and stakes-based entry point guidance.
- `CONTRIBUTING.md` defining the ten-section entry structure, folder ownership rules, and review standards.
- `CODE_OF_CONDUCT.md` based on the Contributor Covenant 2.1.
- `ROADMAP.md` covering planned work through v1.3.0.
- MIT licence, editor configuration, Markdown lint configuration, and GitHub issue and pull request templates.

**Documentation (`docs/`)**

- `Getting-Started.md`, `Installation.md`, `Prompting-Guide.md`, `Claude-Code-Best-Practices.md`,
  `Research-Framework.md`, `Thinking-Framework.md`, `AI-Agent-Workflow.md`, `Output-Standards.md`,
  `Style-Guide.md`, and `FAQ.md`.

**Playbook entries (`prompts/`) — 23 entries published**

- `core/system/` — 9 entries. `role-composition`, `output-contract`, `project-constitution`,
  and six roles: `senior-engineer`, `software-architect`, `code-reviewer`, `security-engineer`,
  `ux-designer`, `technical-writer`, `research-analyst`.
- `core/research/` — 6 entries. `technical-research`, `competitor-analysis`, `market-research`,
  `user-research`, `source-validation`, `fact-checking`.
- `web/websites/` — 8 entries. `website-architecture` as the base entry, six archetypes
  (`corporate`, `agency`, `saas`, `marketplace`, `portfolio`, `booking`), and `website-audit`.

**Taxonomy and navigation**

- Domain-grouped structure across `core`, `business`, `web`, `frontend`, `backend`,
  `cms-commerce`, `infrastructure`, `quality`, `growth`, `mobile`, `media`, `mcp`,
  and `industries`.
- Flat A–Z index at `prompts/README.md` so the grouping never costs discoverability.
- An index for every folder — published or planned — stating its scope, ownership
  boundaries, planned entries, and target milestone.
- `assets/` — image sourcing and licensing policy, plus diagram conventions.
- `templates/prompt-template.md` — the canonical ten-section entry skeleton.
- `scripts/check-links.ps1` — verifies every relative link resolves. 1,260 checked, 0 broken.

**Planned but not yet written**

`checklists/`, `examples/`, `frameworks/`, `snippets/`, `agents/`, and the remaining
`prompts/` folders have indexes describing their intended scope but contain no entries.
They are listed here so the gap is explicit rather than discovered. See
[ROADMAP.md](ROADMAP.md) for target milestones.

### Design decisions

- **Rejected the flat 38-folder `prompts/` layout** in favour of domain grouping. A flat list stops
  being navigable past roughly a dozen entries, and six pairs in the original list overlapped enough
  to guarantee duplicate content. All original folder names are preserved inside their domain group.
- **Adopted a single mandatory entry structure.** Uniformity is what makes a hundred files feel like
  one book rather than a hundred blog posts.
- **Declared external links a public API.** Deep links into this repository are load-bearing for
  anyone who bookmarks or cites an entry, so breaking one is a major version bump. Enforced by
  `scripts/check-links.ps1`.
- **Merged Hotel and Restaurant into one `booking-website` entry.** They share one reservation
  model; the differences are content, not structure.
- **Made industries constraint overlays rather than archetypes.** A healthcare corporate site
  and a manufacturing corporate site share their entire information architecture. As separate
  entries, every improvement to corporate structure would need making twice and would not be.
- **Shipped indexes for unwritten folders rather than placeholder entries.** An empty folder
  with an honest index is better than one padded with thin content, and it makes the taxonomy
  reviewable before the entries are written.

---

[Unreleased]: https://github.com/rajtiwariyng/claude-code-playbook/compare/v1.0.0...HEAD
[1.0.0]: https://github.com/rajtiwariyng/claude-code-playbook/releases/tag/v1.0.0
