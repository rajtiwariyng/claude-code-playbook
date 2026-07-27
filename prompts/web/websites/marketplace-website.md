# Marketplace Website

The archetype for two-sided platforms, where one site must recruit two audiences who want opposite things.

> [!IMPORTANT]
> Run [website-architecture.md](website-architecture.md) first. This entry covers only what is specific to the marketplace archetype.

---

## Purpose

Produce the structure and content strategy for a two-sided marketplace. The defining constraint is that supply and demand want opposite things — sellers want more buyers and less competition, buyers want more sellers and lower prices — and a single site must recruit both without either seeing the argument made to the other.

## When to Use

Use this when:

- The platform connects two distinct user types who transact with each other
- Value to each side depends on the size of the other side
- You must solve the cold-start problem in the site structure, not just the product
- Both sides need separate acquisition paths

Use something else when:

| Situation | Go to |
| --- | --- |
| You sell your own inventory | [saas-website.md](saas-website.md) or an e-commerce entry |
| Only one audience needs recruiting | The relevant single-audience archetype |
| The two sides never see each other's pages | Two separate sites; say so |

## Inputs Required

| Input | Required | Notes |
| --- | --- | --- |
| `{{ARCHITECTURE_OUTPUT}}` | Yes | Output of [website-architecture.md](website-architecture.md) |
| `{{SIDE_A}}` / `{{SIDE_B}}` | Yes | Each side named, with the job it arrives to do |
| `{{CONSTRAINED_SIDE}}` | Yes | Which side is harder to acquire. Determines almost everything |
| `{{LIQUIDITY_DEFINITION}}` | Yes | What "enough supply" means, concretely, in a category or geography |
| `{{TRUST_MECHANISM}}` | Yes | What makes a stranger transact — reviews, escrow, verification, guarantee |
| `{{TAKE_MODEL}}` | Yes | How the platform earns, and which side pays |
| `{{COLD_START_STATE}}` | Yes | What each side sees when the other side is thin |

## Workflow

1. **Identify the constrained side.** Almost every marketplace is limited by one side, and the site should be built for that side first.
2. **Define liquidity concretely** — in a category, in a geography, at a time. "Enough sellers" is not a definition and cannot be measured.
3. **Design the cold-start states.** An empty category is the first thing an early user sees and it determines whether they return.
4. **Separate the two acquisition paths** so neither side reads the argument made to the other.
5. **Make the trust mechanism visible before the transaction**, not after. Trust is what a marketplace sells.
6. **State the take rate honestly** where the paying side can find it.

## Claude Prompt

```text
ROLE
You are an information architect working on a two-sided marketplace.

You optimise for the constrained side, and you accept a less polished
experience for the abundant side as the cost of that.

You refuse to:
- Design a site that shows both sides the same argument. Sellers want
  fewer competitors; buyers want more. A page that pleases both is
  saying nothing.
- Present an empty category as a bug. In an early marketplace it is
  the normal state and must be designed.
- Hide the take rate from the side that pays it. Discovered fees
  destroy trust permanently.
- Treat reviews as the default trust mechanism. Reviews require
  liquidity to work, which is the thing you do not have yet.
- Design for the steady state. A marketplace site is used mostly in
  the cold-start state, for longer than anyone plans for.

You define liquidity as a measurable condition in a specific category
and geography, not as a general aspiration.

CONTEXT
Architecture: {{ARCHITECTURE_OUTPUT}}
Side A: {{SIDE_A}}
Side B: {{SIDE_B}}
Constrained side: {{CONSTRAINED_SIDE}}
Liquidity means: {{LIQUIDITY_DEFINITION}}
Trust mechanism: {{TRUST_MECHANISM}}
Take model: {{TAKE_MODEL}}
Cold-start state: {{COLD_START_STATE}}

TASK

STAGE 1 — THE CONSTRAINED SIDE
Which side is harder to acquire, and why? State what this implies for
homepage priority, navigation, and where acquisition effort goes.

STAGE 2 — SEPARATE PATHS
| Side | Entry point | Landing | The argument made | What they must not see |
The last column matters. A seller reading "thousands of sellers
competing for your business" leaves.

STAGE 3 — COLD START
For each side, what they see when the other side is thin:
| Scenario | What the user sees | What keeps them | What loses them |
Cover: empty category, one result, results far away, no reviews yet,
no response to an enquiry.

STAGE 4 — TRUST BEFORE TRANSACTION
What makes a stranger transact here? Where is it visible, and is it
visible before the point of commitment?

Reviews cannot be the answer at cold start. State what substitutes
until review volume exists.

STAGE 5 — TAKE RATE DISCLOSURE
Which side pays, how much, and where does the site state it? Model
what a seller earns on a typical transaction, in numbers.

STAGE 6 — LIQUIDITY MEASUREMENT
The concrete metric that says a category is liquid. What the site does
differently in liquid and illiquid categories.
```

