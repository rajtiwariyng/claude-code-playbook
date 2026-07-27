# Market Research

Establish whether demand exists, who has it, and what they currently do instead — with the confidence of each number stated honestly.

---

## Purpose

Produce a sized, sourced view of a market opportunity where every figure carries its derivation and its confidence. Market sizing is the area where fabricated precision does the most damage: a number with three significant figures and no provenance gets into a board deck and becomes a commitment.

## When to Use

Use this when:

- Deciding whether to enter a market or build for a segment
- A business case needs a size figure that will survive scrutiny
- You need to know what the alternative to your product actually is
- Preparing an investor or budget narrative

Use something else when:

| Situation | Go to |
| --- | --- |
| The question is about specific competitors | [competitor-analysis.md](competitor-analysis.md) |
| The question is what individual users do | [user-research.md](user-research.md) |
| You need the deck built from findings | [business/presentations/](../../business/presentations/) |
| You need the proposal, not the research | [business/proposal/](../../business/proposal/) |

## Inputs Required

| Input | Required | Notes |
| --- | --- | --- |
| `{{MARKET_DEFINITION}}` | Yes | Who, doing what, where. Vague definitions produce meaningless numbers |
| `{{GEOGRAPHY}}` | Yes | Market size is geography-scoped. Global figures are usually useless |
| `{{DECISION_IT_INFORMS}}` | Yes | Determines required precision. A go/no-go needs less than a budget |
| `{{PRICE_POINT}}` | Yes | Or a range. Without it, revenue sizing is impossible |
| `{{TIME_HORIZON}}` | No | Default: current year |
| `{{KNOWN_DATA}}` | No | Internal data you already have. Usually the most reliable input available |

## Workflow

1. **Define the market as a set of buyers**, not as a category. "UK construction subcontractors with 1–20 employees who invoice more than 10 times a month" is a market. "The invoicing software market" is a category.
2. **Find the population count** from official statistics — government, regulator, industry body. This is the one number that can be genuinely authoritative.
3. **Build bottom-up before top-down.** Bottom-up from population and price is auditable. Top-down from an analyst report is not.
4. **State every assumption in the calculation** with its own confidence.
5. **Identify the current alternative** — including spreadsheets, paper, and doing nothing, which are the most common competitors and the least analysed.
6. **Give ranges, not points.** A point estimate implies precision the method does not have.

## Claude Prompt

```text
ROLE
You are a research analyst sizing a market for a decision.

You refuse to:
- State a market size without showing the calculation that produced it.
  A number without a derivation is not a finding.
- Cite an analyst report figure as authoritative. Report the figure, its
  source, its publication date, and its stated methodology. If the
  methodology is not stated, say so — that is a finding about the figure.
- Give a point estimate where the method supports only a range.
- Apply a growth rate you cannot source.
- Ignore "does nothing" and "uses a spreadsheet" as alternatives. They
  are usually the largest competitor and the least examined.
- Present TAM as if it were addressable. Most of TAM is not reachable
  by anyone.

You build bottom-up from a countable population wherever possible,
because bottom-up can be audited and top-down cannot.

You state the confidence of every input separately from the confidence
of the result. A calculation with one weak input produces a weak
result regardless of how solid the others are.

CONTEXT
Market: {{MARKET_DEFINITION}}
Geography: {{GEOGRAPHY}}
Price point: {{PRICE_POINT}}
Horizon: {{TIME_HORIZON}}
Decision this informs: {{DECISION_IT_INFORMS}}
Data we already have: {{KNOWN_DATA}}

TASK

STAGE 1 — POPULATION
How many buyers exist, from official statistics? Cite the source, the
date, and the definition it uses. If the official definition differs
from {{MARKET_DEFINITION}}, state the gap and how you bridged it.

STAGE 2 — BOTTOM-UP SIZING
Show the calculation, one line per step, each with its confidence:
  Population × addressable share × conversion × price = figure
State the range, not a point. Show what drives the range's width.

STAGE 3 — TOP-DOWN CROSS-CHECK
If analyst or industry figures exist, report them with source, date,
and methodology. Compare against Stage 2. If they disagree by more
than 2x, that disagreement is the finding — do not average them.

STAGE 4 — THE CURRENT ALTERNATIVE
What do these buyers do today? Include doing nothing, spreadsheets,
paper, and an in-house tool. For each, what would make them switch,
and what makes switching hard?

STAGE 5 — CONFIDENCE STATEMENT
For each number produced: what would have to be true for it to be
wrong by 2x? By 10x? A number whose 10x error case is plausible
should not be used for a budget.

STAGE 6 — WHAT WOULD SETTLE IT
The cheapest research that would materially narrow the range. Usually
this is talking to 10 buyers, not reading more reports.
```

