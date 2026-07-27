# Frequently Asked Questions

Answers to the questions that come up most often about this repository and about working with Claude Code.

## Table of Contents

- [About This Repository](#about-this-repository)
- [Using the Playbook](#using-the-playbook)
- [Output Quality](#output-quality)
- [Working in a Codebase](#working-in-a-codebase)
- [Accuracy and Trust](#accuracy-and-trust)
- [Team and Process](#team-and-process)
- [Contributing](#contributing)
- [Related](#related)
- [References](#references)

---

## About This Repository

### Is this official Anthropic documentation?

No. This is an independent community project, not affiliated with or endorsed by Anthropic. For how Claude Code itself behaves — flags, configuration, feature availability — the [official documentation](https://docs.claude.com/en/docs/claude-code) is the source of truth, and this repository defers to it.

What you get here is **method**: how to frame, stage, verify, and review work. That layer is not documented upstream because it is not a product feature.

### Why not just use an "awesome prompts" list?

Because a prompt without its surrounding structure is the least valuable part of the work. Compare:

| A prompt list gives you | This gives you |
| --- | --- |
| Text to paste | The inputs to gather first |
| — | The stages to run it in |
| — | What a correct result looks like |
| — | An objective checklist to judge it |
| — | The documented ways this task fails |

If you take only the prompt block from a file here, you have taken the part that matters least.

### Why is the folder structure different from a flat list?

The original design brief specified 38 sibling folders under `prompts/`. That was rejected for two reasons: GitHub renders 38 undifferentiated directories with no navigational hierarchy, and six pairs in that list overlap enough to guarantee duplicate content within a few releases.

Every folder name from the brief is preserved — nested under a domain group, with a flat A–Z index in [prompts/README.md](../prompts/README.md). The [folder ownership rules](../CONTRIBUTING.md#folder-ownership) define which folder owns each overlapping topic.

### Can I use this commercially?

Yes. MIT licensed. Use it in client work, internal tooling, or training material. Attribution is appreciated, not required.

### How current is this?

Version-sensitive claims are re-verified at each minor release, and factual corrections ship within 14 days of being reported. See [ROADMAP.md](../ROADMAP.md#maintenance-commitments).

If you find something stale, [open an issue](https://github.com/rajtiwariyng/claude-code-playbook/issues) — those reports are the mechanism that keeps this accurate.

---

## Using the Playbook

### Where do I start?

[Getting-Started.md](Getting-Started.md), then [Prompting-Guide.md](Prompting-Guide.md). Then pick a real task you were going to do anyway and find its entry in [prompts/README.md](../prompts/README.md).

Do not start with a fake task. You cannot calibrate your judgement of output quality on work where you cannot tell good from bad.

### Do I have to read the whole entry, or can I just copy the prompt?

You can copy the prompt. You will get worse results.

The three sections people skip are the three that matter most: **Inputs Required** (missing inputs are the top cause of generic output), **Expected Output** (without it you have no baseline to judge against), and **Quality Checklist** (without it you are guessing).

### When should I use the Advanced Version?

When the stakes justify the cost. The Advanced Version takes longer and demands more of your attention, and on routine work it returns nothing for that. Use the tier table in [Thinking-Framework.md](Thinking-Framework.md#four-effort-tiers): T3 and T4 work warrants it, T1 and T2 generally does not.

### Can I modify the prompts?

Yes, and you should. They are starting points calibrated for a general case; your project has specifics. If a modification consistently works better, [contribute it back](../CONTRIBUTING.md).

### How do I chain entries together?

See [AI-Agent-Workflow.md](AI-Agent-Workflow.md). The short version: Research → Plan → Build → Review, with a human gate between each stage. Gate 2 — reviewing the plan — is the highest-value one, because it is the last point where changing direction is cheap.

---

## Output Quality

### Why is the output so generic?

Almost always because the inputs were vague. The model fills unspecified gaps with the statistically ordinary choice: no audience specified means a general audience, no constraints specified means an unconstrained solution.

Fill the entry's Inputs Required table properly. Then check that you replaced every `{{PLACEHOLDER}}` — a leftover placeholder is the single most common cause.

### I rewrote the prompt five times and it is still wrong.

Stop rewriting. Rewording almost never fixes a framing problem, and it is the box people check first because it is cheapest.

Work through the diagnostic table in [Prompting-Guide.md](Prompting-Guide.md#iteration-diagnose-do-not-rephrase). The question is *which component is missing* — context, constraints, output shape, grounding, acceptance criteria — not which words to change.

### Output starts strong and degrades toward the end.

The task exceeded what one pass sustains. Split it into stages. See [AI-Agent-Workflow.md](AI-Agent-Workflow.md#when-one-prompt-is-not-enough).

### Quality drops partway through a long session.

Accumulated context, not task difficulty. Write the current state to a file, start a fresh session, and read the file back:

```text
"Summarise the current state, decisions made, and remaining work.
 Write it to docs/wip/<topic>.md."
```

This costs one round trip and recovers more quality than any amount of rephrasing.

### The output ignores a constraint I stated.

Check where you stated it. Constraints placed after a long request compete with everything above them. Move them into a labelled block near the top:

```text
CONSTRAINTS
- No new dependencies.
- The database cannot be migrated this sprint.
- Must work without JavaScript.
```

---

## Working in a Codebase

### How do I stop re-explaining my project every session?

`CLAUDE.md` at your repository root. It is read automatically and is the highest-leverage configuration you can create. See [Installation.md](Installation.md#project-memory).

The reflex to develop: when you explain something twice, stop and add the line.

### What belongs in CLAUDE.md?

Decisions, not descriptions. The model can read your `package.json`; it cannot read your team's conventions.

| Include | Omit |
| --- | --- |
| Conventions a newcomer would get wrong | Facts derivable from the code |
| Commands with non-obvious flags | Standard framework commands |
| Things that look like bugs but are deliberate | A directory listing |
| How to verify work is done | Generic best-practice advice |

The test for whether a line belongs: does it prevent a specific, likely mistake?

### It keeps suggesting things we already ruled out.

Say so explicitly. Rejections stated ten turns ago fade; rejections in the current prompt do not:

```text
Already rejected, do not re-propose:
- Adding a caching layer (we cache already)
- Rewriting in Go (not happening this year)
```

### Should I let it run commands automatically?

Read-only and idempotent commands, yes — allowlist `git status`, `git diff`, test runs. Anything that writes, deploys, deletes, or installs, no. See [Claude-Code-Best-Practices.md](Claude-Code-Best-Practices.md#permissions-and-safety).

Never allowlist a broad wildcard like `Bash(*)`. It defeats the entire mechanism.

### How do I review AI-assisted changes?

To the same standard as any other change. But look in different places — the failure modes differ:

- Plausible but fabricated API usage
- Silent scope expansion beyond what you asked
- Tests that assert what the code does rather than what it should do
- Removed edge-case handling that someone added deliberately
- Confident comments describing intent the code does not have

The dangerous output is not the obviously bad kind. It is work that is 95% right, well-structured, and wrong in one place your eyes slide over because the surrounding code inspires confidence.

---

## Accuracy and Trust

### How much should I trust the output?

Trust the structure. Verify the facts.

Reasoning, organisation, and code structure are generally sound. Specific factual claims — version numbers, API signatures, CLI flags, configuration keys, limits, pricing — are the category that goes wrong, and they go wrong while sounding exactly as confident as the things that are right.

**Confidence carries no information about correctness.** Treat the two as unrelated.

### What should I always verify?

Anything with a number, a version, or a proper noun in it. Specifically:

Versions · API signatures · CLI flags · Configuration keys · Limits and quotas · Pricing · Statistics · Security guidance · Compliance claims

See [Research-Framework.md](Research-Framework.md#what-must-always-be-verified).

### It cited a source that does not say what it claims.

This happens, and it is the reason citations must be followed rather than counted. A plausible-looking reference to a real source that does not contain the claim is worse than no citation, because it survives review.

Follow through to the primary source. If the source does not say it, the claim does not stand.

### How do I get it to admit uncertainty?

Ask for it structurally, not politely:

```text
Before the deliverable, output an "Assumptions" section as a table:
#, Assumption, Risk (LOW/MEDIUM/HIGH), If wrong.

List every gap you filled that I did not specify — including ones
you consider obvious, since those go unchallenged.

If more than three assumptions are HIGH risk, stop and ask instead.
```

Assumptions buried in prose read as facts. Forcing them into their own section is what makes them attackable.

---

## Team and Process

### How do we standardise this across a team?

Four things, in order of leverage:

1. **Commit `CLAUDE.md`** and review changes to it like code.
2. **Commit `.claude/settings.json`** with an agreed permission allowlist.
3. **Promote repeated prompts to slash commands** in `.claude/commands/`, committed.
4. **Apply the same review bar** to all changes regardless of authorship.

See [Installation.md](Installation.md#team-setup).

### Should we mandate that everyone uses this?

No. Tools adopted under mandate get used badly and resentfully. Make the good configuration available, share the failures as well as the wins, and let adoption follow results.

### How do we handle the "is this AI-generated?" question in review?

By not asking it. The review standard does not change based on authorship — if the change is correct, tested, and consistent with the codebase, it passes; if not, it does not. Authorship is not a quality signal in either direction.

What is worth doing is knowing where the failure modes cluster, so review attention goes to the right places. See [Claude-Code-Best-Practices.md](Claude-Code-Best-Practices.md#reviewing-ai-assisted-changes).

### What about security and confidential code?

Understand your data handling terms before using any AI tool on confidential material — this is a question for your organisation's policy, not for this repository. Independently of that:

- Never paste secrets, keys, or credentials into a prompt.
- Never commit an API key, and revoke immediately if one is exposed.
- Treat prompts as potentially logged.

---

## Contributing

### How do I contribute an entry?

Open an issue first using the **New entry proposal** template. Most rejections are for duplication or wrong folder, and both are cheap to catch before you write anything. Then see [CONTRIBUTING.md](../CONTRIBUTING.md).

### My entry was rejected as a duplicate.

Improve the existing entry instead. A near-duplicate is worse than a gap, because it splits maintenance and the two copies drift apart. If your version is genuinely better in places, contribute those places.

### Can I contribute an entry I have not actually used?

No. The Example and Common Mistakes sections are the ones that make an entry trustworthy, and they cannot be written from imagination. An entry drafted but never run reads plausible and fails in practice — which is exactly the failure mode this repository exists to counter.

### What is the most valuable contribution?

A report that an entry **did not work**. Include what you asked, what you got, and what you expected. These are the rarest reports and the most useful ones — everything else is easier to write and tells us less.

---

## Related

- [Getting-Started.md](Getting-Started.md) — orientation
- [Prompting-Guide.md](Prompting-Guide.md) — diagnosing weak output
- [Research-Framework.md](Research-Framework.md) — verification and sourcing
- [Claude-Code-Best-Practices.md](Claude-Code-Best-Practices.md) — daily working habits
- [CONTRIBUTING.md](../CONTRIBUTING.md) — how to contribute
- [ROADMAP.md](../ROADMAP.md) — what is planned

## References

- [Claude Code documentation](https://docs.claude.com/en/docs/claude-code) — official documentation
- [Claude Code troubleshooting](https://docs.claude.com/en/docs/claude-code/troubleshooting)
- [Claude Code repository](https://github.com/anthropics/claude-code) — upstream issues
- [Claude Docs](https://docs.claude.com)
