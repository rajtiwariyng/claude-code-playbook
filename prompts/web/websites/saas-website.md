# SaaS Website

The archetype for products where the visitor can evaluate and buy without talking to anyone.

> [!IMPORTANT]
> Run [website-architecture.md](website-architecture.md) first. This entry covers only what is specific to the SaaS archetype.

---

## Purpose

Produce the structure and content strategy for a self-serve software product site. The defining constraint is that the visitor decides alone, in one session, without a salesperson to answer objections — so every objection must be anticipated and answered on the page, and the pricing must be legible without a conversation.

## When to Use

Use this when:

- A visitor can sign up, trial, or buy without human contact
- The product is the primary proof and can be shown
- Pricing is published
- Conversion is measurable within a single session

Use something else when:

| Situation | Go to |
| --- | --- |
| Buying involves a committee over months | [corporate-website.md](corporate-website.md) |
| Sales is human-led and pricing is quoted | [corporate-website.md](corporate-website.md) |
| One campaign, one audience, one goal | [../landing-pages/](../landing-pages/) |
| Two distinct user types must both be recruited | [marketplace-website.md](marketplace-website.md) |

## Inputs Required

| Input | Required | Notes |
| --- | --- | --- |
| `{{ARCHITECTURE_OUTPUT}}` | Yes | The output of [website-architecture.md](website-architecture.md) |
| `{{PRODUCT_JOB}}` | Yes | The job the product does, in the user's words |
| `{{CURRENT_ALTERNATIVE}}` | Yes | What they use now — usually a spreadsheet or nothing |
| `{{PRICING_MODEL}}` | Yes | Tiers, what gates each, and the metric it scales on |
| `{{ACTIVATION_MOMENT}}` | Yes | The point a new user first gets value. Determines the whole funnel |
| `{{TOP_OBJECTIONS}}` | Yes | Why people do not sign up. From sales, support, or churn interviews |
| `{{TRIAL_MODEL}}` | Yes | Free tier, time-limited trial, demo, or none |

## Workflow

1. **State the job in the user's words**, not the product's category. Users search for their problem, not for your category name.
2. **Name the current alternative honestly** — usually a spreadsheet, a manual process, or nothing. That is the real competitor and the comparison the page must win.
3. **Identify the activation moment** and work backwards. Everything before it is friction to minimise; everything after is retention.
4. **Enumerate objections and answer each on the page.** There is no salesperson. An unanswered objection is a lost visitor.
5. **Make pricing legible without arithmetic.** If a visitor must calculate to know their price, a proportion will leave rather than calculate.
6. **Show the product.** Screenshots of real interfaces outperform description, and abstract illustrations of the product outperform nothing but not much.

## Claude Prompt

```text
ROLE
You are an information architect working on a self-serve software
product site.

You optimise for a visitor reaching a confident yes or a confident no
without talking to anyone, and you accept losing some poorly-fitting
signups as the cost of that. A fast, honest no is a good outcome.

You refuse to:
- Describe the product by its category. Users search for their problem.
- Hide pricing behind "contact us" on a self-serve product. It reads
  as expensive and it breaks the archetype.
- Answer an objection with a reassurance. "Enterprise-grade security"
  does not answer "will my data be safe" — a security page does.
- Use abstract illustration where a screenshot of the real product
  would work.
- Treat the free tier as a pricing question. It is a product question:
  what can someone do without paying, and does that reach the
  activation moment?
- Write feature lists. Features are what it does; the page must say
  what the user gets.

You name the current alternative honestly. For most products that is a
spreadsheet or nothing, and a page that pretends the competitor is
another vendor is arguing with the wrong opponent.

CONTEXT
Architecture: {{ARCHITECTURE_OUTPUT}}
The job, in user words: {{PRODUCT_JOB}}
What they use now: {{CURRENT_ALTERNATIVE}}
Pricing: {{PRICING_MODEL}}
Activation moment: {{ACTIVATION_MOMENT}}
Top objections: {{TOP_OBJECTIONS}}
Trial model: {{TRIAL_MODEL}}

TASK

STAGE 1 — THE ALTERNATIVE
State what the visitor does today and what it costs them. The page has
to beat that, not beat a competitor's feature list.

STAGE 2 — OBJECTION MAP
| Objection | Where it arises | What answers it | Which page |
An objection with no answer on the site is a leak. Mark them.

STAGE 3 — PATH TO ACTIVATION
Every step from landing to {{ACTIVATION_MOMENT}}. For each:
| Step | What is required of the user | Can it be deferred or removed? |
Anything required before activation that could come after it is
friction to cut.

STAGE 4 — PRICING PAGE
- Tier structure and what gates each capability
- The metric pricing scales on, and whether a visitor can predict
  their own bill without arithmetic
- What happens at the limit — hard stop, overage, or upgrade prompt
- The three questions a visitor asks that the page must answer

STAGE 5 — PROOF
What can be shown rather than claimed? Screenshots, real data, a
public demo, a sandbox. Rank by how much doubt each removes.

STAGE 6 — THE HONEST NO
Who is this product wrong for, and does the site say so? Naming your
non-fit converts better than pretending universality, and it reduces
churn and support load.
```

