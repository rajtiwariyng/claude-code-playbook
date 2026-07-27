# Screenshots

Capture specification for repository imagery. **No placeholder images are committed**, and none should be.

## Why There Are No Placeholders

A `![screenshot](coming-soon.png)` that renders as a broken-image icon is worse than an empty section. It signals an unfinished repository on the first screen a visitor sees, and it is the single most common self-inflicted wound in a new open-source README.

The rule here: **an image lands in the README the day it exists, and not before.** Until then the README uses Mermaid diagrams, which render natively on GitHub, diff as text, need no asset pipeline, and cannot break.

## What Would Earn a Place

Only images that answer a question the text cannot. Ranked by value:

| # | Image | Answers | Status |
| --- | --- | --- | --- |
| 1 | An entry's ten-section structure, annotated | "What does an entry actually look like?" | Wanted |
| 2 | Side-by-side output: vague inputs vs a completed Inputs table | "Does this actually change the result?" | Wanted |
| 3 | A real `CLAUDE.md` in an editor, with callouts on the load-bearing lines | "What belongs in project memory?" | Wanted |
| 4 | The audit script failing, then passing | "What does enforcement look like?" | Wanted |

Number 2 is the highest-value image this repository could have and the hardest to produce honestly. It has to be a genuine pair of runs, not a staged comparison.

## Capture Specification

| Property | Requirement |
| --- | --- |
| Format | PNG for UI, SVG for diagrams. No JPEG — it smears text |
| Width | 1600px maximum. GitHub renders README images at roughly 850px |
| File size | Under 300 KB. Compress before committing |
| Aspect | Crop tight to the subject. No desktop wallpaper, no dock, no tab bar |
| Theme | Capture both light and dark where the README shows them conditionally |
| Text size | Legible at 50% scale, since that is how it renders in a README |
| Naming | `kebab-case-describing-content.png`, not `screenshot-1.png` |

## Before Committing an Image

- [ ] No API key, token, or credential is visible — including in a URL bar or a terminal scrollback
- [ ] No client name, real customer data, or internal hostname appears
- [ ] No personal information: email addresses, avatars, file paths containing a username
- [ ] The content shown is real, not staged to look better than a real run
- [ ] Alt text is written and describes the content, not the file
- [ ] Compressed, and under 300 KB
- [ ] Provenance recorded below if the image is not original

> [!WARNING]
> A screenshot is a data leak with a friendly interface. Terminal scrollback, browser history, and editor tabs routinely capture things the author did not intend to publish. Review the full frame at 100% before committing — and remember that deleting the file later does not remove it from git history.

## Referencing an Image

Always with meaningful alt text, and never as the only carrier of information:

```markdown
![The ten mandatory sections of a playbook entry, annotated with which three
readers most often skip](assets/screenshots/entry-structure-annotated.png)
```

An image must never be the only place something is explained. Anyone using a screen reader, on a slow connection, or reading a diff sees the alt text and nothing else.

## Diagrams Are Not Screenshots

Anything structural — a flow, a hierarchy, a decision tree — belongs in Mermaid, inline in the Markdown. It renders natively, versions properly, and any contributor can correct it without the original tool.

Conventions: [docs/Style-Guide.md](../../docs/Style-Guide.md#diagrams).

## Provenance

No images are currently committed. When one is added, record it here:

| File | Source | Licence | Added |
| --- | --- | --- | --- |
| — | — | — | — |

Original captures are recorded as `Original` under the repository's MIT licence. Anything else follows the [sourcing policy](../README.md#image-sourcing-policy).

## Related

- [assets/README.md](../README.md) — the repository-wide image sourcing and licensing policy
- [docs/Style-Guide.md](../../docs/Style-Guide.md#diagrams) — Mermaid conventions
- [prompts/quality/accessibility/](../../prompts/quality/accessibility/) — alt text requirements
- [prompts/quality/performance/](../../prompts/quality/performance/) — image optimisation
- [CONTRIBUTING.md](../../CONTRIBUTING.md) — contributing an image

## References

- [GitHub image rendering](https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax#images)
- [WCAG 2.2: Non-text Content](https://www.w3.org/WAI/WCAG22/Understanding/non-text-content.html)
- [Mermaid documentation](https://mermaid.js.org/)
