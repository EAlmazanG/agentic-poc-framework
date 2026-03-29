# Agentic POC Framework

<p align="center">
  A reusable full-stack template for fast proof-of-concept projects with a Python API, a Next.js frontend, Docker-first workflows, and a multi-agent collaboration model.
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Python-3.12-3776AB?logo=python&logoColor=white" alt="Python 3.12" />
  <img src="https://img.shields.io/badge/Node-20-339933?logo=node.js&logoColor=white" alt="Node 20" />
  <img src="https://img.shields.io/badge/FastAPI-Backend-009688?logo=fastapi&logoColor=white" alt="FastAPI Backend" />
  <img src="https://img.shields.io/badge/Next.js-Frontend-000000?logo=next.js&logoColor=white" alt="Next.js Frontend" />
  <img src="https://img.shields.io/badge/Docker-First-2496ED?logo=docker&logoColor=white" alt="Docker First" />
  <img src="https://img.shields.io/badge/Agent-Friendly-7A3EFF" alt="Agent Friendly" />
</p>

---

## Overview

This template is designed to help you move quickly without losing structure.

It gives you:

- a FastAPI backend in `apps/api`
- a Next.js frontend in `apps/web`
- Docker Compose workflows for development, prod-like validation, and deployment
- a root `Makefile` as the canonical command surface
- linting, typing, tests, CI, and lightweight documentation guardrails
- agent-oriented guidance through root and local `AGENTS.md` files
- durable architecture docs, runbooks, ADRs, and a security baseline

## Why this template exists

Use it when you want a repo that is:

- **fast to start**
- **easy to navigate**
- **safe to evolve**
- **understandable for both humans and coding agents**

The template is intentionally opinionated:

- one root command surface through `Makefile`
- clear backend and frontend boundaries
- minimal default reading path for agents
- documentation kept focused on durable structure and real workflows

## Operating model

- **Humans** start from `README.md`, then review `SECURITY.md` and `docs/` only as needed.
- **Agents** start from `AGENTS.md`, then read extra docs on demand.
- **Architecture decisions** live in `docs/adr/`.
- **Common workflows** should be reachable through root `make` targets.

---

## Quick start

```bash
cp .env.example .env
make setup
make dev-up
```

## Main commands

| Area | Command | Purpose |
| --- | --- | --- |
| Help | `make help` | Show the main command surface |
| Tooling check | `make doctor` | Verify required local tooling |
| Bootstrap | `make setup` | Prepare env, dependencies, and hooks |
| Development | `make dev-up` | Start the development stack |
| Prod-like | `make prod-up` | Start the prod-like local stack |
| Deployment | `make deploy-up` | Start the deployment stack |
| Docs guardrail | `make docs-check` | Verify documented commands, doc references, and change-impact alignment |
| Docs suggestion | `make docs-suggest` | Suggest docs, context files, and checks for the current changes |
| Fast validation | `make quick-check` | Run the fast local guardrails |
| Full validation | `make ci` | Run the full local validation flow |

---

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

### Backend

- `apps/api/src/app/core` for settings and cross-cutting backend concerns
- `apps/api/src/app/db` for database wiring and SQLAlchemy integration
- `apps/api/src/app/modules/<feature>` for feature code
- `apps/api/src/app/shared` for reusable backend helpers that truly need to be shared

### Frontend

- `apps/web/src/app` for routes, layouts, and page composition
- `apps/web/src/components` for reusable presentation components
- `apps/web/src/features/<feature>` for feature-specific frontend code
- `apps/web/src/lib` for shared integration and config boundaries

### Documentation and operations

- `docs/architecture` for durable structural explanation
- `docs/runbooks` for operational procedures
- `SECURITY.md` for security baseline and review rules
- `AGENTS.md` files for agent-operational guidance

## Intentional empty folders

Some folders may remain almost empty on purpose:

- `apps/api/src/app/shared`
- `apps/api/src/app/modules/example/infrastructure`
- `apps/web/src/features`

They exist to show where future code should go when the project grows, not to force premature abstractions.

---

## Documentation index

### Architecture

- Repository structure: `docs/architecture/repository-structure.md`
- Backend architecture: `docs/architecture/backend.md`
- Frontend architecture: `docs/architecture/frontend.md`
- Docker and runtime model: `docs/architecture/docker-and-runtime.md`

### Runbooks

- Local development workflow: `docs/runbooks/local-development.md`
- Testing workflow: `docs/runbooks/testing.md`
- Docker deployment workflow: `docs/runbooks/docker-deployment.md`
- Database migrations: `docs/runbooks/database-migrations.md`

### Governance

- Security baseline: `SECURITY.md`
- Contribution guide: `CONTRIBUTING.md`
- Change impact manifest: `docs/change-impact.json`
- Architecture decisions: `docs/adr/`

---

## Agent guidance

Agents should use the minimal reading path:

- Read `AGENTS.md`
- Read one local `AGENTS.md` only if touching `apps/api` or `apps/web`
- Read extra docs only when the task affects commands, structure, runtime, security, or deployment
- Use `.windsurf/workflows/project-bootstrap.md` when adapting the template to a new project description

## Local guides

- Backend agent guide: `apps/api/AGENTS.md`
- Frontend agent guide: `apps/web/AGENTS.md`

---

## Validation flow

- **Documentation guardrail**: `make docs-check`
- **Context-aware suggestion**: `make docs-suggest`
- **Fast code guardrail**: `make quick-check`
- **Full local validation**: `make ci`

## Documentation automation model

- `docs/change-impact.json` is the canonical machine-readable map for change routing.
- `make docs-check` validates command/docs/manifest consistency.
- `make docs-suggest` consumes that manifest and suggests what to review, update, and run for the current file changes.
