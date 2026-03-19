# AGENTS.md

This repository manages personal dotfiles with `chezmoi`.

## Goal

- Keep this setup minimal, reproducible, and safe across machines.
- Prefer small, targeted changes over broad refactors.
- Respect existing conventions so generated home-directory files stay correct.

## Repository shape

- Root docs: `README.md`, `AGENTS.md`.
- Chezmoi core config: `.chezmoi.yaml.tmpl`, `.chezmoiexternal.yaml`, `.chezmoiignore.tmpl`.
- Shell config: `dot_bashrc`, `dot_zshrc`.
- Neovim config: `dot_config/nvim/`.
- Terminal/tmux/starship: `dot_config/ghostty/`, `dot_config/tmux/`, `dot_config/starship.toml`.
- SSH/AWS: `private_dot_ssh/`, `dot_aws/`.
- Local scripts: `dot_local/scripts/`.
- OpenCode customizations: `dot_config/opencode/agents/` and `dot_config/opencode/commands/`.

## Chezmoi naming conventions used here

- `dot_foo` -> `.foo` in the target home directory.
- `private_` files contain sensitive/private material and should stay private.
- `*.tmpl` are Go templates evaluated by chezmoi at apply time.
- `executable_foo` becomes `foo` with executable permissions.
- `exact_foo` becomes `foo` and is managed as an exact directory/file.

Examples in this repo:

- `dot_gitconfig.tml` -> `~/.gitconfig`

## Editing rules for agents

- Follow existing style in each file (shell style, Lua style, template style).
- Keep comments minimal; only add them when logic is non-obvious.
- Make focused edits; avoid unrelated cleanup in the same change.
- Do not rename/move chezmoi-managed files unless required.
- Be extra careful with template conditionals (OS checks, ..).
- Never use destructive git commands unless explicitly requested.

## Validation after changes

Run the smallest relevant checks first:

1. `chezmoi diff`
2. `chezmoi apply --dry-run --verbose`
3. If shell scripts changed: `bash -n <file>` (and `zsh -n <file>` for zsh-specific files)
4. If Python scripts changed: `python3 -m py_compile <file>`

If a command cannot run in the current environment, report that clearly and provide a manual verify step.

## Commit and PR guidance

- Keep commit messages short and imperative (existing history uses styles like `Add ...`, `Fix ...`, `Swap ...`).
- Describe why the change exists, not just what changed.
- Avoid bundling unrelated updates.