## Expected Output

| Element | Detail |
| --- | --- |
| Alternative analysis | What they do today and its real cost |
| Objection map | Each objection with its answer and location, leaks marked |
| Activation path | Every step, with removable friction identified |
| Pricing specification | Predictable, with limit behaviour stated |
| Proof ranking | What is shown rather than claimed |
| Non-fit statement | Who this is wrong for |

It should **not** contain:

- Category-first positioning
- Hidden pricing on a self-serve product
- Objections answered with reassurance
- Feature lists in place of outcomes
- Abstract illustration where a screenshot would work

## Quality Checklist

- [ ] The job is stated in the user's words, not the product category
- [ ] The current alternative is named and its cost stated
- [ ] Every objection has a specific answer located on a specific page
- [ ] The activation moment is defined
- [ ] Every pre-activation step is justified or removed
- [ ] Pricing is published
- [ ] A visitor can predict their own bill without arithmetic
- [ ] Limit behaviour is stated — hard stop, overage, or prompt
- [ ] The product is shown, not only described
- [ ] The site states who the product is wrong for
- [ ] Trial or free tier reaches the activation moment
- [ ] Meets [Output-Standards.md](../../../docs/Output-Standards.md) on all four universal standards

## Common Mistakes

| Mistake | Why it happens | Fix |
| --- | --- | --- |
| Leading with the category | It is how the team describes the product internally | Users search for their problem. Lead with the job |
| Arguing with a competitor | Competitors are visible and specific | The real alternative is usually a spreadsheet. Beat that |
| "Contact us" pricing | It preserves negotiating room | On a self-serve product it reads as expensive and breaks the model |
| Unpredictable pricing metric | It matches internal cost structure | If a visitor cannot predict their bill, a proportion leaves rather than calculate |
| Reassurance instead of answers | It is faster to write | "Bank-grade security" answers nothing. Link the security page |
| Feature lists | They are easy to generate from a backlog | Features are what it does. Users buy what they get |
| Signup friction before activation | Data collection feels necessary | Every field before the activation moment costs conversion. Collect later |
| Claiming universality | Narrowing feels like losing customers | Naming your non-fit raises conversion among the fit and cuts churn |
| Abstract product illustration | Screenshots look unpolished | A real screenshot removes more doubt than any illustration |

## Example

> **Provenance:** constructed. Inputs and output demonstrate the pattern; this is not a transcript of a real run.
**Inputs**

| Input | Value |
| --- | --- |
| `{{PRODUCT_JOB}}` | "Stop losing track of which invoices clients haven't paid" |
| `{{CURRENT_ALTERNATIVE}}` | A spreadsheet, plus remembering to chase |
| `{{PRICING_MODEL}}` | £19/mo up to 50 active invoices, £39 to 200, custom above |
| `{{ACTIVATION_MOMENT}}` | First automated chase email sends |
| `{{TOP_OBJECTIONS}}` | "Will it email my clients something embarrassing?"; "Is my client data safe?"; "Do I have to re-enter everything?" |

**Abbreviated output**

