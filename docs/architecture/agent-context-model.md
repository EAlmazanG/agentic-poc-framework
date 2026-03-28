# Agent Context Model

## Purpose

This document explains how humans and coding agents should discover repository context without duplicating knowledge across many files.

## Reading order

### Humans
1. `README.md`
2. Relevant docs in `docs/architecture/` or `docs/runbooks/`
3. `CONTRIBUTING.md` when preparing changes or reviews

### Agents
1. `AGENTS.md`
2. The nearest local `AGENTS.md`
3. Relevant architecture or runbook docs for the task
4. ADRs only when the task affects a recorded decision

## Source-of-truth split

- `README.md`: overview, quick start, repository map
- `AGENTS.md`: operational rules for agents
- `docs/architecture/*`: durable structure and boundaries
- `docs/runbooks/*`: workflows and procedures
- `docs/adr/*`: important decisions and trade-offs
- `SECURITY.md`: repository security baseline

## Update rules

- If commands change, update `README.md`, `docs/runbooks/*`, and relevant `AGENTS.md` files.
- If structure changes, update `docs/architecture/*` and the relevant ADR.
- If security posture changes, update `SECURITY.md`, runtime docs, and relevant env examples.
- If agent behavior expectations change, update `AGENTS.md` and any affected local guides.

## Anti-patterns

- Do not duplicate architecture explanation inside `AGENTS.md`.
- Do not create random `CONTEXT.md` files with overlapping content.
- Do not create new top-level docs when an existing architecture or runbook document should be updated instead.
