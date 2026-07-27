# Corporate Website

The archetype for organisations where trust is the product and the buying decision involves several people over months.

> [!IMPORTANT]
> Run [website-architecture.md](website-architecture.md) first. This entry covers only what is specific to the corporate archetype and assumes you have the page inventory, content model, and measurement plan from that entry.

---

## Purpose

Produce the structure and content strategy for a corporate site whose job is to survive due diligence. The defining constraint is that no single visitor makes the decision — a corporate site is read by a champion, a sceptic, a procurement officer, and a legal reviewer, each looking for different evidence, and it fails if it satisfies only the first.

## When to Use

Use this when:

- The buying cycle is long, involves multiple people, and includes formal procurement
- Credibility, scale, and continuity matter more than product features
- The site serves several audiences — customers, partners, investors, candidates, press
- The organisation is established and the site's job is to confirm rather than persuade

Use something else when:

| Situation | Go to |
| --- | --- |
| Conversion is self-serve and immediate | [saas-website.md](saas-website.md) |
| The work itself is the argument | [agency-website.md](agency-website.md) |
| One campaign, one goal, one page | [../landing-pages/](../landing-pages/) |
| The organisation is regulated | This entry, then [../../industries/](../../industries/) |

## Inputs Required

| Input | Required | Notes |
| --- | --- | --- |
| `{{ARCHITECTURE_OUTPUT}}` | Yes | The output of [website-architecture.md](website-architecture.md) |
| `{{BUYING_COMMITTEE}}` | Yes | Every role that touches the decision, and what each needs to see |
| `{{PROOF_ASSETS}}` | Yes | Named clients, case studies, certifications, figures you can substantiate |
| `{{CLAIMS_TO_SUBSTANTIATE}}` | Yes | Anything a legal reviewer would question |
| `{{COMPLIANCE_OBLIGATIONS}}` | Yes | Accessibility statements, privacy, sector regulation |
| `{{CONTINUITY_SIGNALS}}` | No | Years operating, staff count, offices, ownership |

## Workflow

1. **Map the buying committee**, not the persona. A corporate site is read by four people with different fears.
2. **Inventory substantiable proof.** Every credibility claim needs evidence you could produce if challenged; unsubstantiable claims are cut, not softened.
3. **Assign proof to committee members.** Different evidence convinces the champion and the procurement officer.
4. **Write for the sceptic first.** A site that convinces the sceptic also convinces the champion; the reverse is not true.
5. **Handle compliance surfaces explicitly** — accessibility statement, privacy, terms, and any sector obligations.
6. **Plan for continuity.** Corporate sites are judged partly on whether they look maintained.

## Claude Prompt

```text
ROLE
You are an information architect working on a corporate website where
the buying decision involves several people over months.

You optimise for surviving scrutiny, and you accept a less exciting
site as the cost of that.

You refuse to:
- Make a claim that cannot be substantiated if challenged. Not softened
  — removed. "Industry-leading" is not a claim, it is a liability.
- Write for a single persona. Corporate decisions are made by a
  committee whose members want contradictory things.
- Bury proof in a testimonials page. Evidence goes beside the claim it
  supports.
- Treat the About page as filler. In this archetype it is a due
  diligence surface and gets read carefully by the people who can veto.
- Omit the boring pages. Legal, accessibility, privacy, and security
  pages are read by exactly the people who can stop a deal.

You write for the sceptic on the committee. Convincing the sceptic
convinces everyone; convincing the champion convinces nobody else.

CONTEXT
Architecture: {{ARCHITECTURE_OUTPUT}}
Buying committee: {{BUYING_COMMITTEE}}
Substantiable proof: {{PROOF_ASSETS}}
Claims needing substantiation: {{CLAIMS_TO_SUBSTANTIATE}}
Compliance: {{COMPLIANCE_OBLIGATIONS}}
Continuity signals: {{CONTINUITY_SIGNALS}}

TASK

STAGE 1 — COMMITTEE MAP
| Role | What they fear | Evidence that answers it | Where it lives |

Include the person who can say no but not yes. That role is usually
unrepresented in site planning and frequently kills deals.

STAGE 2 — CLAIM AUDIT
| Claim | Substantiable? | Evidence | Verdict |
Verdict: KEEP WITH PROOF / WEAKEN TO SUPPORTABLE / CUT.

Cut anything unsubstantiable. Do not weaken it into vagueness — a
vague claim occupies space and convinces nobody.

STAGE 3 — PROOF PLACEMENT
For each page, which evidence appears and which committee member it
serves. Evidence sits beside the claim, never in a separate room.

STAGE 4 — DUE DILIGENCE SURFACES
The pages a procurement or legal reviewer will look for. What each
must contain. Mark any that are missing.

STAGE 5 — CONTINUITY
What signals that this organisation is operating and maintained? What
on this site will look abandoned in 18 months, and what prevents that?

STAGE 6 — WHAT I WOULD CHALLENGE
Read the site plan as a sceptical procurement officer. Name the three
weakest points and what would strengthen them.
```

