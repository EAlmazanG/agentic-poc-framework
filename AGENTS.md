# AGENTS.md

## Purpose
This repository is a reusable full-stack POC template with a Python API in `apps/api` and a Next.js frontend in `apps/web`.

## Start here
- Read `README.md` for the project overview and bootstrap flow.
- Read `docs/architecture/overview.md` for the system layout.
- Read the nearest local `AGENTS.md` before editing code in `apps/api` or `apps/web`.

## Required checks
- Run the smallest relevant checks first.
- Before finishing, run the relevant lint, typecheck, and tests for the affected app.
- Prefer root `make` targets instead of ad-hoc commands.

## Safety rules
- Never hardcode secrets.
- Ask before adding new runtime dependencies.
- Do not perform large repo-wide rewrites unless the task explicitly requires it.
- Keep diffs focused and preserve the intended architecture.

## Documentation update rules
- If architecture changes, update `docs/architecture/*` and add or update an ADR when appropriate.
- If workflows or commands change, update `README.md`, `docs/runbooks/*`, and the relevant local `AGENTS.md`.
- If API contracts change, update tests and any affected frontend integration.

## Source of truth
- Human-facing project truth lives in `README.md` and `docs/`.
- Operational agent guidance lives in `AGENTS.md` files.
- Significant decisions live in `docs/adr/`.

## Local guides
- Backend: `apps/api/AGENTS.md`
- Frontend: `apps/web/AGENTS.md`