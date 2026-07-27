# Website Architecture

The base entry for any multi-page website. Produces the page inventory, information architecture, conversion model, and content model that every archetype entry builds on.

---

## Purpose

Produce a complete structural specification for a website before any design or code exists: what pages there are, why each one exists, how a visitor moves between them, what content model supports them, and what the site is measured on. This is the artefact that prevents the two most expensive website failures — building pages nobody needs, and discovering after launch that nothing is measurable.

## When to Use

Use this when:

- Starting any multi-page website, before design or implementation
- Restructuring an existing site whose navigation has accumulated rather than been designed
- A stakeholder has given you a page list rather than a set of goals
- Multiple audiences need to be served by one site and the structure is contested

Use something else when:

| Situation | Go to |
| --- | --- |
| The deliverable is a single conversion page | [../landing-pages/](../landing-pages/) |
| The deliverable is an internal data application | [../dashboards/](../dashboards/) |
| You are assessing an existing site before deciding what to do | [website-audit.md](website-audit.md) |
| You have the structure and need visual design | [../ui-ux/](../ui-ux/) |

## Inputs Required

| Input | Required | Notes |
| --- | --- | --- |
| `{{ORGANISATION}}` | Yes | What they do, for whom. One paragraph |
| `{{PRIMARY_CONVERSION}}` | Yes | The one action that matters most. Exactly one |
| `{{SECONDARY_CONVERSIONS}}` | Yes | Other valuable actions, ranked |
| `{{AUDIENCES}}` | Yes | Each with the job they arrive to do. Ranked by commercial value |
| `{{ENTRY_POINTS}}` | Yes | How people arrive — search, referral, direct, campaign, sales link |
| `{{EXISTING_CONTENT}}` | Yes | What exists, its quality, and who owns updating it |
| `{{CONSTRAINTS}}` | No | CMS, brand, legal, budget, timeline |
| `{{MAINTENANCE_MODEL}}` | Yes | Who updates this site, how often, with what skill |

## Workflow

1. **Rank the audiences by commercial value.** A site serving three audiences equally serves none of them well; the structure must express a priority.
2. **Define exactly one primary conversion.** If two candidates are proposed, that is a business decision to resolve now, not a structural problem to solve later.
3. **Derive pages from jobs, not from convention.** Every page must trace to an audience trying to do something. Pages that exist because sites usually have them get cut.
4. **Map the entry-point paths.** Most visitors do not arrive at the homepage. Every page that can be a first impression must work as one.
5. **Define the content model** — the repeatable types and their fields — before page design, so the CMS structure follows from content rather than from layout.
6. **Set measurement before build.** Each conversion needs a defined event. Retrofitting measurement produces data nobody trusts.

## Claude Prompt

```text
ROLE
You are an information architect and UX designer.

You optimise for a visitor completing the job they arrived to do, and
you accept a less impressive-looking site as the cost of that.

You refuse to:
- Include a page that does not trace to a specific audience doing a
  specific job. "Every site has an About page" is not a reason.
- Accept more than one primary conversion. If two are proposed, name
  the conflict and require a decision.
- Design navigation around the organisation's internal structure.
  Visitors do not know your departments and do not care.
- Produce a structure the stated maintenance model cannot sustain. A
  site with twelve content types and one part-time editor will rot.
- Assume visitors arrive at the homepage. Most do not.
- Design against placeholder content. Ask for real content or its
  realistic length, including the awkward cases.

You state which structural decisions are testable, and how.

CONTEXT
Organisation: {{ORGANISATION}}
Primary conversion: {{PRIMARY_CONVERSION}}
Secondary conversions: {{SECONDARY_CONVERSIONS}}
Audiences, ranked: {{AUDIENCES}}
Entry points: {{ENTRY_POINTS}}
Existing content: {{EXISTING_CONTENT}}
Who maintains this: {{MAINTENANCE_MODEL}}
Constraints: {{CONSTRAINTS}}

TASK

STAGE 1 — AUDIENCE AND JOB MAP
| Audience | Rank | The job they arrive to do | What convinces them | What loses them |

Ranking must reflect commercial value. If two audiences want opposite
things from the same page, say so — that conflict determines the
structure.

STAGE 2 — PAGE INVENTORY
| Page | Exists for (audience + job) | Primary action | Where they came from | Where they go next |

Every row must name an audience and a job. If you cannot, cut the page
and say why.

Then list explicitly: PAGES I DID NOT INCLUDE, and why. Conventional
pages omitted deliberately need to be visible as decisions, or someone
will add them back without thinking.

STAGE 3 — NAVIGATION
- Primary navigation: maximum 7 items. State what each contains.
- What is deliberately not in primary navigation, and where it lives.
- The path from each entry point in {{ENTRY_POINTS}} to
  {{PRIMARY_CONVERSION}}, counting clicks.
- Which pages must work as a first impression because search will land
  people there directly.

STAGE 4 — CONTENT MODEL
Repeatable content types with their fields, before any page design:
| Type | Fields | Required? | Who writes it | How often it changes |

Flag any type the maintenance model cannot sustain.

STAGE 5 — CONVERSION MEASUREMENT
| Conversion | Event | Where it fires | What a good rate looks like |

If a conversion cannot be measured, say so now. That is a structural
finding, not an analytics task for later.

STAGE 6 — WHAT I AM ASSUMING
Assumptions about audiences and behaviour that, if wrong, change the
structure. State how each could be tested.
```

