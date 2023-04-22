repo-add-1:
  file.replace:
    - name: 'C:\ProgramData\Salt Project\salt\conf\minion'
    - pattern: 'winrepo_remotes_ng:'
    - repl: 'winrepo_remotes_ng:'
    - append_if_not_found: True
    - count: 1

repo-add-2:
  file.replace:
    - name: 'C:\ProgramData\Salt Project\salt\conf\minion'
    - pattern: '  - main https://github.com/digitalsleuth/salt-winrepo-ng.git'
    - repl: '  - main https://github.com/digitalsleuth/salt-winrepo-ng.git'
    - append_if_not_found: True
    - count: 1
    - require:
      - file: repo-add-1

repo-add-3:
  file.replace:
    - name: 'C:\ProgramData\Salt Project\salt\conf\minion'
    - pattern: 'winrepo_remotes: '
    - repl: 'winrepo_remotes:'
    - append_if_not_found: True
    - count: 1
    - require:
      - file: repo-add-1
      - file: repo-add-2

repo-update:
  cmd.run:
    - name: 'set PATH=%PATH%;C:\Program Files\Git\cmd&& "C:\Program Files\Salt Project\Salt\bin\salt.exe" call --local winrepo.update_git_repos && "C:\Program Files\Salt Project\Salt\bin\salt.exe" call --local pkg.refresh_db'
    - onlyif:
      - fun: file.file_exists
        path: 'C:\Program Files\Git\cmd\git.exe'
    - require:
      - file: repo-add-1
      - file: repo-add-2
      - file: repo-add-3
