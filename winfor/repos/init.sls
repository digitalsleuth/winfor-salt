winfor-repos-add-1:
  file.replace:
    - name: 'C:\\ProgramData\\Salt Project\\salt\\conf\\minion'
    - pattern: 'winrepo_remotes_ng:'
    - repl: 'winrepo_remotes_ng:'
    - append_if_not_found: True
    - count: 1

winfor-repos-add-2:
  file.replace:
    - name: 'C:\\ProgramData\\Salt Project\\salt\\conf\\minion'
    - pattern: '  - main https://github.com/digitalsleuth/salt-winrepo-ng.git'
    - repl: '  - main https://github.com/digitalsleuth/salt-winrepo-ng.git'
    - append_if_not_found: True
    - count: 1
    - require:
      - file: winfor-repos-add-1

winfor-repos-add-3:
  file.replace:
    - name: 'C:\\ProgramData\\Salt Project\\salt\\conf\\minion'
    - pattern: 'winrepo_remotes: '
    - repl: 'winrepo_remotes:'
    - append_if_not_found: True
    - count: 1
    - require:
      - file: winfor-repos-add-1
      - file: winfor-repos-add-2

winfor-repos-update:
  cmd.run:
    - name: 'salt-call --local winrepo.update_git_repos && salt-call --local pkg.refresh_db'
    - require:
      - file: winfor-repos-add-1
      - file: winfor-repos-add-2
      - file: winfor-repos-add-3

