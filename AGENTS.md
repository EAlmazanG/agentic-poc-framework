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
- `.windsurf/workflows/project-bootstrap.md` when adapting this template to a new POC from a project description
- `docs/change-impact.json` if you need the canonical change-to-docs-and-checks map
- `SECURITY.md` if secrets, runtime exposure, headers, CORS, trusted hosts, proxying, auth, or browser-exposed env vars change
- `docs/architecture/docker-and-runtime.md` if `infra/compose/*`, `infra/docker/*`, or runtime behavior changes
- `docs/architecture/repository-structure.md` if folders, module boundaries, or repo layout change
- `docs/runbooks/local-development.md` if setup, bootstrap, or local commands change
- `docs/runbooks/docker-deployment.md` if prod/deploy behavior changes
- `docs/runbooks/database-migrations.md` if migration workflow changes
- `docs/adr/*` only if the task changes an important recorded decision
- `README.md` mainly for humans or when updating onboarding/project overview

## Structured change routing
- Canonical machine-readable change map: `docs/change-impact.json`
- Use it when deciding which docs, context files, and checks a change should touch.
- `make docs-check` validates that the manifest stays aligned with the repo.
- `make docs-suggest` prints likely docs, context files, and checks for the current changed files.

## Common cross-app changes
- `api_contract`
- `auth_shared_runtime_config`
- `browser_exposed_envs`
- Use the matching entry in `docs/change-impact.json` before finishing.

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
- Project adaptation workflow: `.windsurf/workflows/project-bootstrap.md`
- Fast repo guardrail: `make docs-check`
- Suggested docs/checks for current changes: `make docs-suggest`
- Fast code guardrail: `make quick-check`
- Full local validation: `make ci`