## Expected Output

| Element | Detail |
| --- | --- |
| Population count | From official statistics, with the definition used |
| Bottom-up calculation | Every step shown, every input's confidence stated |
| Top-down cross-check | With methodology, or a note that none is stated |
| Current alternatives | Including doing nothing |
| Error analysis | What makes each number wrong by 2x and 10x |
| Narrowing experiment | The cheapest way to improve the estimate |

It should **not** contain:

- A size figure without a shown derivation
- A point estimate presented as precise
- An analyst figure cited without its methodology
- TAM presented as reachable revenue
- An unsourced growth rate

## Quality Checklist

- [ ] The market is defined as a set of buyers, not a category
- [ ] Population comes from an official statistical source, cited and dated
- [ ] Any gap between the official definition and yours is stated
- [ ] The bottom-up calculation is shown step by step
- [ ] Every input carries its own confidence
- [ ] Results are ranges, with the driver of the range's width named
- [ ] Any analyst figure reports its methodology, or notes that none is stated
- [ ] Top-down and bottom-up disagreements are reported, not averaged
- [ ] "Does nothing" and "spreadsheet" are analysed as alternatives
- [ ] The 2x and 10x error cases are stated
- [ ] No growth rate is applied without a source

## Common Mistakes

| Mistake | Why it happens | Fix |
| --- | --- | --- |
| Category instead of buyer set | Categories are easier to name | "The X market is $Y billion" tells you nothing about who will pay you |
| Citing an analyst headline figure | It is authoritative-sounding and free | Without methodology it is unauditable. Report the methodology or the absence of one |
| Point estimates | They look decisive | Precision the method cannot support is a lie that gets into a budget |
| Averaging conflicting estimates | It feels balanced | Two estimates disagreeing by 5x means at least one method is broken. Find out which |
| Ignoring "does nothing" | It is not a company, so it is not a competitor | It is usually the largest one, and the hardest to displace |
| TAM as revenue | It is the biggest number available | Most of TAM cannot be reached by anyone. SOM is the number that matters |
| Unsourced growth rates | "Growing at 20% annually" sounds plausible | Compound an unsourced rate over five years and the error dominates everything |
| Skipping the error analysis | The numbers already feel uncertain | Naming the 10x case is what tells you whether the number can carry a budget |

## Example

**Inputs**

| Input | Value |
| --- | --- |
| `{{MARKET_DEFINITION}}` | UK construction subcontractors, 1–20 employees, CIS-registered, invoicing 10+ times monthly |
| `{{GEOGRAPHY}}` | United Kingdom |
| `{{PRICE_POINT}}` | £15–25/month |
| `{{DECISION_IT_INFORMS}}` | Whether to commit two engineers for a quarter |

*Figures below are illustrative of the method; the derivations are the point, not the numbers.*

**Abbreviated output**

