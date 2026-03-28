# Docker Deployment

## Local prod-like validation

```bash
make prod-up
make prod-logs
make prod-down
```

## Simple server deployment

```bash
make deploy-pull
make deploy-up
make deploy-logs
```

## Meaning of each mode

- `prod` validates production-style images locally
- `deploy` represents the server topology, including the proxy layer

## When to update this runbook

Update this file whenever:
- `infra/compose/compose.prod.yaml` changes
- `infra/compose/compose.deploy.yaml` changes
- `infra/docker/*` changes in a way that affects runtime behavior
- exposed ports or proxy behavior changes
