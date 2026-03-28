# Docker and Runtime Model

## Runtime modes

- `dev`: local development with hot reload
- `prod`: local prod-like validation using production-style images
- `deploy`: simple server deployment using Compose overlays

## Compose layering

- `infra/compose/compose.yaml`: shared base services and healthchecks
- `infra/compose/compose.dev.yaml`: development overrides and mounts
- `infra/compose/compose.prod.yaml`: local prod-like port exposure and restart policy
- `infra/compose/compose.deploy.yaml`: deploy topology with proxy and server-oriented restart behavior

## Dockerfile strategy

- `infra/docker/api.Dockerfile` has explicit `dev` and `runtime` stages
- `infra/docker/web.Dockerfile` has explicit `dev`, `builder`, and `runner` stages

## Rules

- Keep image build concerns in Dockerfiles.
- Keep environment intent in Compose overlays.
- Avoid installing dependencies in runtime commands.
- If runtime topology changes, update this file and the deployment runbooks.
