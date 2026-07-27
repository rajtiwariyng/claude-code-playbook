# Booking Website

The archetype for hotels, restaurants, clinics, and any site where checking availability and reserving is the core interaction.

> [!IMPORTANT]
> Run [website-architecture.md](website-architecture.md) first. This entry covers only what is specific to the booking archetype.

---

## Purpose

Produce the structure and content strategy for a site whose primary conversion is a reservation. The defining constraint is that **availability is the content** — a visitor's first question is "can I get what I want, when I want it", and every page that delays that answer loses bookings to an aggregator that answers it immediately.

## When to Use

Use this when:

- The conversion is a time-bound reservation — a room, a table, an appointment, a class
- Availability changes and must be shown live
- You compete with aggregators that own the search results
- Direct booking is commercially preferable to a third-party channel

Use something else when:

| Situation | Go to |
| --- | --- |
| The purchase is not time-bound | [saas-website.md](saas-website.md) or an e-commerce entry |
| The reservation is arranged by conversation | [corporate-website.md](corporate-website.md) |
| It is a two-sided platform of many venues | [marketplace-website.md](marketplace-website.md) |
| It is a healthcare or regulated setting | This entry, then [../../industries/](../../industries/) |

## Inputs Required

| Input | Required | Notes |
| --- | --- | --- |
| `{{ARCHITECTURE_OUTPUT}}` | Yes | Output of [website-architecture.md](website-architecture.md) |
| `{{BOOKABLE_UNIT}}` | Yes | Room-night, table for N at a time, 30-minute appointment |
| `{{BOOKING_SYSTEM}}` | Yes | The engine. Its constraints shape the whole site |
| `{{AGGREGATOR_CHANNELS}}` | Yes | Which third parties you are also listed on, and their commission |
| `{{DIRECT_ADVANTAGE}}` | Yes | What a direct booker gets that an aggregator booker does not. If nothing, that is the finding |
| `{{CANCELLATION_POLICY}}` | Yes | The most-read text on the site |
| `{{PEAK_PATTERN}}` | No | When demand concentrates. Changes what the site must handle |

## Workflow

1. **Put availability first.** Not after the gallery, not after the story. The visitor's question is availability and every scroll before the answer is a loss.
2. **Establish the direct advantage** — and if there is none, say so, because that is a commercial finding rather than a design problem.
3. **Design around the booking engine's real constraints.** Most booking engines constrain the design more than the brand does, and discovering this late is expensive.
4. **Write the cancellation policy as primary content**, not as legal boilerplate. It is read more than any other text on the site.
5. **Design the unavailable state.** "No availability" is a common outcome and it either loses the visitor or captures them.
6. **Handle the mobile-at-the-door case.** A significant proportion of restaurant and hotel bookings happen on a phone, outside, in a hurry.

## Claude Prompt

```text
ROLE
You are an information architect working on a booking website.

You optimise for the visitor learning whether they can get what they
want as fast as possible, and you accept a less atmospheric site as
the cost of that.

You refuse to:
- Place the availability check below atmospheric content. The visitor
  has a date in mind and everything before the answer is friction.
- Present "no availability" as a dead end. It is the most common
  outcome at peak and it is a capture opportunity.
- Bury the cancellation policy. It is the most-read text on a booking
  site and hiding it produces disputes, chargebacks, and bad reviews.
- Show a price that is not the price. A rate that grows at checkout
  is the single largest cause of abandonment in this archetype.
- Design a booking flow the booking engine cannot support. Confirm the
  engine's constraints before designing anything.
- Assume desktop. A large share of these bookings happen on a phone,
  one-handed, often standing outside the venue.

You treat the direct advantage as a commercial question. If a direct
booker gets nothing an aggregator booker does not, no site design
recovers the commission, and you say so plainly.

CONTEXT
Architecture: {{ARCHITECTURE_OUTPUT}}
Bookable unit: {{BOOKABLE_UNIT}}
Booking engine: {{BOOKING_SYSTEM}}
Aggregator channels: {{AGGREGATOR_CHANNELS}}
Direct advantage: {{DIRECT_ADVANTAGE}}
Cancellation policy: {{CANCELLATION_POLICY}}
Peak pattern: {{PEAK_PATTERN}}

TASK

STAGE 1 — TIME TO AVAILABILITY
How many actions from landing to seeing real availability for a
specific date? Count them for each entry point. Anything above two
is a defect.

STAGE 2 — THE DIRECT ADVANTAGE
State what a direct booker gets that an aggregator booker does not,
and where the site says it. If there is nothing, say so — that is a
commercial decision to escalate, not a design problem to solve.

STAGE 3 — BOOKING FLOW
| Step | What is asked | Why it is needed | Can it move later? |
Everything asked before the reservation is held is friction. Everything
asked after is admin the customer is already committed to.

STAGE 4 — THE UNAVAILABLE STATE
What happens when the requested date is full? Options, in order of
value: alternative dates, waitlist, alternative unit, notify-me.
Design it as a page, not as an error.

STAGE 5 — PRICE HONESTY
The price shown at first view versus the price at checkout. Every
addition between them: taxes, fees, service charge, deposit. Any gap
is an abandonment cause.

STAGE 6 — POLICY AS CONTENT
Cancellation, deposit, and change policies, written in plain language,
placed where they are read before commitment rather than after.

STAGE 7 — THE PHONE-AT-THE-DOOR CASE
A visitor is outside the venue, on a phone, deciding now. What do they
need in the first screen? Usually: are you open, is there space, how
do I get in.
```

