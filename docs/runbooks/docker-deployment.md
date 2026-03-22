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

## Notes

- `compose.prod.yaml` is for local production-style validation.
- `compose.deploy.yaml` is the deployment-specific overlay for simple servers.
- If runtime commands or port mappings change, update this runbook, `README.md`, and the relevant `AGENTS.md` files.
