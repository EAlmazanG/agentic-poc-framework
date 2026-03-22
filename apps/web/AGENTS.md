# Web Agent Guide

## Commands
- `make web-lint`
- `make web-format`
- `make web-typecheck`
- `make web-test`

## Rules
- Prefer Server Components by default.
- Use Client Components only when interactivity is required.
- Keep UI components small and focused.
- Use the shared API/config boundary in `src/lib` instead of scattering request logic.
- New UI behavior should include tests when practical.

## Update triggers
- If the frontend structure changes materially, update `docs/architecture/frontend.md`.
- If local workflows change, update `docs/runbooks/local-development.md` and this file.
- If API integration patterns change, update the relevant frontend docs and tests.