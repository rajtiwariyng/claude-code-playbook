# User Research

Establish what users actually do, kept strictly separate from what they say they do.

---

## Purpose

Produce findings about user behaviour where observed action, reported preference, and stated intention are never conflated. The gap between these three is where most product mistakes originate: people accurately report their preferences and inaccurately predict their behaviour, and research that mixes the two produces confident, wrong conclusions.

## When to Use

Use this when:

- Designing or redesigning a flow and you need to know where users actually fail
- A stakeholder asserts "users want X" and the claim is load-bearing
- Planning interviews, usability sessions, or a survey and needing questions that do not lead
- Analysing existing research, support tickets, or session data

Use something else when:

| Situation | Go to |
| --- | --- |
| You need the interface designed | [core/system/ux-designer.md](../system/ux-designer.md) |
| The question is market size | [market-research.md](market-research.md) |
| The question is what competitors do | [competitor-analysis.md](competitor-analysis.md) |
| You need conformance testing | [quality/accessibility/](../../quality/accessibility/) |

> [!IMPORTANT]
> This entry helps you design research and analyse its results. It cannot substitute for talking to users. A model can tell you what questions not to ask; it cannot tell you what a user in a cold store with gloves on actually does.

## Inputs Required

| Input | Required | Notes |
| --- | --- | --- |
| `{{RESEARCH_QUESTION}}` | Yes | What decision this informs. "Learn about users" is not a research question |
| `{{USER_DESCRIPTION}}` | Yes | Context of use, not demographics |
| `{{EXISTING_EVIDENCE}}` | Yes | Support tickets, analytics, session recordings, prior research. Usually more exists than people think |
| `{{METHOD}}` | No | Interview, usability test, survey, diary study. If unsure, the workflow chooses |
| `{{CONSTRAINTS}}` | No | Access to users, timeline, budget |

## Workflow

1. **Mine existing evidence first.** Support tickets and session data are cheaper than new research and describe behaviour rather than opinion. Most teams have more than they realise.
2. **State the decision the research informs.** Research without a decision attached produces interesting findings nobody acts on.
3. **Choose the method by what you need to learn** — see the table below.
4. **Write questions that ask about the past**, never about the future. See the prompt.
5. **Separate the three categories** at the point of recording: observed, reported, predicted.
6. **Report the disagreements** between what users said and what they did. That gap is usually the finding.

### Choosing a method

| You need to learn | Method | Not |
| --- | --- | --- |
| Where users fail in a flow | Usability test, session recordings | A survey. People cannot report failures they did not notice |
| Why users do something | Interview about a specific recent instance | A survey asking "why do you…" |
| How often something happens | Analytics, diary study | An interview. Frequency recall is unreliable |
| Whether users would want X | Nothing reliable exists | Any method asking them to predict. Ship a test instead |
| What users currently use | Interview, support tickets | Assumption |

## Claude Prompt

```text
ROLE
You are a user researcher.

You maintain three strictly separate categories and never merge them:
  OBSERVED  — behaviour you or a recording actually saw
  REPORTED  — what a user said about their own past behaviour
  PREDICTED — what a user said they would do in future

You treat PREDICTED as near-worthless for decisions. People report
preferences accurately and predict their own behaviour badly. A user
saying "I would definitely use that" is evidence about their politeness
and their self-image, not about their future behaviour.

You refuse to:
- Write a question that asks a user to predict their behaviour or
  evaluate a hypothetical.
- Write a leading question, or one that names the feature you hope
  they want.
- Aggregate small-sample qualitative findings into percentages.
  "3 of 5 participants" is honest; "60% of users" is not.
- Report a finding without stating how many participants it came from
  and whether any disconfirmed it.
- Treat a feature request as a finding. A request is a user's proposed
  solution; the finding is the problem behind it.
- Present the absence of a complaint as satisfaction.

You actively look for the gap between what users said and what they
did. That gap is usually the most valuable output.

CONTEXT
Research question: {{RESEARCH_QUESTION}}
Users: {{USER_DESCRIPTION}}
Evidence available: {{EXISTING_EVIDENCE}}
Method: {{METHOD}}
Constraints: {{CONSTRAINTS}}

TASK

STAGE 1 — WHAT EXISTING EVIDENCE ALREADY ANSWERS
Before proposing new research, state what {{EXISTING_EVIDENCE}} already
establishes, and what it cannot. New research that duplicates existing
evidence is waste.

STAGE 2 — METHOD
State the method and why it fits this question. If the question cannot
be answered by asking users, say so plainly and name what would answer
it instead.

STAGE 3 — THE PROTOCOL
Questions or tasks, in order. Every question must be about a specific
past instance:
  GOOD: "Walk me through the last time you had to do X."
  BAD:  "How do you usually do X?"        (invites a generalised ideal)
  BAD:  "Would you use a feature that…?"  (asks for a prediction)

For each question, state what it is trying to learn. A question with
no stated purpose gets cut.

STAGE 4 — WHAT WOULD DISCONFIRM OUR ASSUMPTION
State the assumption behind {{RESEARCH_QUESTION}} and what observation
would show it to be wrong. Research designed only to confirm finds
confirmation.

STAGE 5 — ANALYSIS FRAME
How findings will be recorded, with the OBSERVED / REPORTED / PREDICTED
separation enforced at the point of capture rather than afterwards.
```

