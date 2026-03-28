# Frontend Architecture

## Stack

- Next.js App Router
- TypeScript
- Tailwind CSS
- Jest + Testing Library

## Baseline layout

- `src/app`: routes, layouts, and top-level page composition
- `src/components`: reusable presentation components
- `src/features`: feature-local code once a feature grows beyond route composition
- `src/lib`: shared config, API, and framework integration helpers
- `public`: static assets

## How to structure a new frontend feature

Start in the route layer if the feature is still small.
When logic, state, or subcomponents become feature-specific, create `src/features/<feature>`.

## Rules

- Prefer Server Components by default.
- Use Client Components only when needed.
- Keep presentational UI in `components`.
- Keep shared API/config boundaries in `lib`.
- Avoid generic dumping grounds like `helpers` or `misc`.
