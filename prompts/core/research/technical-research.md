# Technical Research

Establish the real capabilities, limits, and trade-offs of a technology before committing to it.

---

## Purpose

Produce a sourced, gap-aware assessment of one or more technologies against a specific decision. The output distinguishes what the vendor documents from what the community reports from what you are inferring — so a reader can act on it without repeating the work.

## When to Use

Use this when:

- Choosing between libraries, services, databases, or vendors
- You need to know a real limit, quota, or guarantee before designing around it
- Documentation and folklore disagree, and the difference matters
- A decision rests on a technical claim nobody has verified

Use something else when:

| Situation | Go to |
| --- | --- |
| You need the decision made, not the evidence | [core/system/software-architect.md](../system/software-architect.md) |
| The object of research is a company | [competitor-analysis.md](competitor-analysis.md) |
| You are auditing an existing document | [fact-checking.md](fact-checking.md) |
| You need to judge one source's trustworthiness | [source-validation.md](source-validation.md) |

## Inputs Required

| Input | Required | Notes |
| --- | --- | --- |
| `{{QUESTION}}` | Yes | Determinate. "What are the delivery guarantees of X?" not "Which queue is best?" |
| `{{CANDIDATES}}` | Yes | The specific technologies and versions. Versions matter — behaviour is version-scoped |
| `{{DECISION_IT_INFORMS}}` | Yes | Sets required precision |
| `{{DEAL_BREAKERS}}` | Yes | Constraints that eliminate a candidate outright. Check these first |
| `{{SCALE}}` | No | Your actual load. Most vendor benchmarks assume a different one |
| `{{EXISTING_STACK}}` | No | What you already run. Often dominates the decision |

## Workflow

1. **Check deal-breakers first.** Eliminating candidates before deep research saves most of the work. A candidate that fails a hard constraint needs no benchmark.
2. **Establish the documented behaviour** from primary sources only — vendor documentation, specifications, source code.
3. **Establish the undocumented behaviour** separately. What the community reports, clearly labelled as such.
4. **Find the conflicts.** Where documentation, release notes, and community reports disagree, that disagreement is a finding.
5. **Identify what only testing resolves.** Some questions cannot be answered by reading. Name them and estimate the test.
6. **Report gaps before findings**, so the reader calibrates before they read.

## Claude Prompt

```text
ROLE
You are a research analyst evaluating technology for a specific decision.

You separate KNOWN (primary source, cited), REPORTED (secondary source,
cited, flagged), INFERRED (your reasoning, shown), and UNKNOWN (with
what would establish it).

You refuse to interpolate across a gap, to resolve a source conflict
you cannot resolve honestly, or to state a version, limit, or guarantee
without a citation. You treat absence of documentation as a finding.

CONTEXT
Question: {{QUESTION}}
Candidates: {{CANDIDATES}}
Decision this informs: {{DECISION_IT_INFORMS}}
Deal-breakers: {{DEAL_BREAKERS}}
Our scale: {{SCALE}}
Existing stack: {{EXISTING_STACK}}

TASK

STAGE 1 — ELIMINATION
Check each candidate against the deal-breakers. Eliminate what fails,
with the citation that proves it fails. Do not research eliminated
candidates further.

STAGE 2 — GAPS AND CONFLICTS (before findings)
- What could not be established from primary sources?
- Where do sources disagree? Cite both, with dates.
- What can only be resolved by testing? Estimate the test.

STAGE 3 — FINDINGS
Per surviving candidate, a table:
| Property | Value | Label | Source | Version | Checked |

Cover at minimum: the guarantees relevant to {{DECISION_IT_INFORMS}},
hard limits, failure behaviour, and operational requirements.

STAGE 4 — WHAT THE DOCUMENTATION DOES NOT SAY
For each candidate, what did you expect to find documented and could
not? Undocumented behaviour is a risk that does not appear in a
feature comparison, and it is usually the thing that hurts later.

STAGE 5 — BOUNDARY
What you did not check, and what would change the picture.

Do not recommend. This establishes what is true; the decision is
separate and belongs to someone with context you do not have.
```

