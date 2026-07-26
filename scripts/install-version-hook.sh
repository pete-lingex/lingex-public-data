#!/usr/bin/env sh
set -eu

SCRIPT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
REPO_ROOT=$(CDPATH= cd -- "$SCRIPT_DIR/.." && pwd)
HOOK_PATH="$REPO_ROOT/.git/hooks/pre-commit"

mkdir -p "$REPO_ROOT/.git/hooks"

cat > "$HOOK_PATH" <<'HOOK'
#!/usr/bin/env sh
set -eu

if [ "${LINGEX_PUBLIC_DATA_SKIP_AUTO_VERSION:-0}" = "1" ]; then
  echo "[lingex-public-data-version] Auto bump skipped: LINGEX_PUBLIC_DATA_SKIP_AUTO_VERSION=1."
  exit 0
fi

if git diff --cached --name-only | grep -Eq '^(VERSION)$'; then
  echo "[lingex-public-data-version] Auto bump skipped: VERSION already staged."
  exit 0
fi

./scripts/bump-version.sh --patch --stage
HOOK

chmod +x "$HOOK_PATH"
echo "[lingex-public-data-version] Installed pre-commit hook at $HOOK_PATH"
echo "[lingex-public-data-version] Normal commits now auto-increment patch version."
