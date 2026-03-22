# ADR 0003: Use `uv`, `ruff`, `mypy`, `pytest`, and Alembic

## Status
Accepted

## Context
The backend template should be fast to bootstrap, strict enough for collaborative coding, and production-capable.

## Decision
Use `uv` for environment and dependency workflow, `ruff` for linting and formatting, `mypy` for static typing, `pytest` for tests, and Alembic for migrations.

## Consequences
- Local setup is fast and reproducible.
- Type and style expectations are explicit.
- Schema changes have a standard migration path.
