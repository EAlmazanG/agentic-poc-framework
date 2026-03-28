# Web Agent Guide

## When to read this
Read this file only when touching `apps/web` code or frontend tests.

## Use these commands
- `make web-lint`
- `make web-format`
- `make web-typecheck`
- `make web-test`

## Where things go
- `src/app`: routes, layouts, and page-level composition
- `src/components`: reusable presentation components
- `src/features/<feature>`: feature-local UI logic and components when the app grows
- `src/lib`: shared frontend utilities, API/config boundaries, and framework adapters
- `public`: static assets

## Rules
- Prefer Server Components by default.
- Use Client Components only when interactivity is required.
- Keep UI components small and focused.
- Use `src/lib` for shared API/config boundaries.
- Add tests when new UI behavior matters.
- Do not create a feature folder until there is real feature-level behavior to isolate.
- Treat `NEXT_PUBLIC_*` values as public browser data.

## Read extra docs only when needed
- `docs/architecture/frontend.md` if frontend structure or boundaries change
- `docs/runbooks/local-development.md` if local frontend workflow changes
- `SECURITY.md` if browser-exposed env usage, headers, or proxy behavior change
