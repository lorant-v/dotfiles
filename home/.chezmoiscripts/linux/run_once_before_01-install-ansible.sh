#!/bin/sh
# Install Ansible before dotfiles are applied.
set -eu
echo "[chezmoi] Running script: Install Ansible"

if command -v ansible-playbook >/dev/null 2>&1; then
  echo "[chezmoi] Ansible already installed, skipping"
  exit 0
fi

if command -v apt-get >/dev/null 2>&1; then
  sudo apt-get update
  sudo apt-get install -y ansible
elif command -v dnf >/dev/null 2>&1; then
  sudo dnf install -y ansible
elif command -v pacman >/dev/null 2>&1; then
  sudo pacman -Sy --noconfirm ansible
elif command -v brew >/dev/null 2>&1; then
  brew install ansible
else
  echo "No supported package manager found" >&2
  exit 1
fi
