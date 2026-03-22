# API Agent Guide

## Commands
- `make api-lint`
- `make api-format`
- `make api-typecheck`
- `make api-test`
- `make api-migrate`

## Rules
- Use type hints in all Python code.
- Keep FastAPI routers thin.
- Put business logic in services or use-case layers, not directly in routers.
- Database schema changes must include a migration.
- New behavior requires tests.

## Update triggers
- If API runtime or env handling changes, update `docs/architecture/backend.md` and the relevant runbooks.
- If migration workflow changes, update `docs/runbooks/database-migrations.md`.
- If API contracts change, update backend tests and any affected frontend integration.