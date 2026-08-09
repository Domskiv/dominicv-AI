---
name: code-standards
description: Per-stack coding standards for TypeScript/Angular/React, Rails, PHP/Laravel, and SQL. Covers API design, DB schema, error handling, performance, and accessibility. Referenced by companion and engineer.
---

# Code Standards

Read the section for the stack you're working in.

---

## TypeScript (all frameworks)

- `strict: true` always. Never `any` — use `unknown` and narrow it, or define a real type.
- `interface` for object shapes. `type` for unions, intersections, and aliases.
- All parameters, return types, and property types explicit. No implicit types.
- `unknown` at system boundaries (user input, external APIs). Narrow before use.

## Angular (v17+)

- Signals for reactive state. `OnPush` change detection on all components.
- Standalone components. No NgModule boilerplate in new code.
- `inject()` over constructor injection.
- `takeUntilDestroyed()` or `async` pipe — never leave subscriptions open.
- Reactive forms over template-driven for anything beyond a single field.
- No logic in templates — move it to the component class or a pipe.
- Smart/dumb split: smart components own state and services; dumb components are pure presentational.

## React / Next.js

- Server Components by default. `"use client"` only for interactivity.
- No prop drilling past 2 levels — lift state or use context.
- `useCallback` / `useMemo` only when there is a measured performance problem. Not by default.
- Keys in lists must be stable and unique — never array index.
- `useEffect` cleanup functions always present when there is a subscription, timer, or listener.

---

## API Design

- RESTful URLs: noun resources, plural, no verbs (`/users`, not `/getUsers`)
- HTTP methods mean what they say: GET (read), POST (create), PUT/PATCH (update), DELETE (delete)
- Response envelope: `{ data: ..., meta: ... }` for collections; flat object for single resources
- Errors: `{ error: { code: "...", message: "..." } }` — message is human-readable, code is machine-readable
- Pagination: `?page=1&per_page=20`, meta includes `total`, `page`, `per_page`
- Versioning: `/api/v1/...` in the path
- Auth: Bearer token in `Authorization` header

---

## Database

- Table names: snake_case, plural (`users`, `expense_categories`)
- Column names: snake_case. Foreign keys: `[table_singular]_id` (`user_id`)
- Always index: foreign keys, columns in WHERE, columns in ORDER BY
- `created_at`, `updated_at` on every table
- Soft delete: `deleted_at` nullable timestamp — not a boolean `is_deleted`
- Migrations must be reversible. Never mutate a migration that has run in production.
- No `SELECT *` in application queries — name columns explicitly.
- Parameterize all user input. No string interpolation into queries.

---

## Rails

- Fat models, skinny controllers. Extract service objects (`app/services/`) when a model method touches more than one other model or has non-trivial side effects.
- Scopes over class methods for query chains.
- Strong parameters in controllers — never mass-assign without them.
- `find_each` / `find_in_batches` over `.all` for large datasets.
- N+1 is a bug — use `includes`, `preload`, or `eager_load`.
- Callbacks only for single-model lifecycle. Cross-model side effects go in service objects.
- RSpec: model specs for validations/scopes, request specs for API endpoints.

---

## PHP / Laravel

- PHP 8.x features: named arguments, match expressions, nullsafe `?->`, enums, readonly properties, constructor property promotion.
- Type everything. No implicit `mixed`.
- PDO prepared statements only. No raw string SQL with user input.
- Eloquent: `with()` for eager loading. N+1 is a bug.
- Controllers thin — business logic in service classes or actions.
- Early returns to reduce nesting.

---

## SQL

- Explicit JOIN types (`INNER JOIN`, `LEFT JOIN`). Never implicit comma joins.
- Name columns explicitly in SELECT.
- CTEs (`WITH`) over deeply nested subqueries.
- Parameterize all user input.
- `EXPLAIN ANALYZE` before declaring a query fast enough.
- Transactions for multi-step writes that must be atomic.
- Bulk inserts/updates in batches, not row-by-row loops.

---

## Error handling

- Validate at system boundaries (user input, external APIs). Trust internal code.
- Error messages state what went wrong and how to fix it — not just "something failed."
- No silent failures. Log or surface exceptions; never swallow them.
- No try/catch for things that can't throw.

---

## Performance

- N+1 queries are bugs, not "optimizations for later."
- Index columns before the query is slow — not after.
- Cache at the right layer: HTTP (CDN/ETag), app (Redis), DB (materialized views).
- Lazy-load routes and heavy components. Measure before assuming it's fine.
- Core Web Vitals targets: LCP < 2.5s, INP < 200ms, CLS < 0.1.

---

## Accessibility (baseline)

- Semantic HTML first: `<button>` not `<div onClick>`, `<nav>` not `<div class="nav">`.
- Every image needs an `alt` attribute. Empty string `alt=""` for decorative images.
- Forms: every input has a `<label>`. Never placeholder-as-label.
- Interactive elements reachable and operable via keyboard.
- Never `outline: none` without a replacement focus style.
- WCAG AA contrast: 4.5:1 for body text, 3:1 for large text (18px+).
