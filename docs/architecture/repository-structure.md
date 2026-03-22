# Repository Structure

## Chosen shape

```text
.
├── apps/
│   ├── api/
│   └── web/
├── docs/
├── infra/
├── .github/
├── AGENTS.md
├── CONTRIBUTING.md
├── Makefile
└── README.md
```

## Why `apps/api` and `apps/web`

This repository is a template workspace, not just a product repo. The `apps/*` structure leaves a clean path for future additions such as `apps/worker` or shared internal packages without forcing a later redesign.

## Boundaries

- App code belongs inside `apps/`.
- Runtime and container logic belongs inside `infra/`.
- Durable explanation belongs inside `docs/`.
- Root-level files should stay focused on entrypoints and repository-wide rules.
