# Fact Checking

Audit the claims in an existing document, per claim, with verdicts you can act on.

---

## Purpose

Produce a claim-by-claim verdict on a document that already exists — yours or someone else's — before it is published, relied on, or acted upon. This is the counterpart to [source-validation.md](source-validation.md): that entry judges a source before you cite it, this one audits claims after they are written.

## When to Use

Use this when:

- A document is about to be published, sent to a client, or filed
- You inherited a document and do not know how much to trust it
- A deck or proposal contains numbers whose origin nobody can name
- Documentation is suspected of having gone stale

Use something else when:

| Situation | Go to |
| --- | --- |
| You are judging one source's trustworthiness | [source-validation.md](source-validation.md) |
| You need to establish facts, not check them | [technical-research.md](technical-research.md) |
| The document needs rewriting, not checking | [core/system/technical-writer.md](../system/technical-writer.md) |
| You need a code review | [core/system/code-reviewer.md](../system/code-reviewer.md) |

## Inputs Required

| Input | Required | Notes |
| --- | --- | --- |
| `{{DOCUMENT}}` | Yes | The full text. Excerpts hide claims that depend on context |
| `{{AUTHORITATIVE_SOURCES}}` | Yes | What counts as primary for this subject matter |
| `{{STAKES}}` | Yes | Published externally, regulated, internal. Sets the bar |
| `{{SUBJECT_VERSIONS}}` | No | Which product or spec versions the document should describe |
| `{{AS_OF_DATE}}` | No | The date the document should be accurate as of. Default: today |

## Workflow

1. **Extract every claim before checking any.** Checking as you read causes you to skip the familiar-sounding ones, which are exactly the ones that survive review while being wrong.
2. **Classify each claim** by type — a version number, a statistic, and an opinion need different treatment.
3. **Check in tier order**, primary sources first.
4. **Verify quoted and cited support verbatim.** A citation that does not support its claim is the most damaging defect, because it looks checked.
5. **Report per claim** with a verdict, not as a rewritten document.
6. **Fix in a separate pass.** A checker that fixes as it goes produces a clean document and no record of how wrong it was.

## Claude Prompt

```text
ROLE
You are a fact checker auditing a document before it is relied upon.

You extract every claim before checking any of them. Checking while
reading causes familiar-sounding claims to be skipped, and those are
precisely the wrong ones that survive review.

You refuse to:
- Rewrite the document. You report. A rewritten document hides how many
  claims were wrong, and the count is the information.
- Skip a claim because it sounds obviously true. Obvious-sounding wrong
  facts are the ones that reach publication.
- Accept a citation without confirming the source says what is claimed.
- Mark something VERIFIED on the basis of a secondary source.
- Treat a specific number as more reliable than a vague one. Specificity
  is a rhetorical property, not an epistemic one — "41.3%" and "about
  40%" are equally likely to be invented.

You check what the document implies as well as what it states. A true
sentence placed to suggest something false is a defect.

CONTEXT
Authoritative sources: {{AUTHORITATIVE_SOURCES}}
Stakes: {{STAKES}}
Should be accurate for versions: {{SUBJECT_VERSIONS}}
Accurate as of: {{AS_OF_DATE}}

TASK

STAGE 1 — EXTRACTION
List every factual claim in document order. Do not check any yet.
A claim is anything that could be true or false: numbers, versions,
capabilities, causes, attributions, comparisons, and any sentence
containing "always", "never", "all", or "only".

Report the count. A document with 60 claims and 4 checked is a
different situation from one with 6 claims.

STAGE 2 — CLASSIFICATION
Per claim: FACTUAL (checkable), OPINION (not checkable, must be marked
as opinion in the document), PREDICTION (not checkable, must be marked
as such), or IMPLICATION (not stated but strongly suggested).

STAGE 3 — VERDICTS
Per FACTUAL claim, a row:
| # | Claim | Verdict | Source | Note |

Verdicts:
  VERIFIED      — primary source confirms it. Cite it.
  LIKELY        — secondary source only. Cite it, flag the tier.
  UNVERIFIED    — no source found. Not the same as false.
  CONTRADICTED  — a source says otherwise. Cite it. State what is correct.
  STALE         — was true, is no longer. State when it changed.
  MISCITED      — the document's own citation does not support the claim.
  UNVERIFIABLE  — not the kind of claim that can be checked.

STAGE 4 — IMPLICATIONS
Claims the document does not state but leads a reader to conclude. For
each, is the implication supported? A document of individually true
sentences can still mislead.

STAGE 5 — SEVERITY
Rank the problems by consequence if published as-is, not by how wrong
they are. A minor error in a headline figure outranks a major error in
a footnote.

STAGE 6 — WHAT I COULD NOT CHECK
The boundary. Claims you could not resolve, and what would resolve them.

Do not fix anything. Report only.
```

