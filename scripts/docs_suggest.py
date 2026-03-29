from __future__ import annotations

import json
import subprocess
import sys
from pathlib import Path
from typing import Any

REPO_ROOT = Path(__file__).resolve().parent.parent
CHANGE_IMPACT_PATH = REPO_ROOT / "docs/change-impact.json"


def load_change_impact() -> dict[str, Any]:
    return json.loads(CHANGE_IMPACT_PATH.read_text())


def get_changed_files(cli_args: list[str]) -> list[str]:
    if cli_args:
        return sorted(dict.fromkeys(arg for arg in cli_args if arg))

    candidates = [
        ["git", "diff", "--name-only", "--relative", "HEAD"],
        ["git", "diff", "--name-only", "--relative"],
    ]

    for command in candidates:
        try:
            completed = subprocess.run(
                command,
                cwd=REPO_ROOT,
                check=True,
                capture_output=True,
                text=True,
            )
        except (OSError, subprocess.CalledProcessError):
            continue

        files = [line.strip() for line in completed.stdout.splitlines() if line.strip()]
        if files:
            return sorted(dict.fromkeys(files))

    return []


def matches_any_path(file_path: str, patterns: list[str]) -> bool:
    target = Path(file_path)
    return any(target.match(pattern) for pattern in patterns)


def infer_change_types(changed_files: list[str], change_types: dict[str, Any]) -> list[str]:
    matches: list[str] = []

    for change_name, payload in change_types.items():
        patterns = payload.get("match_paths", [])
        if patterns and any(matches_any_path(file_path, patterns) for file_path in changed_files):
            matches.append(change_name)

    return matches


def print_change_suggestion(change_name: str, payload: dict[str, Any]) -> None:
    print(f"[{change_name}]")

    review_context = payload.get("review_context", [])
    update_docs = payload.get("update_docs", [])
    run_checks = payload.get("run_checks", [])

    if review_context:
        print("  Review context:")
        for item in review_context:
            print(f"  - {item}")

    if update_docs:
        print("  Update docs:")
        for item in update_docs:
            print(f"  - {item}")

    if run_checks:
        print("  Run checks:")
        for item in run_checks:
            print(f"  - make {item}")

    print()


def print_available_change_types(change_types: dict[str, Any]) -> None:
    print("Available change types:")
    for change_name in change_types:
        print(f"- {change_name}")


def main() -> int:
    data = load_change_impact()
    change_types = data.get("change_types", {})
    changed_files = get_changed_files(sys.argv[1:])

    if not changed_files:
        print("No changed files detected.")
        print("Pass file paths explicitly or run the command with local git changes present.")
        print()
        print_available_change_types(change_types)
        return 0

    print("Changed files:")
    for file_path in changed_files:
        print(f"- {file_path}")
    print()

    matched_change_types = infer_change_types(changed_files, change_types)
    if not matched_change_types:
        print("No specific change type matched the current file set.")
        print("Use the manifest directly if the change is conceptual or spans multiple areas.")
        print()
        print_available_change_types(change_types)
        return 0

    print("Suggested change routes:")
    print()
    for change_name in matched_change_types:
        print_change_suggestion(change_name, change_types[change_name])

    return 0


if __name__ == "__main__":
    raise SystemExit(main())
