# Snippets

Small reusable fragments — the parts you paste repeatedly that are too small to be an entry.

> [!NOTE]
> **Status: planned for v1.1.** Indexed here so the taxonomy is stable and links resolve.

## Snippet Versus Entry

| It is a snippet if | It is an entry if |
| --- | --- |
| It is a few lines you paste into a larger prompt | It is a task with a workflow |
| It has no workflow of its own | It has verifiable stages |
| It cannot fail on its own | It has failure modes worth documenting |
| It has no meaningful "expected output" | You can describe a correct result |

If a fragment needs the ten-section structure to be useful, it is an entry and belongs in [prompts/](../prompts/).

## Planned Snippets

### Prompt fragments

| Snippet | Purpose | Status |
| --- | --- | --- |
| `assumptions-block.md` | Force assumptions into a separate risk-rated table | Planned v1.1 |
| `constraints-block.md` | The labelled constraint block that goes near the top | Planned v1.1 |
| `output-shape.md` | Specifying an exact output format | Planned v1.1 |
| `no-fixing.md` | Restrict a pass to reporting only | Planned v1.1 |
| `adversarial-turn.md` | Flip to the blocking-reviewer position | Planned v1.1 |
| `rejected-options.md` | State what has already been ruled out | Planned v1.1 |
| `verification-demand.md` | Require evidence rather than a claim of success | Planned v1.1 |

### `CLAUDE.md` blocks

| Snippet | For | Status |
| --- | --- | --- |
| `claude-md-laravel.md` | Laravel projects | Planned v1.1 |
| `claude-md-react.md` | React projects | Planned v1.1 |
| `claude-md-nodejs.md` | Node.js services | Planned v1.1 |
| `claude-md-monorepo.md` | Monorepos | Planned v1.2 |
| `claude-md-verification.md` | The "before claiming complete" section | Planned v1.1 |

### Settings and configuration

| Snippet | For | Status |
| --- | --- | --- |
| `permissions-safe-defaults.md` | A read-only allowlist that removes friction without risk | Planned v1.1 |
| `hooks-lint-on-edit.md` | Running a linter after every edit | Planned v1.2 |

## The Highest-Value Snippet

If only one ships, it is the assumptions block:

```text
Before the deliverable, output an "Assumptions" section as a table:
| # | Assumption | Risk (LOW/MEDIUM/HIGH) | If wrong |

List every gap you filled that I did not specify, including ones you
consider obvious — those are the ones that go unchallenged.

If more than three assumptions are HIGH risk, stop and ask instead of
producing the deliverable.
```

It works on any task, costs four lines, and converts the most common failure — a confident deliverable resting on an unexamined premise — into something you can see and attack.

## Promotion

The threshold for turning a snippet into a slash command is **twice**. The second time you paste the same fragment, put it in `.claude/commands/` and commit it. The cost is two minutes; the alternative is rediscovering it every month, and your teammates never getting it at all.

## Related

- [../prompts/core/system/](../prompts/core/system/) — the full role and contract entries these fragments come from
- [../prompts/core/system/project-constitution.md](../prompts/core/system/project-constitution.md) — what belongs in a `CLAUDE.md`
- [../docs/Installation.md](../docs/Installation.md#settings-and-permissions) — settings and permissions
- [../docs/Prompting-Guide.md](../docs/Prompting-Guide.md) — the techniques these fragments implement
- [../templates/](../templates/) — whole-document skeletons rather than fragments

## References

- [Claude Code memory](https://docs.claude.com/en/docs/claude-code/memory)
- [Claude Code settings](https://docs.claude.com/en/docs/claude-code/settings)
- [Claude Code slash commands](https://docs.claude.com/en/docs/claude-code/slash-commands)