## Expected Output

| Element | Detail |
| --- | --- |
| Claim inventory | Every claim, in document order, with a count |
| Classification | Factual, opinion, prediction, implication |
| Per-claim verdicts | With sources and corrections |
| Implication audit | What the document leads a reader to conclude |
| Severity ranking | By consequence of publication, not by degree of wrongness |
| Boundary | What could not be checked |

It should **not** contain:

- A rewritten document
- Verdicts on a sample of claims presented as an audit of all of them
- VERIFIED assigned on secondary-source evidence
- Claims skipped for sounding obviously true

## Quality Checklist

- [ ] Every claim was extracted before any was checked
- [ ] The total claim count is reported
- [ ] Each claim carries one of the seven defined verdicts
- [ ] Every VERIFIED cites a primary source
- [ ] Every citation in the document was opened and confirmed
- [ ] MISCITED claims are identified explicitly
- [ ] Version scope was checked, not just truth
- [ ] Opinions and predictions are identified as needing labels in the document
- [ ] Implications were audited, not only statements
- [ ] Severity reflects consequence of publication
- [ ] The unchecked boundary is stated
- [ ] Nothing was rewritten

## Common Mistakes

| Mistake | Why it happens | Fix |
| --- | --- | --- |
| Checking while reading | It feels efficient | Familiar-sounding claims get skipped. Extract first, check second |
| Skipping obvious claims | They are obviously true | Obvious-sounding wrong facts are the ones that survive every review |
| Trusting the document's own citations | They look like evidence of checking | MISCITED is a common and high-severity finding. Open every one |
| Fixing while checking | The fix is right there | You get a clean document and no defect count, so you never learn how bad it was |
| Equating specific with reliable | "41.3%" reads as researched | Specificity is rhetorical. Invented numbers are often precise |
| Ignoring implications | They are not stated | A set of true sentences can construct a false impression. That is still a defect |
| Sampling claims | Checking all of them is slow | A sampled audit reported as a full one is worse than no audit |
| Severity by wrongness | It is the intuitive ranking | A small error in a headline number does more damage than a large one in an appendix |

## Example

> **Provenance:** constructed. Inputs and output demonstrate the pattern; this is not a transcript of a real run.
**Inputs**

| Input | Value |
| --- | --- |
| `{{DOCUMENT}}` | A one-page technical comparison prepared for a client, recommending a stack |
| `{{AUTHORITATIVE_SOURCES}}` | Vendor documentation and official release notes |
| `{{STAKES}}` | Sent to a client as the basis for a build decision |

**Abbreviated output**

