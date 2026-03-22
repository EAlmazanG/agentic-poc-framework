# Docker and Runtime Model

## Runtime modes

- `dev`: local development with hot reload and mounted source code
- `prod`: local prod-like validation with production-style images
- `deploy`: simple server deployment using Compose overlays

## Compose layering

- `infra/compose/compose.yaml`: base shared services
- `infra/compose/compose.dev.yaml`: development overrides
- `infra/compose/compose.prod.yaml`: local prod-like validation overrides
- `infra/compose/compose.deploy.yaml`: deployment-specific overrides

## Service model

- `db`: PostgreSQL stateful service
- `api`: FastAPI application service
- `web`: Next.js application service
- `proxy`: optional deploy-layer reverse proxy

## Operational rule

Keep image-specific behavior in Dockerfiles and environment-specific behavior in Compose overlays.
