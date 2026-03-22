# Agentic POC Framework

A reusable full-stack template for fast proof-of-concept projects built with a Python API, a Next.js frontend, Docker-first workflows, and a multi-agent collaboration model.

## What this template includes

- FastAPI backend in `apps/api`
- Next.js frontend in `apps/web`
- PostgreSQL-ready runtime wiring for local development and deployment
- Docker Compose workflows for development, prod-like validation, and simple server deployment
- Root `Makefile` as the canonical command surface
- Linting, typing, tests, CI, and contribution guardrails
- `AGENTS.md` + local agent guides for consistent AI-assisted development
- Architecture docs, runbooks, and ADRs

## What this template does not include

- Production auth, billing, or multi-tenant architecture
- Background workers enabled by default
- Cloud-provider-specific deployment logic
- Domain-specific business logic beyond a minimal example slice

## Quick start

```bash
cp .env.example .env
make setup
make dev-up
```

## Main commands

```bash
make help
make dev-up
make prod-up
make deploy-up
make lint
make typecheck
make test
make ci
```

## Repository map

```text
.
├── apps/
│   ├── api/
│   └── web/
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
├── Makefile
└── .env.example
```

## Runtime modes

- `dev`: hot-reload local development with Compose overlays
- `prod`: local prod-like validation using production-style images and commands
- `deploy`: simple Docker Compose deployment target for a VPS or single Docker host

## Extension points

- Add a worker later as `apps/worker`
- Add shared internal packages later if the repo grows
- Keep runtime and process decisions in `docs/adr/`
- Keep operational workflows in `docs/runbooks/`

## Documentation index

- Architecture overview: `docs/architecture/overview.md`
- Repository structure: `docs/architecture/repository-structure.md`
- Docker and runtime model: `docs/architecture/docker-and-runtime.md`
- Local development workflow: `docs/runbooks/local-development.md`
- Testing workflow: `docs/runbooks/testing.md`
- Docker deployment workflow: `docs/runbooks/docker-deployment.md`
- Agent operating contract: `AGENTS.md`

## Agent guidance

This repository uses a canonical agent-instruction model:

- Root `AGENTS.md` for global operational rules
- `apps/api/AGENTS.md` for backend-specific rules
- `apps/web/AGENTS.md` for frontend-specific rules
- Optional thin adapters for agent-specific tools

If you are using an AI coding assistant, start with `AGENTS.md` before making changes.