# Local Development

## Bootstrap

1. Copy `.env.example` to `.env`.
2. Run `make setup`.
3. Start the stack with `make dev-up`.

## Validation flow

- Documentation guardrail: `make docs-check`
- Context-aware suggestion when commands/docs/runtime change: `make docs-suggest`
- Fast code guardrail: `make quick-check`
- Full local validation: `make ci`

## Useful commands

- `make dev-logs`
- `make api-test`
- `make web-test`
- `make db-shell`
- `make compose-dev-config`

## When to update this runbook

Update this file whenever:
- `Makefile` bootstrap commands change
- dev Compose mounts or commands change
- expected local ports or services change
