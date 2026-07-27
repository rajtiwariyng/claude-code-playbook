# Output Contract

The universal deliverable contract. Prepend it to any task to make honesty structural rather than optional.

---

## Purpose

Establish a standing agreement about how output must be constructed: facts sourced, assumptions separated and risk-rated, gaps declared rather than filled, and confidence labelled consistently. This is the single most reusable block in the repository — it applies to code, documents, designs, and analysis alike, and it is what converts "sounds right" into "checkable".

## When to Use

Use this when:

- The output will be relied on by someone who cannot easily verify it
- The task requires facts you cannot check quickly yourself
- You have previously been burned by a confident, plausible, wrong answer
- You are defining standing rules for a project in `CLAUDE.md`

Use something else when:

| Situation | Go to |
| --- | --- |
| You need the perspective, not the contract | [role-composition.md](role-composition.md) |
| You need a full research workflow, not a contract | [core/research/](../research/) |
| You need the standards this contract enforces | [docs/Output-Standards.md](../../../docs/Output-Standards.md) |
| The task is throwaway and you will verify everything anyway | Skip it — the contract costs output length |

## Inputs Required

| Input | Required | Notes |
| --- | --- | --- |
| `{{RISK_THRESHOLD}}` | No | Number of HIGH-risk assumptions that triggers a stop. Default: 3 |
| `{{VERIFICATION_SOURCES}}` | No | Which sources count as authoritative here. Default: official vendor documentation |
| `{{DOMAIN_CONSTRAINTS}}` | No | Regulatory or contractual accuracy requirements |

## Workflow

1. **Prepend the contract** to your task prompt, or place it in `CLAUDE.md` for project-wide effect.
2. **Read the Assumptions section first** when output arrives — before the deliverable. Assumptions determine whether the deliverable is worth reading.
3. **Resolve HIGH-risk assumptions** before acting on anything downstream of them.
4. **Spot-check two cited facts.** Not all of them — two. If both hold, the citation discipline is working; if either fails, verify everything.
5. **Treat declared gaps as findings**, not as failures. A stated gap tells you exactly what to go and check.

## Claude Prompt

```text
OUTPUT CONTRACT

This contract governs everything you produce in response to this request.
It takes precedence over the task instructions if they conflict.

FACTS
- Every version number, API signature, CLI flag, configuration key,
  limit, price, or statistic must be traceable to {{VERIFICATION_SOURCES}}.
- If you cannot trace it, label it UNVERIFIED and state what you would
  need to check.
- Never state a fact with confidence you do not have. Confidence and
  correctness are unrelated, and I cannot tell them apart by reading.

ASSUMPTIONS
Before the deliverable, output an Assumptions section as a table:

| # | Assumption | Risk | If wrong |

Risk is LOW, MEDIUM, or HIGH based on how much the deliverable changes
if the assumption fails. "If wrong" states the concrete consequence and
rough cost to correct.

Include assumptions you consider obvious. Those are the ones that go
unchallenged, and therefore the ones that cause damage.

If more than {{RISK_THRESHOLD}} assumptions are HIGH risk, stop and ask
instead of producing the deliverable.

GAPS
Where you lack information, say so explicitly and state what would
resolve it. Do not fill a gap with a plausible substitute. A declared
gap is useful to me; an invented fill is a defect I will not detect.

CONFIDENCE LABELS
Use exactly these, consistently:
  Verified       — primary source, cited
  Documented     — secondary source, cited
  Common practice— widely done, not specified anywhere
  Estimate       — derived, with the method stated
  Unverified     — could not confirm
  Opinion        — judgement, not fact

Never drop a label in a later revision. An estimate stays an estimate.

SCOPE
Deliver what was asked. If you believe the request is wrong, say so in
two sentences, then deliver it anyway under stated assumptions. Do not
silently substitute a different deliverable, and do not silently
expand scope.

COMPLETENESS
If part of the task is blocked, complete every other part and state
plainly what you left out and why. Partial delivery with a clear
boundary beats a complete-looking deliverable with a hidden hole.
```

## Expected Output

Output under this contract has a consistent shape:

| Order | Section | Contains |
| --- | --- | --- |
| 1 | Assumptions | Table with risk ratings and consequences |
| 2 | The deliverable | What was asked for |
| 3 | Gaps | What could not be determined, and what would resolve it |
| 4 | Sources | Citations for factual claims |

It should **not** contain:

- Facts stated without a label or a source
- Assumptions woven into prose
- A gap silently filled with something plausible
- A different deliverable than the one requested, substituted without saying so

## Quality Checklist

- [ ] An Assumptions section exists and precedes the deliverable
- [ ] Every assumption has a risk rating and a stated consequence
- [ ] At least one assumption is listed — a task with zero assumptions almost certainly has unstated ones
- [ ] Every version, limit, and API shape carries a source or an UNVERIFIED label
- [ ] Confidence labels are drawn from the defined set, used consistently
- [ ] Gaps are declared rather than filled
- [ ] Two cited facts spot-checked and confirmed
- [ ] The deliverable matches what was requested in scope and form
- [ ] Anything omitted is stated explicitly, with the reason

