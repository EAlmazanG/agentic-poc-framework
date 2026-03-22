# Database Migrations

## Create a migration

```bash
cd apps/api
uv run alembic revision --autogenerate -m "describe change"
```

## Apply migrations

```bash
make api-migrate
```

## Rules

- Every schema change must ship with a migration.
- Migration workflow changes must update this runbook and `apps/api/AGENTS.md`.
