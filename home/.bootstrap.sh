#!/bin/sh
set -eu

# Install all chezmoi dependencies:
# - Password manager (bw via mise)

MISE="$HOME/.local/bin/mise"
BW="$HOME/.local/share/mise/shims/bw"

# exit early if bw is already available
[ -x "$BW" ] && exit 0
command -v bw >/dev/null 2>&1 && exit 0

case "$(uname -s)" in
Darwin | Linux) ;;
*)
    echo "unsupported OS: $(uname -s)" >&2
    exit 1
    ;;
esac

# install mise if missing
if [ ! -x "$MISE" ]; then
    curl -fsSL https://mise.run | sh
fi

# install bw and make sure its shim exists
"$MISE" use -g bitwarden@latest