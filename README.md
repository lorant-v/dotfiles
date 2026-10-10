# Dotfiles

This configuration is managed with [chezmoi](https://www.chezmoi.io/).

## Getting Started

### Prerequisites

* `curl`

### Installation

```sh
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply lorant-v
```

On first execution, chezmoi prompts for git author details and a few optional setup choices.

Bootstrap installs Ansible if needed and runs the local workstation playbook. Expect a sudo/become password prompt for system package installation. 