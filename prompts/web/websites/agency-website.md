# Agency Website

The archetype for service businesses where the work itself is the argument.

> [!IMPORTANT]
> Run [website-architecture.md](website-architecture.md) first. This entry covers only what is specific to the agency archetype.

---

## Purpose

Produce the structure and content strategy for an agency, studio, or consultancy site. The defining constraint is that the buyer is assessing **judgement**, which cannot be claimed — only demonstrated. An agency site succeeds when a prospect can tell, from the work shown, whether these people would think well about their problem.

## When to Use

Use this when:

- The service is bespoke, priced per engagement, and sold on judgement
- Past work is available and can be shown
- The buyer is choosing between three shortlisted firms
- The site's job is to earn a first conversation, not to close

Use something else when:

| Situation | Go to |
| --- | --- |
| The service is productised with published prices | [saas-website.md](saas-website.md) |
| The organisation is large and trust rests on scale | [corporate-website.md](corporate-website.md) |
| It is one individual's work | [portfolio-website.md](portfolio-website.md) |
| You need the proposal document | [../../business/proposal/](../../business/proposal/) |

## Inputs Required

| Input | Required | Notes |
| --- | --- | --- |
| `{{ARCHITECTURE_OUTPUT}}` | Yes | Output of [website-architecture.md](website-architecture.md) |
| `{{WORK_SHOWABLE}}` | Yes | Projects you can name, with what you may disclose about each |
| `{{IDEAL_ENGAGEMENT}}` | Yes | Size, sector, and type of work you want more of |
| `{{WORK_TO_DECLINE}}` | Yes | What you do not want. This shapes the site more than what you do want |
| `{{DIFFERENTIATOR}}` | Yes | What you do differently, stated so a competitor could not copy the sentence |
| `{{PRICE_FLOOR}}` | No | Minimum engagement. Publishing it filters hard and well |
| `{{TEAM_VISIBILITY}}` | No | Whether named people are part of the offer |

## Workflow

1. **Audit what you can actually show.** Confidential work you cannot describe is not a portfolio, however good it was. Get disclosure permission or exclude it.
2. **Define the work you want to decline.** A site that filters is more valuable than a site that attracts — unqualified enquiries cost hours.
3. **Structure case studies around the decision**, not the deliverable. Buyers assess judgement, and judgement is visible in what you chose not to do.
4. **Make the differentiator falsifiable.** If a competitor could paste your positioning onto their site unchanged, it is not positioning.
5. **Decide on price signalling.** A published floor loses enquiries you did not want and raises the quality of the rest.
6. **Show the people** if the people are the offer, which for most agencies they are.

## Claude Prompt

```text
ROLE
You are an information architect working on an agency website.

You optimise for the right prospect starting a conversation and the
wrong one leaving, and you accept a lower total enquiry count as the
cost of that.

You refuse to:
- Present a case study as a description of deliverables. A list of
  what was built demonstrates capacity, not judgement, and judgement
  is what is being bought.
- Write a differentiator a competitor could paste onto their site
  unchanged. "We really listen" is not a differentiator.
- Show work you cannot describe. An unlabelled screenshot proves
  nothing.
- Hide the team when the team is the offer.
- Design a site that attracts every enquiry. Unqualified enquiries
  cost more than they return.
- List services as a menu. A service list invites price shopping on
  the one axis where you cannot compete.

You structure case studies around the decision: what was the real
problem, what did you consider, what did you choose, what did you
deliberately not do, and what happened.

CONTEXT
Architecture: {{ARCHITECTURE_OUTPUT}}
Showable work: {{WORK_SHOWABLE}}
Ideal engagement: {{IDEAL_ENGAGEMENT}}
Work to decline: {{WORK_TO_DECLINE}}
Differentiator: {{DIFFERENTIATOR}}
Price floor: {{PRICE_FLOOR}}
Team visibility: {{TEAM_VISIBILITY}}

TASK

STAGE 1 — SHOWABLE INVENTORY
| Project | What may be disclosed | Outcome available? | Ranks for which ideal engagement |
Exclude anything you cannot describe. State what was excluded and why.

STAGE 2 — FILTERING
How does this site cause the wrong prospect to leave? Be concrete —
price signal, stated non-fit, sector focus, engagement minimum.
A site with no filter is a site that generates unqualified enquiries.

STAGE 3 — CASE STUDY STRUCTURE
Define the repeatable structure. It must include:
  - The real problem, which is usually not the stated brief
  - What was considered and rejected, with the reason
  - What was deliberately not done
  - What happened, with a number if one is disclosable
Then apply it to one project as a worked example.

STAGE 4 — DIFFERENTIATOR TEST
State the differentiator. Then attempt to paste it onto a competitor's
site. If it fits unchanged, rewrite it and try again. Report both
attempts so the failure mode is visible.

STAGE 5 — THE FIRST CONVERSATION
What does the site need a prospect to know before the first call, so
that the call starts at a useful place? Where does that live?

STAGE 6 — WHAT WE ARE NOT
The explicit statement of who this agency is wrong for. Where it goes.
```

## Expected Output

| Element | Detail |
| --- | --- |
| Showable inventory | With disclosure boundaries and exclusions stated |
| Filtering mechanism | Concrete, not implied |
| Case study structure | Decision-centred, with a worked example |
| Tested differentiator | With the failed first attempt shown |
| First-conversation prep | What the site must establish before the call |
| Non-fit statement | Explicit and placed |

It should **not** contain:

- Case studies structured as deliverable lists
- A differentiator a competitor could reuse
- Unlabelled work
- A services menu inviting price comparison
- A site designed to maximise enquiry volume

