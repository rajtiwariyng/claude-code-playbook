# Portfolio Website

The archetype for one person, where the site's entire job is to make a stranger want to work with you.

> [!IMPORTANT]
> Run [website-architecture.md](website-architecture.md) first. This entry covers only what is specific to the portfolio archetype.

---

## Purpose

Produce the structure and content strategy for an individual's portfolio. The defining constraint is scope: a portfolio has one voice, a small number of pieces, and a visitor who will give it under a minute. Most portfolios fail by being too large — showing everything, which demonstrates range and communicates no point of view.

## When to Use

Use this when:

- The site represents one person's work — design, engineering, writing, photography, consulting
- The goal is being hired, commissioned, or contacted
- The work can be shown
- You maintain it yourself, irregularly

Use something else when:

| Situation | Go to |
| --- | --- |
| It is a team or firm | [agency-website.md](agency-website.md) |
| The work cannot be shown publicly | [agency-website.md](agency-website.md), then resolve disclosure |
| You are selling a product rather than yourself | [saas-website.md](saas-website.md) |

## Inputs Required

| Input | Required | Notes |
| --- | --- | --- |
| `{{ARCHITECTURE_OUTPUT}}` | Yes | Output of [website-architecture.md](website-architecture.md) |
| `{{GOAL}}` | Yes | Employment, freelance commissions, speaking, or credibility. They need different sites |
| `{{WORK_AVAILABLE}}` | Yes | Everything you could show, with disclosure status |
| `{{WORK_WANTED}}` | Yes | What you want more of. This selects the pieces |
| `{{AUDIENCE}}` | Yes | Hiring manager, art director, or client. Each reads differently |
| `{{TIME_TO_MAINTAIN}}` | Yes | Realistically. Determines whether a blog or feed can exist |

## Workflow

1. **State the goal precisely.** A portfolio for getting hired and one for getting commissions are different sites; trying to serve both produces one that serves neither.
2. **Select by what you want next**, not by what is most recent or most impressive. Showing work you do not want to repeat attracts more of it.
3. **Cut to a small number of pieces.** Three strong pieces beat nine of mixed quality — a visitor's impression is set by the weakest piece they see, not the average.
4. **Show your thinking on at least one piece.** For most audiences the process is the differentiator, since the output can be evaluated in seconds and the judgement cannot.
5. **Make contact obvious and low-friction.** A contact form is a barrier where an email address is not.
6. **Design for decay.** A portfolio is updated rarely. Anything that will look stale in a year should not be there.

## Claude Prompt

```text
ROLE
You are an information architect working on an individual's portfolio.

You optimise for a stranger deciding to make contact within about
sixty seconds, and you accept showing less work as the cost of that.

You refuse to:
- Include work the person does not want more of. A portfolio is a
  request, and everything shown is being requested.
- Show more than a handful of pieces. A visitor's impression is set
  by the weakest piece they see, not by the average or the best.
- Put a contact form where an email address would do. A form is a
  barrier that also fails silently.
- Include a blog the maintenance budget cannot sustain. Three posts
  ending eighteen months ago reads as abandonment.
- Lead with a biography. The visitor wants to see the work; the
  biography answers a question they have not asked yet.
- Use a loading animation, a splash screen, or a scroll-jacking
  intro. Every one of them spends the visitor's sixty seconds on
  something that is not the work.

You show thinking on at least one piece. Output can be judged in
seconds; judgement cannot, and judgement is what is being hired.

CONTEXT
Architecture: {{ARCHITECTURE_OUTPUT}}
Goal: {{GOAL}}
Work available: {{WORK_AVAILABLE}}
Work wanted: {{WORK_WANTED}}
Audience: {{AUDIENCE}}
Maintenance budget: {{TIME_TO_MAINTAIN}}

TASK

STAGE 1 — SELECTION
| Piece | Attracts what kind of work | Include? | Why |
Cut anything that attracts work in {{WORK_AVAILABLE}} but not in
{{WORK_WANTED}}. State every cut and its reason — the cuts are the
strategy.

STAGE 2 — THE WEAKEST PIECE
Of the included pieces, which is weakest? Justify keeping it or cut
it. A portfolio is judged by its floor.

STAGE 3 — THE DEPTH PIECE
Which one piece gets the full treatment — problem, constraints, what
was tried, what was rejected, what was learned? One deep piece
outperforms five shallow ones for every audience that is hiring
judgement rather than output.

STAGE 4 — THE FIRST SCREEN
What is visible before any scroll? For this archetype it should be:
who you are, what you do, and work. Not a manifesto, not a photograph
of you, not an animation.

STAGE 5 — CONTACT
The route, and its friction. Where it appears. What a visitor should
already know before they write, so the first message is useful.

STAGE 6 — DECAY AUDIT
What on this site will be stale in twelve months given
{{TIME_TO_MAINTAIN}}? Cut it or make it dateless.
```

