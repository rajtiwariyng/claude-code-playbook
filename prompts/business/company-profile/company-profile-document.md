# Company Profile Document

Produce the document a prospect, partner, or procurement officer reads when they are deciding whether your organisation is real.

---

## Purpose

Produce a company profile that survives scrutiny rather than one that describes aspirations. The defining constraint is that this document is read by someone looking for a reason to disqualify you — a procurement officer checking you exist, a partner checking you will still exist in two years, a client checking you have done this before. Every claim it makes must be one you would be comfortable defending in writing.

## When to Use

Use this when:

- A prospect, partner, or tender process has asked for a company profile or capability document
- You are entering a market where buyers expect a formal document before a conversation
- Your existing profile is a list of adjectives and you need one made of evidence
- Onboarding a reseller, distributor, or channel partner who must represent you accurately

Use something else when:

| Situation | Go to |
| --- | --- |
| The deliverable is slides | [../presentations/](../presentations/) — that folder owns every deck |
| You need a priced, scoped offer for one client | [../proposal/](../proposal/) |
| You need a short document answering one buyer's specific capability question | [capability-statement.md](capability-statement.md) |
| The output is a website About page | [../../web/websites/corporate-website.md](../../web/websites/corporate-website.md) |

## Inputs Required

| Input | Required | Notes |
| --- | --- | --- |
| `{{READER}}` | Yes | Who opens this and what they are deciding. "Procurement at a mid-size NHS trust", not "potential clients" |
| `{{DECISION}}` | Yes | What they do next if convinced. Shortlist you, approve you as a supplier, sign an NDA |
| `{{DISQUALIFIERS}}` | Yes | What would make them reject you. This shapes the document more than your strengths do |
| `{{SUBSTANTIABLE_FACTS}}` | Yes | Founded date, headcount, registration number, certifications, named clients you may name |
| `{{EVIDENCE}}` | Yes | Outcomes you can disclose, with permission status for each |
| `{{CLAIMS_TO_TEST}}` | Yes | Anything currently said about the company that may not survive challenge |
| `{{LENGTH_LIMIT}}` | No | Tender documents often specify one. Default: 6–8 pages |
| `{{COMPLIANCE}}` | No | Sector requirements, insurance, accreditations to evidence |

## Workflow

1. **Name the reader and the decision.** A profile written for "potential clients" is written for nobody and reads like it.
2. **List the disqualifiers first.** What gets you rejected is more actionable than what gets you chosen, and it is usually shorter and more specific.
3. **Audit every existing claim.** Sort into substantiable, weakenable, and cut. Do not soften an unsupportable claim into vagueness — remove it.
4. **Match evidence to disqualifiers.** Each disqualifier needs a specific fact that answers it, placed where the reader hits the doubt.
5. **Write the boring sections properly.** Company registration, insurance, and continuity read as filler to you and as the whole document to procurement.
6. **Date it and set a review trigger.** An undated profile decays into inaccuracy silently.

## Claude Prompt

```text
ROLE
You are a business writer producing a company profile for formal scrutiny.

You optimise for the document surviving challenge, and you accept a
duller, shorter document as the cost of that.

You refuse to:
- Write a claim that cannot be substantiated on request. Not softened —
  removed. "Leading provider" is not a claim, it is an exposure.
- Use an adjective where a number exists. "Experienced" is worth less
  than "founded 2014, 31 staff, 240 completed engagements".
- Describe aspirations in the present tense. What the company intends
  to become is not what it is.
- Open with a mission statement. The reader is checking whether you are
  real, and a mission statement is the least verifiable thing on the page.
- Omit the unglamorous sections. Registration, insurance, and continuity
  are read most carefully by the person who can reject you.
- Present a testimonial without a named source and a date. An anonymous
  quote is decoration.

You write for a reader looking for a reason to disqualify you. Every
section answers a doubt rather than making a case.

CONTEXT
Reader: {{READER}}
What they decide next: {{DECISION}}
What would disqualify us: {{DISQUALIFIERS}}
Substantiable facts: {{SUBSTANTIABLE_FACTS}}
Disclosable evidence: {{EVIDENCE}}
Claims to test: {{CLAIMS_TO_TEST}}
Length limit: {{LENGTH_LIMIT}}
Compliance to evidence: {{COMPLIANCE}}

TASK

STAGE 1 — DISQUALIFIER MAP
| Disqualifier | The doubt behind it | Fact that answers it | Do we have it? |
Mark every row where the answer is no. Those are gaps to fill before
writing, not sections to write around.

STAGE 2 — CLAIM AUDIT
| Current claim | Substantiable? | Evidence | Verdict |
Verdict: KEEP WITH PROOF / REPLACE WITH SPECIFIC / CUT.
For REPLACE, write the specific version.

STAGE 3 — STRUCTURE
Section order, driven by the reader's doubts in the order they arise —
not by convention. State what each section must contain and roughly
how long it runs.

STAGE 4 — DRAFT
Write it. Every factual sentence carries its source in a bracket so a
reviewer can check it. Strip the brackets at final formatting.

STAGE 5 — DECAY AUDIT
| Statement | Goes stale when | Review trigger |
Anything that becomes false without anyone editing it needs either a
date attached or a rewrite into a dateless form.

STAGE 6 — THE REJECTION READ
Read the draft as {{READER}} looking for a reason to say no. Name the
three weakest points and what would strengthen each.
```

