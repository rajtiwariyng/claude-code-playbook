# Security

**All security guidance in this repository.** Every other folder links here rather than restating it.

> [!NOTE]
> **Status: planned for v1.1.** This folder has no entries yet. Its scope and
> intended contents are documented below so the taxonomy is stable and links resolve.
> See [ROADMAP.md](../../../ROADMAP.md) for the release plan.

## Scope

**All security guidance in this repository.** Every other folder links here rather than restating it.

> [!IMPORTANT]
> This folder is deliberately authoritative. Security rules restated across twenty folders are out of sync by the next release. The security *role* is owned by [core/system/security-engineer.md](../../core/system/security-engineer.md).

## Planned Entries

| Entry | Status |
| --- | --- |
| `owasp-top-10.md` | Planned |
| `authentication.md` | Planned |
| `authorization.md` | Planned |
| `sql-injection.md` | Planned |
| `xss.md` | Planned |
| `csrf.md` | Planned |
| `ssrf.md` | Planned |
| `rate-limiting.md` | Planned |
| `file-upload.md` | Planned |
| `secrets-management.md` | Planned |
| `dependency-audit.md` | Planned |
| `security-review.md` | Planned |

Each will be written to the full ten-section structure defined in
[CONTRIBUTING.md](../../../CONTRIBUTING.md#the-ten-section-entry-structure). None will ship as a stub.

## Shared Concerns Live Elsewhere

Per the [folder ownership rules](../../../CONTRIBUTING.md#folder-ownership), these are never
restated in this folder:

| Concern | Owner |
| --- | --- |
| Security | [quality/security/](../../quality/security/) |
| Performance | [quality/performance/](../../quality/performance/) |
| Accessibility | [quality/accessibility/](../../quality/accessibility/) |
| Roles and output contracts | [core/system/](../../core/system/) |
| Research method | [core/research/](../../core/research/) |

## Contributing an Entry Here

This folder is open for contribution. Open an issue using the **New entry proposal**
template first -- most rejected pull requests are for duplication or wrong folder, and
both are cheap to catch before anything is written.

See [CONTRIBUTING.md](../../../CONTRIBUTING.md).

## Related

- [prompts/README.md](../../README.md) -- the full A-Z entry index
- [docs/Output-Standards.md](../../../docs/Output-Standards.md) -- the quality bar every entry enforces
- [templates/prompt-template.md](../../../templates/prompt-template.md) -- the entry skeleton
- [ROADMAP.md](../../../ROADMAP.md) -- when this folder ships

## References

- [Claude Code documentation](https://docs.claude.com/en/docs/claude-code)
- [WCAG 2.2](https://www.w3.org/TR/WCAG22/)
- [OWASP Top 10](https://owasp.org/Top10/)