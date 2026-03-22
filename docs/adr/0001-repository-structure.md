# ADR 0001: Use `apps/api` and `apps/web`

## Status
Accepted

## Context
This repository is intended to be a reusable template workspace, not just a single product codebase.

## Decision
Use `apps/api` and `apps/web` as the primary application layout.

## Consequences
- The repo stays simple for current POCs.
- The layout can grow later with `apps/worker` or shared packages.
- Local agent instructions can live close to each application.
