#!/bin/sh
set -eu
echo "[chezmoi] Running script: Install password manager"

"$HOME/.local/bin/mise" use -g bitwarden@latest