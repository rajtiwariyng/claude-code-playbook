# Team Profile

The named-people section that answers the question a small organisation always gets asked: who actually does the work?

---

## Purpose

Produce team biographies that function as evidence rather than as decoration. For any organisation under roughly a hundred people, the team *is* the capability, and a buyer assessing risk is assessing individuals. This entry produces profiles that answer "is this person credible for this work" instead of listing career histories.

## When to Use

Use this when:

- A buyer has asked who will deliver, or a tender scores key personnel
- Your organisation is small enough that headcount raises a delivery-risk doubt
- Existing biographies list job titles and say nothing about capability
- A partner or client needs to know who they will actually deal with

Use something else when:

| Situation | Go to |
| --- | --- |
| The reader is checking the organisation exists | [company-profile-document.md](company-profile-document.md) |
| The evidence needed is project outcomes | [case-study-library.md](case-study-library.md) |
| It is one individual promoting themselves | [../../web/websites/portfolio-website.md](../../web/websites/portfolio-website.md) |
| The deliverable is slides | [../presentations/](../presentations/) |

## Inputs Required

| Input | Required | Notes |
| --- | --- | --- |
| `{{DOUBT}}` | Yes | What the reader fears about your team. Usually size, continuity, or depth |
| `{{PEOPLE}}` | Yes | Who to include, and their actual role on the work in question |
| `{{RELEVANT_EVIDENCE}}` | Yes | Per person: what they have delivered that resembles this |
| `{{CONSENT}}` | Yes | Each person's agreement to what is published, including photographs |
| `{{CONTINUITY_PLAN}}` | Yes | What happens if a named person leaves. Buyers ask this |
| `{{FORMAT}}` | No | Document section, slide, or web page. Default: document section |

## Workflow

1. **Name the doubt.** For a small firm it is nearly always "what if the two people who matter leave". Write to that.
2. **Include only people on this work.** A team page listing everyone dilutes the individuals who matter and invites questions about the rest.
3. **Lead with relevant delivery**, not with career history. Where someone worked ten years ago is not evidence about this project.
4. **Get consent per person**, covering the text and any photograph. This is a data protection matter, not a courtesy.
5. **Answer continuity explicitly.** An unanswered "what if they leave" is the doubt the whole section exists to close.
6. **Date it.** A team page listing someone who left eight months ago is the most damaging staleness in any business document.

## Claude Prompt

```text
ROLE
You are writing team biographies that function as delivery evidence.

You optimise for a buyer concluding "these specific people can do this
specific work", and you accept shorter, less flattering biographies as
the cost of that.

You refuse to:
- Lead with career history. Where someone worked in 2014 is not
  evidence about this engagement.
- Use "passionate", "seasoned", "guru", "ninja", or "thought leader".
  None of them is a capability, and each one costs credibility with the
  reader who matters.
- List everyone in the organisation. Include the people who will do
  this work. A padded team section invites questions about who is
  actually assigned.
- Publish a biography the person has not approved, including their
  photograph.
- Leave the continuity question unanswered. If a named person is
  load-bearing, say what happens if they leave.
- Inflate a title. A buyer who discovers the "Head of Delivery" is one
  of three people discounts everything else on the page.

You write each biography to answer: has this person done something
comparable, and what would they do here.

CONTEXT
The doubt this must answer: {{DOUBT}}
People: {{PEOPLE}}
Relevant evidence per person: {{RELEVANT_EVIDENCE}}
Consent status: {{CONSENT}}
Continuity plan: {{CONTINUITY_PLAN}}
Format: {{FORMAT}}

TASK

STAGE 1 — WHO TO INCLUDE
| Person | Role on this work | Comparable delivery | Include? |
State who you excluded and why. A four-person section where all four
are load-bearing outperforms a twelve-person section.

STAGE 2 — PER-PERSON EVIDENCE
| Person | The comparable thing they delivered | Their actual role in it | Disclosable? |
If someone has no comparable delivery, say so. They may still belong on
the page for another reason — state it rather than manufacturing one.

STAGE 3 — BIOGRAPHIES
Per person, in this order:
  1. Name, role, and what they will do on this engagement
  2. The most comparable thing they have delivered, with their role in it
  3. One specific fact that is hard to claim without having done it
  4. Time with the organisation

Three to five sentences. Longer reads as padding.

STAGE 4 — CONTINUITY
Answer directly: what happens if each named person becomes
unavailable? Options in order of strength — a named second, documented
handover, a partner arrangement, a stated recruitment position.

"We would recruit" is the weakest answer and is better than silence.

STAGE 5 — CONSENT RECORD
| Person | Text approved | Photo approved | Date | Notes |

STAGE 6 — STALENESS TRIGGER
What makes this section wrong without anyone editing it, and who owns
noticing.
```

## Expected Output

| Element | Detail |
| --- | --- |
| Inclusion decision | Who is on the page, who was excluded and why |
| Per-person evidence | Comparable delivery with their actual role |
| Biographies | Three to five sentences, delivery-led |
| Continuity answer | Explicit per named person |
| Consent record | Text and photograph, dated |
| Staleness trigger | With a named owner |

It should **not** contain:

- Career history before relevant delivery
- "Passionate", "seasoned", "guru", "ninja", "thought leader"
- Everyone in the organisation
- Inflated titles
- An unanswered continuity question

## Quality Checklist

- [ ] The doubt being answered is named
- [ ] Only people working on this engagement are included
- [ ] Every biography leads with comparable delivery, not career history
- [ ] Every person's actual role in the cited project is stated
- [ ] No banned adjective appears
- [ ] No title is inflated relative to organisation size
- [ ] Continuity is answered for every named person
- [ ] Written consent recorded for text and photograph, with a date
- [ ] Biographies are five sentences or fewer
- [ ] The section is dated with a review owner
- [ ] Nobody listed has left

