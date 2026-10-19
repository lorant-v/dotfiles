# Dotfiles

Personal dotfiles for Linux (Arch/Ubuntu/WSL), macOS and Windows, managed with [chezmoi](https://chezmoi.io).

## Getting started

### Linux/macOS

```sh
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply lorant-v
```

### Windows

The first run needs an elevated shell because enabling WSL and the Virtual Machine Platform are admin-only operations. After that, `chezmoi apply` and `chezmoi update` run from a normal PowerShell.

```powershell
# Run as Administrator
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
winget install Git.Git twpayne.chezmoi
chezmoi init --apply https://github.com/lorant-v/dotfiles.git
```

chezmoi prompts for local configuration details like name and which profiles to enable. It then installs Ansible if it's missing and runs the local playbook, which installs system packages and the mise binary. mise installs the user tools after that. Expect a sudo prompt for the system packages.