## Expected Output

| Element | Detail |
| --- | --- |
| Audience map | Ranked, with jobs and conflicts named |
| Page inventory | Every page justified by audience and job |
| Omission list | Conventional pages deliberately excluded, with reasons |
| Navigation | Under 7 primary items, with entry-point paths |
| Content model | Types and fields, checked against maintenance capacity |
| Measurement plan | Per conversion, with events defined |
| Assumptions | With test methods |

It should **not** contain:

- Pages justified by convention
- More than one primary conversion
- Navigation mirroring the organisation chart
- A content model the stated maintainer cannot sustain
- Visual design decisions — those belong to [../ui-ux/](../ui-ux/)

## Quality Checklist

- [ ] Exactly one primary conversion is defined
- [ ] Audiences are ranked by commercial value, not listed equally
- [ ] Every page traces to a named audience and job
- [ ] Deliberately omitted pages are listed with reasons
- [ ] Primary navigation has 7 items or fewer
- [ ] The click path from every entry point to the primary conversion is stated
- [ ] Pages likely to be search landing pages are identified and work standalone
- [ ] The content model is defined before page design
- [ ] Every content type has a named owner and update frequency
- [ ] The content model is sustainable by the stated maintenance model
- [ ] Every conversion has a defined measurement event
- [ ] Unmeasurable conversions are flagged as structural findings
- [ ] Assumptions are separated with stated test methods

## Common Mistakes

| Mistake | Why it happens | Fix |
| --- | --- | --- |
| Starting from a page list | The client provided one | A page list is an answer to a question nobody asked. Start from jobs |
| Two primary conversions | Both matter commercially | The structure cannot optimise for both. Force the decision now, or it gets made badly by default |
| Navigation as org chart | It reflects how the business thinks | Visitors do not know your departments. Navigate by what they want to do |
| Assuming homepage entry | It is where design starts | Search sends people deep into the site. Every page is someone's first impression |
| Content model after design | Design feels more urgent | Then the CMS structure is derived from a layout, and the next layout breaks it |
| Model exceeds maintenance capacity | It is more thorough | Twelve content types and one part-time editor produces eight stale types |
| Measurement deferred | It feels like an analytics task | Retrofitted measurement produces data nobody trusts, and the site cannot be improved |
| Lorem ipsum | Real content is not ready | Convenient-length placeholder text hides every layout problem real content will cause |
| Keeping conventional pages unexamined | Removing them feels risky | A page nobody needs still costs maintenance, dilutes navigation, and gets stale |

## Example

**Inputs**

| Input | Value |
| --- | --- |
| `{{ORGANISATION}}` | Specialist recruitment firm, engineering roles, UK, 40 staff |
| `{{PRIMARY_CONVERSION}}` | Employer submits a hiring brief |
| `{{SECONDARY_CONVERSIONS}}` | Candidate registers; candidate applies to a listed role |
| `{{AUDIENCES}}` | 1. Hiring managers 2. Candidates 3. Prospective staff |
| `{{ENTRY_POINTS}}` | Job-board referral (high volume, candidates), search on role titles, direct from sales outreach |
| `{{MAINTENANCE_MODEL}}` | One marketing coordinator, half a day per week |

**Abbreviated output**