## Expected Output

| Element | Detail |
| --- | --- |
| Committee map | Every role, its fear, and the evidence that answers it |
| Claim audit | Every claim with a keep, weaken, or cut verdict |
| Proof placement | Evidence beside claims, mapped to committee roles |
| Due diligence surfaces | The pages procurement and legal look for |
| Continuity plan | What prevents the site looking abandoned |
| Sceptical read | The three weakest points |

It should **not** contain:

- Unsubstantiable superlatives
- A testimonials page separating proof from claims
- An About page treated as filler
- Missing legal, privacy, or accessibility surfaces

## Quality Checklist

- [ ] Every role in the buying committee is mapped, including the veto role
- [ ] Every claim is substantiable, or has been cut
- [ ] No superlative appears without evidence attached
- [ ] Proof sits beside the claim it supports, not in a separate section
- [ ] The About page contains due diligence content, not filler
- [ ] Accessibility statement, privacy policy, and terms are present
- [ ] Any sector compliance obligation has a surface
- [ ] Continuity signals are present and will remain accurate
- [ ] The site is dated where dating matters, and undated where it would decay
- [ ] Meets [Output-Standards.md](../../../docs/Output-Standards.md) on accuracy, accessibility, performance, security

## Common Mistakes

| Mistake | Why it happens | Fix |
| --- | --- | --- |
| Writing for one persona | Personas are the standard tool | Corporate decisions are committee decisions. Map the committee |
| Ignoring the veto role | They are not the customer | Legal, security, and procurement can stop a deal and cannot start one |
| Unsubstantiable superlatives | They feel like table stakes | They convince nobody and expose you if challenged. Cut them |
| Testimonials page | It groups the proof tidily | Nobody navigates to it. Evidence belongs beside the claim |
| About page as filler | It feels like a formality | It is a due diligence surface, and it is read |
| Skipping legal surfaces | They are not marketing | They are read by the people who can say no |
| Undated content that ages | Dates feel like clutter | "Trusted by 200 clients" with no date decays into a lie |
| Design that cannot be maintained | It looks impressive at launch | A corporate site that looks abandoned reads as an organisation in trouble |

## Example

> **Provenance:** constructed. Inputs and output demonstrate the pattern; this is not a transcript of a real run.
**Inputs**

| Input | Value |
| --- | --- |
| `{{BUYING_COMMITTEE}}` | Operations director (champion), IT security lead (veto), procurement (veto), finance |
| `{{PROOF_ASSETS}}` | 3 named client case studies, ISO 27001, 11 years operating, 2 UK offices |
| `{{CLAIMS_TO_SUBSTANTIATE}}` | "Market-leading uptime", "trusted by hundreds", "fastest onboarding in the sector" |

**Abbreviated output**

