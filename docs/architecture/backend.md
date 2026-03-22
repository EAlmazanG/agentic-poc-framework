# Backend Architecture

## Stack

- FastAPI
- Pydantic Settings
- SQLAlchemy
- Alembic
- Ruff
- mypy
- pytest

## Layout

- `src/app/main.py`: application entrypoint
- `src/app/core`: settings and future shared backend concerns
- `src/app/db`: SQLAlchemy base and session wiring
- `src/app/modules/*`: domain or feature modules
- `tests/`: backend tests

## Rules

- Keep routers thin.
- Put business logic outside routers.
- New behavior requires tests.
- Schema changes require Alembic migrations.
