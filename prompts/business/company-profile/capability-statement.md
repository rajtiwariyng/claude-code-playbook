# Capability Statement

One page answering one buyer's specific question: can you do this particular thing, and what proves it.

---

## Purpose

Produce a single-page document targeted at one opportunity. A capability statement is not a shortened company profile — it is a different document with a different job. The profile establishes that you are real; the capability statement establishes that you have done *this specific thing* before, for someone comparable, with a result you can name.

## When to Use

Use this when:

- A specific opportunity has a specific requirement and you need to answer it
- A buyer has asked "have you done this before?" and expects evidence, not a brochure
- Registering on a supplier portal with a character-limited capability field
- A partner or prime contractor is assembling a bid and needs your section

Use something else when:

| Situation | Go to |
| --- | --- |
| The reader is checking whether you exist at all | [company-profile-document.md](company-profile-document.md) |
| You need a priced, scoped offer | [../proposal/](../proposal/) |
| The deliverable is slides | [../presentations/](../presentations/) |
| You need the underlying evidence assembled | [case-study-library.md](case-study-library.md) |

## Inputs Required

| Input | Required | Notes |
| --- | --- | --- |
| `{{REQUIREMENT}}` | Yes | The buyer's specific need, in their words. Quote the tender or brief verbatim |
| `{{BUYER}}` | Yes | Organisation type, sector, and who reads this |
| `{{CLOSEST_EVIDENCE}}` | Yes | The most comparable work you have done, with what you may disclose |
| `{{GAP}}` | Yes | Where your experience does not match. Naming it is what makes the rest credible |
| `{{DIFFERENTIATOR}}` | Yes | Why you rather than a larger or cheaper competitor |
| `{{FORMAT_LIMIT}}` | Yes | One page, 500 words, a portal field with a character cap |
| `{{CAPABILITY_CODES}}` | No | NAICS, SIC, CPV, or framework lot codes if the buyer uses them |

## Workflow

1. **Quote the requirement verbatim.** Paraphrasing it loses the buyer's vocabulary, and the buyer scores against their own words.
2. **Find the closest evidence, honestly.** The nearest comparable project, not the most impressive one.
3. **Name the gap.** Where your experience does not match, say so and say what covers it. A buyer who finds the gap themselves discounts everything else.
4. **Lead with the match, not the company.** The first sentence answers their question; the company details go last.
5. **Cut to the format limit.** A capability statement that exceeds its limit is not read; it is skimmed for the parts that fit.
6. **Check the vocabulary.** Use the buyer's terms for things, including where you would use different ones internally.

## Claude Prompt

```text
ROLE
You are a bid writer producing a one-page capability statement for a
specific opportunity.

You optimise for the buyer concluding "they have done this before", and
you accept saying much less about the company as the cost of that.

You refuse to:
- Open with the company. The buyer asked a question; answer it in the
  first sentence.
- Claim experience you do not have. A buyer who discovers an overstated
  claim at reference stage discounts the entire submission, not just
  that line.
- Hide the gap. Where the closest evidence does not match, name the
  difference and state what covers it. A named gap with a mitigation
  outscores a gap the buyer finds themselves.
- Use your vocabulary where the buyer has their own. Score sheets are
  written in the buyer's words.
- Exceed {{FORMAT_LIMIT}}. Over-length submissions are truncated or
  penalised, and the part that gets cut is the part you wrote last.
- Include a capability you cannot evidence, to look more complete.
  Breadth without evidence reads as a firm that does everything badly.

You lead with the closest comparable work, name the outcome, then
establish the company in as few words as the format allows.

CONTEXT
The requirement, verbatim: {{REQUIREMENT}}
Buyer: {{BUYER}}
Closest evidence: {{CLOSEST_EVIDENCE}}
Where our experience does not match: {{GAP}}
Why us: {{DIFFERENTIATOR}}
Format limit: {{FORMAT_LIMIT}}
Capability codes: {{CAPABILITY_CODES}}

TASK

STAGE 1 — REQUIREMENT DECOMPOSITION
Break {{REQUIREMENT}} into the discrete things the buyer is asking for.
| Sub-requirement | Our evidence | Strength: STRONG / PARTIAL / NONE |

Anything marked NONE is either a gap to name or a reason not to bid.
Say which.

STAGE 2 — THE MATCH
The single closest piece of evidence, and why it is comparable. State
the dimension on which it matches — sector, scale, constraint, or
technical similarity — and be specific about which.

STAGE 3 — THE GAP
Where the evidence does not match, and what covers it. Options in order
of strength: adjacent experience, a named partner, a hire already made,
a method that does not depend on the missing experience.

STAGE 4 — DRAFT
Within {{FORMAT_LIMIT}}. Order:
  1. Direct answer to the requirement
  2. The closest evidence, with an outcome
  3. The gap and what covers it
  4. Company, in one or two sentences
  5. Contact and codes

STAGE 5 — VOCABULARY CHECK
List every term where you used your word and the buyer used theirs.
Replace yours.

STAGE 6 — THE SCORE READ
If the buyer scores this against {{REQUIREMENT}}, what do they mark it
out of and where do they deduct? Name the deductions.
```

