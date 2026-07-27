# Project Constitution

The durable rules that belong in `CLAUDE.md` — written once, applied to every session, reviewed like code.

---

## Purpose

Produce a `CLAUDE.md` whose every line prevents a specific, likely mistake. Most `CLAUDE.md` files fail the same way: they restate what the code already says. This entry produces the other kind — the decisions, conventions, and deliberate oddities that a model cannot infer by reading the repository.

## When to Use

Use this when:

- Setting up Claude Code on a project for the first time
- You have corrected the same misunderstanding twice
- Team members get inconsistent results on the same codebase
- An existing `CLAUDE.md` is long and not obviously helping

Use something else when:

| Situation | Go to |
| --- | --- |
| You need the mechanics of memory scopes and file locations | [docs/Installation.md](../../../docs/Installation.md#project-memory) |
| The rule applies to one task, not the whole project | [role-composition.md](role-composition.md) |
| You want the honesty contract, not project rules | [output-contract.md](output-contract.md) |
| You need reusable starting blocks by stack | [snippets/](../../../snippets/) |

## Inputs Required

| Input | Required | Notes |
| --- | --- | --- |
| `{{STACK}}` | Yes | Languages, frameworks, and versions. Versions matter — idiom is version-scoped |
| `{{VERIFICATION_COMMANDS}}` | Yes | How work is proven done. The single most valuable section |
| `{{CORRECTIONS_MADE}}` | Yes | Things you have had to correct. This is the source material |
| `{{DELIBERATE_ODDITIES}}` | Yes | Things that look like bugs and are not |
| `{{OFF_LIMITS}}` | Yes | Files, directories, or patterns that must not be touched |
| `{{DOMAIN_VOCABULARY}}` | No | Terms whose meaning here differs from the general one |

## Workflow

1. **Run `/init` first** to get a draft. It describes what the code *is*, which is the less valuable half — but it is faster than starting blank.
2. **Delete everything derivable from the code.** File listings, dependency lists, obvious framework commands. If the model can read it, do not write it.
3. **Add the corrections you have made.** Every time you have said "no, we do it this way here", that is a line.
4. **Add the deliberate oddities.** The code that looks wrong and is not — this prevents well-intentioned damage.
5. **Add the verification section.** How does anyone know work is finished?
6. **Test it**: run a representative task in a fresh session and see whether the conventions hold.
7. **Grow it reactively.** When you correct the same thing twice, add a line. Do not try to write it all at once.

## Claude Prompt

Two prompts. The first generates a draft; the second audits an existing file, which is the more common need.

**Generate**

```text
Write a CLAUDE.md for this project.

INCLUDE ONLY things that cannot be inferred by reading the code:
- Conventions a competent newcomer would get wrong
- Commands with non-obvious flags or ordering
- Architectural decisions and the reason behind them
- Code that looks like a bug and is deliberate
- Areas that are off-limits or require review
- Domain vocabulary whose meaning here differs from the general meaning
- How to verify work is complete

EXCLUDE, without exception:
- Anything derivable from package.json, composer.json, or the file tree
- Standard framework commands
- A directory listing
- Generic advice ("write clean code", "add tests")
- Aspirational rules nobody currently follows

CONTEXT
Stack: {{STACK}}
Verification: {{VERIFICATION_COMMANDS}}
Corrections I have had to make: {{CORRECTIONS_MADE}}
Deliberate oddities: {{DELIBERATE_ODDITIES}}
Off-limits: {{OFF_LIMITS}}
Domain vocabulary: {{DOMAIN_VOCABULARY}}

THE TEST FOR EVERY LINE
Does this line prevent a specific, likely mistake? If you cannot name
the mistake it prevents, cut the line.

After the draft, list every line you cut and the reason. I want to see
what you rejected as much as what you kept.

Target under 150 lines. A CLAUDE.md nobody reads has the same effect
as no CLAUDE.md.
```

**Audit an existing file**

```text
Audit this CLAUDE.md.

For every line, classify it:
  KEEP    — prevents a specific, likely mistake. Name the mistake.
  CUT     — derivable from the code, or generic advice
  STALE   — was true, no longer matches the codebase
  VAGUE   — states an intent but gives no actionable rule
  MISSING — a rule the codebase implies but the file does not state

For STALE, check against the actual code and say what changed.
For MISSING, look for patterns in the codebase that a newcomer would
get wrong, and propose the line.

Report as a table. Do not rewrite the file — I want to see the
classification before anything changes.

---
{{EXISTING_CLAUDE_MD}}
```

## Expected Output

A `CLAUDE.md` with this structure:

| Section | Contains |
| --- | --- |
| Stack | Languages, frameworks, versions. Three lines |
| Commands | Only those with non-obvious flags, timing, or ordering |
| Conventions | Rules a newcomer would violate, stated as rules |
| Deliberate oddities | Code that looks wrong, with the reason it is not |
| Off-limits | What must not be changed without review |
| Vocabulary | Domain terms with local meanings |
| Before claiming complete | The verification steps |

It should **not** contain:

- A file or directory listing
- Standard framework commands
- Generic engineering advice
- Rules the team does not actually follow
- Anything longer than one line per rule

## Quality Checklist

- [ ] Every line names a mistake it prevents
- [ ] Nothing is derivable from the manifest files or the file tree
- [ ] Verification commands are stated, with expected duration if slow
- [ ] Deliberate oddities are documented with their reasons
- [ ] Off-limits areas are explicit
- [ ] Domain vocabulary with non-standard local meanings is defined
- [ ] Under 150 lines
- [ ] No aspirational rules — only what the team actually does
- [ ] Tested in a fresh session on a representative task
- [ ] Committed to the repository, not left local
- [ ] No secret, key, path with a credential, or internal URL that should not be shared

## Common Mistakes

| Mistake | Why it happens | Fix |
| --- | --- | --- |
| Restating the code | `/init` produces it and it looks substantial | The model reads the code already. Only decisions add value |
| Writing it all at once | It feels like a task to complete | A file written in one sitting is mostly guesses. Grow it from real corrections |
| Aspirational rules | "We should always write tests first" | Rules the team ignores teach that the file can be ignored |
| Too long | Every line seemed useful individually | Past ~150 lines, attention thins across all of it. Cut ruthlessly |
| Never revised | It shipped, so it is done | A stale convention actively misleads every session |
| Left uncommitted | It works locally | The whole value is that improvements compound across the team |
| Vague intent | "Prefer clean architecture" | Unactionable. State the rule: "Database access outside a repository class is a review blocker" |
| Missing verification | It seems obvious to the team | It is the single most valuable section, and the most often absent |
| Secrets or internal URLs | Convenience | It is committed and shared. Treat it as public |

## Example

> **Provenance:** constructed. Inputs and output demonstrate the pattern; this is not a transcript of a real run.
**Before** — a typical generated `CLAUDE.md`, abbreviated:

```markdown
# Project

This is a Laravel application. It uses PHP and the Laravel framework.

## Structure
- app/Http/Controllers - controllers
- app/Models - Eloquent models
- database/migrations - migrations
- resources/views - Blade templates
[... 40 more lines of directory listing ...]

## Commands
- php artisan serve - start the dev server
- php artisan migrate - run migrations
- composer install - install dependencies

## Best Practices
- Write clean, maintainable code
- Follow SOLID principles
- Add tests for new features
```

Every line here is either derivable from the file tree or generic advice. It occupies context and prevents nothing.

**After**

```markdown
# Acme Billing API

Laravel 11, PostgreSQL 16, Redis 7, PHP 8.3. Deployed to AWS ECS.

## Commands

| Command | Notes |
| --- | --- |
| `make test` | Full suite, ~4 min. Required before claiming work complete. |
| `make test-unit` | Fast subset, ~20s. Use while iterating. |
| `php artisan lint` | Pint + PHPStan level 8. CI blocks on this. |
| `make migrate-check` | Dry-runs migrations against a prod-sized snapshot. Run before any migration PR. |

## Conventions

- Money is stored as integer minor units. Never use floats for currency,
  including in tests and fixtures.
- All monetary output goes through `Money::format()`. Inline formatting
  is a review blocker.
- Domain logic lives in `app/Domain/`. Controllers stay thin — business
  logic in `app/Http/` is a review blocker.
- Database access outside a repository class is a review blocker.
- Every new endpoint needs a feature test covering the unauthorised case.
  We have shipped two cross-tenant leaks; this is why.

## Deliberate oddities

- `LegacyInvoiceSync` polls instead of using webhooks. The upstream
  provider's webhooks drop roughly 2% of events. Do not "fix" this.
- Migrations before 2024-06 use a different naming scheme. Leave them.
- `Invoice::total()` recalculates rather than reading a stored column.
  The stored column exists for reporting and is intentionally allowed
  to lag. Do not "optimise" the recalculation away.

## Off-limits without review

- `app/Domain/Tax/` — rates are audited; changes need finance sign-off.
- Anything under `database/migrations/` older than 2024-06.
- `config/queue.php` — the retry settings were tuned against a real
  incident.

## Vocabulary

- **Settlement** here means the nightly reconciliation batch, not the
  card-network sense.
- **Void** is before capture; **refund** is after. They are different
  code paths and the distinction matters.

## Before claiming work complete

1. `make test` passes — show the output
2. `php artisan lint` passes
3. New endpoints have an unauthorised-access test
4. Any migration has been through `make migrate-check`
```

Every line in the "after" version traces to a mistake someone actually made. The cross-tenant leak note and the `LegacyInvoiceSync` warning are each worth more than the entire "before" file.

## Advanced Version

Use this for large teams or long-lived codebases, where `CLAUDE.md` needs to stay accurate without anyone being assigned to maintain it.

```text
QUARTERLY CLAUDE.MD AUDIT

Compare the current CLAUDE.md against the codebase as it is today.

1. STALENESS — for each rule, find the code it refers to. Report:
   | Rule | Still accurate? | Evidence |
   A rule whose referenced code no longer exists is actively harmful.

2. UNSTATED CONVENTIONS — analyse the last 3 months of commits for
   patterns that were enforced in review but are not written down.
   Look for: repeated review comments, repeated corrections in commit
   messages, patterns applied consistently but not documented.

3. VIOLATED RULES — find code that breaks a stated rule. Either the
   rule is wrong, or the code is. Report both cases; do not assume
   which.

4. REDUNDANCY — rules now enforced mechanically by the linter, type
   checker, or CI. These should be cut; mechanical enforcement is
   strictly better than documentation.

5. LENGTH — if over 150 lines, identify the least load-bearing third.

Report as findings. Do not rewrite the file.
```

Running this quarterly, and treating the output as a pull request, is what keeps a `CLAUDE.md` from decaying into folklore.

## Related

- [output-contract.md](output-contract.md) — the honesty rules, which belong in `CLAUDE.md` for high-stakes projects
- [role-composition.md](role-composition.md) — roles that can be made durable the same way
- [senior-engineer.md](senior-engineer.md) — the conventions this file encodes
- [docs/Installation.md](../../../docs/Installation.md#project-memory) — memory scopes and file locations
- [docs/Claude-Code-Best-Practices.md](../../../docs/Claude-Code-Best-Practices.md#team-practices) — team adoption
- [snippets/](../../../snippets/) — reusable `CLAUDE.md` blocks by stack

## References

- [Claude Code memory](https://docs.claude.com/en/docs/claude-code/memory) — how `CLAUDE.md` is loaded and merged
- [Claude Code settings](https://docs.claude.com/en/docs/claude-code/settings) — the configuration that accompanies it
- [Claude Code documentation](https://docs.claude.com/en/docs/claude-code)
