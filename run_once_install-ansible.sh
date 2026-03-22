#!/bin/sh
set -eu

if command -v ansible-playbook >/dev/null 2>&1; then
  exit 0
fi

install_with_apt() {
  sudo apt-get update
  sudo apt-get install -y ansible
}

install_with_dnf() {
  sudo dnf install -y ansible
}

install_with_pacman() {
  sudo pacman -Sy --noconfirm ansible
}

install_with_brew() {
  brew install ansible
}

if command -v apt-get >/dev/null 2>&1; then
  install_with_apt
elif command -v dnf >/dev/null 2>&1; then
  install_with_dnf
elif command -v pacman >/dev/null 2>&1; then
  install_with_pacman
elif command -v brew >/dev/null 2>&1; then
  install_with_brew
else
  echo "No supported package manager found for installing ansible" >&2
  exit 1
fi
