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

**Playbook entries (`prompts/`)**

- Domain-grouped structure: `core`, `business`, `web`, `frontend`, `backend`, `cms-commerce`,
  `infrastructure`, `quality`, `growth`, `mobile`, `media`, and `industries`.
- Flat A–Z index at `prompts/README.md` so the grouping never costs discoverability.

**Supporting material**

- `templates/` — document and configuration skeletons, including the canonical entry template.
- `examples/` — complete worked runs showing input, workflow, and output.
- `checklists/` — pre-flight and pre-ship verification lists.
- `frameworks/` — reusable mental models for research, planning, shipping, and review.
- `snippets/` — reusable prompt fragments and `CLAUDE.md` blocks.
- `assets/` — diagrams plus the image sourcing and licensing policy.

### Design decisions

- **Rejected the flat 38-folder `prompts/` layout** in favour of domain grouping. A flat list stops
  being navigable past roughly a dozen entries, and six pairs in the original list overlapped enough
  to guarantee duplicate content. All original folder names are preserved inside their domain group.
- **Adopted a single mandatory entry structure.** Uniformity is what makes a hundred files feel like
  one book rather than a hundred blog posts.
- **Declared external links a public API.** Deep links into this repository are load-bearing for
  anyone who bookmarks or cites an entry, so breaking one is a major version bump.

---

[Unreleased]: https://github.com/rajtiwariyng/claude-code-playbook/compare/v1.0.0...HEAD
[1.0.0]: https://github.com/rajtiwariyng/claude-code-playbook/releases/tag/v1.0.0
