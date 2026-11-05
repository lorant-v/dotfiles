This setup uses three tools, each with its own responsibility.

| Tool | Responsibility | Examples |
|---|---|---|
| **chezmoi** | Files and settings in the user's home directory; lightweight setup orchestration | Shell config, Git config, templates, running setup scripts |
| **Ansible** | Machine-level setup and OS packages | Installing packages, configuring services, applying platform-specific tasks |
| **mise** | User-level tools and runtimes with selectable versions | Node.js, OpenTofu, developer CLIs |
 |



## Setup layers

The layers run in dependency order:

1. **Prerequisites** — install what's needed to start setup, such as chezmoi or Ansible.
2. **User configuration** — chezmoi places files and renders templates.
3. **Machine provisioning** — Ansible installs system packages and applies system-level configuration.
4. **User tools** — mise installs the tools declared for that user and machine.

Chezmoi can trigger provisioning during `apply` for convenient bootstrapping. Keep independently changing work separate where possible: changing a mise tool should not require rerunning unrelated system provisioning.

## Platform and profiles

Treat these as separate dimensions:

- **Platform facts** are detected: operating system and Linux distribution.
- **Environment facts** describe where it runs: for example WSL, a VM, or a container. Apply only the environment-specific differences; a VM can still be a workstation or a server.
- **Profiles** are choices about what the machine is for: for example `homelab` or `development`. Use them to opt into related tools or configuration.

Platform and environment determine compatibility. Profiles determine optional capabilities. Combine them with conditions rather than creating a separate setup for every combination (such as `ubuntu-wsl-homelab`).

## Where things go

- Home-directory files and application settings → **chezmoi**.
- System packages or services → **Ansible**, with platform-specific tasks as needed.
- Version-managed user tools → **mise**; gate optional tool groups by profile.
- WSL-, VM-, or container-specific behavior → a condition in the layer that owns that behavior.
- Project-specific tool versions → the project's mise configuration, not the global tool list.

Add a new layer or role only when it has a distinct responsibility. Otherwise, prefer a small conditional or an entry in the existing tool/package list.