## Expected Output

| Element | Detail |
| --- | --- |
| Time-to-availability | Counted per entry point |
| Direct advantage | Stated, or escalated as absent |
| Booking flow | Every step justified, deferrable steps identified |
| Unavailable state | Designed as a page with options |
| Price ledger | First-view to checkout, every addition listed |
| Policies as content | Plain language, placed before commitment |
| Phone-at-the-door path | First-screen essentials |

It should **not** contain:

- Availability below atmospheric content
- A dead-end unavailable state
- A checkout price higher than the displayed price without prior disclosure
- Cancellation policy in a footer link only
- A flow the booking engine cannot execute

## Quality Checklist

- [ ] Availability is reachable in two actions or fewer from every entry point
- [ ] The direct advantage is stated, or its absence has been escalated
- [ ] Every pre-reservation step is justified; deferrable ones are deferred
- [ ] The unavailable state offers alternative dates, waitlist, or notify-me
- [ ] The first-view price equals the checkout price, or every addition is disclosed up front
- [ ] Cancellation policy appears before the commitment point, in plain language
- [ ] The booking flow is confirmed executable by the booking engine
- [ ] The flow works one-handed on a 320px screen
- [ ] Opening hours, address, and access are on the first mobile screen
- [ ] Confirmation includes everything needed to arrive without returning to the site
- [ ] Meets [Output-Standards.md](../../../docs/Output-Standards.md) on all four universal standards

## Common Mistakes

| Mistake | Why it happens | Fix |
| --- | --- | --- |
| Gallery before availability | The venue is beautiful and the photos are the investment | The visitor has a date in mind. Answer that first; the gallery converts nobody who cannot get a room |
| No direct advantage | Nobody framed it as a commercial question | Without one, the aggregator wins on convenience and the commission is unavoidable |
| Unavailable as an error | It is treated as a failure state | It is the peak-time norm. A waitlist captures what a dead end loses |
| Price growing at checkout | Fees are handled by the booking engine | It is the largest abandonment cause in this archetype. Disclose up front |
| Hidden cancellation policy | It reads as unfriendly | It is the most-read text on the site. Hiding it produces disputes and bad reviews |
| Designing before checking the engine | The engine is treated as an implementation detail | Booking engines constrain flow more than brand does. Confirm first |
| Desktop-first | Design happens on a desktop | A large share of these bookings happen one-handed on a phone |
| Confirmation without arrival detail | The booking is the goal | The customer needs the address, the time, and the access instructions without logging back in |

## Example

**Inputs** *(constructed for illustration)*

| Input | Value |
| --- | --- |
| `{{BOOKABLE_UNIT}}` | Table for 2–8, 90-minute slots |
| `{{AGGREGATOR_CHANNELS}}` | Two booking platforms, roughly £2 per cover |
| `{{DIRECT_ADVANTAGE}}` | Initially stated as "none" |
| `{{PEAK_PATTERN}}` | Friday and Saturday 19:00–20:30, booked out 2 weeks ahead |

**Abbreviated output**

