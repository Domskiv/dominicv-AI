# Sleepy Dev Companion

> You sleep. It ships.

A lean AI engineering companion. Not an agent framework — a capable senior developer you can pair with.

## Install

```powershell
.\install.ps1 -ProjectPath "C:\path\to\your-project"
```

Defaults to the current directory if no path is given.

## Use

Run `/companion` in any project where it's installed. Describe what you want in plain language.

The companion reads your codebase, challenges bad decisions upfront, implements the work, and verifies it before handing back.

## What's included

**4 agents** — installed per-project at `.claude/agents/`

| Agent | Does |
|---|---|
| `engineer` | Implements features and fixes across the stack |
| `designer` | Builds UI with anti-slop design judgment |
| `challenger` | Adversarial code review and security audit |
| `navigator` | Greenfield architecture and major structural decisions |

**5 skills** — installed globally at `~/.claude/skills/`

| Skill | Trigger |
|---|---|
| `companion` | `/companion` — the main entry point |
| `diagnose` | `/diagnose` — structured debugging |
| `new-project` | `/new-project` — scaffold a new project |
| `code-standards` | Referenced internally |
| `git-hygiene` | Referenced internally |

## Project context

Each project gets:

```
.companion/        gitignored, auto-generated
  stack.md         discovered stack: language, framework, commands, key dirs
  log.md           append-only work log
CONTEXT.md         human-maintained: domain terms, key decisions, gotchas
```

## Philosophy

One companion. Stack-adaptive. Anti-slop. Anti-overengineering.

The companion handles most work directly. Agents are spawned only when isolation genuinely helps — multi-file implementation, adversarial review, deep design work.
