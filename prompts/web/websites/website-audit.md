# Website Audit

Assess an existing site against evidence before deciding what to change.

---

## Purpose

Produce a prioritised, evidence-backed assessment of a live website, ranked by the cost of each defect rather than by how easy it is to notice. The purpose is to prevent the most common and most expensive redesign failure: rebuilding a site because it looks dated, when the actual problem was three specific pages nobody could find.

## When to Use

Use this when:

- Someone has proposed a redesign and the reason is "it looks old"
- A site underperforms and the cause is not established
- You inherited a site and need to know what you have
- Deciding between a redesign and targeted fixes

Use something else when:

| Situation | Go to |
| --- | --- |
| You have decided to rebuild and need the structure | [website-architecture.md](website-architecture.md) |
| The concern is only accessibility conformance | [../../quality/accessibility/](../../quality/accessibility/) |
| The concern is only performance | [../../quality/performance/](../../quality/performance/) |
| The concern is only search visibility | [../../growth/seo/](../../growth/seo/) |

## Inputs Required

| Input | Required | Notes |
| --- | --- | --- |
| `{{SITE_URL}}` | Yes | Plus staging, if the audit precedes a launch |
| `{{PRIMARY_CONVERSION}}` | Yes | What the site is for. Without it there is no basis to rank findings |
| `{{ANALYTICS_ACCESS}}` | Yes | Behaviour data. An audit without it is opinion |
| `{{STATED_PROBLEM}}` | Yes | What someone believes is wrong. Frequently not the actual problem |
| `{{SEARCH_CONSOLE_DATA}}` | No | Query and impression data |
| `{{SUPPORT_THEMES}}` | No | What people contact you about. Often the strongest evidence available |
| `{{CONSTRAINTS}}` | No | What cannot change — CMS, brand, budget |

## Workflow

1. **Separate the stated problem from the observed problem.** They differ often enough that treating them as the same is the primary risk in this work.
2. **Establish the conversion path from data**, not from the site map. Where visitors actually go rarely matches the intended route.
3. **Audit against the four universal standards** — accuracy, accessibility, performance, security — since each has objective criteria.
4. **Rank by cost, not by visibility.** A missing form label costs more than a dated hero image, and gets noticed less.
5. **Distinguish structural defects from surface defects.** Only structural defects justify a rebuild.
6. **Give a verdict**: targeted fixes, restructure, or rebuild — with the reason.

## Claude Prompt

```text
ROLE
You are auditing a live website against evidence.

You optimise for identifying the smallest change that fixes the
largest problem, and you accept producing an unexciting recommendation
as the cost of that.

You refuse to:
- Recommend a redesign because the site looks dated. Aesthetic age is
  a finding only when it demonstrably costs conversions.
- Report a finding without evidence. "The navigation is confusing" is
  an opinion; "62% of sessions that reach the pricing page arrive via
  site search rather than navigation" is a finding.
- Rank findings by how noticeable they are. The most visible defect
  is rarely the most expensive one.
- Accept the stated problem as the actual problem without checking.
- Produce a list of everything wrong. A ranked list of the few things
  that matter is actionable; an exhaustive list is not.
- Confuse a structural defect with a surface defect. Only structural
  defects justify a rebuild.

CONTEXT
Site: {{SITE_URL}}
Primary conversion: {{PRIMARY_CONVERSION}}
Stated problem: {{STATED_PROBLEM}}
Analytics: {{ANALYTICS_ACCESS}}
Search data: {{SEARCH_CONSOLE_DATA}}
Support themes: {{SUPPORT_THEMES}}
Constraints: {{CONSTRAINTS}}

TASK

STAGE 1 — STATED VERSUS OBSERVED
What does {{STATED_PROBLEM}} claim? What does the evidence show? State
the gap explicitly. If they agree, say so — that is useful too.

STAGE 2 — THE ACTUAL CONVERSION PATH
From analytics, not from the site map:
- Where do visitors enter?
- What is the real path to {{PRIMARY_CONVERSION}}?
- Where do they leave, and from which page?
- Which pages receive traffic but lead nowhere?
- Which pages exist and receive nothing?

STAGE 3 — STANDARDS AUDIT
Against the four universal standards. For each finding:
| Standard | Finding | Evidence | Cost if unfixed | Effort to fix |

Accuracy — stale claims, wrong prices, dead information
Accessibility — measured, not eyeballed; keyboard path walked manually
Performance — field data where available, not only lab scores
Security — exposed surfaces, missing headers, third-party scripts

STAGE 4 — STRUCTURAL VERSUS SURFACE
Classify every finding:
  SURFACE     — fixable without changing the structure
  STRUCTURAL  — requires changing information architecture or content model
Only structural defects justify a rebuild. State the count of each.

STAGE 5 — RANKED FINDINGS
Ordered by cost if unfixed, not by visibility. Each with its evidence
and its effort estimate.

STAGE 6 — VERDICT
One of:
  TARGETED FIXES  — the structure is sound; name the specific changes
  RESTRUCTURE     — the IA is wrong; the design and content can stay
  REBUILD         — both are wrong, or the platform cannot support fixes
State which findings drove the verdict. A rebuild recommendation needs
structural findings behind it, not aesthetic ones.

STAGE 7 — WHAT I COULD NOT ASSESS
The boundary. What needs data or access you did not have.
```

