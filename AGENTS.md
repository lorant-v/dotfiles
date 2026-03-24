# AGENTS.md

This repository manages personal dotfiles with `chezmoi`.

## Goal

- Keep this setup minimal, reproducible, and safe across machines.
- Prefer small, targeted changes over broad refactors.
- Respect existing conventions so generated home-directory files stay correct.

## Working style

- Start by understanding the goal, constraints, and affected files.
- Inspect existing code and docs before introducing new patterns.
- Ask only when blocked by ambiguity, missing credentials, or a risky irreversible action.
- Prefer small, reviewable diffs over sweeping rewrites.

## Repository shape

- Root docs: `README.md`, `AGENTS.md`.
- Chezmoi core config: `.chezmoi.yaml.tmpl`, `.chezmoiignore`.
- Chezmoi automation: `.chezmoiscripts/`.
- Bootstrap automation: `ansible/playbook.yml`.
- Managed dotfiles in this repo currently include `dot_gitconfig.tmpl` and `dot_config/opencode/`.
- OpenCode customizations live under `dot_config/opencode/agents/` and `dot_config/opencode/commands/`.

## Chezmoi naming conventions used here

- `dot_foo` -> `.foo` in the target home directory.
- `private_` files contain sensitive/private material and should stay private.
- `*.tmpl` are Go templates evaluated by chezmoi at apply time.
- `executable_foo` becomes `foo` with executable permissions.
- `exact_foo` becomes `foo` and is managed as an exact directory/file.

Examples in this repo:

- `dot_gitconfig.tmpl` -> `~/.gitconfig`

## Editing rules for agents

- Follow existing style in each file (shell style, template style, Markdown style).
- Keep comments minimal; only add them when logic is non-obvious.
- Make focused edits; avoid unrelated cleanup in the same change.
- Do not rename or move chezmoi-managed files unless required.
- Be extra careful with template conditionals, prompts, and platform-specific branches.
- Never use destructive git commands unless explicitly requested.

## Secrets and safety

- Never print secrets, tokens, private keys, or credentials.
- Do not weaken protections around copied SSH material or bootstrap prompts.
- Treat WSL and host-SSH copy flows as sensitive operations.
- Prefer existing authenticated tooling over asking users to paste secrets.

## Validation after changes

Run the smallest relevant checks first:

1. `chezmoi diff`
2. `chezmoi apply --dry-run --verbose`
3. If shell scripts changed: `bash -n <file>`
4. If `ansible/playbook.yml` changed: `ansible-playbook --syntax-check ansible/playbook.yml`
5. If Python scripts are added later: `python3 -m py_compile <file>`

If a command cannot run in the current environment, report that clearly and provide a manual verify step.

## Commit and PR guidance

- Use Conventional Commits for commit messages.
- Keep commits focused and scoped to the task.
- Describe why the change exists, not just what changed.
- Avoid bundling unrelated updates.

## Inspiration
- https://github.com/logandonley/dotfiles
  - Using chezmoi -> ansible for tool installation
- benchoncy
  - https://github.com/benchoncy/dotfiles
  - https://github.com/benchoncy/my-workstation-setup-playbook
- https://github.com/natelandau/dotfiles
  - https://github.com/natelandau/dotfiles
