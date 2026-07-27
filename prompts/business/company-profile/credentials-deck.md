# Credentials Deck

The presented form of your company profile — built for a room, not for reading.

> [!IMPORTANT]
> Slide construction, narrative arc, and deck mechanics are owned by [../presentations/](../presentations/). This entry covers only what is specific to a credentials deck: what changes when profile material is presented rather than read.

---

## Purpose

Adapt company profile material into a deck that works when someone is talking over it. The defining constraint is that a credentials deck has two incompatible jobs — supporting a live presentation and being forwarded afterwards to people who were not there — and a deck built well for one fails at the other. This entry resolves that conflict explicitly rather than producing a document that does neither.

## When to Use

Use this when:

- Presenting to a prospect, panel, or partner who expects slides
- A tender includes a presentation stage after a written submission
- Onboarding a channel partner who must represent you to their clients
- Existing slides are your profile document pasted into a template

Use something else when:

| Situation | Go to |
| --- | --- |
| The material will be read, not presented | [company-profile-document.md](company-profile-document.md) |
| You need general deck construction and narrative | [../presentations/](../presentations/) |
| The deck is asking for investment | [../presentations/](../presentations/) — pitch and investor decks |
| The deck accompanies a priced offer | [../proposal/](../proposal/) |

## Inputs Required

| Input | Required | Notes |
| --- | --- | --- |
| `{{PROFILE_SOURCE}}` | Yes | Output of [company-profile-document.md](company-profile-document.md). Do not start from scratch |
| `{{ROOM}}` | Yes | Who is present, their roles, and who decides |
| `{{TIME}}` | Yes | Minutes you actually have, not what the agenda says |
| `{{FORWARDED_TO}}` | Yes | Who reads it afterwards without you. This decides the whole format question |
| `{{THE_ONE_THING}}` | Yes | What they must remember tomorrow. Exactly one |
| `{{LIKELY_CHALLENGE}}` | Yes | The hardest question you will be asked |

## Workflow

1. **Start from the profile document**, not from a blank deck. The claim audit and evidence work is already done and should not be redone loosely.
2. **Resolve the two-jobs conflict first.** Decide whether this is a presentation deck with a separate leave-behind, or one hybrid document. Everything downstream depends on it.
3. **Pick the one thing.** A deck with four messages delivers none.
4. **Cut to the time you actually have.** Presentations overrun; the material you rehearsed last is the material you lose.
5. **Prepare the challenge.** The hardest question deserves a prepared slide held in appendix, not an improvised answer.
6. **Rehearse against the clock**, out loud. Slide count is a poor proxy for duration.

## Claude Prompt

```text
ROLE
You are adapting company profile material into a credentials deck.

You optimise for one message surviving until tomorrow, and you accept
leaving most of the profile out as the cost of that.

You refuse to:
- Paste the profile document into slides. A document read silently and
  a deck spoken over are different artefacts with different densities.
- Build one deck that serves both the room and the forwarding chain
  without saying which it is optimised for. Decide, and state the
  trade-off.
- Put more than one message on a slide, or more than one message in
  the deck.
- Use a slide the presenter has to read aloud. If the slide says it,
  the presenter is redundant; if the presenter says it, the slide
  should show the evidence instead.
- Leave the hardest question to an improvised answer. Prepare it.
- Open with the company history. The room is deciding whether you can
  do their thing.

You work from {{PROFILE_SOURCE}} and do not re-derive claims. If a
claim was cut during the profile's claim audit, it stays cut.

CONTEXT
Profile source: {{PROFILE_SOURCE}}
The room: {{ROOM}}
Time available: {{TIME}}
Forwarded afterwards to: {{FORWARDED_TO}}
The one thing: {{THE_ONE_THING}}
Hardest question: {{LIKELY_CHALLENGE}}

TASK

STAGE 1 — RESOLVE THE TWO JOBS
State which this deck is optimised for and what it costs:
  PRESENTATION — sparse slides, presenter carries meaning. Unusable
                 when forwarded without a separate leave-behind.
  LEAVE-BEHIND — dense enough to read alone. Weakens the live delivery
                 because the room reads ahead.
  HYBRID       — sparse slides plus speaker notes exported as the
                 leave-behind. More work, and it is usually right.
Recommend one. State what is lost.

STAGE 2 — TIME BUDGET
| Section | Minutes | Slides | What must land |
Total must fit {{TIME}} with a quarter held back for questions. State
what was cut to fit.

STAGE 3 — SLIDE PLAN
| # | Slide | The one thing it carries | Evidence shown | Presenter says |
The last two columns must differ. A slide that shows what the presenter
says is a slide being read aloud.

STAGE 4 — THE CHALLENGE SLIDE
{{LIKELY_CHALLENGE}}, answered on a prepared appendix slide. State the
answer and the evidence.

Being able to turn to a prepared slide converts the hardest moment in
the meeting into the most convincing one.

STAGE 5 — THE FORWARDING TEST
Someone who was not in the room opens this. What do they misunderstand?
For each, state the fix — a speaker note, a leave-behind paragraph, or
an accepted loss.

STAGE 6 — THE CLOSE
What happens next, stated as a specific action with an owner and a
date. Not "we look forward to hearing from you".
```