## Expected Output

| Element | Detail |
| --- | --- |
| Stated versus observed | The gap, stated explicitly |
| Real conversion path | From data, including dead-end and orphan pages |
| Standards findings | Each with evidence, cost, and effort |
| Structural/surface split | With counts |
| Ranked findings | By cost, not visibility |
| Verdict | One of three, with the driving findings |
| Boundary | What could not be assessed |

It should **not** contain:

- A redesign recommendation driven by aesthetics
- Findings without evidence
- An exhaustive list of everything wrong
- Rankings by visibility

## Quality Checklist

- [ ] The stated problem was tested against evidence, not assumed
- [ ] The conversion path comes from analytics, not from the site map
- [ ] Orphan pages and dead-end pages are identified
- [ ] Every finding cites specific evidence
- [ ] Accessibility was measured, and the keyboard path was walked manually
- [ ] Performance uses field data where available, not only lab scores
- [ ] Contrast was measured with a tool, not judged by eye
- [ ] Every finding is classified structural or surface
- [ ] Findings are ranked by cost if unfixed
- [ ] Each finding has an effort estimate
- [ ] The verdict is justified by structural findings if it is REBUILD
- [ ] The assessment boundary is stated

## Common Mistakes

| Mistake | Why it happens | Fix |
| --- | --- | --- |
| Redesign because it looks dated | Aesthetic age is the most visible property | Age costs nothing directly. Find the defect that costs conversions |
| Accepting the stated problem | It came from someone with authority | The stated problem and the real one differ often. Check |
| Path from the site map | The site map is available and tidy | Visitors do not follow it. Use analytics |
| Findings without evidence | Opinions are faster to produce | An opinion cannot be prioritised or defended in a budget conversation |
| Ranking by visibility | Noticeable defects feel urgent | A missing form label costs more than a dated image and is invisible |
| Exhaustive lists | Completeness feels thorough | A 90-item list gets nothing fixed. Rank and cut |
| Lab scores only | Lighthouse is easy to run | Field data reflects real users. Lab data reflects your laptop |
| No structural/surface split | Every finding feels equally real | Without it, surface defects accumulate into a rebuild recommendation they do not justify |
| Skipping orphan pages | Nobody visits them, so they seem harmless | They carry maintenance cost, dilute search, and go stale into wrongness |

## Example

**Inputs** *(constructed for illustration)*

| Input | Value |
| --- | --- |
| `{{PRIMARY_CONVERSION}}` | Quote request submitted |
| `{{STATED_PROBLEM}}` | "The site looks old and we're losing to competitors" |
| `{{ANALYTICS_ACCESS}}` | 12 months of data |

**Abbreviated output**

