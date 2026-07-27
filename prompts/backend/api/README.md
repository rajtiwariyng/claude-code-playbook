# API Design

REST and GraphQL contract design, versioning, and documentation.

> [!NOTE]
> **Status: planned for v1.1.** This folder has no entries yet. Its scope and
> intended contents are documented below so the taxonomy is stable and links resolve.
> See [ROADMAP.md](../../../ROADMAP.md) for the release plan.

## Scope

REST and GraphQL contract design, versioning, and documentation.

> [!IMPORTANT]
> Framework folders link here and cover only framework-specific implementation. Rate limiting as a security control is owned by [quality/security/](../../quality/security/); this folder owns its contract design.

## Planned Entries

| Entry | Status |
| --- | --- |
| `rest-contract-design.md` | Planned |
| `graphql-schema-design.md` | Planned |
| `api-versioning.md` | Planned |
| `pagination-and-filtering.md` | Planned |
| `error-model.md` | Planned |
| `idempotency.md` | Planned |
| `rate-limiting-design.md` | Planned |
| `api-documentation.md` | Planned |

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