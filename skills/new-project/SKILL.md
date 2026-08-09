---
name: new-project
description: Scaffold a new project from scratch and wire in the Sleepy Dev Companion. Detects the desired stack, creates the project structure, initializes git, and sets up companion context. Trigger phrases: "new project", "scaffold", "start a new app", "/new-project".
---

# New Project

Scaffold a new project and wire in the companion.

---

## Step 1 — Clarify (one question max)

If the stack isn't clear from the request, ask ONE question:

> "What are we building? (e.g. 'Next.js SaaS', 'Rails API', 'Laravel + React', 'TypeScript CLI')"

If it's clear from context — skip this and proceed.

---

## Step 2 — Scaffold

**Next.js**
```bash
npx create-next-app@latest [name] --typescript --tailwind --eslint --app --src-dir --import-alias "@/*"
```

**Vite + React**
```bash
npm create vite@latest [name] -- --template react-ts
```

**Rails API**
```bash
rails new [name] --api --database=postgresql -T
```

**Laravel**
```bash
composer create-project laravel/laravel [name]
```

**TypeScript CLI / library**
```bash
mkdir [name] && cd [name]
npm init -y
npm install -D typescript @types/node tsx
npx tsc --init
```

Adapt to what was asked. Don't scaffold extras that weren't requested.

---

## Step 3 — Git init

```bash
cd [name]
git init
git add .
git commit -m "initial scaffold"
```

---

## Step 4 — Wire in the companion

1. Create `.companion/` directory
2. Create blank `.companion/stack.md` and `.companion/log.md`
3. Add `.companion/` to `.gitignore`
4. Copy `CONTEXT.md` template to project root
5. Create `.claude/agents/` and copy the 4 agent files there

---

## Step 5 — Populate stack.md

Run inline discovery on the scaffolded project and write the result to `.companion/stack.md`.

---

## Step 6 — Report

```
Project: [name]
Stack: [what was scaffolded]
Dev server: [command + port]
Test command: [if configured]
Next: [first thing to do — e.g. "configure the database", "create your first component"]
```
