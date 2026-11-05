- [ ] update docs
- [ ] ssh config
- [ ] try mise instead of chezmoi+ansible
- [ ] install ansible with mise?
- [ ] use {{ template "script-header" . }},
  - echo "[chezmoi] Running script: {{ base .chezmoi.sourceFile | trimSuffix ".tmpl" }}"
- [x] update opencode config + simplify
- [x] test on windows
- [x] separate list of packages to install via ansible?
- [x] separate profiles? windows/linux/wsl
- [x] take into account all ansible files for hash
```
# Bootstrap input hash: {{ printf "%s\n%s\n%s\n" (include "dot_bootstrap/ansible/playbook.yaml") (include "dot_bootstrap/ansible/inventory.yaml") (include "dot_bootstrap/ansible/group_vars/all.yaml.tmpl") | sha256sum }}
```

- [x] simplify ansible + mise?
- [x] install srt + deps + opencode
