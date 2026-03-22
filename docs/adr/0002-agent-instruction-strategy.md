# ADR 0002: Use canonical `AGENTS.md` with local specialization

## Status
Accepted

## Context
The repository should work across multiple coding-agent systems without duplicating context across many vendor-specific rule files.

## Decision
Use a small root `AGENTS.md` as the canonical operational contract, local `AGENTS.md` files for app-specific rules, and thin vendor adapters only when needed.

## Consequences
- The repo stays portable across tools.
- Local instructions can improve agent fidelity.
- Human-facing truth remains in `README.md` and `docs/`.