```text
STAGE 1 — THE ALTERNATIVE

They use a spreadsheet and their memory. It costs them: invoices that
age past 60 days unnoticed, awkward chase conversations because the
chase is late, and roughly two hours a month reconciling.

The page must beat that, and the spreadsheet has real advantages —
free, flexible, already understood, no data to move. Any page that
does not acknowledge those is arguing against a strawman.

STAGE 2 — OBJECTION MAP

| Objection | Arises | Answer | Page |
|-----------|--------|--------|------|
| "Will it email something embarrassing to my client?" | Before signup, blocks trial | Show the actual email templates, editable, with a "nothing sends until you approve it" first-run state | Home + a template gallery page |
| "Is my client data safe?" | Before entering data | Security page: where data is held, who can see it, deletion process | Security page — MISSING |
| "Do I have to re-enter everything?" | At signup | CSV import, and the accounting-package integrations, stated on the pricing and signup pages | Home + Signup |
| "What if I stop paying — do I lose my data?" | At payment step | Export policy, stated plainly | Pricing — MISSING |

Two leaks. The first objection is the biggest: this product sends
email as the client, and that is genuinely frightening. It is answered
by showing the templates, not by promising professionalism.

STAGE 3 — PATH TO ACTIVATION

| Step | Requires | Deferrable? |
|------|----------|-------------|
| Land | — | — |
| Sign up | Email, password | No |
| Company name | Typed | YES — defer; it is only needed on the first email |
| Add payment card | Card | YES — defer to end of trial |
| Import or add first invoice | CSV or manual entry | No — this is the product |
| Set chase schedule | Choose from defaults | No, but default it so it is one click |
| First chase sends | Time passes, or "send now" | This is activation |

Two steps deferrable. The card requirement before activation is the
expensive one — it moves the decision before any value is experienced.

STAGE 4 — PRICING

Metric: active invoices. A visitor can count their own active invoices,
so the bill is predictable. Good.

At the limit: currently a hard stop, which for this product means
chases stop sending — the failure is silent and damaging. Recommend a
soft limit with an upgrade prompt, and make the behaviour explicit on
the pricing page. A silent stop on a chasing product loses the customer
money and they will blame you correctly.

Three questions the page must answer:
1. What counts as an "active" invoice? (Define it, with an example.)
2. What happens at 51 invoices?
3. If I cancel, what happens to my data?

STAGE 6 — THE HONEST NO

This is wrong for: businesses invoicing more than ~200 times a month
(the interface is not built for that volume), anyone needing multi-
currency, and anyone whose accounting package already chases.

Say so on the pricing page. Every one of those signups churns within
two months and files support tickets on the way out.
```

Stage 2's first objection is the one this archetype exists to catch: a product-defining fear that no amount of reassurance answers, and that showing the actual email templates answers completely.

## Advanced Version

Use this when conversion is the primary business constraint, or when a redesign must be justified by measurable improvement.

```text
[Stages 1-6 as above, plus:]

STAGE 7 — FUNNEL INSTRUMENTATION
For each step in the activation path, the event that measures it and
the drop-off you would consider normal. A funnel you cannot measure
step by step cannot be improved — you will only know that it leaks,
not where.

STAGE 8 — TIME TO VALUE
Measure, in minutes, the fastest realistic path from landing to
{{ACTIVATION_MOMENT}}. Then state the slowest realistic path.

If the slow path exceeds a single sitting, the product needs a
resumable onboarding state, and the site needs to say so.

STAGE 9 — PRICING PAGE STRESS TEST
Take three specific hypothetical customers at different sizes. For
each, walk the pricing page and state: which tier, what it costs, and
how long it took to work out.

Any customer who cannot determine their price in under 30 seconds is
a pricing page defect, not a customer problem.

STAGE 10 — CHURN SIGNALS IN THE SITE
Which site content sets an expectation the product does not meet?
Mis-set expectations are the cheapest churn to eliminate and the
hardest to see, because the page reads well and the product works —
the two do not match.
```

## Related

- [website-architecture.md](website-architecture.md) — **run first**
- [../landing-pages/](../landing-pages/) — campaign pages that feed this site
- [corporate-website.md](corporate-website.md) — when sales is human-led
- [../../growth/seo/](../../growth/seo/) — capturing problem-based search
- [../../quality/performance/](../../quality/performance/) — conversion is sensitive to load time
- [../../../docs/Output-Standards.md](../../../docs/Output-Standards.md) — the quality bar

## References

- [Core Web Vitals](https://web.dev/articles/vitals) — performance metrics that affect conversion
- [WCAG 2.2](https://www.w3.org/TR/WCAG22/) — accessibility conformance
- [Schema.org SoftwareApplication](https://schema.org/SoftwareApplication) — structured data for software products
