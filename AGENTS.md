# Repository guidance

This repository manages personal dotfiles with `chezmoi`. Keep the setup minimal, reproducible, and safe across machines.

## Responsibilities

- Use chezmoi for home-directory files, templates, and lightweight setup orchestration.
- Use Ansible for repeatable machine provisioning and package installation.
- Use mise for user-level language runtimes and development tools.
- Keep application settings with their relevant dotfiles; keep secrets out of ordinary tracked files.

## Working style

- Understand the goal and affected behavior before editing.
- Prefer small, reviewable changes; avoid unrelated cleanup and unnecessary abstractions.
- Follow the existing conventions for shell, templates, YAML, and Markdown.
- Treat platform branches, prompts, and SSH-related flows as sensitive.
- Do not use destructive Git commands or discard work you did not create.


## Safety

- Never print or commit secrets, tokens, private keys, or credentials.
- Prefer authenticated tooling already available over asking for pasted credentials.

## Validation

- Do not run validation commands unless the user explicitly asks.
- After edits, list the smallest relevant checks for the user to run manually.
- Prefer `chezmoi diff` and `chezmoi apply --dry-run --verbose`; for shell changes suggest `bash -n <script>`, and for Ansible changes suggest `ansible-playbook --syntax-check -i <inventory> <playbook>`.

## Commits

Use focused Conventional Commits. Describe why the change exists, not only what files changed.