## Expected Output

| Element | Detail |
| --- | --- |
| Existing evidence assessment | What is already answered, and what is not |
| Method justification | Fitted to the question, not to convenience |
| Protocol | Past-instance questions with stated purposes |
| Disconfirmation criterion | What would show the assumption is wrong |
| Analysis frame | The three-category separation, enforced at capture |

It should **not** contain:

- Questions asking users to predict behaviour
- Questions naming the feature you hope they want
- Percentages derived from single-digit samples
- Feature requests reported as findings
- A protocol that cannot disconfirm anything

## Quality Checklist

- [ ] Existing evidence was mined before new research was proposed
- [ ] The research question names the decision it informs
- [ ] The method fits what needs to be learned
- [ ] Every question asks about a specific past instance
- [ ] No question asks for a prediction or evaluates a hypothetical
- [ ] No question names the feature under consideration
- [ ] Every question states what it is trying to learn
- [ ] A disconfirmation criterion is stated
- [ ] The OBSERVED / REPORTED / PREDICTED separation is enforced at capture
- [ ] Sample sizes are stated as counts, never as percentages
- [ ] Disconfirming participants are reported, not averaged away

## Common Mistakes

| Mistake | Why it happens | Fix |
| --- | --- | --- |
| Asking users to predict | It is the question you actually want answered | Predictions are unreliable. Ask about the past, or ship a test |
| Leading with the feature | You want to know if they want it | Naming it guarantees polite agreement. Ask about the problem |
| Percentages from five people | Percentages look rigorous | "3 of 5" is honest. "60%" implies a sample that does not exist |
| Treating requests as findings | They are concrete and easy to act on | A request is the user's proposed solution. The finding is the problem behind it |
| Skipping existing evidence | New research feels more rigorous | Support tickets describe real behaviour and cost nothing |
| Merging said and did | The transcript contains both | Once merged they cannot be separated. Enforce it at capture |
| Research designed to confirm | You already believe the answer | State the disconfirming observation before you start |
| Absence of complaint as satisfaction | Nobody complained | Users abandon silently far more often than they complain |
| Generalised questions | "How do you usually…" feels efficient | It produces an idealised account, not a real one |

## Example

> **Provenance:** constructed. Inputs and output demonstrate the pattern; this is not a transcript of a real run.
**Inputs**

| Input | Value |
| --- | --- |
| `{{RESEARCH_QUESTION}}` | Why do 40% of users abandon the damage-report flow at the photo step? Decision: whether to make photos optional |
| `{{USER_DESCRIPTION}}` | Warehouse supervisors, phone, gloves, cold store, frequently interrupted |
| `{{EXISTING_EVIDENCE}}` | Analytics funnel; 6 months of support tickets; no session recordings |

**Abbreviated output**

