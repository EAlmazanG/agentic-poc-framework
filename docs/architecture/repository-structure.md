# Repository Structure

## Top-level shape

```text
.
├── apps/
├── docs/
├── infra/
├── .github/
├── AGENTS.md
├── CONTRIBUTING.md
├── Makefile
└── README.md
```

## Top-level responsibilities

- `apps/`: runnable application code
- `docs/`: durable explanation and runbooks
- `infra/`: container and runtime configuration
- `.github/`: repository automation and PR/CI policy
- `AGENTS.md`: repository-wide agent operating contract
- `Makefile`: single root command surface

## Application structure

### Backend

```text
apps/api/
├── src/app/core
├── src/app/db
├── src/app/modules
│   └── <feature>/
│       ├── api
│       ├── application
│       ├── domain
│       └── infrastructure
├── src/app/shared
└── tests
```

### Frontend

```text
apps/web/
├── src/app
├── src/components
├── src/features
├── src/lib
└── public
```

## Rules for creating folders

- Create a backend module in `apps/api/src/app/modules/<feature>` when behavior belongs to a coherent API/domain slice.
- Create `application`, `domain`, or `infrastructure` only when the feature actually needs them.
- Use `apps/api/src/app/shared` only for cross-module backend code.
- Create a frontend feature folder in `apps/web/src/features/<feature>` only when UI logic stops fitting cleanly in route-level composition.
- Keep top-level repository folders small and purpose-specific.

## What not to do

- Do not create generic `utils` or `helpers` folders at random locations.
- Do not put infra logic inside app folders.
- Do not put durable architecture explanation inside `AGENTS.md`.