## Expected Output

| Element | Detail |
| --- | --- |
| Selection with cuts | Every excluded piece, with its reason |
| Weakest-piece decision | Explicit keep or cut |
| Depth piece | One piece with full process treatment |
| First screen | Who, what, and work — before any scroll |
| Contact route | Low friction, with what to prepare |
| Decay audit | Everything that will age, cut or made dateless |

It should **not** contain:

- Work the person does not want more of
- More than a handful of pieces
- A contact form where an email address would do
- A blog the maintenance budget cannot sustain
- A splash screen, loading animation, or scroll-jacking intro

## Quality Checklist

- [ ] The goal is one goal, not two
- [ ] Every included piece attracts work the person wants more of
- [ ] The cuts are documented with reasons
- [ ] The weakest included piece has been explicitly justified or cut
- [ ] At least one piece shows process, not only outcome
- [ ] The first screen states who, what, and shows work — before scrolling
- [ ] Contact is one action, and an email address is available
- [ ] No element requires maintenance the person will not do
- [ ] Nothing on the site will read as abandoned in twelve months
- [ ] Loads and is usable without JavaScript-heavy intro sequences
- [ ] Meets [Output-Standards.md](../../../docs/Output-Standards.md) on all four universal standards

## Common Mistakes

| Mistake | Why it happens | Fix |
| --- | --- | --- |
| Showing everything | Range feels like strength | It communicates no point of view, and the floor sets the impression |
| Including work you do not want | It was good work | Everything shown is a request for more of it |
| Outcome without process | The output is the artefact | Output is judged in seconds. Judgement is what is being hired |
| Contact form only | It looks professional | It is friction, and it fails silently. An email address always works |
| Abandoned blog | It seemed like a good idea | Three posts ending eighteen months ago reads worse than no blog |
| Biography first | It is how a CV is ordered | The visitor came for the work. The biography answers a later question |
| Splash screen or animation | It demonstrates technical skill | It spends the visitor's sixty seconds on something that is not the work |
| Dated content that ages badly | "Currently working at…" | It becomes wrong silently. Make it dateless or commit to updating it |

## Example

**Inputs** *(constructed for illustration)*

| Input | Value |
| --- | --- |
| `{{GOAL}}` | Freelance commissions |
| `{{WORK_AVAILABLE}}` | 9 pieces: 4 marketing sites, 3 complex web applications, 2 logo designs |
| `{{WORK_WANTED}}` | Complex web applications only |
| `{{AUDIENCE}}` | Technical founders and product leads |
| `{{TIME_TO_MAINTAIN}}` | An hour or two, twice a year |

**Abbreviated output**