```text
STAGE 1 — EXISTING EVIDENCE

Analytics establish: abandonment concentrates at the photo step, and
abandoned sessions have a median duration of 22s before the photo step
and then stop. It does NOT establish why.

Support tickets: 14 mention photos. Reading them, 11 are variations of
"it wouldn't let me finish without a photo" and 3 are "photo upload
failed". These are different problems — one is a policy complaint, one
is a bug. The analytics funnel cannot distinguish them, and the
proposed decision (make photos optional) only addresses the first.

FINDING BEFORE ANY NEW RESEARCH: at least 3 of 14 photo-related
tickets are an upload reliability issue, not a policy issue. Check
error rates on the upload endpoint before running user research. If
upload failure is significant, the research question is wrong.

STAGE 2 — METHOD

Contextual observation in the warehouse, not interviews. The research
question is about a failure users may not consciously notice or
attribute correctly. A user who abandoned because their gloves would
not work the camera will report "the app is slow".

If warehouse access is not possible: session recordings first. Do not
substitute interviews — they will produce plausible explanations that
are not the cause.

STAGE 3 — PROTOCOL (contextual observation, 5 supervisors, 1 shift each)

| # | Task / question | Learning |
|---|-----------------|----------|
| 1 | Observe: shadow a full shift. Note every damage event, whether it was logged, and if not, why not. | Base rate of unlogged damage — the invisible denominator. Analytics only see started flows |
| 2 | On the first logging event: observe silently through to completion or abandonment. Do not assist. | Where the real failure occurs |
| 3 | Immediately after: "Talk me through what just happened there." | REPORTED account, to compare against OBSERVED |
| 4 | "Tell me about the last time you had damage and didn't log it in the app." | The abandonment case, from the past |
| 5 | "What did you do instead?" | The current alternative |
| 6 | Observe: can they operate the camera with gloves on? Ask them to try. | Direct test of the leading hypothesis |

No question asks whether photos should be optional. If we ask, they
will have an opinion, and the opinion will not predict their behaviour.

STAGE 4 — DISCONFIRMATION

Our assumption: users abandon because the photo requirement is
burdensome.

Disconfirmed if: users complete the photo step reliably when observed,
and abandonment traces instead to upload failure, interruption, or
finding the pallet ID. In that case, making photos optional would
change nothing and would degrade the claims data for no benefit.

The support ticket reading in Stage 1 already provides partial
disconfirmation. Treat the assumption as unproven.

STAGE 5 — ANALYSIS FRAME

Recorded per participant, in three columns, at the time of capture:

| OBSERVED | REPORTED | PREDICTED |
|----------|----------|-----------|
| What they did | What they said about what they did | Anything about the future — recorded but excluded from conclusions |

Conclusions may cite OBSERVED alone, or OBSERVED with REPORTED as
supporting context. No conclusion may rest on REPORTED alone, and none
may cite PREDICTED at all.

Report the OBSERVED/REPORTED gaps explicitly. Where a participant's
account differs from what was seen, that difference is a finding —
not an error to reconcile.
```

Stage 1 is the highest-value part and cost nothing: reading 14 existing tickets showed the research question may be aimed at the wrong problem. Most teams skip straight to interviews.

## Advanced Version

Use this when the research informs a significant investment, or when previous research produced findings that turned out to be wrong.

```text
[Stages 1-5 as above, plus:]

STAGE 6 — THE SILENT MAJORITY
Everyone in the study is someone who still uses the product. Those who
abandoned entirely are absent, and they are the most informative group.

State: who is systematically missing from this sample, what they would
likely say, and how you could reach even three of them. Churned-user
conversations are the hardest to arrange and the most valuable.

STAGE 7 — PRIOR RESEARCH AUDIT
Find previous research on this question. For each prior finding:
  - Did it turn out to be right?
  - If it was wrong, what was the methodological cause?
Repeating a method that previously produced a wrong answer is common
and avoidable.

STAGE 8 — THE ACTION TEST
For each planned finding, state what you would do differently
depending on the result. If a question has the same consequence under
every possible answer, cut it — it is curiosity, not research, and it
costs participant patience that the real questions need.
```

## Related

- [core/system/ux-designer.md](../system/ux-designer.md) — turning findings into design
- [market-research.md](market-research.md) — the buyer-side view
- [competitor-analysis.md](competitor-analysis.md) — what they use instead
- [core/system/research-analyst.md](../system/research-analyst.md) — the role to prepend
- [web/ui-ux/](../../web/ui-ux/) — applying findings to an interface

## References

- [Nielsen Norman Group research methods](https://www.nngroup.com/articles/which-ux-research-methods/) — method selection guidance
- [Claude Docs](https://docs.claude.com)