## Quality Checklist

- [ ] Every shown project has disclosure permission for what is said about it
- [ ] Work that cannot be described is excluded, not shown unlabelled
- [ ] The site contains at least one concrete filtering mechanism
- [ ] Case studies state the real problem, not the stated brief
- [ ] Case studies state what was rejected and why
- [ ] Case studies state what was deliberately not done
- [ ] Outcomes carry a number where one is disclosable
- [ ] The differentiator fails the paste test against a competitor
- [ ] Named people appear if people are the offer
- [ ] The site states who the agency is wrong for
- [ ] Meets [Output-Standards.md](../../../docs/Output-Standards.md) on all four universal standards

## Common Mistakes

| Mistake | Why it happens | Fix |
| --- | --- | --- |
| Deliverable-list case studies | They are easy to write from project records | They prove capacity. Buyers are assessing judgement |
| Interchangeable positioning | Everyone writes the same words | Run the paste test. If it fits a competitor, it says nothing |
| Showing work you cannot discuss | The portfolio looks thin without it | An unlabelled screenshot proves nothing and raises questions |
| No filtering | More enquiries feels better | Unqualified enquiries cost hours and convert at near zero |
| Services as a menu | Clients ask for a service list | A menu invites comparison on price, the one axis you lose on |
| Hiding the team | It looks bigger | For most agencies the people are the product. Anonymity reads as churn |
| No outcomes | Clients will not permit disclosure | Ask specifically. Most permit a percentage or a direction |
| Omitting what was rejected | It feels like admitting doubt | It is the clearest available evidence of judgement |

## Example

**Inputs** *(constructed for illustration)*

| Input | Value |
| --- | --- |
| `{{IDEAL_ENGAGEMENT}}` | £40k+ platform rebuilds, B2B, 6–12 weeks |
| `{{WORK_TO_DECLINE}}` | Brochure sites; sub-£15k projects; anything needing ongoing retainer support |
| `{{DIFFERENTIATOR}}` | First draft: "We combine technical depth with commercial understanding" |

**Abbreviated output**

```text
STAGE 2 — FILTERING

Three mechanisms, in order of bluntness:
1. Publish the engagement floor: "We work on projects from £40,000."
   This is the strongest filter available and costs only enquiries
   that would not have converted.
2. State the sector focus on the homepage, not just in case studies.
3. Explicit non-fit statement (Stage 6).

Currently the site has none of these, which is why the enquiry mix
skews to sub-£10k brochure requests.

STAGE 3 — CASE STUDY STRUCTURE

| Section | Contains |
|---------|----------|
| The brief we were given | What the client asked for, in their words |
| The problem underneath it | What was actually wrong. Usually different |
| What we considered | Two or three approaches, with the trade-off of each |
| What we chose, and why not the others | The decision, compared |
| What we deliberately did not do | Scope declined, and the reason |
| What happened | A number, or a stated direction if the number is confidential |

Worked example — the "what we did not do" section:

  "The brief asked for a customer portal. We built the order status
   API and a single status page instead, and recommended against the
   portal. Their support volume was concentrated in one question —
   'where is my order' — and a portal would have taken four months to
   answer a question a page could answer in three weeks. We revisit
   the portal decision annually; it has not been needed yet."

That paragraph demonstrates judgement more effectively than any
capability claim on the site, and no competitor can copy it because
it is a specific decision about a specific client.

STAGE 4 — DIFFERENTIATOR TEST

Attempt 1: "We combine technical depth with commercial understanding."
Paste test: FAILS. Fits any consultancy site unchanged. Cut.

Attempt 2: "We take fixed-scope, fixed-price engagements of 6-12 weeks,
and we will tell you when the thing you asked for is not the thing you
need. Three of our last ten engagements were smaller than the brief
we were given."
Paste test: PASSES. A competitor pasting this would be making a
falsifiable claim about their own delivery model and their own numbers.

The second version is a differentiator because it can be wrong.
```

## Advanced Version

Use this when the site is the primary source of new business, or when enquiry quality rather than volume is the constraint.

```text
[Stages 1-6 as above, plus:]

STAGE 7 — ENQUIRY QUALITY DIAGNOSIS
Take the last 20 enquiries. For each: qualified or not, and which page
they arrived from. Which content is attracting the wrong prospect?

Bad-fit enquiries are usually traceable to one page making a broader
promise than the agency wants to keep.

STAGE 8 — THE SHORTLIST READ
A prospect has three agency sites open. Read yours as that prospect,
and state:
  - What is memorable after closing the tab
  - Which of the three you would call first, honestly
  - What the other two have that you do not

STAGE 9 — DISCLOSURE CAMPAIGN
List every past client whose outcome would strengthen the site, and
draft the specific ask for each. Most clients agree to a directional
outcome ("reduced processing time by more than half") when asked
specifically and refuse when asked generally.

This is usually the highest-return work available on an agency site,
and it is almost never done.
```

## Related

- [website-architecture.md](website-architecture.md) — **run first**
- [portfolio-website.md](portfolio-website.md) — the single-person variant
- [corporate-website.md](corporate-website.md) — when scale is the trust signal
- [../../business/proposal/](../../business/proposal/) — what follows the first conversation
- [../../business/sales/](../../business/sales/) — the sales narrative
- [../../../docs/Output-Standards.md](../../../docs/Output-Standards.md) — the quality bar

## References

- [WCAG 2.2](https://www.w3.org/TR/WCAG22/) — accessibility conformance
- [Core Web Vitals](https://web.dev/articles/vitals) — performance metrics
- [Schema.org ProfessionalService](https://schema.org/ProfessionalService) — structured data
