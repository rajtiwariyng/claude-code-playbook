# MCP Servers

Entries for connecting Claude Code to external systems through the [Model Context Protocol](https://modelcontextprotocol.io).

> [!NOTE]
> **Status: planned for v1.2.** This folder has no entries yet. Its scope and intended
> contents are documented below so the taxonomy is stable and links resolve.
> See [ROADMAP.md](../../ROADMAP.md).

## Scope

An MCP server gives Claude Code access to a system it otherwise cannot reach — a database, an issue tracker, a browser, a design tool, an internal API. This folder covers **when a server is worth connecting, how to scope its access safely, and how to prompt effectively once it is available.**

It does **not** cover how to build an MCP server. That is upstream product documentation, maintained at [modelcontextprotocol.io](https://modelcontextprotocol.io), and would go stale here.

## The Question Every Entry Answers First

> Does connecting this system change what Claude Code can do, or only how you paste things into it?

A server that saves copy-and-paste is convenience. A server that lets Claude Code *check reality* — query the actual schema, read the actual ticket, see the actual rendered page — changes the quality of the output, because it replaces recall with observation.

The second kind is worth the setup and the access risk. The first frequently is not.

## Planned Entries

| Entry | Connects | Changes what is possible |
| --- | --- | --- |
| `github.md` | Repositories, issues, pull requests | Reading real issue context and PR history rather than a pasted summary |
| `filesystem.md` | Directories outside the working tree | Reference material and shared assets that do not belong in the repository |
| `browser.md` | A live browser | Verifying that a page actually renders and behaves as claimed |
| `playwright.md` | Browser automation | Running real interaction flows, capturing real failures |
| `docker.md` | Containers and images | Inspecting running state instead of inferring it from configuration |
| `postgres.md` | A PostgreSQL database | Reading the real schema, real indexes, real query plans |
| `mysql.md` | A MySQL database | As above |
| `aws.md` | AWS resources | Reading actual deployed configuration |
| `notion.md` | Notion workspaces | Specs and decisions where they actually live |
| `slack.md` | Slack channels | Retrieving the conversation where a decision was made |
| `gmail.md` | Email | Correspondence context for client work |
| `figma.md` | Design files | Reading real design tokens and specifications rather than screenshots |

Each will be written to the full ten-section structure in [CONTRIBUTING.md](../../CONTRIBUTING.md#the-ten-section-entry-structure).

## Access Is a Security Decision

Every entry in this folder will carry an access-scoping section, because connecting a server is a security decision and it is routinely treated as a convenience one.

| Rule | Why |
| --- | --- |
| **Read-only by default** | Write access to a production system should be a deliberate, separate decision |
| **Scope credentials to the minimum** | A token with full account access is a token that can do full account damage |
| **Never connect production databases directly** | Use a replica or a scoped role. A read query can still lock, and a mistyped statement is not always a read |
| **Assume prompts are logged** | Anything a server returns may end up in a transcript |
| **Audit what the server can reach** | "Filesystem access" means every file it is pointed at, including the ones you forgot were there |

> [!WARNING]
> An MCP server extends what Claude Code can reach to everything the credential can reach. Scope the credential, not the intention. Full guidance is owned by [quality/security/secrets-management.md](../quality/security/) and is not restated here.

## Shared Concerns Live Elsewhere

| Concern | Owner |
| --- | --- |
| Credential handling and secrets | [quality/security/](../quality/security/) |
| Database schema and query concerns | [backend/database/](../backend/database/) |
| Container operations | [infrastructure/docker/](../infrastructure/docker/) |
| AWS architecture | [infrastructure/aws/](../infrastructure/aws/) |
| Design decisions | [web/ui-ux/](../web/ui-ux/) |

## Contributing an Entry Here

Open an issue using the **New entry proposal** template first. For this folder, the proposal must answer the question at the top of this page: what does connecting this system make possible that was not possible before?

An entry that documents a server providing convenience only will be redirected to a snippet.

## Related

- [prompts/README.md](../README.md) — the full A–Z entry index
- [docs/AI-Agent-Workflow.md](../../docs/AI-Agent-Workflow.md#delegating-to-subagents) — extending Claude Code
- [docs/Installation.md](../../docs/Installation.md#extending-claude-code) — where MCP fits among the extension points
- [agents/](../../agents/) — subagent roles, which often pair with a server
- [ROADMAP.md](../../ROADMAP.md) — when this folder ships

## References

- [Model Context Protocol](https://modelcontextprotocol.io) — the specification
- [MCP servers reference](https://github.com/modelcontextprotocol/servers) — reference implementations
- [Claude Code MCP documentation](https://docs.claude.com/en/docs/claude-code/mcp) — official setup guidance
- [OWASP Top 10](https://owasp.org/Top10/) — the access risks this folder takes seriously