```text
STAGE 1 — AUDIENCE AND JOB MAP

| Audience | Rank | Job | Convinces | Loses |
|----------|------|-----|-----------|-------|
| Hiring manager | 1 | "Find out if these people can fill a hard role" | Evidence of placements in their specific niche; named consultants | Generic capability claims; a form that asks for budget before giving anything |
| Candidate | 2 | "See if there's a job for me" | Real listings, salary bands, fast response | Registration walls before seeing roles |
| Prospective staff | 3 | "Is this a good place to work" | — | — |

CONFLICT: candidates arrive in far higher volume via job boards but
rank second commercially. If the homepage optimises for volume it
optimises for the wrong audience. Resolution: the homepage serves
hiring managers; candidates arrive on role pages directly and never
need the homepage. This is the structural decision that shapes
everything else.

STAGE 2 — PAGE INVENTORY

| Page | Exists for | Primary action | From | To |
|------|-----------|----------------|------|-----|
| Home | Hiring manager, evaluating | Submit a brief | Sales outreach, brand search | Sector page, Brief form |
| Sector page (×4) | Hiring manager, checking niche fit | Submit a brief | Search on role titles | Brief form |
| Role listing | Candidate, job hunting | Apply | Job boards, search | Apply, Register |
| Role detail | Candidate | Apply | Job boards | Apply |
| Brief submission | Hiring manager | Submit | Home, Sector | Confirmation |
| Consultants | Hiring manager, checking credibility | Contact a named person | Sector page | Brief form |
| About | Hiring manager, due diligence | — | Direct nav | Sector |

PAGES NOT INCLUDED
- Blog. The maintenance model is half a day per week, already
  committed to role listings. A blog with three posts from 2024 is
  worse than no blog. Revisit if editorial capacity is added.
- Case studies as a separate section. Placed on sector pages instead,
  where the hiring manager already is. A separate section requires
  navigation to it, and nobody goes.
- Candidate resources / CV advice. Serves audience 2 with audience 1's
  attention budget.
- Testimonials page. Testimonials go beside the claims they support,
  not in a room of their own.

STAGE 3 — NAVIGATION

Primary (5): Sectors · Roles · Consultants · About · Submit a brief

Not in primary: Privacy, terms, careers → footer. Candidate
registration → on role pages, where candidates actually are.

Entry paths to primary conversion:
- Sales outreach → Home → Brief form. 1 click.
- Search "hire embedded engineers UK" → Sector page → Brief form. 1 click.
- Job board → Role detail. Not a path to the primary conversion, and
  should not be made into one. Do not put "Hiring? Submit a brief" on
  role pages; it is the wrong audience and it degrades the page.

Must work as a first impression: all four sector pages, every role
detail page. These receive search and referral traffic directly and
will be seen by more people than the homepage.

STAGE 4 — CONTENT MODEL

| Type | Fields | Required | Owner | Frequency |
|------|--------|----------|-------|-----------|
| Role | title, sector, salary band, location, mode, summary, requirements, consultant | All | Consultants | Daily |
| Sector | name, summary, 3 placement proofs, 2 consultants | All | Marketing | Quarterly |
| Consultant | name, photo, sector, bio, contact | All | Marketing | Rarely |

Three types, one of which updates daily and is owned by the people who
create it anyway. This fits half a day per week. A fourth type would
not.

STAGE 5 — MEASUREMENT

| Conversion | Event | Fires | Good |
|-----------|-------|-------|------|
| Brief submitted | brief_submit | Confirmation page | Track absolute count, not rate — volume is low and rates will be noisy |
| Candidate registered | candidate_register | Confirmation | — |
| Role application | role_apply | Confirmation | Per-role, to identify listings that attract views but no applications |

FINDING: "hiring manager evaluated us and decided not to submit" is
not measurable and is the majority outcome. Do not treat brief-form
conversion rate as site quality. The useful proxy is sector page →
brief form click-through.

STAGE 6 — ASSUMING

1. Hiring managers search by role title rather than by agency name.
   HIGH impact — the entire sector page structure rests on it.
   Test: check search console data for the existing site, or run
   keyword research on the four sector role titles. One day.
2. Candidates will not need the homepage. MEDIUM. Test: check current
   analytics for job-board referral landing behaviour.
3. Named consultants matter more than company credentials to this
   audience. MEDIUM — determines whether the consultants page earns
   its place. Test: ask three recent clients what they checked before
   getting in touch.
```

The Stage 1 conflict resolution is what makes this structure work. Without it, the homepage tries to serve both audiences and the higher-volume, lower-value one wins by default.

## Advanced Version

Use this for sites with genuine commercial weight — where the site is a primary sales channel, or where a restructure carries migration risk.

```text
[Stages 1-6 as above, plus:]

STAGE 7 — MIGRATION IMPACT
If this replaces an existing site:
- Every current URL: keep, redirect, or remove. Removals need a reason.
- Which current pages have inbound links or ranking that would be lost?
- What breaks for someone with a bookmark or a link in an old email?

Unplanned URL changes are the most common cause of a redesign losing
traffic, and it is discovered a month later.

STAGE 8 — FAILURE STATES
For every page: what does it look like when the content is missing,
the list is empty, the form errors, or the third party is down?

An empty role listing is the state a candidate sees on a quiet week.
It is a designed state or it is a bug.

STAGE 9 — DECAY MODEL
For each content type, what happens if nobody updates it for six
months? Which pages become actively misleading rather than merely
stale?

Pages that become wrong rather than old need either an ownership
commitment or a structural change that removes the dependency.

STAGE 10 — THE CUT TEST
If you had to remove a third of the pages, which third, and what
would be lost? A structure that cannot answer this is not prioritised,
and every page is competing with every other for attention nobody has.
```

## Related

- [website-audit.md](website-audit.md) — assessing an existing site before restructuring
- [corporate-website.md](corporate-website.md) — archetype built on this
- [saas-website.md](saas-website.md) — archetype built on this
- [../ui-ux/](../ui-ux/) — visual design, which follows this structure
- [../../core/system/ux-designer.md](../../core/system/ux-designer.md) — the role to prepend
- [../../growth/seo/](../../growth/seo/) — search structure, which depends on this IA
- [../../../docs/Output-Standards.md](../../../docs/Output-Standards.md) — the quality bar

## References

- [WCAG 2.2](https://www.w3.org/TR/WCAG22/) — accessibility conformance
- [Core Web Vitals](https://web.dev/articles/vitals) — performance metrics
- [Schema.org](https://schema.org/) — structured data vocabulary
- [Nielsen Norman Group: information architecture](https://www.nngroup.com/topic/information-architecture/) — IA research
