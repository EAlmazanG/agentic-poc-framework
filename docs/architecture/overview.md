# Architecture Overview

`agentic-poc-framework` is a reusable workspace template for small full-stack POCs.

## Core applications

- `apps/api`: FastAPI backend
- `apps/web`: Next.js frontend

## Support layers

- `infra/compose`: environment-specific Docker Compose overlays
- `infra/docker`: production-capable Dockerfiles and proxy configuration
- `docs/architecture`: durable architecture explanation
- `docs/runbooks`: operational workflows
- `docs/adr`: architecture decision records

## Design principles

- Keep the repo small but extensible.
- Use one root command surface through `Makefile`.
- Keep human-facing truth in `README.md` and `docs/`.
- Keep agent-operational guidance in `AGENTS.md` files.
- Use ADRs for non-trivial structural decisions.
