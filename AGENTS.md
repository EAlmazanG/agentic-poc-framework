# AGENTS.md

## Purpose
This repository is a reusable full-stack POC template with a Python API in `apps/api` and a Next.js frontend in `apps/web`.

## Start here
- Read `README.md` for the repository map and bootstrap flow.
- Read `docs/architecture/overview.md` for the system layout.
- Read the nearest local `AGENTS.md` before editing code in `apps/api` or `apps/web`.

## Operating rules
- Prefer root `make` targets instead of ad-hoc commands.
- Run the smallest relevant checks first.
- Before finishing, run the relevant lint, typecheck, and tests for the affected app.
- Keep diffs focused and preserve the intended architecture.

## Safety rules
- Never hardcode secrets.
- Ask before adding new runtime dependencies.
- Do not introduce new shared abstractions unless at least two real call sites need them.

## Change-impact rules
- If `Makefile` changes, update `README.md`, `docs/runbooks/local-development.md`, and any affected local `AGENTS.md`.
- If `infra/compose/*` or `infra/docker/*` changes, update `docs/architecture/docker-and-runtime.md` and `docs/runbooks/docker-deployment.md`.
- If repository structure changes, update `docs/architecture/repository-structure.md` and add or update an ADR.
- If API contracts change, update backend tests and any affected frontend integration.
- If agent workflow changes, update the relevant `AGENTS.md` files and contribution docs.

## Source of truth
- Human-facing project truth lives in `README.md` and `docs/`.
- Operational agent guidance lives in `AGENTS.md` files.
- Significant decisions live in `docs/adr/`.

## Local guides
- Backend: `apps/api/AGENTS.md`
- Frontend: `apps/web/AGENTS.md`
