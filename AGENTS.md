# AGENTS.md

## Purpose
This repository is a reusable full-stack POC template with a Python API in `apps/api` and a Next.js frontend in `apps/web`.

## Default reading path
For most tasks, read only this file first.
Read additional files only when the task touches their area.

### Always read this file for any task
- `AGENTS.md`

### Read one local guide only if you touch that app
- `apps/api/AGENTS.md` when editing backend code or backend tests
- `apps/web/AGENTS.md` when editing frontend code or frontend tests

### Read extra docs only when the task requires them
- `SECURITY.md` if secrets, runtime exposure, headers, CORS, trusted hosts, proxying, auth, or browser-exposed env vars change
- `docs/architecture/docker-and-runtime.md` if `infra/compose/*`, `infra/docker/*`, or runtime behavior changes
- `docs/architecture/repository-structure.md` if folders, module boundaries, or repo layout change
- `docs/runbooks/local-development.md` if setup, bootstrap, or local commands change
- `docs/runbooks/docker-deployment.md` if prod/deploy behavior changes
- `docs/runbooks/database-migrations.md` if migration workflow changes
- `docs/adr/*` only if the task changes an important recorded decision
- `README.md` mainly for humans or when updating onboarding/project overview

## Impact matrix
- `commands/workflow` -> touch `README.md`, `docs/runbooks/local-development.md`, affected `AGENTS.md` -> run `make docs-check` and the relevant app checks
- `runtime/security/deploy` -> touch `SECURITY.md`, `docs/architecture/docker-and-runtime.md`, env examples, affected `AGENTS.md` -> run `make docs-check` and `make ci`
- `repo structure` -> touch relevant architecture docs and an ADR when the decision is significant -> run `make docs-check` and affected app checks
- `api contract` -> touch backend router/schemas/tests and affected frontend integration/tests -> run affected app checks, usually `make api-test`, `make web-test`, and typechecks
- `data model/schema` -> add migration, update DB code/tests, review migration/runtime docs if workflow changed -> run `make api-test` and migration-related validation
- `agent workflow` -> touch `AGENTS.md`, affected local guides, and `CONTRIBUTING.md` -> run `make docs-check`

## Cross-app change map
- `api contract` -> update backend transport code and tests, update frontend integration and tests, then run backend and frontend checks
- `auth or shared runtime config` -> review backend settings, frontend integration points, browser-exposed env usage, and `SECURITY.md`
- `browser-exposed envs` -> review `NEXT_PUBLIC_*` usage, frontend integration points, and `SECURITY.md` before finishing

## Operating rules
- Prefer root `make` targets instead of ad-hoc commands.
- Run the smallest relevant checks first.
- Before finishing, run the relevant lint, typecheck, and tests for the affected app.
- Keep diffs focused and preserve the intended architecture.

## Safety rules
- Never hardcode secrets.
- Ask before adding new runtime dependencies.
- Do not introduce new shared abstractions unless at least two real call sites need them.
- Treat `NEXT_PUBLIC_*` values as browser-exposed and never put sensitive data there.
- If runtime exposure changes, review `SECURITY.md` before finishing.

## Source of truth
- Human-facing project truth lives in `README.md`, `SECURITY.md`, and `docs/`.
- Operational agent guidance lives in `AGENTS.md` files.
- Significant decisions live in `docs/adr/`.

## Validation shortcuts
- Fast repo guardrail: `make docs-check`
- Fast code guardrail: `make quick-check`
- Full local validation: `make ci`