## Expected Output

| Element | Detail |
| --- | --- |
| Requirement decomposition | Each sub-requirement with evidence strength |
| The match | One closest piece of evidence, with the dimension of similarity named |
| The gap | Named, with a stated mitigation |
| Draft | Within the format limit, requirement answered first |
| Vocabulary check | Buyer's terms substituted for yours |
| Score read | Where a scorer would deduct |

It should **not** contain:

- A company introduction before the answer
- A capability with no evidence behind it
- An unnamed gap
- Your vocabulary where the buyer has their own
- Anything beyond the format limit

## Quality Checklist

- [ ] The requirement is quoted verbatim, not paraphrased
- [ ] Every sub-requirement is marked STRONG, PARTIAL, or NONE
- [ ] The first sentence answers the buyer's question
- [ ] The closest evidence names the dimension on which it is comparable
- [ ] The outcome carries a number, or states why one is not disclosable
- [ ] The gap is named, with a stated mitigation
- [ ] No capability is claimed without evidence
- [ ] The buyer's vocabulary is used throughout
- [ ] Within `{{FORMAT_LIMIT}}`, counted not estimated
- [ ] Capability codes included where the buyer uses them
- [ ] Contact route and a named person appear

## Common Mistakes

| Mistake | Why it happens | Fix |
| --- | --- | --- |
| Shortening the company profile | It is the document you already have | Different job. The profile proves you exist; this proves you have done *this* |
| Opening with the company | Every template does | The buyer asked a question. Answer it, then introduce yourself |
| Listing every capability | Breadth feels safer | Unevidenced breadth reads as a firm that does everything badly. Depth on the match scores higher |
| Hiding the gap | Naming it feels like conceding | A gap the buyer finds is worth less than a gap you named and covered |
| Using your vocabulary | It is how the team talks | Scorers mark against their own words. Use theirs |
| Choosing the most impressive project | It is the best work | Choose the most *comparable*. Relevance beats prestige |
| Exceeding the limit | There is more to say | Over-length is truncated or penalised, and you lose the end |
| No named contact | A generic inbox seems professional | Procurement wants a person. A shared inbox reads as nobody owning it |

## Example

> **Provenance:** constructed. Inputs and output demonstrate the pattern; this is not a transcript of a real run.

**Inputs**

| Input | Value |
| --- | --- |
| `{{REQUIREMENT}}` | "Migration of a legacy case-management system to a supported platform, with no loss of historic records and no service interruption to frontline staff" |
| `{{BUYER}}` | UK housing association, 400 staff, procurement-led |
| `{{CLOSEST_EVIDENCE}}` | 2023 migration for a different housing provider — 190k records, phased over 11 weeks, no downtime. Client permits naming the sector and the record count, not the organisation |
| `{{GAP}}` | That system was a different vendor's; no experience with the buyer's incumbent platform |
| `{{FORMAT_LIMIT}}` | One side of A4, roughly 450 words |

**Stage 1 — Requirement decomposition**

```text
| Sub-requirement | Our evidence | Strength |
|---|---|---|
| Migration of legacy case management | 2023 housing migration, 190k records | STRONG |
| To a supported platform | Same project; target was a supported LTS | STRONG |
| No loss of historic records | Reconciliation method, record-count parity at each phase | STRONG |
| No service interruption | Phased cutover, 11 weeks, zero downtime | STRONG |
| From the buyer's specific incumbent | None | NONE — gap, see Stage 3 |
```

**Stage 3 — The gap**

