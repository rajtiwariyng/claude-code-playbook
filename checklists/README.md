# Checklists

Verification lists to run *during* work, not documentation to read before it.

> [!NOTE]
> [release.md](release.md) is available now. The rest are indexed below so the taxonomy is
> stable and links resolve, and are planned for v1.1. Entry-specific checklists already exist
> inside every published entry under [prompts/](../prompts/).

## Scope

Each playbook entry carries its own Quality Checklist, scoped to that task. This folder holds the **cross-cutting** lists — the ones that apply regardless of what you were building.

| Checklist | Run it | Status |
| --- | --- | --- |
| [release.md](release.md) | Before tagging a version | **Available** |
| `pre-flight.md` | Before starting work | Planned v1.1 |
| `pre-ship.md` | Before anything reaches a user | Planned v1.1 |
| `code-review.md` | Reviewing any change | Planned v1.1 |
| `accessibility.md` | Before shipping any interface | Planned v1.1 |
| `security.md` | Before shipping anything handling input or auth | Planned v1.1 |
| `performance.md` | Before shipping anything user-facing | Planned v1.1 |
| `content-accuracy.md` | Before publishing any factual claim | Planned v1.1 |
| `irreversible-action.md` | Before deleting, deploying, or publishing | Planned v1.1 |

## What Makes a Checklist Item Valid

Every item must be **objectively pass or fail**. This is the rule that separates a checklist from a list of good intentions.

| Valid | Invalid | Why |
| --- | --- | --- |
| Contrast ratio ≥ 4.5:1, measured | "Colours look accessible" | The second cannot be failed |
| `make test` passed, output shown | "Tests are passing" | A claim is not evidence |
| Every endpoint has an authorisation check | "Authorisation is handled" | Coverage is the finding, not existence |
| LCP ≤ 2.5s at p75, field data | "Site feels fast" | Feels fast on your machine |
| No `{{` remains in the document | "Placeholders replaced" | One is checkable in a second |

An item you can talk yourself past is not a checklist item.

## How to Use One

**Go item by item, and score honestly.** "Mostly" is a fail. The value of a checklist is entirely in its willingness to fail you — a list you always pass is a ritual, not a control.

Record which items failed rather than only that something did. The failures are the information: they tell you where your process leaks, and the same two or three items usually fail repeatedly.

## Checklist Versus Hook

If a check is mechanical, non-negotiable, and fast, it should be a hook rather than a checklist item. Enforcement beats documentation.

| Make it a hook | Keep it a checklist item |
| --- | --- |
| A command decides pass/fail | The check needs judgement |
| You never want it skipped | Context sometimes justifies skipping |
| It runs in seconds | It takes real time |

A hook cannot decide whether an API design is good. It can decide whether the linter passed. See [docs/AI-Agent-Workflow.md](../docs/AI-Agent-Workflow.md#enforcing-gates-with-hooks).

## Related

- [../docs/Output-Standards.md](../docs/Output-Standards.md#definition-of-done) — the definition of done these lists enforce
- [../docs/Claude-Code-Best-Practices.md](../docs/Claude-Code-Best-Practices.md#daily-checklist) — the daily working checklist
- [../docs/Thinking-Framework.md](../docs/Thinking-Framework.md#the-reversibility-test) — which work warrants which list
- [../prompts/](../prompts/) — entry-specific quality checklists
- [../frameworks/](../frameworks/) — the mental models behind these checks

## References

- [WCAG 2.2 quick reference](https://www.w3.org/WAI/WCAG22/quickref/)
- [OWASP Application Security Verification Standard](https://owasp.org/www-project-application-security-verification-standard/)
- [Core Web Vitals](https://web.dev/articles/vitals)
