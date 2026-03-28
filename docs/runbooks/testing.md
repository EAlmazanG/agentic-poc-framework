# Testing Workflow

## Canonical commands

- `make quick-check`
- `make api-test`
- `make web-test`
- `make test`
- `make ci`

## Expectations

- New behavior should include tests.
- Bug fixes should include regression coverage when practical.
- Type checks and linting are part of the validation path.

## Recommended local order

1. Run the smallest relevant app-level checks.
2. Run the relevant app-level tests.
3. Run `make ci` before considering broader work complete.

## When to update this runbook

Update this file when validation commands, test tooling, or repo-level quality gates change.