## Expected Output

| Element | Detail |
| --- | --- |
| Constrained-side analysis | With its structural implications |
| Two separate paths | Including what each side must not see |
| Cold-start states | Designed, per side, per scenario |
| Trust mechanism | Visible pre-transaction, with a cold-start substitute |
| Take rate disclosure | Modelled in numbers |
| Liquidity metric | Concrete, per category and geography |

It should **not** contain:

- One argument addressed to both sides
- Empty states treated as edge cases
- Reviews assumed as the cold-start trust mechanism
- A hidden or discoverable-later take rate
- A design that only works at steady state

## Quality Checklist

- [ ] The constrained side is identified and drives structural priority
- [ ] Each side has a separate acquisition path
- [ ] Each path states what that side must not see
- [ ] Empty category, single result, and no-reviews states are designed
- [ ] The trust mechanism is visible before the point of commitment
- [ ] A cold-start trust substitute exists that does not depend on volume
- [ ] The take rate is stated where the paying side will find it
- [ ] A typical transaction is modelled in numbers
- [ ] Liquidity is defined as a measurable condition in a category and geography
- [ ] The site behaves differently in liquid and illiquid categories
- [ ] Meets [Output-Standards.md](../../../docs/Output-Standards.md) on all four universal standards

## Common Mistakes

| Mistake | Why it happens | Fix |
| --- | --- | --- |
| One homepage for both sides | It is one site | The two arguments contradict. Separate the paths |
| Empty states as edge cases | Steady state is what gets designed | Cold start is the normal state for longer than anyone plans |
| Reviews as the trust mechanism | Every mature marketplace uses them | Reviews need volume you do not have. Find a substitute for the first year |
| Hidden take rate | It looks lower if discovered late | Discovered fees destroy trust permanently and generate support load |
| Optimising the abundant side | It is the side that is responsive | Effort on the abundant side compounds nothing |
| Vague liquidity | "Enough supply" feels sufficient | Unmeasurable, so nobody knows whether it is working |
| National launch | It is more ambitious | Marketplaces are liquid locally or not at all. Concentrate geographically |
| Same UI in liquid and illiquid categories | It is simpler to build | A search returning two results needs a different page than one returning two hundred |

## Example

> **Provenance:** constructed. Inputs and output demonstrate the pattern; this is not a transcript of a real run.
**Inputs**

| Input | Value |
| --- | --- |
| `{{SIDE_A}}` | Homeowners needing a tradesperson |
| `{{SIDE_B}}` | Vetted tradespeople |
| `{{CONSTRAINED_SIDE}}` | Tradespeople — they have work already and no reason to join |
| `{{TAKE_MODEL}}` | 8% of job value, paid by the tradesperson |

**Abbreviated output**

