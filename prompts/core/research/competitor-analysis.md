# Competitor Analysis

Establish what competitors actually do, from observable evidence, and what it implies for your decisions.

---

## Purpose

Produce an evidence-based analysis of competitors grounded in what can be observed — their pricing pages, their product, their public statements, their hiring — rather than in assumptions about their strategy. The output separates observation from inference, because the two get confused constantly in competitive work and the confusion drives bad decisions.

## When to Use

Use this when:

- Positioning a product, pricing it, or deciding what to build next
- A stakeholder asserts "competitor X does Y" and the claim is load-bearing
- Entering a market you do not know well
- Preparing a sales or investor narrative that references competitors

Use something else when:

| Situation | Go to |
| --- | --- |
| The question is market size and demand | [market-research.md](market-research.md) |
| The question is what your users do | [user-research.md](user-research.md) |
| You need a technology comparison | [technical-research.md](technical-research.md) |
| You need the sales narrative built | [business/sales/](../../business/sales/) |

> [!WARNING]
> Do not use this to gather information through deception, credential misuse, or violation of a competitor's terms of service. Everything in this entry works from publicly available material. If a finding requires misrepresenting who you are to obtain it, it is out of scope here.

## Inputs Required

| Input | Required | Notes |
| --- | --- | --- |
| `{{COMPETITORS}}` | Yes | Named, with URLs. Three to five. More produces a survey, not an analysis |
| `{{DECISION_IT_INFORMS}}` | Yes | Pricing, roadmap, positioning. Determines what to look at |
| `{{YOUR_POSITION}}` | Yes | What you do and for whom. Without it, comparison has no axis |
| `{{SEGMENT}}` | Yes | Which customer segment. Competitors differ per segment |
| `{{OBSERVABLE_SOURCES}}` | No | Their site, docs, changelog, pricing, job postings, filings, app stores |
| `{{DATE}}` | Yes | Everything here is perishable. Date the analysis |

## Workflow

1. **Confirm they are competitors for the same job.** Two products in the same category often serve different jobs, and comparing them produces noise.
2. **Gather observables only** — pricing pages, public documentation, changelogs, job postings, filings, app store listings, status pages.
3. **Separate observation from inference at the point of writing.** Once mixed, they cannot be unmixed by a reader.
4. **Look for what is absent.** A feature nobody has, a segment nobody serves, a price point nobody occupies.
5. **Date everything.** Competitive analysis is stale within a quarter, and undated analysis gets cited a year later.
6. **State the implication, not the recommendation.** "They have moved upmarket" is a finding; "we should too" is a decision.

## Claude Prompt

```text
ROLE
You are a research analyst studying competitors from public evidence.

You separate OBSERVED (something publicly verifiable, with a link and
a date) from INFERRED (your reasoning from observations, with the
reasoning shown) from UNKNOWN (not establishable from public sources).

You refuse to:
- State a competitor's strategy, roadmap, or internal reasoning as fact.
  You cannot observe intent. You can observe behaviour and infer from it,
  labelled as inference.
- Report a feature comparison without stating the plan, tier, or
  configuration it applies to. "They have SSO" is meaningless without
  "on the $$$ Enterprise tier only".
- Reproduce marketing claims as findings. "Industry-leading" is an
  observation about their copy, not about their product.
- Infer company health from headcount, funding, or hiring alone. These
  are weak signals that get treated as strong ones.
- Use any information that would require deception or terms-of-service
  violation to obtain.

You look for absences as hard as you look for presences. The segment
nobody serves and the price point nobody occupies are findings.

CONTEXT
Our position: {{YOUR_POSITION}}
Segment: {{SEGMENT}}
Competitors: {{COMPETITORS}}
Decision this informs: {{DECISION_IT_INFORMS}}
Sources: {{OBSERVABLE_SOURCES}}
Analysis date: {{DATE}}

TASK

STAGE 1 — SAME JOB?
For each competitor, state the job the customer hires them for. If it
differs from ours, say so — they may not be a competitor for this
decision even if they are in the same category.

STAGE 2 — OBSERVED
Per competitor, a table. Every row needs a source link and a date.
| Dimension | Observation | Source | Checked |

Cover, at minimum, whatever bears on {{DECISION_IT_INFORMS}}. For
pricing, always state the tier and what gates each capability.

STAGE 3 — ABSENCES
What does nobody do? Which segment is unserved? Which price point is
empty? Which integration does nobody offer? State whether the absence
looks deliberate or like an opening — and say which you cannot tell.

STAGE 4 — INFERRED
Your reasoning from the observations, each with the observations it
rests on. Label clearly. Include the confidence and what would
disconfirm it.

STAGE 5 — UNKNOWN
What matters for this decision that public sources cannot establish?
For each, state what would establish it — a customer conversation, a
trial, a support interaction.

STAGE 6 — IMPLICATIONS
What these findings mean for {{DECISION_IT_INFORMS}}. State
implications, not recommendations. The decision belongs to someone
with context you do not have.
```

