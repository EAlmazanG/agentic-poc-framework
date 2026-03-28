# Contributing

## Development model

- Use the root `Makefile` as the canonical command interface.
- Keep changes focused and small when possible.
- Follow the local `AGENTS.md` file closest to the code you modify.
- Review `SECURITY.md` whenever a change affects runtime exposure, env handling, dependencies, or deployment.

## Definition of done

A change is not complete until all of the following are true:

- Relevant lint, typecheck, and test commands pass.
- Relevant tests were added or updated for the changed behavior.
- Documentation was updated when architecture, commands, workflows, or security posture changed.
- ADRs were added or updated for significant architectural decisions.

## Review checklist

Reviewers should verify:

- The code follows the local architecture rules.
- Tests match the behavior being changed.
- Runbooks were updated if operational flows changed.
- `AGENTS.md` files were updated if agent workflows changed.
- `SECURITY.md` was updated if runtime exposure, secrets handling, or deployment posture changed.
- No secrets or unsafe configuration were introduced.