```text
STAGE 1 — CONSTRAINED SIDE

Tradespeople. They are busy, sceptical of lead-generation platforms
(most have been burned by pay-per-lead models), and have no acquisition
problem in a strong market.

Implication: the homepage should address tradespeople, not homeowners.
This is counter-intuitive — homeowners are the visible customer — but
homeowner acquisition is straightforward and supply is not. Homeowners
arrive by search on their specific problem and should land on category
pages, never the homepage.

STAGE 2 — SEPARATE PATHS

| Side | Entry | Lands on | Argument | Must not see |
|------|-------|----------|----------|--------------|
| Tradesperson | Direct, referral, trade press | Homepage | "Paid work, no lead fees, you only pay when you get paid" | Any claim about how many tradespeople are on the platform |
| Homeowner | Search: "emergency plumber Leeds" | Category + location page | "Vetted, insured, we hold the payment until you're happy" | The take rate; any framing that makes the tradesperson look like a commodity |

The tradesperson must-not-see column is the important one. Standard
marketplace copy — "join thousands of professionals" — actively repels
the constrained side, because it describes competition.

STAGE 3 — COLD START

| Scenario | Sees | Keeps them | Loses them |
|----------|------|-----------|------------|
| Homeowner, empty category | Not "no results". Instead: "We don't have a vetted electrician in Leeds yet. Tell us what you need and we'll find one within 48 hours, or tell you we can't." | A real commitment with a deadline | A blank page, or a fake "coming soon" |
| Homeowner, one result | The single result, presented fully, with no comparison UI at all | It reads as curation, not scarcity | A grid layout with one item in it, which reads as failure |
| Tradesperson, no jobs yet | Honest state: how many homeowner requests came in this week in their area, even if zero, and what the platform is doing about it | Honesty about a real number | Fabricated activity — trades talk to each other and this is found out |
| No reviews yet | Vetting evidence instead: insurance verified, qualifications checked, ID confirmed, date of check | Verification is a substitute for reputation | Empty star ratings, which read worse than no ratings |

The one-result layout is a real design decision: a comparison grid
with one card in it communicates failure, while a single full-width
profile communicates selection.

STAGE 5 — TAKE RATE

8%, paid by the tradesperson, stated on the tradesperson landing page
above the fold, with a worked example:

  "A £400 job: you receive £368. We take £32. No monthly fee, no lead
   fees, nothing if the job doesn't happen."

Compare to the alternative they know — pay-per-lead platforms charging
for unqualified leads. The comparison is the argument, and it only
works if the number is stated plainly.

STAGE 6 — LIQUIDITY

Defined as: in a given trade and postcode district, at least 3 vetted
tradespeople with availability within 7 days.

Below that threshold, the category page shows the concierge state
(Stage 3) rather than a search interface. Above it, search and compare.
Two genuinely different pages, switched on a measurable condition.
```

## Advanced Version

Use this when launching a marketplace, or when a category has stalled and the cause is unclear.

```text
[Stages 1-6 as above, plus:]

STAGE 7 — GEOGRAPHIC CONCENTRATION
Marketplaces are liquid locally or not at all. State:
  - The single geography to reach liquidity in first, and why
  - What the site does for visitors outside it
  - The threshold that triggers opening a second geography

A site that serves everywhere thinly is illiquid everywhere.

STAGE 8 — DISINTERMEDIATION
Once two parties meet, what stops them transacting off-platform?
State honestly what the platform provides after introduction. If the
answer is "nothing", the take model has a structural problem that no
site structure fixes — say so.

STAGE 9 — THE STALLED CATEGORY
For a category that is not growing, diagnose: is it a supply problem,
a demand problem, a trust problem, or a fit problem? Each has a
different fix, and they are routinely confused.

State what evidence would distinguish them, and where the site would
show that evidence.
```

## Related

- [website-architecture.md](website-architecture.md) — **run first**
- [saas-website.md](saas-website.md) — the single-audience self-serve archetype
- [../dashboards/](../dashboards/) — the seller-side management interface
- [../../core/research/user-research.md](../../core/research/user-research.md) — understanding the constrained side
- [../../../docs/Output-Standards.md](../../../docs/Output-Standards.md) — the quality bar

## References

- [WCAG 2.2](https://www.w3.org/TR/WCAG22/) — accessibility conformance
- [Schema.org Offer](https://schema.org/Offer) — structured data for listings
- [Core Web Vitals](https://web.dev/articles/vitals) — performance metrics
