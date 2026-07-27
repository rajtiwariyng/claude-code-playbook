# Publishing and Distribution

Decisions about GitHub Pages, the Wiki, and Discussions — what this repository uses, what it deliberately does not, and why.

Recorded here rather than left implicit, so they can be argued with instead of rediscovered.

## Table of Contents

- [Summary](#summary)
- [GitHub Pages](#github-pages)
- [GitHub Wiki](#github-wiki)
- [GitHub Discussions](#github-discussions)
- [Releases and Tags](#releases-and-tags)
- [Labels](#labels)
- [Related](#related)
- [References](#references)

---

## Summary

| Surface | Decision | Reason |
| --- | --- | --- |
| **GitHub Pages** | Supported but **off by default** | Relative `.md` links break under Jekyll. Config is provided for anyone who wants it |
| **GitHub Wiki** | **Disabled** | Unreviewed, unversioned content that drifts from the repository |
| **GitHub Discussions** | **Enabled** | Questions are not defects and should not live in the issue tracker |
| **Releases** | Tagged per version | Deep links are a public API; releases make each state citable |

## GitHub Pages

### The compatibility problem

This repository reads correctly on github.com because GitHub resolves relative links between Markdown files. **Under GitHub Pages, those same links break.**

```text
On github.com          docs/Getting-Started.md   →  renders
On GitHub Pages        docs/Getting-Started.md   →  404, needs /docs/getting-started/
```

There are roughly 1,300 relative links here. Any Pages setup must rewrite every one of them, or the site is a maze of dead ends — which is worse than not publishing at all.

### Pages: the decision

**Pages is off by default.** The repository is designed to be read on github.com, where navigation already works, search already works, and nothing needs a build step.

This is not a limitation being worked around. A documentation repository that renders correctly in the place people already are is a feature; adding a static site generator adds a build, a theme, a deploy, and a class of drift where the site and the repository disagree.

### If you want Pages anyway

A minimal Jekyll configuration ships at [`_config.yml`](../_config.yml). It is **not** enabled by any workflow — turning it on is a deliberate act.

```bash
# Settings → Pages → Source: Deploy from a branch → main → / (root)
```

Then be aware of what you have signed up for:

| Consequence | Detail |
| --- | --- |
| Relative `.md` links 404 | Jekyll serves `/path/` not `/path.md`. Either add `relative_links` handling or rewrite links |
| Underscore-prefixed paths are ignored | Not currently an issue here; it would be if a `_folder` were added |
| Mermaid does not render | GitHub renders Mermaid natively; Jekyll does not without a plugin |
| A second thing to keep current | The site can be stale while the repository is correct |

The third row matters most. Every diagram in this repository is Mermaid, so a naive Pages deployment loses all of them.

> [!IMPORTANT]
> If you enable Pages, verify the diagrams and a sample of relative links before announcing the URL. A published site with broken navigation and missing diagrams damages the project more than having no site.

## GitHub Wiki

### Wiki: the decision

**Disabled**, deliberately. Settings → Features → Wiki → unchecked.

### Why

| Problem | Consequence |
| --- | --- |
| Wiki content is not reviewed | It bypasses `CONTRIBUTING.md`, the ten-section structure, and every check in `scripts/` |
| Wiki content is not versioned with the code | It cannot be tagged, released, or rolled back alongside the repository |
| Wiki lives in a separate git repository | The audit and link checker never see it |
| Wiki invites duplication | The natural thing to put in a wiki is a guide — and guides already live in `docs/` |

The last one is decisive. A wiki page explaining how to use an entry would duplicate that entry, and the copy nobody checks is the copy that goes wrong. That is exactly the failure the [folder ownership rules](../CONTRIBUTING.md#folder-ownership) exist to prevent, and a wiki reintroduces it outside the reach of any enforcement.

**Everything a wiki would hold belongs in `docs/`**, where it is reviewed, versioned, linked, and checked on every push.

## GitHub Discussions

### Discussions: the decision

**Enabled.** Templates ship for [Q&A](../.github/DISCUSSION_TEMPLATE/q-a.yml) and [Show and tell](../.github/DISCUSSION_TEMPLATE/show-and-tell.yml).

### Why, when the Wiki is disabled

Discussions and the Wiki fail in opposite directions. A wiki accumulates **unreviewed documentation that competes with the repository**. Discussions accumulate **conversation that never pretends to be documentation** — a question with an answer stays a question, and nobody mistakes it for a specification.

### Categories

| Category | For | Not for |
| --- | --- | --- |
| **Q&A** | "How do I do X with this?" | Defect reports — those are issues |
| **Ideas** | Disagreeing with a recommendation; proposing direction | Entry proposals — those are issues |
| **Show and tell** | Prompts, workflows, and `CLAUDE.md` files that worked or failed instructively | Promotion of unrelated products |
| **Announcements** | Releases, maintainer-only | — |

Routing between issues and discussions is documented in [SUPPORT.md](../SUPPORT.md#route-your-question).

### Promotion path

A Show and tell post that proves itself is a strong candidate for an entry. The route is: discussion → *New entry proposal* issue → pull request. Discussions are where a pattern earns its evidence; entries are where it becomes maintained.

## Releases and Tags

Deep links here are treated as a public API, so each version is tagged and released.

| Practice | Detail |
| --- | --- |
| Tag format | `v1.0.0`, matching [CHANGELOG.md](../CHANGELOG.md) |
| Release notes | Copied from the CHANGELOG section, not rewritten |
| What triggers a release | Any change to the entry set or structure. Typo fixes batch |
| Breaking change | Any renamed file or heading. Major bump — see the [versioning policy](../CHANGELOG.md#versioning-policy) |

## Labels

A small, meaningful set. Labels that nobody filters by are noise.

| Label | Meaning |
| --- | --- |
| `defect` | Something here is wrong or stale |
| `entry proposal` | A new entry is being proposed |
| `documentation` | Affects `docs/` |
| `taxonomy` | Affects folder structure or ownership — needs discussion before work |
| `enforcement` | Affects `scripts/` or CI |
| `good first issue` | Self-contained, with the fix described |
| `help wanted` | Maintainers will not get to this soon |
| `triage` | Not yet assessed |
| `dependencies` | Raised by Dependabot |
| `wontfix` | Declined, with the reason in the thread |

Anything labelled `taxonomy` is blocked until the structural question is settled. Structure changes break deep links, and deep links are load-bearing.

## Related

- [SUPPORT.md](../SUPPORT.md) — where to ask, and what makes a report actionable
- [CONTRIBUTING.md](../CONTRIBUTING.md) — the review standards a wiki would bypass
- [CHANGELOG.md](../CHANGELOG.md#versioning-policy) — what counts as a breaking change
- [ROADMAP.md](../ROADMAP.md) — what ships when
- [scripts/README.md](../scripts/README.md) — the checks that only cover the repository

## References

- [GitHub Pages documentation](https://docs.github.com/en/pages)
- [GitHub Discussions documentation](https://docs.github.com/en/discussions)
- [Jekyll configuration](https://jekyllrb.com/docs/configuration/)
- [GitHub releases](https://docs.github.com/en/repositories/releasing-projects-on-github)
- [Semantic Versioning 2.0.0](https://semver.org/)
