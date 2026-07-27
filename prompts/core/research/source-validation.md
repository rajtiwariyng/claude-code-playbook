# Source Validation

Decide whether a source can be trusted, before you cite it.

---

## Purpose

Produce a trust verdict on a single source, with the reasoning shown. This is the check applied *before* a citation enters your work — distinct from [fact-checking.md](fact-checking.md), which audits claims in a document that already exists.

## When to Use

Use this when:

- A source is about to become load-bearing in a decision or a deliverable
- A widely-cited figure or claim traces back to one origin you have not examined
- Sources disagree and you need to know which to weight
- A source is undated, unattributed, or reached you second-hand

Use something else when:

| Situation | Go to |
| --- | --- |
| You are auditing claims in an existing document | [fact-checking.md](fact-checking.md) |
| You need to find sources, not judge one | [technical-research.md](technical-research.md) |
| You want the sourcing hierarchy explained | [docs/Research-Framework.md](../../../docs/Research-Framework.md#the-source-hierarchy) |

## Inputs Required

| Input | Required | Notes |
| --- | --- | --- |
| `{{SOURCE}}` | Yes | URL, citation, or the document itself |
| `{{CLAIM_IT_SUPPORTS}}` | Yes | What you want to cite it for. Trust is claim-specific, not absolute |
| `{{STAKES}}` | Yes | What depends on this being right |
| `{{SUBJECT_VERSION}}` | No | Which version of the thing the source describes |
| `{{ALTERNATIVES_FOUND}}` | No | Other sources on the same claim |

## Workflow

1. **State the specific claim** you want the source for. A source can be authoritative on one claim and worthless on the next.
2. **Find the origin.** Follow the citation chain until it stops. Most weak claims are strong-looking because they have been repeated, not because they were established.
3. **Check the date and the version scope.** A correct source describing v2 is a wrong source if you are on v5.
4. **Identify the incentive.** Not to dismiss the source, but to know which claims to check hardest.
5. **Verify the source says what it is cited as saying.** This fails more often than people expect.
6. **Assign a tier and a verdict** with the reasoning attached.

## Claude Prompt

```text
ROLE
You are a research analyst assessing whether a source can be trusted
for a specific claim.

You assess trust per claim, not per source. A vendor's documentation
is authoritative about their own API and unreliable about a
competitor's. The same page can be both.

You refuse to:
- Judge a source by its production quality. A well-designed page and
  a well-researched one are unrelated.
- Accept a citation chain without following it to the origin. A claim
  repeated across twenty articles has one source, not twenty.
- Treat an undated source as current.
- Dismiss a source solely for having an incentive. Incentive tells you
  which claims to check hardest, not which to discard.
- Confirm that a source supports a claim without checking what it
  actually says.

CONTEXT
Source: {{SOURCE}}
Claim I want to cite it for: {{CLAIM_IT_SUPPORTS}}
What depends on this: {{STAKES}}
Version in question: {{SUBJECT_VERSION}}
Other sources found: {{ALTERNATIVES_FOUND}}

TASK

1. ORIGIN — Does this source originate the claim, or repeat it? Follow
   the chain as far as it goes. State where it stops, and whether the
   origin is reachable. A claim whose origin is unreachable is folklore
   regardless of how many places repeat it.

2. TIER — Classify:
   1 Primary          — official docs, specification, source code, filing
   2 Authoritative    — vendor blog, maintainer talk, standards body
   3 Community        — tutorial, forum, technical blog
   4 Unattributable   — no author, no date, no traceable origin

3. CURRENCY — Publication date, last update, and the version of the
   subject it describes. State whether it predates a material change.

4. INCENTIVE — Who benefits if this claim is believed? Which specific
   claims in this source does that incentive touch?

5. DOES IT ACTUALLY SAY IT — Quote the passage supporting
   {{CLAIM_IT_SUPPORTS}}. If the source does not directly support the
   claim, say so plainly. This is the check that most often fails.

6. VERDICT — one of:
   CITE                — trustworthy for this claim
   CITE WITH SCOPE     — trustworthy, but only for a narrower claim.
                         State the narrower claim.
   CORROBORATE FIRST   — needs a second independent source
   DO NOT CITE         — with the reason

7. IF DO NOT CITE — what would be a better source, and does it exist?
```

## Expected Output

| Element | Detail |
| --- | --- |
| Origin trace | Where the claim actually starts |
| Tier | 1–4, with the reason |
| Currency | Dates plus the version scope |
| Incentive | Whose, and which claims it touches |
| Verbatim support | The quoted passage, or a statement that none exists |
| Verdict | One of four, with reasoning |

It should **not** contain:

- A verdict without a quoted passage or an explicit note that none exists
- Trust assessed for the source in general rather than for the claim
- Dismissal purely on the basis of incentive
- Acceptance of an unreachable origin

## Quality Checklist

- [ ] Trust is assessed for the specific claim, not the source generally
- [ ] The citation chain was followed to its origin, or the origin was reported unreachable
- [ ] A tier is assigned with a reason
- [ ] Publication date and last-update date are both stated, or their absence noted
- [ ] The version of the subject described is stated
- [ ] Incentive is identified and mapped to specific claims
- [ ] The supporting passage is quoted verbatim, or its absence is stated
- [ ] The verdict is one of the four defined values
- [ ] A better source is named where the verdict is DO NOT CITE

## Common Mistakes

| Mistake | Why it happens | Fix |
| --- | --- | --- |
| Judging by presentation | A polished page reads as credible | Production quality and research quality are unrelated |
| Counting repetitions as corroboration | Twenty articles feels like consensus | Twenty repetitions of one source is one source. Follow the chain |
| Not opening the citation | The citation exists, so it presumably supports the claim | A citation that does not support its claim is the most damaging failure, because it survives review |
| Treating undated as current | No date is displayed | Undated technical content should be treated as old until shown otherwise |
| Dismissing for incentive | Bias is disqualifying | Vendors are the best source on their own product. Incentive guides scrutiny, not exclusion |
| Assessing the source globally | It is easier than per-claim | The same page can be tier 1 for one claim and tier 4 for the next |
| Ignoring version scope | The claim is stated absolutely | Behaviour is version-scoped. Right about v2 is wrong about v5 |
| Accepting a "study shows" claim | It sounds rigorous | Find the study. Articles routinely misstate what studies found |

## Example

**Inputs**

| Input | Value |
| --- | --- |
| `{{SOURCE}}` | A technical blog post stating "PostgreSQL full-text search does not scale beyond one million documents" |
| `{{CLAIM_IT_SUPPORTS}}` | That PostgreSQL FTS is unsuitable for our 900k-document corpus |
| `{{STAKES}}` | Eliminating the zero-cost option and committing to a paid search service |

**Abbreviated output**

```text
1. ORIGIN
The post states the figure without citation. Searching the phrasing
finds it in at least six other posts, three of which link to a 2016
conference talk. The talk's slides do contain the figure — as a
characterisation of one specific workload (large documents, GiST
index, hardware of that era), not as a general limit.

The chain terminates at a workload-specific observation that has been
repeated as a general limit for roughly a decade.

2. TIER
Tier 3 for the post. Tier 2 for the 2016 talk (maintainer-adjacent,
conference).
No tier 1 source states any such limit. The PostgreSQL documentation
does not mention a document-count limit for full-text search.

3. CURRENCY
Post: undated. Origin talk: 2016, describing PostgreSQL 9.x.
Multiple major versions have shipped since, including significant
work on GIN index performance. The origin predates material change.

4. INCENTIVE
The blog is published by a vendor selling a hosted search product.
This does not make the claim false. It does mean the claim most
favourable to them — that the free option fails — deserves the
hardest scrutiny, which is exactly the claim in question.

5. DOES IT ACTUALLY SAY IT
The post says it. The 2016 origin does not — it describes a specific
workload's performance, with stated index type and document size. The
generalisation was introduced by the repeaters, not the origin.

Quoted from the origin slides: the figure appears alongside a stated
document size and index configuration. Neither matches ours.

6. VERDICT
DO NOT CITE.

The claim as stated is unsupported. The origin describes a different
workload on a decade-old version, and no primary source establishes
any document-count limit.

7. BETTER SOURCE
None exists for this claim, because the claim is not true as a general
proposition. The answerable question is workload-specific: index a
50k-document sample from your actual corpus, measure, extrapolate.
Roughly one day, and it produces an answer about your data rather than
someone else's.
```

Following the chain here prevented eliminating the zero-cost option on the basis of a decade-old, workload-specific observation that had hardened into folklore through repetition.

## Advanced Version

Use this when a source will be cited publicly, in regulated material, or in a document that will be scrutinised adversarially.

```text
[Steps 1-7 as above, plus:]

8. INDEPENDENT CORROBORATION
Find a second source that establishes the claim independently — not
one that cites the first. State explicitly whether independence was
verified, and how.

Two sources with a common origin are one source. This is the most
common failure in apparently well-cited work.

9. WHAT THE SOURCE OMITS
What would a reader need that this source does not provide?
Conditions, caveats, the population studied, the configuration tested.
A source can be accurate and still mislead by omission.

10. ADVERSARIAL READ
How would someone arguing the opposite position attack this citation?
If the attack succeeds, the citation is not strong enough for
adversarial use even if it is honest.

11. ARCHIVE
Capture the source as it stands today — archive URL and date. Web
sources change without notice, and a citation to a page that has since
been edited is unverifiable by anyone reading you later.
```

## Related

- [fact-checking.md](fact-checking.md) — auditing claims in an existing document
- [technical-research.md](technical-research.md) — where these sources come from
- [core/system/research-analyst.md](../system/research-analyst.md) — the role to prepend
- [docs/Research-Framework.md](../../../docs/Research-Framework.md#evaluating-a-source) — the source hierarchy
- [core/system/output-contract.md](../system/output-contract.md) — the citation discipline this supports

## References

- [Claude Docs](https://docs.claude.com)
- [W3C standards](https://www.w3.org/standards/) — example of a tier 1 source
- [IETF RFCs](https://www.rfc-editor.org/) — example of a tier 1 source
- [Internet Archive Wayback Machine](https://web.archive.org/) — capturing sources for later verification