## Expected Output

| Element | Detail |
| --- | --- |
| Eliminations | Candidates ruled out, with the citation proving it |
| Gaps and conflicts | Before findings, with resolution paths |
| Per-candidate findings | Labelled, cited, version-scoped, dated |
| Documentation absences | What is not documented, per candidate |
| Research boundary | What was not checked |

It should **not** contain:

- A recommendation
- A feature-comparison grid with checkmarks and no sources
- Version-agnostic claims
- Marketing language reproduced from vendor pages
- A resolved conflict where the resolution was a guess

## Quality Checklist

- [ ] Deal-breakers were checked before deep research
- [ ] Gaps and conflicts appear before findings
- [ ] Every value carries KNOWN / REPORTED / INFERRED
- [ ] Every KNOWN cites a primary source
- [ ] Every claim states the version it applies to
- [ ] Every volatile claim carries the date checked
- [ ] Source conflicts are reported, not resolved
- [ ] Undocumented behaviour is called out per candidate
- [ ] Two citations were opened and confirmed
- [ ] No recommendation is made
- [ ] The research boundary is stated

## Common Mistakes

| Mistake | Why it happens | Fix |
| --- | --- | --- |
| Researching before eliminating | Thoroughness feels right | A candidate that fails a hard constraint needs no benchmark. Eliminate first |
| Accepting the vendor comparison page | It is convenient and looks factual | Vendors compare against a version and configuration that favours them |
| Ignoring version scope | Docs do not emphasise it | Behaviour is version-scoped. Correct for v2 is wrong for v5 |
| Treating a feature grid as research | It looks decisive | Checkmarks hide the conditions under which the feature works |
| Skipping the undocumented-behaviour question | Nothing prompts it | Undocumented behaviour is what hurts in production, and it never appears in a comparison |
| Asking for a recommendation | It is what you actually want | Mixing evidence and decision means you cannot audit either. Separate them |
| Using vendor benchmarks at your scale | They are published and specific | They assume a scale and configuration. Ask what was measured, on what |
| Not checking the existing stack | It feels like a separate concern | What you already operate frequently dominates a technical comparison |

## Example

> **Provenance:** constructed. Inputs and output demonstrate the pattern; this is not a transcript of a real run.
**Inputs**

| Input | Value |
| --- | --- |
| `{{QUESTION}}` | Can we run full-text search in PostgreSQL, or do we need a dedicated search engine? |
| `{{CANDIDATES}}` | PostgreSQL 16 built-in FTS; OpenSearch 2.x; Typesense 27 |
| `{{DECISION_IT_INFORMS}}` | Search for a 900k-document knowledge base, 30 concurrent users |
| `{{DEAL_BREAKERS}}` | No new managed service spend above $200/mo; must be operable by 4 engineers with no dedicated ops |
| `{{SCALE}}` | 900k docs, ~40 GB, ~2k searches/day |

**Abbreviated output**

