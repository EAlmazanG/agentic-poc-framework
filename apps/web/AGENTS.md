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

## How to trace a frontend change
- Route entrypoint: start from `src/app` page/layout files
- UI composition: continue into `src/components` or `src/features/<feature>` if present
- Shared config or API boundary: continue into `src/lib`
- Verification: finish in the relevant test file, usually near the route or component being changed

## Typical frontend change map
- API integration change: update `src/lib`, affected routes/components, and frontend tests
- Browser-exposed config change: update `SECURITY.md` if `NEXT_PUBLIC_*` behavior changes
- Structure change: update frontend architecture docs if boundaries move

## Read extra docs only when needed
- `docs/architecture/frontend.md` if frontend structure or boundaries change
- `docs/runbooks/local-development.md` if local frontend workflow changes
- `SECURITY.md` if browser-exposed env usage, headers, or proxy behavior change
