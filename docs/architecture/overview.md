# Architecture Overview

`agentic-poc-framework` is a reusable workspace template for small full-stack POCs.

## Core applications

- `apps/api`: FastAPI backend
- `apps/web`: Next.js frontend

## Support layers

- `infra/compose`: environment-specific Docker Compose overlays
- `infra/docker`: Dockerfiles and proxy configuration
- `docs/architecture`: durable explanation of structure and boundaries
- `docs/runbooks`: operational workflows
- `docs/adr`: decision memory

## Design principles

- Keep the repo small but extensible.
- Use one root command surface through `Makefile`.
- Keep human-facing truth in `README.md` and `docs/`.
- Keep agent-operational guidance in `AGENTS.md` files.
- Add abstractions only when real usage requires them.

## Active baseline vs prepared structure

The template includes a minimal active baseline plus a few intentionally empty folders that show where future code should go.

### Active baseline
- `apps/api/src/app/core`
- `apps/api/src/app/db`
- `apps/api/src/app/modules/health`
- `apps/api/src/app/modules/example`
- `apps/web/src/app`
- `apps/web/src/components`
- `apps/web/src/lib`

### Prepared structure
- `apps/api/src/app/shared`
- `apps/api/src/app/modules/*/infrastructure`
- `apps/web/src/features`

Prepared structure exists to reduce future reshuffling, not to force premature complexity.
