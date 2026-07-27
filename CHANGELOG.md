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

- Nothing yet.

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
