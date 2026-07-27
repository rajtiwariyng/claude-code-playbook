# Case Study Library

Build the evidence base that every other business document draws on, and get the disclosure permissions that make it usable.

---

## Purpose

Produce a maintained library of case studies structured around decisions rather than deliverables, each with its disclosure status recorded. This is the foundational entry in the folder: the profile, the capability statement, the credentials deck, and every proposal all draw on it. Most organisations have the work and lack the permissions, which makes their strongest evidence unusable at the moment they need it.

## When to Use

Use this when:

- Business documents keep being weakened by "a leading client" and "a major retailer"
- You are assembling evidence before a bid cycle rather than during one
- Past work exists but nobody can say what may be disclosed about it
- Case studies read as project descriptions and demonstrate no judgement

Use something else when:

| Situation | Go to |
| --- | --- |
| You need one document for one buyer | [capability-statement.md](capability-statement.md) |
| The evidence is for a website | [../../web/websites/agency-website.md](../../web/websites/agency-website.md) |
| The deliverable is slides | [../presentations/](../presentations/) |
| You need the priced offer | [../proposal/](../proposal/) |

## Inputs Required

| Input | Required | Notes |
| --- | --- | --- |
| `{{PROJECT_LIST}}` | Yes | Everything delivered in a relevant period, including work that went badly |
| `{{TARGET_OPPORTUNITIES}}` | Yes | The kinds of work you want more of. This decides which projects to write up |
| `{{DISCLOSURE_STATUS}}` | Yes | Per project: what may be named, and who decides |
| `{{OUTCOMES_AVAILABLE}}` | Yes | Measured results, and whether the client agreed to them being stated |
| `{{CONTRACT_TERMS}}` | Yes | Confidentiality clauses that constrain what can be said |
| `{{REVIEW_CADENCE}}` | No | How often this is refreshed. Default: quarterly |

## Workflow

1. **Inventory everything**, including projects that went badly. A recovered failure is often the strongest evidence of judgement you own.
2. **Check the contract before the client.** A confidentiality clause overrides a verbal permission, and asking a client for something the contract forbids is an awkward conversation.
3. **Select against target opportunities**, not against how proud you are of the work.
4. **Structure around the decision** — the real problem, what was rejected, what was deliberately not done. Deliverable lists demonstrate capacity, and capacity is not what is being bought.
5. **Run a disclosure campaign.** Ask specifically, per project. Specific asks succeed where general ones fail.
6. **Record the permission**, including its date, scope, and who granted it. An undated verbal permission is not usable in a tender.

## Claude Prompt

```text
ROLE
You are building a case study library that other documents draw on.

You optimise for evidence that can actually be used, and you accept a
shorter library as the cost of that. An unusable case study is not
evidence, however good the work was.

You refuse to:
- Write a case study as a list of deliverables. What was built shows
  capacity. What was decided shows judgement, and judgement is what is
  being assessed.
- Record an outcome without its disclosure status. An unusable figure
  in a library will be used by someone who did not check.
- Omit projects that went badly. A recovered failure demonstrates
  judgement more convincingly than a smooth success.
- Accept a verbal permission without a date, a scope, and a named
  grantor.
- Write a case study for work you would not want more of. Every piece
  of evidence you publish is a request for similar work.
- Round or improve a client's figure. If the reduction was 43%, it is
  43% and not "nearly half".

You check the contract before approaching the client. A confidentiality
clause overrides goodwill.

CONTEXT
Projects: {{PROJECT_LIST}}
Work we want more of: {{TARGET_OPPORTUNITIES}}
Disclosure status: {{DISCLOSURE_STATUS}}
Outcomes available: {{OUTCOMES_AVAILABLE}}
Contract constraints: {{CONTRACT_TERMS}}

TASK

STAGE 1 — INVENTORY AND SELECTION
| Project | Serves which target opportunity | Contract permits? | Evidence strength | Write up? |
Rank by how directly each serves {{TARGET_OPPORTUNITIES}}. State what
you excluded and why — the exclusions are the strategy.

STAGE 2 — DISCLOSURE LADDER
Per selected project, the strongest disclosure the contract permits,
then descending:
  1. Named client, named outcome with a figure
  2. Named client, directional outcome
  3. Sector and scale, named outcome with a figure
  4. Sector and scale only
Mark where you currently sit and where you could get to with an ask.

STAGE 3 — THE ASK
Draft the specific permission request per project. Specific asks
succeed where general ones fail: "may we state that processing time
fell from four days to six hours" gets agreement where "may we use you
as a case study" does not.

Name who to ask. The project sponsor, not the procurement contact.

STAGE 4 — CASE STUDY STRUCTURE
Apply to each selected project:
  - The brief we were given, in the client's words
  - The problem underneath it, which is usually different
  - What we considered, and the trade-off of each option
  - What we chose and why not the others
  - What we deliberately did not do, and why
  - What happened, with a figure if disclosable
  - What we would do differently

The last two sections are where judgement becomes visible. Most case
studies stop at the fourth.

STAGE 5 — PERMISSION RECORD
| Project | Disclosure level | Granted by | Role | Date | Scope | Expires? |
This table is the library's actual value. Without it, the case studies
cannot be used by anyone who was not in the conversation.

STAGE 6 — MAINTENANCE
What goes stale, and when. Outcomes that were current at delivery, staff
who have left, clients who have been acquired.
```