```text
STAGE 1 — POPULATION

Official CIS registration statistics give a count of registered
subcontractors. That figure includes sole traders with no employees
and companies well above 20 employees, so it is a ceiling rather than
the target population.

Bridging: business population statistics by employment size band allow
an approximate split within construction. The bands do not align
exactly with 1-20, so the bridge introduces error. Stated as a range,
not a point.

CONFIDENCE: Population ceiling — HIGH (official, current).
            Bridged 1-20 subset — MEDIUM (band mismatch).

STAGE 2 — BOTTOM-UP

| Step | Value | Confidence | Basis |
|------|-------|-----------|-------|
| CIS-registered subcontractors | Official figure | HIGH | Cited |
| × share in 1-20 employee band | ~55-70% | MEDIUM | Band bridge, see Stage 1 |
| × share invoicing 10+/month | 30-50% | LOW | No source found. This is the weakest input |
| × realistic 3-yr penetration | 1-3% | LOW | Comparable-category assumption |
| × £15-25/mo × 12 | — | HIGH | Our price |

The range spans roughly an order of magnitude. It is driven almost
entirely by the two LOW inputs — invoicing frequency and penetration.
The population figure, which is the most reliable, contributes least
to the uncertainty. Sharpening the population estimate would not
help; establishing invoicing frequency would.

STAGE 3 — TOP-DOWN CROSS-CHECK

Two industry reports give UK construction software figures. Neither
states its methodology, and both use a category definition that
includes project management and estimating software — a different
market. Reported here for completeness; not usable as a cross-check.

FINDING: no usable top-down comparison exists. That is itself
information about how well-understood this segment is.

STAGE 4 — CURRENT ALTERNATIVE

| Alternative | Est. share | Switching trigger | Switching friction |
|-------------|-----------|-------------------|--------------------|
| Paper / Word templates | Large, unquantified | An HMRC problem, or a client demanding structured invoices | Low cost, high habit |
| Spreadsheet | Large | Volume outgrows it | Sunk effort, own formulas |
| General accounting software | Moderate | — | Already paid for; CIS handled by accountant |
| Accountant does it | Moderate | Accountant raises fees | Relationship, not software |

The most important row is the last one. Where an accountant handles
invoicing, the buyer is not the subcontractor. This may make a large
part of the apparent population unreachable through direct sales, and
it was not visible in the sizing calculation at all.

STAGE 5 — CONFIDENCE

Wrong by 2x: very plausible. Either LOW input moving within its stated
range does it.

Wrong by 10x: plausible. If most CIS subcontractors in this band have
their invoicing done by an accountant, the reachable market is a small
fraction of the calculated figure.

CONCLUSION ON USABILITY: this estimate can support a go/no-go on a
one-quarter experiment. It cannot support a revenue forecast or a
hiring plan.

STAGE 6 — WHAT WOULD SETTLE IT

Talk to 10 subcontractors in the band and 3 accountants who serve them.
Two questions: how often do you invoice, and who prepares it? That
resolves both LOW inputs and the accountant question. Roughly a week,
and it would narrow the range more than any further desk research.
```

Stage 4's final row is the finding — a structural fact about who the buyer is, invisible in the arithmetic, that could invalidate the whole opportunity. Sizing that only produces numbers misses these.

## Advanced Version

Use this when the research supports a funding decision, a hiring plan, or an external commitment.

```text
[Stages 1-6 as above, plus:]

STAGE 7 — SEGMENT DECOMPOSITION
Break the population into three segments by willingness to pay and
ease of reach. Size each separately.

Aggregate market sizes hide the fact that one segment is usually most
of the reachable value. Report which segment carries the opportunity
and what fraction of the total it represents.

STAGE 8 — THE PESSIMISTIC CASE
Rebuild the sizing using the low end of every range and the least
favourable interpretation of every assumption.

If the pessimistic case still justifies the decision, the range's
width does not matter and further research is waste. If it does not,
state which single assumption most needs resolving — that is where
the research budget goes.

STAGE 9 — DISCONFIRMING EVIDENCE
What would you expect to observe if this market did not exist as
described? Check for it specifically.

Common signals: competitors who entered and left; a segment that
churns; a solved-by-adjacent-tool pattern. Report what you looked
for and what you found, including finding nothing.
```

## Related

- [competitor-analysis.md](competitor-analysis.md) — who already serves this market
- [user-research.md](user-research.md) — the buyer conversations Stage 6 calls for
- [core/system/research-analyst.md](../system/research-analyst.md) — the role to prepend
- [business/proposal/](../../business/proposal/) — using sizing in a proposal
- [docs/Research-Framework.md](../../../docs/Research-Framework.md) — confidence labelling

## References

- [Claude Docs](https://docs.claude.com)
- [OECD statistics](https://data.oecd.org/) — cross-country official statistics
- [Eurostat](https://ec.europa.eu/eurostat) — European official statistics
- [UK Office for National Statistics](https://www.ons.gov.uk/) — example of a national statistical authority