## Common Mistakes

| Mistake | Why it happens | Fix |
| --- | --- | --- |
| Career-history biographies | It is how a CV is ordered | The reader is assessing this engagement, not the person's decade |
| Listing everyone | It looks bigger | It dilutes the people who matter and invites "so who is actually assigned?" |
| Adjective inflation | Biographies feel thin without them | "Passionate about data" is not a capability. Delete and add a fact |
| Inflated titles | A senior title reads stronger | A buyer who works out the hierarchy discounts the whole page |
| Unanswered continuity | Raising it feels like admitting fragility | The buyer is already thinking it. An unanswered doubt is worse than a modest answer |
| Publishing without consent | Everyone seemed fine with it | Photographs and biographies are personal data. Record the consent |
| Stale team pages | Nobody owns updating it | Listing a departed colleague is the most damaging staleness in business documents |
| Generic photography | Real photos look inconsistent | Stock photos of "the team" are detected instantly and cost more than mismatched real ones |

## Example

> **Provenance:** constructed. Inputs and output demonstrate the pattern; this is not a transcript of a real run.

**Inputs**

| Input | Value |
| --- | --- |
| `{{DOUBT}}` | "24 people cannot carry a three-year framework — and what if the two who know housing leave?" |
| `{{PEOPLE}}` | Priya Raman (Delivery Director), Tom Achebe (Lead Engineer), Sara Lindqvist (Data Lead) |
| `{{CONTINUITY_PLAN}}` | Documented handover; two engineers cross-trained; partner arrangement with a named firm |

**Stage 3 — Biographies**

```text
Priya Raman — Delivery Director
Priya would run this engagement and be your day-to-day contact. She led
the 2023 migration of 190,000 case records for a social housing
provider, including the phased cutover and the client-side sign-off
process at each phase. She has run six housing engagements since 2019.
Before joining in 2018 she managed service transition at a local
authority, which is where the phased-cutover approach came from.

Tom Achebe — Lead Engineer
Tom would lead the technical migration. He wrote the reconciliation
tooling used on the 2023 migration and on the four housing engagements
since. He is the person who identified the identifier-collision problem
on that project, which is now a standard discovery check. Nine years
with the company.

Sara Lindqvist — Data Lead
Sara would own record integrity and the reconciliation sign-off. She
has verified record parity on eleven migrations, including two where
the source system had no reliable primary key. She joined in 2021 from
a data quality role in financial services regulation, where evidencing
integrity to an external auditor was the job.
```

Each biography states the person's role on *this* work first, then the comparable delivery, then one fact that is hard to claim without having done it — the collision check, the missing primary key, the regulatory audit context.

**Stage 4 — Continuity**

```text
The doubt is legitimate: three named people on a three-year contract in
a 24-person firm.

Priya — Tom deputises. He has run two engagements as delivery lead. Our
standard handover pack is maintained per engagement, not written at
departure.

Tom — two engineers are cross-trained on the reconciliation tooling,
which is documented and in version control rather than held by him. The
2023 migration was delivered with Tom off for three weeks mid-project;
the phase completed on schedule.

Sara — this is our thinnest cover. One other person can perform
reconciliation sign-off. If Sara left mid-engagement we would expect a
two-to-four week impact on the verification step, not on the migration
itself. We would also engage [named partner] under the standing
arrangement described at Annex C.

We would rather state that plainly than claim resilience we do not have.
```

The Sara paragraph is the strongest item on the page. Naming the thinnest cover, quantifying the impact, and stating the fallback reads as an organisation that has thought about it — which is exactly what the doubt was asking.

**Stage 5 — Consent record**

```text
| Person | Text | Photo | Date | Notes |
|---|---|---|---|---|
| Priya Raman | Approved | Approved | 2026-07-20 | — |
| Tom Achebe | Approved | Declined | 2026-07-20 | No photograph — use initials block |
| Sara Lindqvist | Approved | Approved | 2026-07-21 | Asked that former employer not be named |
```

## Advanced Version

Use this where key personnel are formally scored, or where the team section must survive a due-diligence process.

```text
[Stages 1-6 as above, plus:]

STAGE 7 — SCORED PERSONNEL
Where a tender scores key personnel against criteria, map each person
to each criterion and mark where evidence is missing.

| Criterion | Person | Evidence | Marks we would award | Why not full |

A criterion with no named person is lost marks, and it is the most
common reason a capable team scores badly.

STAGE 8 — THE CV BEHIND THE BIOGRAPHY
For each named person, hold a full CV that supports every claim in the
short biography. Buyers in regulated procurement ask for these, usually
at short notice.

Check that the CV and the biography agree. They routinely diverge,
because the biography is written for effect and the CV is written from
records.

STAGE 9 — THE BUS-FACTOR AUDIT
For each engagement-critical capability, count how many people hold it.
Report every capability where the answer is one.

Publish the mitigations, not the count. But know the count — a buyer's
technical assessor will work it out, and being unsurprised by their
question is the difference between a confident answer and a defensive
one.
```

## Related

- [company-profile-document.md](company-profile-document.md) — where this section usually sits
- [capability-statement.md](capability-statement.md) — the short form naming a delivery contact
- [case-study-library.md](case-study-library.md) — the projects cited in these biographies
- [credentials-deck.md](credentials-deck.md) — the presented form
- [../proposal/](../proposal/) — where named personnel become contractual
- [../../web/websites/agency-website.md](../../web/websites/agency-website.md) — the published form

## References

- [UK Information Commissioner's Office: employee data](https://ico.org.uk/for-organisations/) — consent and personal data in published biographies
- [Crown Commercial Service supplier guidance](https://www.crowncommercial.gov.uk/suppliers) — how key personnel are scored