## Expected Output

| Element | Detail |
| --- | --- |
| Disqualifier map | Every doubt matched to a fact, gaps marked |
| Claim audit | Each claim kept with proof, replaced with a specific, or cut |
| Structure | Ordered by the reader's doubts, not by convention |
| Draft | Every factual sentence sourced |
| Decay audit | Statements that go stale, with review triggers |
| Rejection read | The three weakest points |

It should **not** contain:

- Unsubstantiable superlatives — "leading", "world-class", "trusted"
- Aspirations written in the present tense
- A mission statement opening
- Anonymous testimonials
- Adjectives where numbers exist

## Quality Checklist

- [ ] A specific reader and decision are named
- [ ] Every disqualifier has a fact that answers it, or is marked as a gap
- [ ] Every claim is substantiable on request, or has been cut
- [ ] No superlative appears without evidence attached
- [ ] Company registration number, registered address, and founding date appear
- [ ] Insurance and certifications state their scope and expiry
- [ ] Every testimonial names its source and carries a date
- [ ] Every outcome figure has disclosure permission recorded
- [ ] The document is dated
- [ ] Every statement that can go stale has a review trigger
- [ ] Length is within `{{LENGTH_LIMIT}}`
- [ ] Meets the accuracy standard in [Output-Standards.md](../../../docs/Output-Standards.md#accuracy-standard)

## Common Mistakes

| Mistake | Why it happens | Fix |
| --- | --- | --- |
| Writing for "potential clients" | It feels inclusive | It produces a document calibrated for nobody. Name one reader |
| Leading with the mission | Every profile template does | The reader is checking you are real. A mission statement is the least verifiable thing available |
| Adjectives instead of numbers | Numbers feel small | "Founded 2014, 31 staff" outperforms "established and experienced" with every reader who matters |
| Softening an unsupportable claim | Cutting feels like losing ground | A vague claim occupies space and convinces nobody. Cut it |
| Skipping registration and insurance | They read as filler | They are read most carefully by the person who can reject you |
| Aspirations in present tense | The team talks that way internally | "We serve enterprise clients" when you serve three SMEs is a claim that fails on the first reference check |
| Anonymous testimonials | Permission was never requested | Ask specifically. Most clients agree to a named quote when asked directly |
| Undated documents | The date feels like clutter | An 18-month-old headcount presented as current is an accuracy failure |

## Example

> **Provenance:** constructed. Inputs and output demonstrate the pattern; this is not a transcript of a real run.

**Inputs**

| Input | Value |
| --- | --- |
| `{{READER}}` | Procurement lead at a UK housing association, running a framework tender |
| `{{DECISION}}` | Admit us to the approved supplier list |
| `{{DISQUALIFIERS}}` | Too small to carry the contract; no sector experience; no evidence of financial stability; cannot evidence insurance |
| `{{SUBSTANTIABLE_FACTS}}` | Founded 2016; 24 staff; company no. 10428871; ISO 27001 (scope: development and hosting, expires 2027-03); PI insurance £5m |
| `{{EVIDENCE}}` | Three housing-sector projects; one client permits naming and a figure |
| `{{CLAIMS_TO_TEST}}` | "The UK's leading housing technology partner"; "trusted by hundreds of organisations"; "end-to-end capability" |

**Stage 1 — Disqualifier map**

```text
| Disqualifier | The doubt | Fact that answers it | Have it? |
|---|---|---|---|
| Too small | "24 people cannot carry a 3-year contract" | Largest engagement to date by value and duration; named delivery leads; subcontractor arrangements | PARTIAL — no contract value disclosable |
| No sector experience | "They will learn on our budget" | Three housing projects, one nameable with a figure | YES |
| Financial stability | "They fold mid-contract" | Filed accounts, 8 years trading, no CCJs | YES |
| Insurance | "Uninsurable risk" | PI £5m, EL £10m, PL £2m — certificates available | YES |

GAP: the size disqualifier is the strongest one and is only partly
answered. Resolve before submitting: get permission to state the value
or duration of the largest engagement, or state team-scaling
arrangements explicitly.
```

**Stage 2 — Claim audit**

```text
| Claim | Substantiable? | Verdict |
|---|---|---|
| "UK's leading housing technology partner" | No — no market-share data exists | CUT |
| "Trusted by hundreds of organisations" | No — client count is 40 | REPLACE: "40 organisations since 2016, of which 11 in social housing" |
| "End-to-end capability" | Partially — no in-house design | REPLACE: "Development, integration, and hosting. Design is delivered through a named partner since 2019." |

Two of three headline claims cut or narrowed. What replaces them is
smaller and checkable, which is what this reader responds to. The
partner disclosure on design is a deliberate inclusion: procurement
discovers subcontracting anyway, and disclosing it first reads as
candour rather than as a finding.
```

**Stage 4 — Draft, opening section**

```text
About Fenwick Systems

Fenwick Systems Ltd (company no. 10428871) was founded in 2016 and
employs 24 people from a single office in Leeds. We build and host
case-management software for social housing providers.

Since 2016 we have delivered 40 engagements, 11 of them in social
housing. Our longest-running client relationship began in 2018 and
is current.

We hold ISO 27001 certification covering software development and
hosting, valid to March 2027. Professional indemnity cover is £5m,
employers' liability £10m, public liability £2m. Certificates are
available on request and are appended at Annex B.

Design is delivered through Marchant Studio, a named partner since
2019, on all engagements requiring it. All development, integration,
and hosting is delivered by our own staff.

[Correct as at 2026-07-27. Headcount and engagement count reviewed
quarterly.]
```

Note what the opening does not do. No mission statement, no adjective before the third sentence, and the subcontracting relationship stated on page one rather than discovered at reference stage.

**Stage 5 — Decay audit**

```text
| Statement | Goes stale when | Trigger |
|---|---|---|
| "24 people" | Any hire or leaver | Quarterly review |
| "40 engagements" | Next completion | Quarterly review |
| "ISO 27001 valid to March 2027" | 2027-03 | Calendar reminder at 2026-12 |
| "longest relationship began 2018 and is current" | That client leaves | On client change |
| "founded 2016" | Never | None — dateless |
```

**Stage 6 — Rejection read**

```text
1. Size remains the weakest point. 24 staff against a 3-year framework
   invites the question the document does not fully answer. Either get
   disclosure on the largest engagement, or add a short section on how
   delivery scales — named partners, retained contractors, and the
   contractual basis.

2. Only one of three housing projects is nameable. Two anonymous
   references read as weaker than one named one. Consider omitting the
   anonymous two rather than listing them thinly.

3. No named delivery leads. For a 24-person firm, the people are the
   capability, and procurement will want to know who runs the account.
   One page with three named leads and their sector experience would
   answer the size doubt better than any other addition.
```

## Advanced Version

Use this for formal tenders, framework applications, or regulated procurement where the document is scored against published criteria.

```text
[Stages 1-6 as above, plus:]

STAGE 7 — SCORE AGAINST THE PUBLISHED CRITERIA
If the tender publishes weighted criteria, map every section to the
criterion it serves and the marks available.

| Criterion | Weight | Where we answer it | Marks we would award ourselves | Why not full |

Any criterion with no corresponding section is lost marks, and it is
the most common reason a capable supplier scores badly.

STAGE 8 — THE EVIDENCE ANNEX
Procurement scores what is evidenced, not what is asserted. List every
claim that needs a supporting document, and whether it exists:

| Claim | Evidence document | Held? | Where |

Certificates, filed accounts, insurance schedules, signed references,
policy documents. A claim without an annexed document scores lower
than the same claim with one attached.

STAGE 9 — DISCLOSURE CAMPAIGN
List every past client whose named reference or disclosable outcome
would materially strengthen this document, and draft the specific ask
for each.

Most clients refuse a general request and agree to a specific one —
"may we state that processing time fell by more than half" succeeds
where "may we use you as a reference" fails. This is usually the
highest-return work available on a company profile and it is almost
never done.

STAGE 10 — ADVERSARIAL REFERENCE CHECK
For every claim in the document, state what a reference call would
have to confirm. Then identify any claim where a plausible reference
answer would contradict it.

A profile that survives its own reference check is finished. One that
does not has a problem no amount of editing fixes.
```

## Related

- [capability-statement.md](capability-statement.md) — the short-form answer to one buyer's specific question
- [credentials-deck.md](credentials-deck.md) — when the same material must be presented rather than read
- [case-study-library.md](case-study-library.md) — the evidence this document draws on
- [team-profile.md](team-profile.md) — the named-people section that answers the size doubt
- [../proposal/](../proposal/) — the priced offer that follows
- [../../web/websites/corporate-website.md](../../web/websites/corporate-website.md) — the same audience, different surface
- [../../core/research/fact-checking.md](../../core/research/fact-checking.md) — auditing the claims before submission
- [../../../docs/Output-Standards.md](../../../docs/Output-Standards.md#content-standards) — claim substantiation rules

## References

- [UK Companies House](https://www.gov.uk/government/organisations/companies-house) — verifying registration and filed accounts
- [ISO 27001](https://www.iso.org/standard/27001) — information security certification
- [Crown Commercial Service supplier guidance](https://www.crowncommercial.gov.uk/suppliers) — example of formal procurement expectations
- [Schema.org Organization](https://schema.org/Organization) — structured data if the profile is also published online
