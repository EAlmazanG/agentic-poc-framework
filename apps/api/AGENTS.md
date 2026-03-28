# API Agent Guide

## When to read this
Read this file only when touching `apps/api` code or backend tests.

## Use these commands
- `make api-lint`
- `make api-format`
- `make api-typecheck`
- `make api-test`
- `make api-migrate`

## Where things go
- `src/app/core`: settings, security middleware, and backend-wide concerns
- `src/app/db`: SQLAlchemy base, sessions, and DB integration wiring
- `src/app/modules/<feature>/api`: FastAPI routers and transport schemas
- `src/app/modules/<feature>/application`: use cases and orchestration logic
- `src/app/modules/<feature>/domain`: domain models and domain rules
- `src/app/modules/<feature>/infrastructure`: persistence or external integration details
- `src/app/shared`: backend utilities used by multiple modules
- `tests`: backend tests, preferably mirroring module boundaries

## Rules
- Keep FastAPI routers thin.
- Put business logic in application services or use-case layers.
- Add tests for new behavior.
- Add a migration for schema changes.
- Do not move code to `shared` until multiple modules need it.

## Read extra docs only when needed
- `docs/architecture/backend.md` if module boundaries or backend architecture change
- `docs/architecture/docker-and-runtime.md` if backend runtime/env behavior changes
- `docs/runbooks/database-migrations.md` if migration workflow changes
- `SECURITY.md` if trusted hosts, headers, secrets, or exposure change
