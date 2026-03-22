# ADR 0004: Use layered Docker Compose files

## Status
Accepted

## Context
The template should support both local development and simple real deployment without hiding environment differences inside a single Compose file.

## Decision
Use a shared base Compose file with dedicated overlays for development, local prod-like validation, and deployment.

## Consequences
- Runtime intent stays explicit.
- Development and deployment concerns are separated cleanly.
- The `Makefile` can expose a stable command surface over a predictable runtime model.
