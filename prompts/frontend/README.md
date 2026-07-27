# Frontend

Browser-side application architecture and patterns.

## Folders

| Folder | Owns | Status |
| --- | --- | --- |
| [react/](react/) | React architecture, state, performance | Planned v1.1 |
| [nextjs/](nextjs/) | Framework-specific concerns only | Planned v1.1 |

> [!IMPORTANT]
> React patterns used inside a Next.js app are owned by `react`. `nextjs` covers only routing, rendering strategy, and server components.

## Shared Concerns

Per the [folder ownership rules](../../CONTRIBUTING.md#folder-ownership), guidance on these
is never restated inside this domain:

| Concern | Owner |
| --- | --- |
| Security | [quality/security/](../quality/security/) |
| Performance | [quality/performance/](../quality/performance/) |
| Accessibility | [quality/accessibility/](../quality/accessibility/) |
| Roles and output contracts | [core/system/](../core/system/) |
| Research method | [core/research/](../core/research/) |

## Related

- [prompts/README.md](../README.md) -- the full A-Z entry index
- [docs/Output-Standards.md](../../docs/Output-Standards.md) -- the quality bar
- [CONTRIBUTING.md](../../CONTRIBUTING.md) -- folder ownership and the entry structure
- [ROADMAP.md](../../ROADMAP.md) -- what ships when

## References

- [Claude Code documentation](https://docs.claude.com/en/docs/claude-code)
- [WCAG 2.2](https://www.w3.org/TR/WCAG22/)
- [OWASP Top 10](https://owasp.org/Top10/)