```text
STAGE 1 — COMMITTEE MAP

| Role | Fears | Evidence | Where |
|------|-------|----------|-------|
| Operations director | Being blamed if it fails | Named case studies in their sector, with outcomes | Sector page |
| IT security lead | Introducing risk | ISO 27001, security page, data residency, incident process | Security page — currently missing |
| Procurement | Supplier collapse; contract risk | 11 years, filed accounts, offices, standard terms available | About + Legal |
| Finance | Unclear total cost | Transparent pricing structure or explicit "how we price" | Pricing approach page |

The IT security lead has no surface on the current plan. They cannot
approve the purchase, but they can stop it, and they will look for a
security page within the first two minutes. This is the highest-priority
gap in the plan.

STAGE 2 — CLAIM AUDIT

| Claim | Substantiable? | Evidence | Verdict |
|-------|---------------|----------|---------|
| "Market-leading uptime" | No — no benchmark, no comparison data | — | CUT |
| "Trusted by hundreds" | Partially — client count is real, "trusted" is not measurable | Client count | WEAKEN: state the number and the date |
| "Fastest onboarding in the sector" | No — no comparative data exists | — | CUT |
| ISO 27001 certified | Yes — certificate | Certificate number, scope, expiry | KEEP WITH PROOF |
| 11 years operating | Yes — filed accounts | Companies register | KEEP WITH PROOF |

Two of five headline claims cut. What replaces them is the specific
version: a stated client count with a date, and a stated onboarding
duration you can meet. Specific and modest outperforms superlative and
unsupported with this audience.

STAGE 4 — DUE DILIGENCE SURFACES

| Surface | Present? | Must contain |
|---------|----------|-------------|
| Security | MISSING | Certification scope, data residency, breach process, sub-processors |
| Accessibility statement | MISSING | Conformance level, known limitations, contact route |
| Privacy | Present | Lawful basis, retention, transfers, rights |
| Terms | Not published | Either publish, or state they are available on request |
| Company details | Partial | Registered number, registered address, VAT number |

STAGE 6 — WHAT I WOULD CHALLENGE

1. No security page. The veto role has nowhere to go and will ask by
   email, adding two weeks to the cycle at best.
2. Case studies name clients but state no outcomes. "We worked with X"
   is a logo; "we reduced X's processing time from 4 days to 6 hours"
   is evidence. Get outcome permission or the case studies are decoration.
3. "11 years operating" appears once, in the footer. It is the
   strongest continuity signal available and it is hidden.
```

## Advanced Version

Use this when the site supports enterprise or public-sector sales, where formal supplier assessment is part of the process.

```text
[Stages 1-6 as above, plus:]

STAGE 7 — SUPPLIER ASSESSMENT READINESS
Enterprise and public-sector buyers run a formal supplier assessment.
For each item they typically request, state whether the site answers
it, and where:
  security posture · data processing and residency · sub-processors ·
  business continuity · insurance · financial standing · accessibility
  conformance · modern slavery or equivalent statements ·
  environmental policy

Every item the site cannot answer becomes an email exchange that adds
days. Rank by how often each is asked.

STAGE 8 — THE PROCUREMENT READ
Read every page as a procurement officer whose job is to find reasons
to reject. Report what they would flag, and whether each flag is
fixable by content or requires a business change.

STAGE 9 — CLAIM DEFENSIBILITY
For every remaining claim, state what you would produce if a
competitor challenged it to a regulator or advertising authority. A
claim you would not want to defend should not be published.
```

## Related

- [website-architecture.md](website-architecture.md) — **run first**; provides structure this builds on
- [agency-website.md](agency-website.md) — when the work is the argument
- [../../business/company-profile/](../../business/company-profile/) — the document form of this material
- [../../industries/](../../industries/) — regulated-sector constraint overlays
- [../../quality/accessibility/](../../quality/accessibility/) — the accessibility statement's substance
- [../../../docs/Output-Standards.md](../../../docs/Output-Standards.md#content-standards) — claim substantiation rules

## References

- [WCAG 2.2](https://www.w3.org/TR/WCAG22/) — accessibility conformance
- [Schema.org Organization](https://schema.org/Organization) — structured data for corporate entities
- [Core Web Vitals](https://web.dev/articles/vitals) — performance metrics
