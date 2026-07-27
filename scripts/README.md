# Scripts

Maintenance scripts that enforce the standards this repository publishes.

## Why These Exist

A documented standard that nothing checks drifts within a release. Everything here mechanically enforces a rule stated in [docs/Style-Guide.md](../docs/Style-Guide.md) or [CONTRIBUTING.md](../CONTRIBUTING.md) — the scripts are the reason those documents stay true.

They are PowerShell because the repository is maintained on Windows and PowerShell ships with it. No install step, no dependency tree, no lockfile to keep current.

## Index

| Script | Checks | Exit code |
| --- | --- | --- |
| [check-links.ps1](check-links.ps1) | Every relative Markdown link resolves | 0 clean, 1 broken |
| [audit.ps1](audit.ps1) | Structure, sections, entry format, code fences, callouts, wording, terminology, naming, whitespace | 0 clean, 1 findings |

## Running Them

```powershell
./scripts/check-links.ps1
./scripts/audit.ps1
```

Run a subset of audit checks while working on one thing:

```powershell
./scripts/audit.ps1 -Check CODE,CALLOUTS
```

Available checks: `STRUCTURE`, `SECTIONS`, `ENTRIES`, `CODE`, `CALLOUTS`, `WORDS`, `TERMS`, `NAMING`, `WHITESPACE`.

## What Each Check Enforces

| Check | Rule | Source |
| --- | --- | --- |
| `STRUCTURE` | One H1; no skipped heading levels; no duplicate sibling headings | [Style-Guide](../docs/Style-Guide.md#headings) |
| `SECTIONS` | Content files end with `Related` and `References` | [Style-Guide](../docs/Style-Guide.md#document-structure) |
| `ENTRIES` | Files under `prompts/` carry all ten mandatory sections, in order | [CONTRIBUTING](../CONTRIBUTING.md#the-ten-section-entry-structure) |
| `CODE` | Every fence is language-tagged; nested fences use more backticks than their parent | [Style-Guide](../docs/Style-Guide.md#code-blocks) |
| `CALLOUTS` | Length-scaled budget; only valid GitHub alert types | [Style-Guide](../docs/Style-Guide.md#callouts) |
| `WORDS` | No filler from the avoid list | [Style-Guide](../docs/Style-Guide.md#words-to-avoid) |
| `TERMS` | Consistent terminology | [Style-Guide](../docs/Style-Guide.md#terminology) |
| `NAMING` | `kebab-case.md` for entries, `Title-Case-Hyphenated.md` for docs | [Style-Guide](../docs/Style-Guide.md#file-naming) |
| `WHITESPACE` | Final newline present, no trailing spaces | [.editorconfig](../.editorconfig) |

## Design Notes for Maintainers

Two decisions worth knowing before you edit these.

**The checks target function, not letters.** `highest-leverage` is a compound noun and passes; `leverage our expertise` is the banned verb and fails. A term quoted inside backticks or quotation marks is being cited as an example of bad writing — every entry that teaches a rule has to name what it bans — so quoted occurrences are skipped. When you add a rule, write the pattern for the harmful form, not for the substring.

**A false positive is worse than a missed finding.** A checker that cries wolf gets ignored, and then it catches nothing at all. If a new rule flags legitimate content, narrow the rule rather than rewriting the content to satisfy it — and if the content is right and the standard is wrong, fix the standard.

## Adding a Check

1. Add it to the `$Check` parameter's default array in `audit.ps1`.
2. Write the rule against a standard that is already documented. If it is not documented, document it first — an unwritten rule enforced by a script is worse than no rule.
3. Run against the whole repository and triage every hit before committing. Any legitimate content it flags means the pattern is too broad.
4. Add a row to the table above.

## Continuous Integration

Both scripts run on every push and pull request via [.github/workflows/audit.yml](../.github/workflows/audit.yml). A failing check blocks the merge.

## Related

- [docs/Style-Guide.md](../docs/Style-Guide.md) — the standard these enforce
- [CONTRIBUTING.md](../CONTRIBUTING.md) — the entry structure `ENTRIES` checks
- [checklists/](../checklists/) — the judgement-based checks that cannot be mechanised
- [docs/AI-Agent-Workflow.md](../docs/AI-Agent-Workflow.md#enforcing-gates-with-hooks) — when to enforce versus document

## References

- [PowerShell documentation](https://learn.microsoft.com/en-us/powershell/)
- [markdownlint rules](https://github.com/DavidAnson/markdownlint/blob/main/doc/Rules.md) — complements these checks
- [GitHub Actions](https://docs.github.com/en/actions) — how these run in CI
