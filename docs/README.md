# Documentation

Orientation for the playbook. These ten documents explain *how to work with Claude Code well*; the entries under [`prompts/`](../prompts/) apply that knowledge to specific tasks.

## Reading Order

```mermaid
flowchart LR
    A[Getting-Started] --> B[Installation]
    B --> C[Prompting-Guide]
    C --> D[Thinking-Framework]
    D --> E[Research-Framework]
    E --> F[AI-Agent-Workflow]
    F --> G[Claude-Code-Best-Practices]
    G --> H[Output-Standards]
    H --> I[Style-Guide]
    I --> J[FAQ]

    style C fill:#2d5f8b,color:#fff
    style D fill:#2d5f8b,color:#fff
```

The two highlighted documents change how everything else lands. If you read nothing else, read those.

## Index

| Document | Read it when | Time |
| --- | --- | --- |
| [Getting-Started.md](Getting-Started.md) | You are new to this repository and want the shortest path to useful output | 15 min |
| [Installation.md](Installation.md) | You are setting Claude Code up on a real project for the first time | 20 min |
| [Prompting-Guide.md](Prompting-Guide.md) | You want your prompts to stop producing generic results | 30 min |
| [Thinking-Framework.md](Thinking-Framework.md) | You need to decide how much reasoning effort a task deserves | 20 min |
| [Research-Framework.md](Research-Framework.md) | You need output that is grounded in verified fact, not plausible fiction | 25 min |
| [AI-Agent-Workflow.md](AI-Agent-Workflow.md) | Your task is too large for one prompt and needs staging | 25 min |
| [Claude-Code-Best-Practices.md](Claude-Code-Best-Practices.md) | You are using Claude Code daily and want to work faster with fewer corrections | 30 min |
| [Output-Standards.md](Output-Standards.md) | You need a shared definition of "production-ready" | 20 min |
| [Style-Guide.md](Style-Guide.md) | You are contributing to this repository | 15 min |
| [Publishing.md](Publishing.md) | You are wondering why Pages is off and the Wiki is disabled | 10 min |
| [FAQ.md](FAQ.md) | You have a specific question | As needed |

## What These Documents Assume

- You have access to Claude Code in some form — CLI, desktop, web, or IDE extension.
- You are working on real projects with real consequences, not experimenting.
- You would rather spend ten minutes framing a task than an hour correcting its output.

## What These Documents Are Not

They are not a substitute for the [official Claude Code documentation](https://docs.claude.com/en/docs/claude-code). Where product behaviour is concerned — flags, configuration, feature availability — the official docs are authoritative and these documents defer to them.

What you get here instead is **method**: how to frame, stage, verify, and review work. That layer is not documented upstream, because it is not a product feature.

## Related

- [prompts/](../prompts/) — the playbook entries these documents underpin
- [frameworks/](../frameworks/) — the mental models referenced throughout
- [checklists/](../checklists/) — verification lists for use during work
- [CONTRIBUTING.md](../CONTRIBUTING.md) — standards for contributing to these documents

## References

- [Claude Code documentation](https://docs.claude.com/en/docs/claude-code)
- [Claude Docs](https://docs.claude.com)