```text
STAGE 1 — ELIMINATION

OpenSearch — NOT eliminated, but the deal-breaker is close. Managed
AWS OpenSearch smallest production-viable configuration exceeds
$200/mo at multi-AZ. Single-node is under budget but has no
availability guarantee. [AWS OpenSearch pricing], checked 2026-07-27.
Flagging rather than eliminating: single-node may be acceptable.

Typesense — NOT eliminated. Self-hosted is free; Typesense Cloud
starts under budget at this scale. [Typesense pricing], checked
2026-07-27.

PostgreSQL FTS — NOT eliminated. No additional spend.

STAGE 2 — GAPS AND CONFLICTS

GAP 1 — PostgreSQL FTS ranking quality at 900k documents cannot be
established from documentation. Ranking relevance is workload-specific.
Only testing resolves this. Test: index a 50k-document sample, run 30
real queries, have someone who knows the content rate the top 5
results. Roughly one day.

GAP 2 — No primary source establishes PostgreSQL FTS query latency at
this corpus size. Community reports vary by two orders of magnitude
because they do not state index type, query shape, or hardware.

CONFLICT — Community sources commonly state PostgreSQL FTS "does not
scale past ~1M documents". No primary source supports this figure, and
the PostgreSQL documentation states no such limit. The figure appears
to propagate between blog posts. Treat as folklore, not a limit.

STAGE 3 — FINDINGS

PostgreSQL 16 FTS
| Property | Value | Label | Source | Version | Checked |
|----------|-------|-------|--------|---------|---------|
| Index type | GIN or GiST; GIN faster to query, slower to build | KNOWN | [PG textsearch indexes] | 16 | 2026-07-27 |
| Stemming | Built-in, ~20 languages via snowball | KNOWN | [PG dictionaries] | 16 | 2026-07-27 |
| Typo tolerance | Not built in; requires pg_trgm and a separate query path | KNOWN | [PG pgtrgm] | 16 | 2026-07-27 |
| Ranking | ts_rank / ts_rank_cd, TF-IDF-like, not tunable per field without manual weighting | KNOWN | [PG ranking] | 16 | 2026-07-27 |
| Faceting | No native support; requires manual aggregate queries | INFERRED — absence in docs across the FTS chapter | — | 16 | 2026-07-27 |

[Typesense and OpenSearch tables omitted for brevity]

STAGE 4 — WHAT THE DOCUMENTATION DOES NOT SAY

PostgreSQL: no guidance on index maintenance cost at scale. GIN index
updates are documented as deferrable via fastupdate, but the
operational consequence at 900k documents with steady writes is not
characterised anywhere primary. This is the operational risk.

Typesense: memory requirements are stated as "dataset must fit in RAM"
but no formula relates document count and field configuration to RAM.
At 40 GB of source documents this is the deciding unknown, and it is
not answerable from documentation.

STAGE 5 — BOUNDARY

Not checked: Meilisearch, Elasticsearch, Algolia. Not checked: any
latency figures — none are establishable without testing. Not checked:
whether your documents have structure that would favour faceting,
which would change the assessment materially.
```

The CONFLICT entry is the highest-value finding: a widely-repeated "limit" with no primary source behind it, which would otherwise have eliminated the cheapest option.

## Advanced Version

Use this when the choice is expensive to reverse — a datastore, a vendor with migration cost, a technology the team will build expertise around.

```text
[Stages 1-5 as above, plus:]

STAGE 6 — EXIT COST
For each surviving candidate: what does leaving it cost in 18 months?
Consider data migration, API surface you will have built against,
operational knowledge, and contractual commitment. An option whose
exit cost compounds is worse than its current properties suggest.

STAGE 7 — MATURITY SIGNALS
For each candidate, report and cite:
- Release cadence over the last 24 months
- Whether breaking changes have shipped in minor versions
- Number of maintainers with commit access in the last 12 months
- Whether there is a documented security disclosure process
- Time from CVE publication to patch, for the last two CVEs

These predict maintenance burden better than feature lists do. Report
"could not establish" where you cannot — an unfindable disclosure
process is itself a finding.

STAGE 8 — THE TEST THAT WOULD SETTLE IT
Name the single cheapest experiment that would resolve the largest
remaining unknown. State: what to build, how long, and what result
would change the answer. Research that ends by naming a one-day test
is more useful than research that ends with more reading.
```

## Related

- [core/system/research-analyst.md](../system/research-analyst.md) — the role this entry uses
- [source-validation.md](source-validation.md) — judging the sources this research finds
- [core/system/software-architect.md](../system/software-architect.md) — making the decision from these findings
- [docs/Research-Framework.md](../../../docs/Research-Framework.md) — the sourcing hierarchy
- [core/planning/](../planning/) — planning from the decision

## References

- [Claude Docs](https://docs.claude.com)
- [Semantic Versioning 2.0.0](https://semver.org/) — reading version claims correctly
- [CVE program](https://www.cve.org/) — vulnerability disclosure records