## Expected Output

| Element | Detail |
| --- | --- |
| Job-to-be-done check | Whether each is actually a competitor here |
| Observations | Linked, dated, tier-specific |
| Absences | What nobody does, and whether it reads as opening or dead end |
| Inferences | Labelled, with the observations they rest on |
| Unknowns | With what would resolve them |
| Implications | Not recommendations |

It should **not** contain:

- Claims about a competitor's strategy or roadmap stated as fact
- Feature comparisons without tier or plan
- Marketing copy reproduced as findings
- Undated observations
- A recommendation

## Quality Checklist

- [ ] Each competitor's job-to-be-done was checked against yours
- [ ] Every observation has a source link and a date
- [ ] Every pricing or feature claim names the tier it applies to
- [ ] Observation, inference, and unknown are visibly separated
- [ ] Every inference states the observations it rests on
- [ ] Absences were analysed, not just presences
- [ ] No claim about internal strategy is stated as fact
- [ ] Marketing language is quoted as copy, not reported as capability
- [ ] The analysis is dated
- [ ] Unknowns state what would resolve them
- [ ] No source required deception or terms-of-service violation

## Common Mistakes

| Mistake | Why it happens | Fix |
| --- | --- | --- |
| Feature-grid analysis | It is easy to produce and looks rigorous | Checkmarks hide tier, configuration, and quality. A row that says "SSO ✓" for both is usually false |
| Inferring strategy from behaviour | Patterns invite explanation | You cannot observe intent. Label it inference and state confidence |
| Reproducing marketing claims | They are on the page, in their words | Their copy is evidence about their positioning, not about their product |
| Comparing across different jobs | Same category, so it feels comparable | Two products in a category can serve different jobs. Check first |
| Undated analysis | The date feels like metadata | It gets cited a year later as current. Date it prominently |
| Ignoring absences | Presences are easier to enumerate | The unoccupied position is usually the finding that matters |
| Treating funding as health | It is public and numeric | Funding measures investor belief at a point in time, not current health |
| Analysing ten competitors | Completeness feels safer | Ten produces a survey nobody reads. Three to five produces an analysis |
| Stating recommendations | It is the obvious next step | Mixing evidence and decision means neither can be audited |

## Example

**Inputs**

| Input | Value |
| --- | --- |
| `{{YOUR_POSITION}}` | Invoicing tool for UK construction subcontractors, 1–20 employees |
| `{{SEGMENT}}` | Sole traders and small subcontractors, not main contractors |
| `{{COMPETITORS}}` | Three named products (anonymised here as A, B, C) |
| `{{DECISION_IT_INFORMS}}` | Whether to build CIS deduction handling, and how to price |
| `{{DATE}}` | 2026-07-27 |

*Inputs are constructed for illustration; the pattern is what matters.*

**Abbreviated output**

