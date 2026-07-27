# Laravel

Laravel application work end to end.

> [!NOTE]
> **Status: planned for v1.1.** This folder has no entries yet. Its scope and
> intended contents are documented below so the taxonomy is stable and links resolve.
> See [ROADMAP.md](../../../ROADMAP.md) for the release plan.

## Scope

Laravel application work end to end.

> [!IMPORTANT]
> API contract design is owned by [backend/api/](../api/); schema and migrations by [backend/database/](../database/). This folder covers Laravel-specific implementation of both.

## Planned Entries

| Entry | Status |
| --- | --- |
| `project-analysis.md` | Planned |
| `architecture-review.md` | Planned |
| `new-module.md` | Planned |
| `laravel-api.md` | Planned |
| `authentication.md` | Planned |
| `authorization.md` | Planned |
| `queues-and-jobs.md` | Planned |
| `events-and-listeners.md` | Planned |
| `notifications.md` | Planned |
| `payments.md` | Planned |
| `laravel-performance.md` | Planned |
| `caching.md` | Planned |
| `laravel-security.md` | Planned |
| `laravel-testing.md` | Planned |
| `deployment.md` | Planned |
| `code-review.md` | Planned |
| `refactoring.md` | Planned |

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