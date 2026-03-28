# Web Agent Guide

## Commands
- `make web-lint`
- `make web-format`
- `make web-typecheck`
- `make web-test`

## Folder responsibilities
- `src/app`: routes, layouts, and page-level composition
- `src/components`: reusable presentation components
- `src/features/<feature>`: feature-local UI logic and components when the app grows
- `src/lib`: shared frontend utilities, API/config boundaries, and framework adapters
- `public`: static assets

## Rules
- Prefer Server Components by default.
- Use Client Components only when interactivity is required.
- Keep UI components small and focused.
- Use the shared API/config boundary in `src/lib` instead of scattering request logic.
- New UI behavior should include tests when practical.
- Do not create a feature folder until there is real feature-level behavior to isolate.
- Treat `NEXT_PUBLIC_*` values as public browser data.
- If response headers, proxy behavior, or public runtime config change, update `SECURITY.md` and the runtime docs.

## Change-impact rules
- If the frontend structure changes materially, update `docs/architecture/frontend.md`.
- If local workflows change, update `docs/runbooks/local-development.md` and this file.
- If API integration patterns change, update the relevant frontend docs and tests.
- If browser-exposed env usage changes, update `SECURITY.md`.
