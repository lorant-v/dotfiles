#!/usr/bin/env bash
set -euo pipefail
echo "[chezmoi] Running script: Install mise"

MISE="$HOME/.local/bin/mise"

# install mise if missing
if [ ! -x "$MISE" ]; then
    curl -fsSL https://mise.run | MISE_SELF_UPDATE_MINIMUM_RELEASE_AGE="7d" sh
fi

$MISE activate