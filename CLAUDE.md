# Sleepy Dev Companion

This is the companion system — not a project. It contains the agents and skills that get installed into projects.

## What this is

- `agents/` — 4 focused agents, installed per-project at `.claude/agents/`
- `skills/` — 5 skills, installed globally at `~/.claude/skills/`
- `templates/` — project template files
- `install.ps1` — wires everything into a target project

## How to install on a project

```powershell
.\install.ps1 -ProjectPath "C:\path\to\your-project"
```

Defaults to the current directory if `-ProjectPath` is omitted.

## Skills

| Skill | Trigger |
|---|---|
| `companion` | `/companion` or any engineering request — the main entry point |
| `diagnose` | `/diagnose` — structured debugging for hard bugs |
| `new-project` | `/new-project` — scaffold a new project |
| `code-standards` | Referenced internally by companion and engineer |
| `git-hygiene` | Referenced internally by companion |

## Agents

| Agent | Spawned for |
|---|---|
| `engineer` | Multi-file implementation across the stack |
| `designer` | UI and design work with anti-slop enforcement |
| `challenger` | Adversarial code review and security audit |
| `navigator` | New project architecture and major structural decisions |

## Commit messages

Before any `git commit`, present 3 options and wait for the user to pick:

```
Which commit message?
  1. option one
  2. option two
  3. option three
```

One sentence, lowercase, no period, no `Co-Authored-By` line.