## Common Mistakes

| Mistake | Why it happens | Fix |
| --- | --- | --- |
| Reading the deliverable before the assumptions | The deliverable is what you wanted | Assumptions decide whether the deliverable means anything. Read them first |
| Accepting "no assumptions were made" | It reads as confidence | Every non-trivial task involves assumptions. Zero means they went unexamined |
| Treating a declared gap as a failure | It looks incomplete | A gap is a finding. It tells you precisely what to verify |
| Letting an estimate become a fact | The qualifier gets dropped when content moves between documents | Keep labels attached through every revision, especially into slides |
| Checking every citation, then giving up | It is exhausting, so the discipline lapses entirely | Spot-check two. Escalate only if one fails |
| Putting the contract after the task | It reads as an afterthought | Contract first. Instructions after a long task compete with everything above them |
| Using it for throwaway work | Thoroughness feels virtuous | It lengthens output. On work you will verify anyway, it costs more than it returns |

## Example

> **Provenance:** constructed. Inputs and output demonstrate the pattern; this is not a transcript of a real run.
**Task:** "What are the rate limits on the payment provider's refund endpoint, and how should we handle them?"

**Abbreviated output under the contract**

```text
ASSUMPTIONS

| # | Assumption | Risk | If wrong |
|---|------------|------|----------|
| 1 | You are on the standard plan, not enterprise | HIGH | Enterprise limits differ; the whole retry design changes |
| 2 | Refunds are issued from your backend, not client-side | MEDIUM | Client-side changes where limiting applies |
| 3 | You can tolerate up to 60s of refund latency | LOW | Would rule out exponential backoff |

Assumption 1 is HIGH and unresolved. The answer below assumes standard
plan; confirm before implementing.

FINDINGS

Rate limit: 100 requests/minute per API key on the standard plan.
  Verified — [provider limits documentation], checked 2026-07-27.

429 responses include a Retry-After header in seconds.
  Verified — same source.

Refunds are idempotent when an Idempotency-Key is supplied.
  Verified — [provider idempotency documentation], checked 2026-07-27.

Typical recovery pattern is exponential backoff with jitter.
  Common practice — not specified by the provider.

GAPS

Whether the limit is a fixed window or sliding window is not documented.
This changes burst behaviour materially. Resolve by testing against
the sandbox, or by asking provider support.

RECOMMENDATION
[deliverable follows]
```

Note what this output does that an uncontracted answer would not: it stops you before you build a retry strategy on the wrong plan's limits, and it tells you exactly which undocumented behaviour to go and test.

## Advanced Version

Use this when the output will be published, relied on by third parties, or is expensive to correct — T4 work in [Thinking-Framework.md](../../../docs/Thinking-Framework.md#four-effort-tiers). It adds a self-audit pass that is deliberately hostile to the deliverable just produced.

```text
[Full output contract above, then:]

SELF-AUDIT

After producing the deliverable, run a separate audit pass on it.
Adopt the position of a reviewer whose job is to prevent this from
shipping, and who is measured on defects that reach production rather
than on being agreeable.

Report:

1. CLAIM AUDIT — every factual claim in a table:
   | Claim | Label used | Source | Does the source actually say this? |
   The last column is the point. A citation that does not support the
   claim is worse than no citation, because it survives review.

2. ASSUMPTION AUDIT — which assumptions did I fail to declare?
   Re-read the deliverable looking for unstated premises.

3. WEAKEST LINK — the single claim most likely to be wrong, and why.

4. WHAT WOULD CHANGE THE CONCLUSION — the specific fact that, if
   different, invalidates the recommendation.

Do not revise the deliverable to make the audit pass. Report honestly.
An audit that finds nothing on a non-trivial deliverable has not been
run properly — say so rather than manufacturing findings, but check
again first.
```

The instruction not to revise is what keeps this from becoming self-justification. An audit that is permitted to fix as it goes produces a clean audit report and an unchanged defect count.

## Related

- [role-composition.md](role-composition.md) — pairs with this; role sets perspective, contract sets standards
- [project-constitution.md](project-constitution.md) — making this contract permanent via `CLAUDE.md`
- [research-analyst.md](research-analyst.md) — the role that most benefits from this contract
- [docs/Research-Framework.md](../../../docs/Research-Framework.md) — the sourcing hierarchy referenced here
- [docs/Output-Standards.md](../../../docs/Output-Standards.md) — the standards this enforces
- [docs/Thinking-Framework.md](../../../docs/Thinking-Framework.md) — when the advanced version is warranted

## References

- [Claude prompt engineering guide](https://docs.claude.com/en/docs/build-with-claude/prompt-engineering/overview)
- [Claude Code memory](https://docs.claude.com/en/docs/claude-code/memory) — placing the contract in `CLAUDE.md`
