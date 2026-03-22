# Testing Workflow

## Canonical commands

- `make api-test`
- `make web-test`
- `make test`
- `make ci`

## Expectations

- New behavior should include tests.
- Bug fixes should include regression coverage when practical.
- Type checks and linting are part of the validation path, not optional extras.

## Local validation order

1. Run the smallest relevant app-level checks.
2. Run the app-level test suite.
3. Run `make ci` before considering broader work complete.
