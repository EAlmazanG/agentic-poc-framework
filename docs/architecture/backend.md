# Backend Architecture

## Stack

- FastAPI
- Pydantic Settings
- SQLAlchemy
- Alembic
- Ruff
- mypy
- pytest

## Baseline layout

- `src/app/main.py`: application factory and router registration
- `src/app/core`: settings and backend-wide concerns
- `src/app/db`: DB base and session wiring
- `src/app/modules/health`: minimal health slice
- `src/app/modules/example`: example of the intended feature architecture
- `tests`: backend tests

## How to structure a new backend feature

Create a new folder in `src/app/modules/<feature>` and add only the layers you actually need.

- `api`: routers and transport schemas
- `application`: use cases or orchestration services
- `domain`: domain models and domain rules
- `infrastructure`: adapters for persistence or external integrations

## Rules

- Keep routers thin.
- Put business logic outside routers.
- Keep module-local logic inside the module.
- Move code to `shared` only when multiple modules need the same abstraction.
- Every behavior change should have tests.
- Every schema change should have a migration.
