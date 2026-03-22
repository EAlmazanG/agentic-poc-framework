# Local Development

## Bootstrap

1. Copy `.env.example` to `.env`.
2. Run `make setup`.
3. Start the stack with `make dev-up`.

## Useful commands

- `make dev-logs`
- `make api-test`
- `make web-test`
- `make db-shell`

## Notes

- The API is exposed on `http://localhost:8000`.
- The frontend is exposed on `http://localhost:3000`.
- PostgreSQL is exposed on `localhost:5432` in dev mode.
