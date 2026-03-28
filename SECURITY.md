# Security Policy

## Security baseline for this template

This repository is designed to be safe by default for small POCs, but it is still a template. Every project created from it must review its own threat model, secrets handling, dependency policy, and deployment posture.

## Rules

- Never hardcode secrets, credentials, tokens, or private keys.
- Keep secrets in environment variables or a dedicated secret manager.
- Prefer non-root runtime containers.
- Prefer pinned or patch-level-controlled dependencies.
- Keep development-only tooling out of production runtime dependencies.
- Do not expose services publicly unless a deployment decision requires it.

## What must be reviewed before deployment

- `NEXT_PUBLIC_*` variables to ensure no sensitive value is exposed to the browser.
- `API_CORS_ORIGINS` and trusted hosts to ensure only expected origins/hosts are allowed.
- Docker/Compose port exposure and proxy behavior.
- Dependency freshness and security advisories.
- TLS strategy and reverse-proxy configuration.

## Reporting

If a real security issue is found in a project derived from this template, do not disclose secrets or exploit details in public issues. Report it through the private security channel used by the owning team.