```text
STAGE 1 — EXTRACTION
23 factual claims extracted from a one-page document. Reported here
because the density matters: a one-page comparison making 23 checkable
claims is making a claim roughly every two sentences.

STAGE 3 — VERDICTS (abbreviated to the consequential ones)

| # | Claim | Verdict | Source | Note |
|---|-------|---------|--------|------|
| 3 | "Framework X reached LTS in 2025" | CONTRADICTED | [official release schedule] | It entered LTS in a different year. The document's timeline argument depends on this |
| 7 | "Y handles 10,000 requests/second" | MISCITED | — | The document cites a vendor benchmark page. That page states a figure for a different configuration and hardware class. The number is real; the attribution is not |
| 11 | "Z has no official Windows support" | STALE | [Z installation docs] | True until a release two versions ago. Windows support is now documented |
| 14 | "Most teams migrate within 6 months" | UNVERIFIED | — | No source found. Phrasing implies research. Either cite or remove |
| 16 | "X is faster than Y" | UNVERIFIABLE | — | No workload, metric, or configuration stated. Not checkable as written |
| 19 | "Y's licence permits commercial use" | VERIFIED | [licence text] | Confirmed |

Summary: 23 claims — 9 VERIFIED, 4 LIKELY, 5 UNVERIFIED, 2 CONTRADICTED,
1 STALE, 1 MISCITED, 1 UNVERIFIABLE.

STAGE 4 — IMPLICATIONS

IMPLICATION 1 — The document places claim 3 (LTS date) next to claim
11 (no Windows support) in a paragraph about maturity. Individually,
one is wrong and one is stale. Together they construct an impression
that Z is less mature than it is. Correcting both individually does
not fully correct the impression; the paragraph needs restructuring.

IMPLICATION 2 — No claim states that the recommended option has a
smaller ecosystem, but the comparison omits ecosystem entirely. For a
client build decision, that omission is material. Not a false claim —
an absent one.

STAGE 5 — SEVERITY (by consequence of sending as-is)

1. Claim 7 (MISCITED) — HIGHEST. It is the headline performance figure
   and it is attributed to a source that does not support it. If the
   client checks the link, credibility on the entire document is gone.
2. Claim 11 (STALE) — a factually wrong disqualifier against an option
   the client may prefer. This could drive the wrong decision.
3. Implication 1 — compounds items 1 and 2.
4. Claim 3 (CONTRADICTED) — wrong, but the argument survives correction.
5. Claim 14 (UNVERIFIED) — reads as researched. Remove or cite.

STAGE 6 — COULD NOT CHECK
- Claim 21 depends on the client's internal deployment constraints,
  which are not stated in the document and not available to me.
- Two pricing claims: vendor pricing pages require authentication for
  the tier described. Verify with the vendor directly before sending.
```

The MISCITED finding is the one this workflow exists for. The number was real and the source was real; only the link between them was false — and that is invisible to a reader who trusts citations, and fatal to a reader who checks one.

## Advanced Version

Use this for anything published externally, filed with a regulator, or presented as expert analysis.

```text
[Stages 1-6 as above, plus:]

STAGE 7 — ADVERSARIAL READ
Read as someone whose interest is in discrediting this document.

- Which single claim would they attack first, and would the attack succeed?
- Which claim is most load-bearing — where does the argument collapse
  if one claim falls?
- Which omission would they characterise as deliberate?

A document survives adversarial reading when its weakest claim is
non-load-bearing. Report whether that is true here.

STAGE 8 — PROVENANCE TRACE
For the three most consequential numbers: trace each to its origin, not
just to its citation. Where did this number first appear, who produced
it, and by what method?

Numbers acquire authority through repetition. A figure repeated across
a decade of documents may have originated as one team's internal
estimate.

STAGE 9 — CONSISTENCY AUDIT
Check the document against itself. Do any two claims contradict? Do
any figures fail to sum? Does the conclusion follow from the findings
as stated, or from a stronger version of them?

Internal inconsistency is the cheapest defect for a reader to find and
the most damaging to credibility, because it needs no external source.
```

## Related

- [source-validation.md](source-validation.md) — judging a source before citing it
- [technical-research.md](technical-research.md) — establishing the facts this audits against
- [core/system/research-analyst.md](../system/research-analyst.md) — the role to prepend
- [core/system/output-contract.md](../system/output-contract.md) — preventing these defects at the point of writing
- [docs/Research-Framework.md](../../../docs/Research-Framework.md) — the verification workflow

## References

- [Claude Docs](https://docs.claude.com)
- [Internet Archive Wayback Machine](https://web.archive.org/) — checking what a source said when it was cited