## Expected Output

| Element | Detail |
| --- | --- |
| Format decision | Presentation, leave-behind, or hybrid, with the cost stated |
| Time budget | Per section, with a quarter held for questions |
| Slide plan | Each slide's one message, its evidence, and what the presenter adds |
| Challenge slide | The hardest question, prepared |
| Forwarding test | What a non-attendee misreads, and the fix |
| Close | A specific next action with owner and date |

It should **not** contain:

- The profile document pasted into slides
- More than one message per slide
- Slides the presenter reads aloud
- An opening company history
- A vague close

## Quality Checklist

- [ ] Built from `{{PROFILE_SOURCE}}`, with no claim reintroduced that the profile's audit cut
- [ ] The presentation / leave-behind / hybrid decision is stated with its cost
- [ ] Exactly one message for the whole deck
- [ ] Each slide carries one message
- [ ] Evidence shown and presenter script differ on every slide
- [ ] Time budget fits `{{TIME}}` with 25% held for questions
- [ ] The hardest question has a prepared appendix slide
- [ ] A non-attendee's likely misreadings are identified and addressed
- [ ] The close names an action, an owner, and a date
- [ ] Rehearsed aloud against a clock
- [ ] Meets [Output-Standards.md](../../../docs/Output-Standards.md#content-standards) on claim substantiation

## Common Mistakes

| Mistake | Why it happens | Fix |
| --- | --- | --- |
| Pasting the profile into slides | The content is written | Documents and decks have different densities. Rebuild from the message |
| One deck, two jobs, no decision | Both needs are real | Decide, or build hybrid with speaker notes. Undecided serves neither |
| Reading the slides aloud | The slide is the script | If the slide says it, the presenter is redundant. Show evidence, speak the argument |
| Opening with company history | Convention | The room is deciding whether you can do *their* thing. Start there |
| Four messages | Everything feels important | Four messages deliver none. Pick one; the rest is support |
| No time budget | Slide count feels like a proxy | It is not. Rehearse against a clock, aloud |
| Improvising the hard question | It feels defensive to prepare | A prepared answer with a slide behind it is the most convincing moment available |
| Vague close | Asking feels pushy | "We look forward to hearing from you" transfers all effort to them, and nothing happens |

## Example

> **Provenance:** constructed. Inputs and output demonstrate the pattern; this is not a transcript of a real run.

**Inputs**

| Input | Value |
| --- | --- |
| `{{ROOM}}` | Housing association panel: Head of Digital (champion), IT Security lead (veto), procurement (veto), finance |
| `{{TIME}}` | 20 minutes stated; assume 15 |
| `{{FORWARDED_TO}}` | Two panel members who will not attend, plus the executive sponsor |
| `{{THE_ONE_THING}}` | "They have migrated this exact kind of system without downtime, and they are honest about what they do not know" |
| `{{LIKELY_CHALLENGE}}` | "You're 24 people. How do you carry a three-year contract?" |

**Stage 1 — Format decision**

```text
HYBRID, recommended.

Two panel members are absent and the executive sponsor will read it
without context. A pure presentation deck would be unusable to the
three people who may matter most.

Cost: speaker notes have to be written properly and exported, which is
roughly two extra hours. The alternative — dense slides — means the
panel reads ahead and stops listening, which is worse in a 15-minute
slot.
```

**Stage 3 — Slide plan, extract**

```text
| # | Slide | Its one message | Evidence shown | Presenter says |
|---|---|---|---|---|
| 1 | Title | — | Company, date, panel names | Thanks; names the 15-minute plan |
| 2 | "190,000 records. Zero downtime. 11 weeks." | We have done this exact thing | Three figures, nothing else | The phasing decision and why single cutover was refused |
| 3 | The four phases | The method is repeatable | Phase diagram with sign-off gates | What happens when reconciliation fails a gate |
| 4 | "We have not used your platform" | We are honest about the gap | The sentence, and the discovery proposal | Why the method does not depend on source familiarity |
| 5 | Named team, three people | Specific people, not a logo | Photos, roles, comparable delivery | Sara's thin cover, stated before they ask |
| 6 | Close | What happens next | Two-week discovery, fixed price, cancellable, start date | Asks for a decision by a named date |

Slide 4 is the deliberate move. Volunteering the gap on slide 4 of 6,
before procurement raises it, converts the weakest point into the
credibility anchor for everything else.
```

**Stage 4 — The challenge slide**

```text
Appendix A — "You're 24 people. How do you carry three years?"

Shown: the continuity table from the team profile — named second for
each role, cross-training status, partner arrangement, and the honest
"Sara is our thinnest cover, two-to-four week impact" line.

Said: the 2023 migration completed on schedule with the lead engineer
absent for three weeks mid-project. That is the evidence, not the
assurance.

Holding this in appendix rather than in the main flow matters. Turning
to a prepared slide when the question comes reads as having thought
about it. Pre-empting it in the main deck reads as defensive.
```

**Stage 6 — The close**

```text
Weak:   "We'd welcome the opportunity to work with you."
Strong: "We propose a two-week discovery, £8,400 fixed, cancellable
         after week one. It would start 18 August and you would have
         the platform risk assessment before your September board.
         We need a yes or no by 8 August to hold that start date."

Names the action, the price, the exit, the date, and what they get.
The deadline is real — after 8 August the start slips — and a deadline
that is not real is detected and costs more than it gains.
```

## Advanced Version

Use this for competitive presentation stages where you present against other shortlisted firms.

```text
[Stages 1-6 as above, plus:]

STAGE 7 — THE COMPARATIVE ROOM
The panel sees three presentations in one day. Yours is one of them.

State: what they remember from yours after the third, and what makes
it distinguishable. If the answer depends on delivery rather than
content, the content is interchangeable and needs work.

STAGE 8 — THE HOSTILE PANELLIST
One person in the room does not want to appoint you. Write their three
questions and the answer to each.

Then: which question has no good answer? That is either a slide to
prepare or a reason to reconsider the bid.

STAGE 9 — THE TECHNICAL DEEP-DIVE
Panels frequently ask one unexpectedly detailed question to test whether
the presenter actually did the work.

Identify the three most likely, and make sure the person answering has
first-hand knowledge. Sending a delivery lead who was not on the cited
project is the most common way a strong submission loses at
presentation stage.
```

## Related

- [company-profile-document.md](company-profile-document.md) — the source material this adapts
- [case-study-library.md](case-study-library.md) — the evidence shown on slides
- [team-profile.md](team-profile.md) — the named-people slide and continuity answer
- [capability-statement.md](capability-statement.md) — the written submission this often follows
- [../presentations/](../presentations/) — **owns** deck construction, narrative, and slide mechanics
- [../proposal/](../proposal/) — the priced offer the close points to

## References

- [Crown Commercial Service supplier guidance](https://www.crowncommercial.gov.uk/suppliers) — presentation stages in public procurement
- [WCAG 2.2](https://www.w3.org/TR/WCAG22/) — accessibility where decks are distributed digitally
