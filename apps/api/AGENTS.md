# API Agent Guide

## Commands
- `make api-lint`
- `make api-format`
- `make api-typecheck`
- `make api-test`
- `make api-migrate`

## Folder responsibilities
- `src/app/core`: backend settings and backend-wide cross-cutting concerns
- `src/app/db`: SQLAlchemy base, sessions, and DB integration wiring
- `src/app/modules/<feature>/api`: FastAPI routers and request/response schemas
- `src/app/modules/<feature>/application`: use cases and orchestration logic
- `src/app/modules/<feature>/domain`: domain models and domain rules
- `src/app/modules/<feature>/infrastructure`: persistence or external integration details
- `src/app/shared`: reusable backend utilities that are not domain-specific
- `tests`: backend tests, preferably mirroring module boundaries

## Rules
- Use type hints in all Python code.
- Keep FastAPI routers thin.
- Put business logic in application services or use-case layers, not directly in routers.
- Database schema changes must include a migration.
- New behavior requires tests.
- Do not create a `shared` abstraction until it is needed by multiple modules.

## Change-impact rules
- If API runtime or env handling changes, update `docs/architecture/backend.md` and the relevant runbooks.
- If migration workflow changes, update `docs/runbooks/database-migrations.md`.
- If a module layout changes, update `docs/architecture/backend.md`.
- If API contracts change, update backend tests and any affected frontend integration.
