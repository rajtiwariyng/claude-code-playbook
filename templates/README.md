# Templates

Fill-in-the-blank skeletons. Copy, complete, delete the guidance comments.

## Index

| Template | For | Status |
| --- | --- | --- |
| [prompt-template.md](prompt-template.md) | **The canonical playbook entry skeleton.** Every entry under `prompts/` starts here | Available |
| `claude-md-template.md` | A `CLAUDE.md` for a new project | Planned v1.1 |
| `decision-record-template.md` | An architectural decision record | Planned v1.1 |
| `research-brief-template.md` | Framing a research task before running it | Planned v1.1 |
| `readme-template.md` | A project README | Planned v1.1 |
| `runbook-template.md` | An operational runbook | Planned v1.1 |
| `proposal-template.md` | A priced client proposal | Planned v1.2 |

## How to Use a Template

1. **Copy it.** Do not edit the template in place.
2. **Fill every placeholder.** Search for `{{` before you consider it done — a leftover placeholder is the most common defect in template-derived documents.
3. **Delete the guidance comments.** They are `<!-- HTML comments -->` and will not render, but they will confuse the next person to edit the file.
4. **Cut what does not apply.** A template is a checklist of things to consider, not a form to complete. An empty section is worse than an absent one.

> [!IMPORTANT]
> [prompt-template.md](prompt-template.md) is the exception to point 4. Its ten sections are mandatory for anything under `prompts/`, and "present but thin" fails review. See [CONTRIBUTING.md](../CONTRIBUTING.md#the-ten-section-entry-structure).

## Why Templates Rather Than Generators

A template is readable, diffable, and forces you to make each decision consciously. A generator produces a document that looks complete before anyone has thought about it, which is the failure mode these are designed to prevent.

## Related

- [../CONTRIBUTING.md](../CONTRIBUTING.md) — the entry structure `prompt-template.md` enforces
- [../docs/Style-Guide.md](../docs/Style-Guide.md) — the writing standard
- [../docs/Output-Standards.md](../docs/Output-Standards.md) — the quality bar
- [../snippets/](../snippets/) — smaller fragments that are not whole documents
- [../checklists/](../checklists/) — verification lists rather than document skeletons

## References

- [GitHub Flavored Markdown](https://github.github.com/gfm/)
- [Architectural Decision Records](https://adr.github.io/)
