# Release Checklist

Run before tagging a version. Every item is objectively pass or fail.

Releases here are cheap to make and expensive to correct, because deep links into this repository are treated as a public API. The point of this list is to catch the things that cannot be fixed by a follow-up commit.

## Before You Start

| Input | Value |
| --- | --- |
| Version being released | |
| Bump type | Major / Minor / Patch |
| Previous version | |
| Date | |

Bump type is decided by the [versioning policy](../CHANGELOG.md#versioning-policy), not by how much work went in. **Any renamed file or heading is a major bump**, regardless of how small the change felt.

## Automated Gates

All three must pass on the commit being tagged. Run them locally; do not rely on having seen them pass earlier.

```powershell
./scripts/check-links.ps1     # every relative link resolves
./scripts/audit.ps1           # published standards
npx markdownlint-cli2 "**/*.md"
```

- [ ] `check-links.ps1` reports 0 broken
- [ ] `audit.ps1` reports 0 findings
- [ ] `markdownlint-cli2` reports 0 issues
- [ ] CI is green on the exact commit being tagged, not an earlier one

## Accuracy

The checks that matter most, and the ones a script cannot make.

- [ ] Every version number, limit, price, and API shape added this cycle has been re-verified against its primary source
- [ ] Every volatile claim carries the date it was checked
- [ ] No claim added this cycle rests on a secondary source where a primary one exists
- [ ] Two citations picked at random were opened and confirmed to say what is claimed
- [ ] No entry states something as fact that was an estimate when written

> [!IMPORTANT]
> The failure this list exists to prevent: a figure that was correctly labelled an estimate in a research note, and lost its qualifier when it moved into an entry. Search the diff for numbers and check each one still carries its confidence label.

## Content Integrity

- [ ] Every new entry uses all ten mandatory sections, and none is thin
- [ ] Every new entry has been run against a real project, or its Example is explicitly labelled illustrative
- [ ] No new entry duplicates an existing one — [folder ownership rules](../CONTRIBUTING.md#folder-ownership) checked
- [ ] Shared concerns link to their owning folder rather than restating it
- [ ] Every new entry appears in `prompts/README.md` and its folder index
- [ ] Common Mistakes tables describe observed failures, not invented ones
- [ ] No secret, key, credential, client name, or internal hostname appears anywhere, including examples and screenshots

## Structure

- [ ] No file or directory was renamed — or, if one was, this is a **major** release
- [ ] No heading was renamed in a way that breaks an existing anchor link
- [ ] Any folder marked *Complete* in `prompts/README.md` actually has entries
- [ ] Any folder marked *Planned* has an honest index and no placeholder entries
- [ ] New folders have an index stating scope, ownership, planned entries, and milestone

## Documentation

- [ ] `CHANGELOG.md` has a section for this version with a real date, not `Unreleased`
- [ ] The CHANGELOG describes what actually shipped — no folder is claimed as complete when it holds only an index
- [ ] Design decisions made this cycle are recorded, not just the file list
- [ ] `ROADMAP.md` moves anything delivered out of *Planned*
- [ ] `README.md` repository map matches the actual folder structure
- [ ] Entry counts stated anywhere are correct

The second item is the one that goes wrong. Overstating what shipped is the accuracy failure this repository's own standards forbid, and a reader who finds one empty folder stops trusting the whole index.

## Release

- [ ] Tag matches the CHANGELOG heading exactly — `v1.1.0`, not `1.1.0`
- [ ] Release notes are copied from the CHANGELOG section, not rewritten
- [ ] Breaking changes are named in the first paragraph of the notes, with the old and new paths
- [ ] `CITATION.cff` version and `date-released` updated
- [ ] Tag pushed to the correct commit

## After Release

- [ ] Open a new `## [Unreleased]` section in the CHANGELOG
- [ ] Announce in [Discussions → Announcements](https://github.com/rajtiwariyng/claude-code-playbook/discussions)
- [ ] Close issues resolved by this release
- [ ] Spot-check three deep links from outside the repository — a search result, a bookmark, anything citing an entry

The last item catches the failure this whole list is built around: a link that worked before the release and does not now. If one broke, that is a major-version mistake and the correction ships immediately.

## If Something Ships Wrong

| Problem | Action |
| --- | --- |
| A factual error | Patch release within 14 days. Do not wait for other work |
| A broken deep link | Restore the old path as a stub linking forward, then fix properly |
| A missing index entry | Patch release; an unindexed entry is invisible |
| An overstated CHANGELOG | Correct it in place and note the correction |

Never quietly rewrite a released CHANGELOG section to hide what it originally claimed. Correct it and say so — the audit trail is worth more than the appearance of having been right.

## Related

- [../CHANGELOG.md](../CHANGELOG.md#versioning-policy) — what counts as major, minor, patch
- [../ROADMAP.md](../ROADMAP.md#maintenance-commitments) — the response times committed to
- [../docs/Publishing.md](../docs/Publishing.md#releases-and-tags) — tagging and release notes
- [../scripts/README.md](../scripts/README.md) — what the automated gates check
- [../CONTRIBUTING.md](../CONTRIBUTING.md) — the standards entries are reviewed against

## References

- [Semantic Versioning 2.0.0](https://semver.org/)
- [Keep a Changelog 1.1.0](https://keepachangelog.com/en/1.1.0/)
- [GitHub releases](https://docs.github.com/en/repositories/releasing-projects-on-github)
- [Citation File Format](https://citation-file-format.github.io/)
