# Dotfiles

Personal dotfiles for Linux (Arch/Ubuntu/WSL), macOS and Windows, managed with [chezmoi](https://chezmoi.io).

## Getting Started

### Linux/macOS

```sh
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply lorant-v
```

### Windows

The first run needs an elevated shell because enabling WSL and the Virtual Machine Platform are admin-only operations. After the initial setup, `chezmoi apply` and `chezmoi update` can be run from a normal PowerShell.

```powershell
# Run as Administrator
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
winget install Git.Git twpayne.chezmoi
chezmoi init --apply https://github.com/B-urb/dotfiles.git
```



On first execution, chezmoi prompts for git author details and a few optional setup choices.

Bootstrap installs Ansible if needed and runs the local workstation playbook. Expect a sudo/become password prompt for system package installation. 