```text
STAGE 1 — TIME TO AVAILABILITY

Current: Home → scroll past hero video → "Reservations" in nav →
booking widget loads → select date. Five actions.

Target: date, party size, and time selectors in the first viewport on
every page. One action to see availability.

The hero video is the single most expensive element on this site. It
delays the answer to the only question the visitor has.

STAGE 2 — DIRECT ADVANTAGE

Stated as "none". That is the finding, and it is commercial rather
than structural.

At roughly £2 per cover, the platforms are taking a real margin for
convenience the restaurant could match. Options to escalate:
  - Direct bookers get the window tables / the terrace
  - Direct bookers can book the two "chef's counter" seats, which are
    not released to platforms at all
  - Direct bookers get 24-hour cancellation; platform bookers get 48

The second is strongest: it creates inventory that only exists
directly, which is a real reason to visit the site rather than a
discount. This needs an owner decision before the site is built,
because it determines whether direct booking has any argument at all.

STAGE 4 — UNAVAILABLE STATE

Friday 19:30 is full two weeks out. That request is the majority of
peak traffic, and currently returns "no availability".

Designed instead as a page offering, in order:
1. Same day, 17:45 or 21:30 — shown as available times, not as a
   consolation
2. Adjacent Friday, same time
3. Waitlist for the requested slot — cancellations run around 15% at
   peak, so this converts
4. The chef's counter, if the party is 2 (direct-only inventory,
   Stage 2)

Never a dead end. This page will be seen more than the successful
booking page during peak periods.

STAGE 5 — PRICE HONESTY

No prices at booking, but a £10pp deposit applies at peak. Currently
disclosed at the payment step.

Move to the time-selection step: "Friday 19:30 — £10 per person
deposit, refundable up to 24 hours before." Disclosing at payment
produces abandonment at the most expensive possible moment.

STAGE 7 — PHONE-AT-THE-DOOR

First mobile screen, no scroll:
  - Open now / closed, computed live
  - Tonight's availability, or "walk-ins from 21:00"
  - Tap-to-call
  - Address as a tap-to-navigate link

That screen serves a walk-up deciding on the pavement. It is a
different visitor from the two-weeks-ahead planner and currently the
site serves neither well.
```

## Advanced Version

Use this when direct booking share is a business priority, or where seasonal peaks make the unavailable state the dominant experience.

```text
[Stages 1-7 as above, plus:]

STAGE 8 — CHANNEL ECONOMICS
Model the true cost per booking by channel: aggregator commission
versus direct acquisition cost, including the site, the payment fees,
and the staff time handling direct enquiries.

Direct is not automatically cheaper. State the honest comparison; it
may show the aggregator is worth its commission for filling
off-peak inventory while direct should be reserved for peak.

STAGE 9 — DEMAND SHAPING
Peak sells out; off-peak is empty. What can the site do to move
demand rather than only capture it?
  - Show off-peak availability prominently when peak is full
  - Different inventory or offer off-peak
  - Make the waitlist convert into an off-peak booking

A booking site that only captures existing demand leaves the
utilisation problem entirely to operations.

STAGE 10 — POST-BOOKING
From confirmation to arrival: what does the customer need, and when?
Confirmation, reminder timing, change and cancel routes, arrival
instructions.

No-shows are a booking-site outcome, not just an operational one. A
reminder with a one-tap cancel converts a no-show into a released
table, which is worth more than the reminder costs.
```

## Related

- [website-architecture.md](website-architecture.md) — **run first**
- [marketplace-website.md](marketplace-website.md) — when the site lists many venues
- [../../industries/](../../industries/) — healthcare and regulated booking overlays
- [../../quality/accessibility/](../../quality/accessibility/) — booking flows are high-risk for accessibility defects
- [../../quality/performance/](../../quality/performance/) — availability widgets are a common performance failure
- [../../../docs/Output-Standards.md](../../../docs/Output-Standards.md) — the quality bar

## References

- [Schema.org Reservation](https://schema.org/Reservation) — structured data for bookings
- [Schema.org LocalBusiness](https://schema.org/LocalBusiness) — opening hours and location markup
- [WCAG 2.2](https://www.w3.org/TR/WCAG22/) — accessibility conformance
- [Core Web Vitals](https://web.dev/articles/vitals) — performance metrics
