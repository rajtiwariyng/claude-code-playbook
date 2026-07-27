# Industries

Constraint overlays. Not archetypes — sets of rules that modify a base entry for a regulated or specialised context.

> [!NOTE]
> **Status: planned for v1.3.** Scope documented here so the taxonomy is stable and links resolve.
> See [ROADMAP.md](../../ROADMAP.md).

## Why Overlays and Not Full Entries

A healthcare corporate website and a manufacturing corporate website share their entire information architecture. What differs is the **constraint set**: regulated claims, consent language, accessibility obligations, procurement cycles, and vocabulary.

Written as separate full entries, every future improvement to corporate site structure would need making twice — and would not be. Written as an overlay, the archetype improves once and every industry inherits it.

```text
Base entry              +   Industry overlay        =   Your deliverable
web/websites/corporate  +   industries/healthcare   =   regulated claims, consent,
                                                        clinical accuracy, WCAG duty
```

> [!IMPORTANT]
> You run **two** entries, not one combined entry. The archetype gives you structure; the overlay gives you the things that get you in trouble. Skipping the overlay on a regulated deliverable is the failure mode this folder exists to prevent.

## What an Overlay Contains

Every overlay follows the same shape, and none of them restates the base entry.

| Section | Contains |
| --- | --- |
| **Regulatory context** | What law or standard applies, and to whom |
| **Claims you cannot make** | Statements that are prohibited or require substantiation |
| **Mandatory disclosures** | What must appear, and where |
| **Vocabulary** | Terms with specific legal or professional meanings in this sector |
| **Accessibility obligations** | Where the duty exceeds the WCAG 2.2 AA baseline |
| **Data handling** | What is sensitive here, and what that requires |
| **Procurement reality** | How buying actually works in this sector |
| **Who must review** | The professional sign-off that no prompt substitutes for |

## Planned Overlays

| Overlay | Applies to | Why it needs its own treatment |
| --- | --- | --- |
| `healthcare.md` | Any patient-facing or clinical deliverable | Patient data, consent, prohibited claims, clinical accuracy |
| `finance.md` | Financial services and fintech | Regulatory disclosure, audit trails, numerical precision |
| `education.md` | Schools, universities, edtech | Accessibility duties, age-appropriate content, institutional procurement |
| `government.md` | Public sector | Statutory accessibility conformance, plain-language mandates, records retention |
| `legal.md` | Legal services | Citation discipline, jurisdiction sensitivity, privilege boundaries |
| `real-estate.md` | Property | Particulars accuracy, disclosure obligations, listing data standards |
| `ecommerce.md` | Retail | Consumer rights, pricing transparency, payment compliance |
| `manufacturing.md` | Industrial | Specification accuracy, safety claims, technical documentation |
| `logistics.md` | Freight and supply chain | Operational data, tracking accuracy, integration with legacy systems |
| `nonprofit.md` | Charities and NGOs | Donor reporting, impact claims, constrained budgets |

Each will be written to the full ten-section structure in [CONTRIBUTING.md](../../CONTRIBUTING.md#the-ten-section-entry-structure).

## The Limit of What These Can Do

> [!WARNING]
> An overlay documents constraints so you know what to ask about. **It is not legal, medical, or financial advice, and it does not replace professional review.** Regulation varies by jurisdiction, changes without notice, and turns on specifics no prompt can assess.
>
> Every overlay will state explicitly who must sign off before the deliverable is used. That section is not optional and will not be softened.

## Contributing an Overlay

Open an issue using the **New entry proposal** template. For this folder, the proposal must additionally answer:

1. Which base entries does this overlay modify?
2. Which jurisdiction does it describe? An overlay claiming to be universal is wrong.
3. What is the professional sign-off requirement?
4. What is your basis for the regulatory claims — the regulation text, not a summary of it?

Overlays making regulatory claims sourced to blog posts will be rejected. This is the folder where [sourcing discipline](../../docs/Research-Framework.md) matters most, because the cost of being wrong is not a bad deliverable.

## Related

- [prompts/README.md](../README.md) — the full A–Z entry index
- [web/websites/](../web/websites/) — the archetypes these overlays modify
- [business/](../business/) — proposals and decks that overlays also modify
- [quality/accessibility/](../quality/accessibility/) — the baseline these sometimes exceed
- [docs/Research-Framework.md](../../docs/Research-Framework.md) — the sourcing standard for regulatory claims
- [ROADMAP.md](../../ROADMAP.md) — when this folder ships

## References

- [WCAG 2.2](https://www.w3.org/TR/WCAG22/) — the accessibility baseline
- [OWASP Top 10](https://owasp.org/Top10/) — security baseline
- [Claude Code documentation](https://docs.claude.com/en/docs/claude-code)
