from __future__ import annotations

import json
import re
import sys
from pathlib import Path

REPO_ROOT = Path(__file__).resolve().parent.parent
MAKEFILE_PATH = REPO_ROOT / "Makefile"
CHANGE_IMPACT_PATH = REPO_ROOT / "docs/change-impact.json"

ROOT_DOC_FILES = [
    REPO_ROOT / "README.md",
    REPO_ROOT / "AGENTS.md",
    REPO_ROOT / "apps/api/AGENTS.md",
    REPO_ROOT / "apps/web/AGENTS.md",
]

ROOT_COMMANDS = [
    "help",
    "doctor",
    "setup",
    "dev-up",
    "prod-up",
    "deploy-up",
    "docs-check",
    "quick-check",
    "ci",
]

API_COMMANDS = [
    "api-lint",
    "api-format",
    "api-typecheck",
    "api-test",
    "api-migrate",
]

WEB_COMMANDS = [
    "web-lint",
    "web-format",
    "web-typecheck",
    "web-test",
]

MARKDOWN_REFERENCE_PATTERN = re.compile(r"`([^`]+\.md(?:/[^`]*)?)`")
MAKE_TARGET_PATTERN = re.compile(r"^([A-Za-z0-9_.-]+):", re.MULTILINE)


def load_make_targets() -> set[str]:
    return set(MAKE_TARGET_PATTERN.findall(MAKEFILE_PATH.read_text()))


def ensure_documented_commands_exist(make_targets: set[str]) -> list[str]:
    errors: list[str] = []

    readme = (REPO_ROOT / "README.md").read_text()
    api_agents = (REPO_ROOT / "apps/api/AGENTS.md").read_text()
    web_agents = (REPO_ROOT / "apps/web/AGENTS.md").read_text()

    for target in ROOT_COMMANDS:
        if target not in make_targets:
            errors.append(f"Missing Makefile target: {target}")
        if f"make {target}" not in readme:
            errors.append(f"README.md is missing documented command: make {target}")

    for target in API_COMMANDS:
        if target not in make_targets:
            errors.append(f"Missing Makefile target: {target}")
        if f"make {target}" not in api_agents:
            errors.append(f"apps/api/AGENTS.md is missing documented command: make {target}")

    for target in WEB_COMMANDS:
        if target not in make_targets:
            errors.append(f"Missing Makefile target: {target}")
        if f"make {target}" not in web_agents:
            errors.append(f"apps/web/AGENTS.md is missing documented command: make {target}")

    return errors


def ensure_markdown_references_exist() -> list[str]:
    errors: list[str] = []

    for file_path in ROOT_DOC_FILES:
        content = file_path.read_text()
        for ref in MARKDOWN_REFERENCE_PATTERN.findall(content):
            if ref.endswith("/*"):
                candidate = REPO_ROOT / ref[:-2]
                if not candidate.exists() or not candidate.is_dir():
                    errors.append(f"Missing referenced doc in {file_path.relative_to(REPO_ROOT)}: {ref}")
                continue

            candidate = REPO_ROOT / ref
            if not candidate.exists():
                errors.append(f"Missing referenced doc in {file_path.relative_to(REPO_ROOT)}: {ref}")

    return errors


def ensure_change_impact_manifest(make_targets: set[str]) -> list[str]:
    errors: list[str] = []

    if not CHANGE_IMPACT_PATH.exists():
        return ["Missing change-impact manifest: docs/change-impact.json"]

    try:
        data = json.loads(CHANGE_IMPACT_PATH.read_text())
    except json.JSONDecodeError as exc:
        return [f"Invalid JSON in docs/change-impact.json: {exc}"]

    if not isinstance(data, dict):
        return ["docs/change-impact.json must contain a top-level object"]

    if data.get("version") != 1:
        errors.append("docs/change-impact.json must declare version 1")

    change_types = data.get("change_types")
    if not isinstance(change_types, dict) or not change_types:
        return errors + ["docs/change-impact.json must define a non-empty change_types object"]

    for change_name, payload in change_types.items():
        if not isinstance(payload, dict):
            errors.append(f"change_types.{change_name} must be an object")
            continue

        for key in ("review_context", "update_docs", "run_checks"):
            value = payload.get(key)
            if not isinstance(value, list):
                errors.append(f"change_types.{change_name}.{key} must be an array")
                continue

            for item in value:
                if not isinstance(item, str) or not item:
                    errors.append(f"change_types.{change_name}.{key} contains an invalid value")
                    continue

                if key == "run_checks":
                    if item not in make_targets:
                        errors.append(f"change_types.{change_name}.run_checks references missing make target: {item}")
                    continue

                candidate = REPO_ROOT / item
                if not candidate.exists():
                    errors.append(f"change_types.{change_name}.{key} references missing path: {item}")

    return errors


def main() -> int:
    make_targets = load_make_targets()
    errors = [
        *ensure_documented_commands_exist(make_targets),
        *ensure_markdown_references_exist(),
        *ensure_change_impact_manifest(make_targets),
    ]

    if errors:
        for error in errors:
            print(error)
        return 1

    print("Documentation guardrails passed.")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
