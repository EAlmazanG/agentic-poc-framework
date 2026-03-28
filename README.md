# Agentic POC Framework

A reusable full-stack template for fast proof-of-concept projects built with a Python API, a Next.js frontend, Docker-first workflows, and a multi-agent collaboration model.

## What this template includes

- FastAPI backend in `apps/api`
- Next.js frontend in `apps/web`
- Docker Compose workflows for development, prod-like validation, and simple server deployment
- Root `Makefile` as the canonical command surface
- Linting, typing, tests, CI, and contribution guardrails
- Root and local `AGENTS.md` files
- Architecture docs, runbooks, ADRs, and a security baseline

## Operating model

- Humans start from `README.md`, `SECURITY.md`, and `docs/`
- Agents start from `AGENTS.md`, then the nearest local `AGENTS.md`, then the relevant docs
- Significant structural decisions live in `docs/adr/`
- All common workflows should be reachable through root `make` targets

## Quick start

```bash
cp .env.example .env
make setup
make dev-up
```

## Main commands

```bash
make help
make doctor
make setup
make dev-up
make prod-up
make deploy-up
make quick-check
make ci
```

## Repository map

```text
.
├── apps/
│   ├── api/
│   │   ├── src/app/core
│   │   ├── src/app/db
│   │   ├── src/app/modules
│   │   ├── src/app/shared
│   │   └── tests
│   └── web/
│       ├── src/app
│       ├── src/components
│       ├── src/features
│       └── src/lib
├── docs/
│   ├── architecture/
│   ├── adr/
│   └── runbooks/
├── infra/
│   ├── compose/
│   └── docker/
├── .github/
├── AGENTS.md
├── CONTRIBUTING.md
├── SECURITY.md
├── Makefile
└── .env.example
```

## Where to put things

- Backend settings and cross-cutting backend concerns go in `apps/api/src/app/core`
- Backend DB wiring goes in `apps/api/src/app/db`
- Backend feature code goes in `apps/api/src/app/modules/<feature>`
- Backend reusable but non-domain-specific helpers go in `apps/api/src/app/shared`
- Frontend routes and layouts go in `apps/web/src/app`
- Frontend reusable UI goes in `apps/web/src/components`
- Frontend feature-specific code goes in `apps/web/src/features/<feature>`
- Frontend shared integration/config helpers go in `apps/web/src/lib`
- Durable explanation goes in `docs/architecture`
- Operational procedures go in `docs/runbooks`
- Security baseline and review rules go in `SECURITY.md`

## Intentional empty folders

Some folders may stay almost empty in the template on purpose:

- `apps/api/src/app/shared`
- `apps/api/src/app/modules/example/infrastructure`
- `apps/web/src/features`

They exist to show where future code belongs when the project grows, not to force premature abstractions.

## Documentation index

- Architecture overview: `docs/architecture/overview.md`
- Repository structure: `docs/architecture/repository-structure.md`
- Backend architecture: `docs/architecture/backend.md`
- Frontend architecture: `docs/architecture/frontend.md`
- Docker and runtime model: `docs/architecture/docker-and-runtime.md`
- Agent context model: `docs/architecture/agent-context-model.md`
- Local development workflow: `docs/runbooks/local-development.md`
- Testing workflow: `docs/runbooks/testing.md`
- Docker deployment workflow: `docs/runbooks/docker-deployment.md`
- Database migrations: `docs/runbooks/database-migrations.md`
- Security baseline: `SECURITY.md`

## Agent guidance

- Global agent operating contract: `AGENTS.md`
- Backend local guide: `apps/api/AGENTS.md`
- Frontend local guide: `apps/web/AGENTS.md`

Read the nearest applicable guide before making changes.
