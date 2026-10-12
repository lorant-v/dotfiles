- [ ] simplify ansible + mise?
- [ ] install srt + deps + opencode
- [ ] update opencode config
- [ ] test on windows
- [ ] separate list of packages to install via ansible?
- [ ] separate profiles? windows/linux/wsl
- [ ] ssh config
- [ ] take into account all ansible files for hash
# Bootstrap input hash: {{ printf "%s\n%s\n%s\n" (include "dot_bootstrap/ansible/playbook.yaml") (include "dot_bootstrap/ansible/inventory.yaml") (include "dot_bootstrap/ansible/group_vars/all.yaml.tmpl") | sha256sum }}