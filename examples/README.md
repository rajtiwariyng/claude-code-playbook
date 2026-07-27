# Examples

Complete worked runs: the inputs, what happened at each stage, and the output — including the runs that went badly.

> [!NOTE]
> **Status: planned for v1.1.** Every published entry already carries a worked Example
> section. This folder will hold the longer, multi-stage runs that do not fit inside an entry.

## Scope

An entry's Example section shows one prompt and an abbreviated result. This folder shows **the whole chain**: research producing findings, findings feeding a plan, the plan being rejected at a gate, the revised plan, the build, and the review.

That is what the entries cannot show, and it is where most of the practical learning is.

## Planned Examples

| Example | Demonstrates | Status |
| --- | --- | --- |
| `full-chain-api-design.md` | Research → Plan → Build → Review with a rejection at gate 2 | Planned v1.1 |
| `website-audit-to-decision.md` | An audit that produced a "do not rebuild" verdict | Planned v1.1 |
| `security-review-real-findings.md` | An adversarial pass on real code | Planned v1.1 |
| `research-with-unresolvable-gap.md` | Research that correctly ended in "go and test this" | Planned v1.1 |
| `claude-md-evolution.md` | A `CLAUDE.md` grown from real corrections over six months | Planned v1.2 |

## The Failure Library

`examples/failures/` will hold runs that produced **bad output**, with the diagnosis.

This is the most useful and least common material in any repository of this kind. A good example shows you a shape to copy; a bad example shows you a mistake you were about to make.

| Planned | Documents |
| --- | --- |
| `generic-output.md` | The same task with vague inputs and with complete ones, side by side |
| `confident-and-wrong.md` | Fabricated API shapes that read as authoritative |
| `scope-creep.md` | A change that quietly became three changes |
| `agreeable-review.md` | A review that found nothing because it was not licensed to block |
| `context-degradation.md` | Output quality dropping across a long session, and the file-handoff recovery |

> [!IMPORTANT]
> Reports of entries that produced poor results are the most valuable contribution to this repository and the rarest. If you have one, [open an issue](https://github.com/rajtiwariyng/claude-code-playbook/issues) using the **Entry defect** template — include what you asked, what you got, and what you expected.

## Honesty Rules for Examples

| Rule | Why |
| --- | --- |
| **Never present a constructed transcript as a real run** | It is the exact failure this repository exists to counter |
| **Label illustrative inputs** | Where inputs are constructed to demonstrate a pattern, say so in one line |
| **Abbreviate, do not embellish** | Trimming output for length is fine. Improving it is not |
| **Include the wrong turns** | A run with no false starts either was trivial or has been sanitised |
| **Redact, do not fabricate** | Replace confidential detail with an obvious placeholder, not with invented detail |

Published entries in this repository follow these rules already — where an Example uses constructed inputs, it says so.

## Related

- [../prompts/](../prompts/) — the entries these examples run
- [../docs/AI-Agent-Workflow.md](../docs/AI-Agent-Workflow.md) — the chain the full-run examples demonstrate
- [../docs/Prompting-Guide.md](../docs/Prompting-Guide.md#iteration-diagnose-do-not-rephrase) — the diagnosis the failure library applies
- [../CONTRIBUTING.md](../CONTRIBUTING.md) — how to contribute a run
- [../ROADMAP.md](../ROADMAP.md) — when this folder ships

## References

- [Claude Code documentation](https://docs.claude.com/en/docs/claude-code)
