---
description: adapt the template to a new project description
---
# Project bootstrap workflow

Use this workflow when the user describes a new POC or product idea and wants this template adapted before feature work starts.

## Goal

Convert the generic template into a project-specific baseline without over-customizing the repo or adding premature complexity.

## Inputs to collect first

Before editing, extract or ask for the minimum project brief:

1. Product or project name.
2. One-sentence description of what the project does.
3. Primary users or audience.
4. First feature or vertical slice to build.
5. Whether auth is needed now, later, or not at all.
6. Whether the frontend is important, optional, or secondary.
7. Whether the project will handle sensitive data or browser-exposed config.

If any of these are missing, ask only for the missing items that materially change the initial setup.

## What to change in the bootstrap step

Apply only the minimum baseline changes needed to reflect the project:

1. Update project identity and visible placeholders.
   - `README.md`
   - `apps/web/src/app/page.tsx`
   - any obvious template-facing project title or description values

2. Update project-facing operational context.
   - `AGENTS.md` only if the project focus changes what agents should prioritize first
   - `SECURITY.md` only if the project brief changes runtime exposure expectations or sensitive data handling

3. Align the first implementation direction.
   - clarify the first module, first route, or first slice in the docs only if that helps future work
   - keep the repo structure intact unless the brief requires a real structural change

4. Keep the template safe and reusable.
   - do not add new shared abstractions unless at least two real call sites need them
   - do not add new runtime dependencies without asking
   - do not invent complex architecture before the first real feature exists

## What not to do in the bootstrap step

Do not do any of the following unless the user explicitly asks for it:

1. Generate a large feature set.
2. Reorganize the whole repository.
3. Add auth infrastructure speculatively.
4. Introduce new deployment complexity.
5. Add long narrative documentation.
6. Create ADRs unless a significant decision has actually been made.

## Expected bootstrap output

Before applying changes, propose a short plan with:

1. Which baseline files will change.
2. What will be personalized now.
3. What will be intentionally deferred.

After applying changes:

1. Run `make docs-suggest` if the changes affect docs, workflow, or runtime guidance.
2. Run `make docs-check`.
3. Run the smallest relevant app checks.
4. Summarize the baseline changes and the deferred decisions.

## Default interpretation rules

When the project brief is ambiguous:

1. Prefer the smallest viable customization.
2. Keep backend and frontend both available unless the user clearly wants one removed.
3. Keep security posture conservative by default.
4. Preserve the documentation system and agent routing already present in the template.
5. Optimize for a clean first slice, not for hypothetical future scale.