## Expected Output

| Element | Detail |
| --- | --- |
| Selection | Ranked against target opportunities, with exclusions stated |
| Disclosure ladder | Current level and achievable level per project |
| Permission asks | Specific, per project, with the right person named |
| Case studies | Decision-structured, including what was rejected |
| Permission record | Grantor, role, date, scope, expiry |
| Maintenance plan | What goes stale and when |

It should **not** contain:

- Deliverable-list case studies
- Outcomes without recorded disclosure status
- Only successful projects
- Undated or unattributed permissions
- Rounded or improved client figures

## Quality Checklist

- [ ] Contract terms were checked before any client was approached
- [ ] Selection is driven by target opportunities, not by pride in the work
- [ ] At least one case study covers work that went badly and was recovered
- [ ] Every case study states what was rejected and why
- [ ] Every case study states what was deliberately not done
- [ ] Every outcome figure is exact, not rounded or improved
- [ ] Every permission records grantor, role, date, and scope
- [ ] Permissions with expiry dates are flagged
- [ ] Every disclosure level is the strongest the contract allows
- [ ] A review cadence is set and owned
- [ ] Excluded projects are listed with reasons

## Common Mistakes

| Mistake | Why it happens | Fix |
| --- | --- | --- |
| Deliverable lists | Easy to write from project records | They prove capacity. Buyers assess judgement |
| Asking generally | "Can we use you as a reference" is quick | Specific asks succeed far more often. Name the exact sentence |
| Asking the wrong person | Procurement is the contact on file | Ask the project sponsor. They benefited and they can approve |
| No permission record | The conversation was clear at the time | Six months later nobody can say what was agreed, so nothing gets used |
| Excluding failures | They feel like weaknesses | A recovered failure is the most credible judgement evidence you own |
| Rounding outcomes | "Nearly half" reads better than 43% | The exact figure is more credible and cannot be challenged |
| Writing up prestige work | The best-known client feels strongest | Relevance beats prestige. Write up the most comparable project |
| Never refreshing | The library shipped | Outcomes age, staff leave, clients get acquired |

## Example

> **Provenance:** constructed. Inputs and output demonstrate the pattern; this is not a transcript of a real run.

**Inputs**

| Input | Value |
| --- | --- |
| `{{TARGET_OPPORTUNITIES}}` | Social housing case-management migrations, £150k+ |
| `{{PROJECT_LIST}}` | 11 housing projects, 29 others |
| `{{CONTRACT_TERMS}}` | Three housing contracts contain mutual confidentiality; two permit naming with written consent |

**Stage 2 — Disclosure ladder, one project**

```text
Project: 2023 migration, 190k records

Contract: permits naming with written consent from the client's
authorised signatory. Currently we have neither.

| Level | Description | Status |
|---|---|---|
| 1 | "Riverbank Housing: case volumes migrated with zero downtime, 190,000 records" | ACHIEVABLE — needs written consent |
| 2 | "Riverbank Housing: migration completed without service interruption" | ACHIEVABLE |
| 3 | "A UK social housing provider: 190,000 records, zero downtime" | CURRENT |
| 4 | "A UK social housing provider" | Fallback |

We are at level 3 and could reach level 1 with one email. The gap
between "a UK social housing provider" and a named client is the single
largest credibility difference in the library, and it costs one ask.
```

**Stage 3 — The ask**

