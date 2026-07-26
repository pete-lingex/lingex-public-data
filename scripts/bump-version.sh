#!/usr/bin/env sh
set -eu

usage() {
  cat <<'USAGE'
Usage:
  scripts/bump-version.sh [--patch] [--set X.Y.Z] [--stage]

Default behavior increments the patch version by 0.0.1.
Use --set for deliberate larger version bumps. Use --stage from the pre-commit hook.

Environment:
  LINGEX_PUBLIC_DATA_SKIP_AUTO_VERSION=1  Skip when called by automation.
USAGE
}

SCRIPT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
REPO_ROOT=$(CDPATH= cd -- "$SCRIPT_DIR/.." && pwd)
MODE="patch"
SET_VERSION=""
STAGE=0

while [ "$#" -gt 0 ]; do
  case "$1" in
    --patch)
      MODE="patch"
      shift
      ;;
    --set)
      MODE="set"
      SET_VERSION="${2:-}"
      shift 2
      ;;
    --stage)
      STAGE=1
      shift
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      echo "Unknown argument: $1" >&2
      usage >&2
      exit 2
      ;;
  esac
done

if [ "${LINGEX_PUBLIC_DATA_SKIP_AUTO_VERSION:-0}" = "1" ]; then
  echo "[lingex-public-data-version] Skipped because LINGEX_PUBLIC_DATA_SKIP_AUTO_VERSION=1."
  exit 0
fi

cd "$REPO_ROOT"

python3 - "$MODE" "$SET_VERSION" <<'PY'
from pathlib import Path
import re
import sys

mode, set_version = sys.argv[1], sys.argv[2]
version_file = Path("VERSION")

if not version_file.exists():
    raise SystemExit("[lingex-public-data-version] Missing required file: VERSION")

old_version = version_file.read_text().strip()
if not re.fullmatch(r"\d+\.\d+\.\d+", old_version):
    raise SystemExit("[lingex-public-data-version] VERSION must contain X.Y.Z")

major, minor, patch = map(int, old_version.split("."))
if mode == "set":
    if not re.fullmatch(r"\d+\.\d+\.\d+", set_version):
        raise SystemExit("[lingex-public-data-version] --set requires X.Y.Z")
    next_version = set_version
else:
    next_version = f"{major}.{minor}.{patch + 1}"

version_file.write_text(next_version + "\n")
print(f"[lingex-public-data-version] Version {old_version} -> {next_version}")
PY

if [ "$STAGE" -eq 1 ]; then
  git add VERSION
fi
