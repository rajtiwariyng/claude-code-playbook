# Frameworks

Reusable mental models. Named so they can be referred to without re-explaining them.

> [!NOTE]
> **Status: planned for v1.1.** The core models are already documented in
> [docs/](../docs/); this folder will extract them into standalone references with
> worked examples. Links below point to their current homes where one exists.

## Why Name a Model

A named model is a shortcut. "Run the reversibility test on this" is one sentence; explaining the reasoning behind it is a paragraph, every time, to every person.

Naming also makes a model **arguable**. An unnamed habit cannot be challenged, improved, or discarded — it just quietly shapes decisions. A named one can be examined.

## Index

| Framework | Answers | Current home | Status |
| --- | --- | --- | --- |
| **Reversibility Test** | How much effort does this task deserve? | [docs/Thinking-Framework.md](../docs/Thinking-Framework.md#the-reversibility-test) | Documented |
| **Four Effort Tiers** | T1 direct, T2 structured, T3 staged, T4 adversarial | [docs/Thinking-Framework.md](../docs/Thinking-Framework.md#four-effort-tiers) | Documented |
| **Source Hierarchy** | Which source wins when they disagree? | [docs/Research-Framework.md](../docs/Research-Framework.md#the-source-hierarchy) | Documented |
| **Confidence Labels** | Verified, Documented, Estimate, Unverified, Opinion | [docs/Research-Framework.md](../docs/Research-Framework.md#confidence-labelling) | Documented |
| **The Standard Chain** | Research → Plan → Build → Review, with gates | [docs/AI-Agent-Workflow.md](../docs/AI-Agent-Workflow.md#the-standard-chain) | Documented |
| **Role Composition** | Identity, optimises for, refuses to | [prompts/core/system/role-composition.md](../prompts/core/system/role-composition.md) | Documented |
| **Observed / Reported / Predicted** | Separating what users do from what they say | [prompts/core/research/user-research.md](../prompts/core/research/user-research.md) | Documented |
| **Known / Reported / Inferred / Unknown** | Separating evidence from reasoning | [prompts/core/system/research-analyst.md](../prompts/core/system/research-analyst.md) | Documented |
| **Structural vs Surface** | Does this justify a rebuild? | [prompts/web/websites/website-audit.md](../prompts/web/websites/website-audit.md) | Documented |
| **Archetype + Overlay** | Base pattern plus constraint set, instead of duplicated entries | [prompts/web/websites/README.md](../prompts/web/websites/README.md) | Documented |
| `pre-mortem.md` | What will this look like when it has failed? | — | Planned v1.1 |
| `inversion.md` | What would guarantee failure here? | — | Planned v1.1 |
| `decision-record.md` | Capturing a decision so it is not re-litigated | — | Planned v1.1 |
| `exit-cost.md` | What does leaving this choice cost later? | — | Planned v1.1 |

## The Two That Do the Most Work

**Reversibility Test.** One question — *if this is wrong, what does it cost to find out and fix?* — decides how much process a task deserves. It replaces the intuition that difficulty implies importance, which is wrong in both directions: deleting a column is trivially easy and permanent.

**Separation models.** Known/Reported/Inferred/Unknown, Observed/Reported/Predicted, and fact/assumption all do the same job: they prevent two things that feel identical while reading from being treated as identical while deciding. Almost every confidently-wrong deliverable in this repository's Common Mistakes tables traces to a separation that was not maintained.

## Using a Framework

A framework is a thinking tool, not a procedure. If applying one costs more than the decision it informs, the framework is the wrong size for the task — that is itself what the Reversibility Test tells you.

## Related

- [../docs/Thinking-Framework.md](../docs/Thinking-Framework.md) — effort allocation
- [../docs/Research-Framework.md](../docs/Research-Framework.md) — evidence and sourcing
- [../docs/AI-Agent-Workflow.md](../docs/AI-Agent-Workflow.md) — staging multi-step work
- [../checklists/](../checklists/) — the verification lists these models inform
- [../prompts/](../prompts/) — entries that apply these models

## References

- [Architectural Decision Records](https://adr.github.io/)
- [Claude Code documentation](https://docs.claude.com/en/docs/claude-code)
