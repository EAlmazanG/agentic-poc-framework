# Frontend Architecture

## Stack

- Next.js App Router
- TypeScript
- Tailwind CSS
- Jest + Testing Library

## Layout

- `src/app`: routes and layouts
- `src/components`: reusable UI building blocks
- `src/lib`: shared frontend utilities and integration boundaries
- `src/features`: feature-oriented modules when the app grows

## Rules

- Prefer Server Components by default.
- Use Client Components only when required.
- Keep the API integration boundary centralized.
- Add tests for meaningful UI behavior.
