# {{ENTRY_TITLE}}

<!--
CANONICAL ENTRY TEMPLATE

Copy this file to create a new playbook entry. Delete every HTML comment
before opening a pull request.

All ten sections below are mandatory, in this order, with no additions
above them. "Present but thin" fails review — see CONTRIBUTING.md.

Before you start:
  1. Search prompts/README.md — does this topic already have an entry?
  2. Check the folder ownership rules in CONTRIBUTING.md — which folder owns it?
  3. Read two neighbouring entries to match the voice.
-->

One paragraph stating what this entry produces and who it is for. No preamble, no motivation. A reader should know from this paragraph alone whether to keep reading.

---

## Purpose

<!--
One paragraph. What this accomplishes and the outcome it produces.
State the deliverable concretely: "a prioritised defect report", not
"insights into your codebase".
-->

## When to Use

<!--
Two lists. The second is the one people skip and the one that prevents
duplicate entries from being needed.
-->

Use this when:

- Signal that makes this the right entry
- Another signal
- Another signal

Use something else when:

| Situation | Go to |
| --- | --- |
| Adjacent situation this entry does not cover | `./related-entry.md` |
| Another adjacent situation | `../../<domain>/<folder>/other-entry.md` |

## Inputs Required

<!--
Gather these before opening Claude Code. Missing inputs are the top
cause of generic output. Mark optional inputs honestly — a table where
everything is "Yes" is not a real table.

Every {{PLACEHOLDER}} in the Claude Prompt section must appear here.
-->

| Input | Required | Notes |
| --- | --- | --- |
| `{{PLACEHOLDER_ONE}}` | Yes | What it is and where to find it |
| `{{PLACEHOLDER_TWO}}` | Yes | |
| `{{PLACEHOLDER_THREE}}` | No | Default if omitted: … |

## Workflow

<!--
Ordered stages. Each stage must be independently verifiable — a reader
should be able to stop after any stage and check whether it succeeded.

If a stage cannot be verified on its own, split it until it can.
Add a Mermaid diagram only when the flow branches; a linear sequence
is an ordered list.
-->

1. **Stage name** — what happens, and how you know it worked.
2. **Stage name** — what happens, and how you know it worked.
3. **Stage name** — what happens, and how you know it worked.
4. **Stage name** — what happens, and how you know it worked.

## Claude Prompt

<!--
Copy-paste ready. Placeholders as {{UPPER_SNAKE_CASE}}.

Structure it with labelled blocks (ROLE, CONTEXT, TASK, CONSTRAINTS,
OUTPUT, ACCEPTANCE). Constraints go near the top — constraints placed
after a long request compete with everything above them.
-->

```text
ROLE
You are a {{ROLE}} who optimises for {{PRIORITY}} and refuses to
{{ANTI_PATTERN}}.

CONTEXT
{{CONTEXT}}

TASK
{{TASK}}

CONSTRAINTS
- Constraint that eliminates an unusable class of solution
- Another constraint
- What is explicitly out of scope

OUTPUT
Describe the exact artefact. For structured output, show one filled row.

ACCEPTANCE
State how the result will be judged. Require that unverifiable claims
be separated from demonstrated ones.
```

## Expected Output

<!--
The shape of a correct result, specific enough that a reader can
recognise a wrong one. Show structure, not a full example — the full
example goes in the Example section.
-->

A correct result contains:

| Element | Detail |
| --- | --- |
| Element name | What it should contain |
| Element name | What it should contain |

It should **not** contain:

- Something a weak result includes
- Something a weak result includes

## Quality Checklist

<!--
Objective, pass/fail. "Contrast ratio >= 4.5:1", not "colours look
accessible". If an item requires judgement to score, rewrite it or
cut it.
-->

- [ ] Objective, verifiable criterion
- [ ] Objective, verifiable criterion
- [ ] Objective, verifiable criterion
- [ ] Every factual claim carries a source
- [ ] Assumptions are listed separately from findings
- [ ] Meets the relevant standards in `docs/Output-Standards.md`

## Common Mistakes

<!--
Minimum three rows, written from observed failures. Invented rows are
visible to reviewers and fail review.
-->

| Mistake | Why it happens | Fix |
| --- | --- | --- |
| What goes wrong | The reason it is tempting | The concrete correction |
| What goes wrong | The reason it is tempting | The concrete correction |
| What goes wrong | The reason it is tempting | The concrete correction |

## Example

<!--
PROVENANCE IS MANDATORY. Keep exactly one of the two lines below and
delete the other. There is no third option and no unlabelled example.

  real run    — you executed this against a real project. You may write
                "the review found", "this surfaced", measured results.
  constructed — written to demonstrate the pattern. You may explain what
                the prompt does and why each part is there. You may NOT
                claim an observation: no "effect observed", no before/after
                comparison, no "in testing this produced". Those are
                empirical claims, and an empirical claim with no run behind
                it is a fabrication however plausible it reads.

Enforced by scripts/audit.ps1 (PROVENANCE check).
-->

> **Provenance:** real run.
> **Provenance:** constructed. Inputs and output demonstrate the pattern; this is not a transcript of a real run.

**Inputs**

| Input | Value |
| --- | --- |
| `{{PLACEHOLDER_ONE}}` | Realistic value |
| `{{PLACEHOLDER_TWO}}` | Realistic value |

**Abbreviated output**

```text
What a good result actually looks like, trimmed to show the shape.
```

## Advanced Version

<!--
The higher-effort variant, and — importantly — when the extra cost is
justified. An Advanced Version that should always be used means the
base version is wrong.
-->

Use this when {{HIGHER_STAKES_CONDITION}}. It costs more time and
attention, and returns nothing extra on routine work.

```text
The advanced prompt, typically adding an adversarial pass, explicit
failure-mode analysis, or a verification stage.
```

## Related

<!--
Minimum two in-repo links. Link to the OWNING folder for shared concerns
rather than restating them.

Placeholders below are deliberately not real links — replace them.
Relative depth from a typical entry at prompts/<domain>/<folder>/entry.md:
  sibling entry      ./other-entry.md
  another folder     ../../<domain>/<folder>/
  repository docs    ../../../docs/Output-Standards.md
-->

- `./related-entry.md` — how it relates
- `../../<domain>/<folder>/` — how it relates
- `../../../docs/Output-Standards.md` — the quality bar this entry enforces

## References

<!-- Official sources first. Every factual claim in the entry should
trace to something here. -->

- [Official source](https://example.com) — what it establishes
- [Official source](https://example.com) — what it establishes
