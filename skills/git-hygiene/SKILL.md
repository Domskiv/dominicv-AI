---
name: git-hygiene
description: Git commit conventions, branch naming, PR standards, and what never goes in a commit. Referenced by companion and engineer.
---

# Git Hygiene

## Commit messages

- One sentence, lowercase, no period
- Verb first: `add`, `fix`, `update`, `remove`, `refactor`, `move`
- Describe what changed, not what you did: "add avatar to profile card" not "updated profile component"
- Max ~72 characters

Before any commit, present 3 options and wait for the user to pick:

```
Which commit message?
  1. [option]
  2. [option]
  3. [option]
```

No `Co-Authored-By` line.

## Branch names

```
feat/short-description
fix/short-description
refactor/short-description
chore/short-description
```

## What never goes in a commit

- `.env` or any file containing real secrets or credentials
- `node_modules/`, `vendor/`, build output, compiled assets
- `.companion/` directory
- Binary files that don't belong in source control
- Commented-out code (delete it)
- Debug logging added during investigation

## Staging

Stage specific files by name. Never `git add -A` or `git add .` — too easy to accidentally include secrets or generated files.

Before committing: run `git diff --staged` to confirm the diff contains only what was intended.

## PR standards

- Title: same rules as commit message, max 70 characters
- Body: what changed + why (the why matters most) + how to test it
- One concern per PR
- If a PR is getting large, split it before opening
