# Lorant's dotfiles

These dotfiles are managed using [chezmoi](https://github.com/twpayne/chezmoi).

## Getting Started

### Prerequisites

* `curl` should be installed

### Installation

```shell
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply lorant-v
```

On first apply, `chezmoi` prompts for your name and email address.

If the machine is running under WSL, it can also optionally copy the Windows host `~/.ssh` directory into WSL. That copy only runs when you opt in and the target `~/.ssh` does not already exist.

Bootstrap also installs Ansible when it is missing, then runs `ansible/playbook.yml`. Expect a sudo or become-password prompt during package installation.