```text
STAGE 1 — SAME JOB?

A — Same job. General small-business invoicing, used by trades.
B — DIFFERENT job. Positioned for main contractors managing
    subcontractor payments — the buyer is the payer, not the invoicer.
    Their pricing and onboarding assume a finance team. Not a
    competitor for this decision; excluded from Stages 2-4.
C — Same job, narrower. Trades-specific, quoting-first.

Excluding B changes the picture materially. Two comparators, not three.

STAGE 2 — OBSERVED

Competitor A
| Dimension | Observation | Source | Checked |
|-----------|-------------|--------|---------|
| Entry price | £12/mo, 1 user, 20 invoices/mo cap | [pricing page] | 2026-07-27 |
| CIS deductions | Available on "Plus" (£28/mo) and above only | [pricing page, feature table] | 2026-07-27 |
| CIS depth | Marketing says "CIS ready". Help docs describe deduction calculation but no monthly CIS300 return export | [help centre article] | 2026-07-27 |
| Mobile | iOS and Android; 3.9★ iOS, most recent 1★ reviews cite offline sync | [App Store listing] | 2026-07-27 |

Competitor C
| Dimension | Observation | Source | Checked |
|-----------|-------------|--------|---------|
| Entry price | £19/mo, unlimited invoices | [pricing page] | 2026-07-27 |
| CIS deductions | Not mentioned anywhere on site or in docs | [site search, docs search] | 2026-07-27 |
| Positioning | Quoting → job → invoice. Invoicing is the last step, not the product | [homepage, product tour] | 2026-07-27 |

STAGE 3 — ABSENCES

- Neither offers CIS300 monthly return generation. Both handle the
  deduction arithmetic; neither closes the loop with HMRC.
  Cannot tell whether this is deliberate (it is a regulated filing
  and support burden) or an opening. This distinction matters and
  is listed as an unknown below.

- No product at this segment prices below £12/mo. The sole trader
  invoicing under 10 times a month is unserved by everyone examined.

- Neither has an offline-first mobile experience. A's 1★ reviews
  cluster on exactly this, and construction sites have poor signal.

STAGE 4 — INFERRED

INFERENCE 1 (moderate confidence) — A gates CIS behind their middle
tier because it is their trades-segment upsell hook, not because it
is expensive to run.
  Rests on: CIS appears in the Plus tier feature table alongside two
  other trades-specific features; entry tier is otherwise
  full-featured for general invoicing.
  Disconfirmed by: finding CIS in their entry tier historically, or
  a support article indicating it was moved.

INFERENCE 2 (low confidence) — C is not targeting CIS-liable
subcontractors at all.
  Rests on: total absence of CIS language, quoting-first positioning.
  Disconfirmed by: a customer story featuring a CIS subcontractor.
  Low confidence because absence from marketing is weak evidence
  about capability.

STAGE 5 — UNKNOWN

1. Whether A's CIS handling is actually adequate for a subcontractor's
   real workflow. Help docs describe the calculation but not the
   monthly return. RESOLVE: 14-day trial, run a real CIS scenario end
   to end. Half a day.

2. Why nobody does CIS300 returns. Deliberate avoidance of a regulated
   filing, or a gap? RESOLVE: ask an accountant who serves this
   segment what they currently do for these clients. One conversation.
   This is the highest-value unknown — it determines whether the
   absence is an opportunity or a warning.

3. Actual retention or satisfaction for either. Not publicly
   observable. App store ratings are a biased sample.

STAGE 6 — IMPLICATIONS

For the CIS build decision: the deduction arithmetic is table stakes —
A has it and gates it. The differentiating question is the CIS300
return, and whether its absence across the market is a deliberate
avoidance of regulated filing. Unknown 2 should be resolved before
committing engineering time; it is one conversation and it determines
the answer.

For pricing: the sub-£12 sole-trader segment is unoccupied. Whether
that is because it is unprofitable or unserved is not establishable
from public sources.
```

Excluding competitor B in Stage 1 is the move that makes this analysis useful. A feature grid comparing all three would have averaged two different jobs together and produced conclusions about neither.

## Advanced Version

Use this when the analysis supports a significant commitment — a pricing change, a major build, an investor narrative.

```text
[Stages 1-6 as above, plus:]

STAGE 7 — CHANGE OVER TIME
Where archived versions of their site or documentation are available,
report what changed over the last 12–24 months. Pricing changes,
positioning changes, features added or quietly removed.

Trajectory is more informative than a snapshot. A competitor moving
upmarket, and one moving down, look identical in a point-in-time
comparison and imply opposite things.

State the archive source and dates. Where no archive exists, say so.

STAGE 8 — THE STEELMAN
For your strongest competitor, write the two-paragraph case for why a
customer in {{SEGMENT}} should choose them over us. Make it the
strongest honest version.

Then: which part of that case is hardest to answer? That is the real
competitive position, and it is usually not the one in the feature grid.

STAGE 9 — WHAT WOULD MAKE THIS ANALYSIS WRONG
Name the specific discovery that would invalidate the implications in
Stage 6. State when you would expect to see it and where you would
look. Analysis that cannot be wrong is not analysis.
```

## Related

- [market-research.md](market-research.md) — sizing the opportunity these findings suggest
- [user-research.md](user-research.md) — what your users actually do about it
- [core/system/research-analyst.md](../system/research-analyst.md) — the role to prepend
- [business/sales/](../../business/sales/) — using competitive findings in sales material
- [docs/Research-Framework.md](../../../docs/Research-Framework.md) — sourcing and confidence labels

## References

- [Claude Docs](https://docs.claude.com)
- [Jobs to be Done](https://hbr.org/2016/09/know-your-customers-jobs-to-be-done) — the framing used in Stage 1