```text
STAGE 1 — STATED VERSUS OBSERVED

Stated: the site looks old, and that is costing business.

Observed: quote requests per session have been flat for 12 months, not
declining. Total sessions have fallen 34% year on year, concentrated
entirely in organic search. Conversion rate has not moved.

The gap is significant. This is a traffic problem, not a conversion
problem. A redesign addresses conversion and would leave the actual
cause untouched — and would likely make it worse, since a rebuild
typically loses further organic traffic through URL changes.

STAGE 2 — ACTUAL CONVERSION PATH

- 71% of sessions enter on one of four service pages, not the homepage
- The real path is: service page → quote form. Two pages. The
  homepage is not in the majority path at all
- Exits concentrate on the quote form itself: 58% of sessions
  reaching it do not submit
- Orphan pages: 23 pages received fewer than 10 sessions in 12 months,
  including six that are linked only from the footer
- Dead ends: the "Our Process" page receives 8% of traffic and links
  nowhere except back to the homepage

STAGE 3 — STANDARDS AUDIT (abbreviated)

| Standard | Finding | Evidence | Cost | Effort |
|----------|---------|----------|------|--------|
| Accessibility | Quote form has no field labels; placeholders only | Keyboard walk; screen reader announces "edit text" for all 7 fields | Form is unusable with assistive technology. Also a likely factor in the 58% form abandonment for everyone | 2 hours |
| Accuracy | Three service pages describe a service discontinued in 2024 | Content review against current offer | Enquiries for a service you cannot deliver; wasted sales time | 1 day |
| Performance | LCP 4.1s at p75 on mobile, field data | CrUX | Above the 2.5s threshold; correlates with the organic decline | 1-2 days (hero image, uncompressed) |
| Security | No CSP; three third-party scripts including one no longer in use | Header inspection | Unnecessary attack surface | 4 hours |

STAGE 4 — STRUCTURAL VERSUS SURFACE

Surface: 11 findings.
Structural: 1 — the site's navigation assumes homepage entry, while
71% of traffic enters on service pages. Service pages do not link to
each other and do not carry the trust content that lives on the
homepage.

One structural finding. That does not justify a rebuild; it justifies
adding cross-links and moving trust content onto service pages.

STAGE 5 — RANKED BY COST

1. Quote form has no labels — 2 hours, and it is the highest-traffic
   interaction on the site. Fixing it is likely to move the 58%
   abandonment rate, and it is currently an accessibility failure.
2. Organic traffic decline — needs its own investigation; the
   performance finding is a candidate cause but not established.
3. Discontinued service still described — generating unfulfillable
   enquiries.
4. LCP 4.1s mobile.
5. Service pages carry no trust content.

Note that the most expensive finding takes two hours and is invisible
to anyone looking at the site casually. Nothing in this list is
addressed by a redesign.

STAGE 6 — VERDICT

TARGETED FIXES.

The structure is sound for the actual traffic pattern with one
addition (cross-linking service pages). The stated problem — dated
appearance — does not appear anywhere in the evidence. A rebuild would
cost 8-12 weeks, risk further organic loss through URL changes, and
would not fix the form labels unless someone specifically noticed them.

Roughly three days of work addresses findings 1, 3, 4 and 5.

STAGE 7 — COULD NOT ASSESS

- The organic decline needs Search Console data, which was not
  available. Whether it is a ranking loss, an index loss, or a
  search-behaviour change is not determinable from analytics alone,
  and those have different fixes.
- No support ticket data, which would corroborate or contradict the
  form abandonment finding.
```

The finding pattern here is the point: the stated problem was cosmetic, the evidence showed a traffic problem plus a two-hour form defect, and the proposed twelve-week rebuild would have addressed neither.

## Advanced Version

Use this when a significant budget is being committed, or when previous audits produced recommendations that did not work.

```text
[Stages 1-7 as above, plus:]

STAGE 8 — THE COUNTERFACTUAL
For the top three findings, state what you expect to happen if each
is fixed, in numbers, and how you would measure it.

A finding whose fix has no predicted measurable effect is a
preference. Say so.

STAGE 9 — REBUILD COST MODEL
If a rebuild is under consideration, model honestly:
  - Build cost and duration
  - Expected organic traffic loss during and after migration
  - Time to recover to current levels
  - What is definitely lost — accumulated content, rankings, links
  - What could be achieved with the same budget spent on fixes

Rebuilds are frequently chosen because the alternative was never
costed.

STAGE 10 — PREVIOUS RECOMMENDATIONS
If earlier audits exist, check what they recommended and whether it
was done. Recommendations that were implemented and did not work are
the most informative evidence available, and they are never consulted.
```

## Related

- [website-architecture.md](website-architecture.md) — where to go if the verdict is restructure or rebuild
- [../../quality/accessibility/](../../quality/accessibility/) — the accessibility audit in depth
- [../../quality/performance/](../../quality/performance/) — the performance audit in depth
- [../../growth/seo/](../../growth/seo/) — investigating organic decline
- [../../core/research/fact-checking.md](../../core/research/fact-checking.md) — auditing site content for accuracy
- [../../../docs/Output-Standards.md](../../../docs/Output-Standards.md) — the four universal standards audited here

## References

- [WCAG 2.2](https://www.w3.org/TR/WCAG22/) — accessibility conformance
- [Core Web Vitals](https://web.dev/articles/vitals) — field performance metrics
- [Chrome UX Report](https://developer.chrome.com/docs/crux) — field data source
- [OWASP Secure Headers Project](https://owasp.org/www-project-secure-headers/) — security header reference