```text
To: Dan Whitfield, Head of Digital, Riverbank Housing
     (project sponsor — NOT the procurement contact)

Subject: Permission to reference the migration

Dan,

We're putting together evidence for a housing framework application
and the 2023 migration is the closest comparable work we have.

Would you be willing to let us state the following, in exactly these
words?

  "Riverbank Housing migrated 190,000 historic case records to a
   supported platform over 11 weeks, with no interruption to frontline
   services."

Nothing beyond that sentence, and nothing about the platform, costs,
or internal process. If you'd prefer we drop the record count or the
timeline, we can use whichever part you're comfortable with.

If it helps, I'm happy to send this as a short form for your comms
team to approve.

Priya
```

Note what the ask does: it quotes the exact sentence, bounds what else will be said, and offers a reduced version. General requests get referred to legal and stall. Specific ones get answered.

**Stage 4 — Case study, the two sections most often missing**

```text
What we deliberately did not do

We did not migrate the historic attachments in phase one. 190,000
records carried roughly 340,000 attached documents, and moving them
alongside the structured data would have extended the cutover window
past the point where a rollback was practical.

We migrated structured records first, left attachments served from the
legacy store behind a redirect, and moved them in a separate phase
three months later with no user-facing deadline. The client initially
wanted a single cutover; we recommended against it and explained the
rollback constraint.

What we would do differently

The reconciliation at phase two took nine days rather than the three we
estimated, because the legacy system stored two record types with
overlapping identifiers that we did not detect in discovery. We now run
an identifier-collision check as a standard discovery step. It takes
half a day and would have saved six.
```

That second section is uncomfortable to write and is the most persuasive part of the case study. It is also the part that survives a reference call, because the client remembers the nine days.

**Stage 5 — Permission record**

```text
| Project | Level | Granted by | Role | Date | Scope | Expires |
|---|---|---|---|---|---|---|
| Riverbank 2023 | 1 | Dan Whitfield | Head of Digital | 2026-07-14 | The exact sentence quoted; no platform, cost, or process detail | None stated |
| Ashford 2022 | 3 | — | — | — | Sector + scale only, per contract cl. 14.2 | — |
| Kelvin 2024 | 2 | Sara Okafor | Programme Director | 2025-11-02 | Naming permitted; no figures | On her departure — re-confirm |
```

The Kelvin row is the one that matters operationally. A permission tied to an individual who has since left is a permission that needs re-confirming before use, and nobody discovers that during a bid unless it is recorded.

## Advanced Version

Use this before a bid cycle, or when rebuilding a library that has gone stale.

```text
[Stages 1-6 as above, plus:]

STAGE 7 — THE DISCLOSURE CAMPAIGN
Rather than asking per bid, run one campaign across every client whose
permission would strengthen the library.

Sequence: contract check → sponsor identified → specific ask drafted →
sent → recorded. Batch it; each individual ask is five minutes and the
context-switching is the cost.

Prioritise by: how directly the project serves target opportunities ×
how much the disclosure level would improve. The highest-value asks are
usually level 3 → level 1 on a highly relevant project.

STAGE 8 — THE REFERENCE REHEARSAL
For each case study, write the three questions a buyer's reference call
would ask, and the answer you believe the client would give.

Where your case study and their likely answer diverge, the case study
is wrong. Fix it before someone else finds it.

STAGE 9 — THE FAILURE CASE
Write up one project that went badly, in full, including what it cost
and what you changed.

Do not publish it. Its purpose is internal: it is the material you draw
on when a prospect asks "what goes wrong on these projects?" — the
question that separates a credible answer from a rehearsed one.
```

## Related

- [company-profile-document.md](company-profile-document.md) — draws on this library
- [capability-statement.md](capability-statement.md) — draws on this library
- [credentials-deck.md](credentials-deck.md) — the presented form
- [team-profile.md](team-profile.md) — the people behind these projects
- [../proposal/](../proposal/) — where this evidence is used commercially
- [../../web/websites/agency-website.md](../../web/websites/agency-website.md) — the same evidence, published
- [../../core/research/fact-checking.md](../../core/research/fact-checking.md) — verifying figures before publication

## References

- [UK Information Commissioner's Office](https://ico.org.uk/) — guidance where case studies touch personal data
- [Crown Commercial Service supplier guidance](https://www.crowncommercial.gov.uk/suppliers) — how references are assessed in public procurement