```text
STAGE 1 — SELECTION

| Piece | Attracts | Include | Why |
|-------|----------|---------|-----|
| App A — scheduling system | Complex apps | YES | Closest to wanted work |
| App B — data-heavy admin tool | Complex apps | YES | Shows scale handling |
| App C — internal reporting | Complex apps | YES — depth piece | Best decisions to show |
| Marketing sites × 4 | Marketing sites | NO | Attracts exactly the work being turned down |
| Logos × 2 | Logo design | NO | Different discipline; dilutes the position |

Three pieces from nine. The four marketing sites are the most visually
polished work available and are the strongest cuts in the set — they
are precisely what would generate the enquiries this person wants to
stop receiving.

STAGE 2 — WEAKEST PIECE

App B. The interface is dated and the project shipped three years ago.

Keep, with the framing changed: it is the only piece demonstrating
work at scale, and for this audience that matters more than visual
currency. The case study leads with the data volume and the
constraints, not with screenshots.

If a fourth complex-application piece becomes available, App B is the
one to replace.

STAGE 3 — DEPTH PIECE

App C. Full treatment:
  - The brief: "build a reporting dashboard"
  - The real problem: three people were manually reconciling two
    systems for a day and a half each month
  - Considered: a dashboard over the existing data; a sync layer; a
    scheduled reconciliation job with an exceptions view
  - Chose: the exceptions view. Rejected the dashboard because it
    would have shown the discrepancy without resolving it
  - Deliberately not done: no real-time sync. The reconciliation is
    monthly and real-time would have tripled the cost for no benefit
  - Result: the manual work went from ~36 person-hours a month to
    about 2, spent reviewing exceptions

That last bullet is the piece of evidence a technical founder is
looking for, and it is only available because the project was framed
around the outcome rather than the deliverable.

STAGE 4 — FIRST SCREEN

Name. One line: "I build complex web applications for small technical
teams." Then three project cards, above the fold.

No photograph, no manifesto, no animation. The visitor has sixty
seconds and the work is the argument.

STAGE 6 — DECAY AUDIT

| Element | Ages? | Action |
|---------|-------|--------|
| "Currently available for work" | Yes — becomes wrong silently, and wrong in the expensive direction | Replace with "Get in touch" and let the reply handle availability |
| "Recent work" heading | Yes — App B is 3 years old | Change to "Selected work" |
| Blog | Would age immediately at 2 hours/year | Do not build one |
| Client logos | No | Keep |
| Case study outcomes | No — they are historical facts | Keep, with the year stated |

Two hours twice a year sustains three case studies and nothing else.
The site is designed to that budget rather than to an intention.
```

## Advanced Version

Use this when the portfolio is the primary source of work, or when it is generating enquiries of the wrong kind.

```text
[Stages 1-6 as above, plus:]

STAGE 7 — ENQUIRY DIAGNOSIS
Take the last ten enquiries. For each: was it work you wanted, and
which piece did they mention?

Wrong-fit enquiries almost always trace to one specific piece. This
diagnosis is faster and more reliable than redesigning.

STAGE 8 — THE SIXTY-SECOND TEST
Have someone unfamiliar with your work look at the site for sixty
seconds, then close it. Ask:
  - What do I do?
  - What kind of work do I want?
  - Would you contact me, and about what?

If they cannot answer the first two, no amount of visual refinement
fixes it — the problem is selection, not design.

STAGE 9 — THE COMPARISON READ
Your site is open alongside two others in the same discipline. What
does yours have that they do not? If the answer is only aesthetic,
the portfolio is competing on the least defensible axis available.
```

## Related

- [website-architecture.md](website-architecture.md) — **run first**
- [agency-website.md](agency-website.md) — the team variant, which shares the case study structure
- [../ui-ux/](../ui-ux/) — visual design decisions
- [../../quality/performance/](../../quality/performance/) — image-heavy sites are a common performance failure
- [../../../docs/Output-Standards.md](../../../docs/Output-Standards.md) — the quality bar

## References

- [WCAG 2.2](https://www.w3.org/TR/WCAG22/) — accessibility conformance
- [Core Web Vitals](https://web.dev/articles/vitals) — performance metrics
- [Schema.org Person](https://schema.org/Person) — structured data for individuals