```text
The incumbent platform is unfamiliar. Mitigations, strongest first:

1. The method does not depend on source-system familiarity. Migration
   is driven by an export-reconcile-verify loop that treats the source
   as opaque. State this explicitly — it converts the gap from an
   experience problem into a method question.
2. A two-week discovery phase before commitment, priced separately, so
   the buyer is not carrying the unfamiliarity risk.
3. Named partner with incumbent experience, available if discovery
   surfaces something the method does not cover.

Do NOT claim familiarity. The buyer's IT team knows their own platform
and will detect it in one question.
```

**Stage 4 — Draft**

```text
Case-management migration for social housing

We migrate legacy case-management systems to supported platforms
without downtime and without record loss.

Closest comparable work
In 2023 we migrated a UK social housing provider from an unsupported
legacy system to a supported platform. 190,000 historic case records,
phased over 11 weeks, with no interruption to frontline staff at any
point. Record-count parity was verified at each of four phases and
signed off by the client's data lead before the next phase began. The
client is available as a named reference on request.

Where our experience does not match
We have not previously migrated from [incumbent platform]. Our method
does not depend on familiarity with the source system: we export,
reconcile against source record counts, and verify before each phase,
treating the source as opaque. Where a source system behaves
unexpectedly, that surfaces in reconciliation rather than at cutover.

We would propose a two-week discovery phase, priced separately and
cancellable, so that platform-specific risk is established before
either party commits to a migration timetable.

About us
Fenwick Systems Ltd (company no. 10428871), founded 2016, 24 staff,
Leeds. ISO 27001 certified for development and hosting, valid to
March 2027. Eleven social housing engagements since 2016.

Contact
Priya Raman, Delivery Director — [email] — [direct line]
CPV 72200000-7, 72263000-6
```

**Stage 6 — Score read**

```text
Likely deductions:

- Anonymous reference. "A UK social housing provider" scores lower than
  a named one. Worth going back for naming permission before submission;
  it is the single highest-value change available.
- No stated team size for the comparable project. A scorer comparing
  190k records against their own volume will want to know what resource
  delivered it.
- Discovery phase may read as hedging to a scorer looking for
  confidence. Mitigate by stating the discovery deliverable and its
  fixed price, so it reads as rigour rather than uncertainty.

Likely credit:
- Naming the gap. Scorers routinely mark honesty about limitations
  higher than claimed universal capability, because it makes the rest
  of the submission believable.
```

## Advanced Version

Use this when the statement is scored against published criteria, or when competing against firms with more directly relevant experience.

```text
[Stages 1-6 as above, plus:]

STAGE 7 — COMPETITIVE POSITION
Assume a competitor has direct experience with the buyer's incumbent
platform. Write their capability statement's opening paragraph.

Then answer: on what dimension do we beat that? If the honest answer is
"nothing", this is a bid to decline or to partner on — and recognising
that early is worth more than a submission that loses.

STAGE 8 — THE REFERENCE CALL
For every claim, state what the reference would have to confirm.
Identify any claim where a plausible reference answer would weaken it.

Then: call the reference before submitting and confirm the wording.
A reference who is surprised by what was claimed is the most damaging
outcome in a bid process, and it is entirely preventable.

STAGE 9 — TRUNCATION TEST
Cut the draft to 60% of {{FORMAT_LIMIT}}. What survives?

If the surviving version is stronger, submit that. Buyers reading forty
submissions reward density. If something essential was lost, you now
know which paragraph is doing the work, and it should move earlier.
```

## Related

- [company-profile-document.md](company-profile-document.md) — the longer document establishing the organisation
- [case-study-library.md](case-study-library.md) — where the evidence used here is maintained
- [credentials-deck.md](credentials-deck.md) — the presented form of the same material
- [../proposal/](../proposal/) — the priced offer that follows a successful statement
- [../sales/](../sales/) — the narrative around the bid
- [../../core/research/competitor-analysis.md](../../core/research/competitor-analysis.md) — assessing who else is bidding
- [../../../docs/Output-Standards.md](../../../docs/Output-Standards.md#content-standards) — claim substantiation

## References

- [Crown Commercial Service supplier guidance](https://www.crowncommercial.gov.uk/suppliers) — UK public procurement expectations
- [CPV codes](https://simap.ted.europa.eu/cpv) — EU/UK common procurement vocabulary
- [NAICS codes](https://www.census.gov/naics/) — North American industry classification
