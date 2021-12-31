{% set git_version = '2.34.1' %}
{% set git_hash = 'd8769a1d90b2f1f7d85ae91e724c8dad16f340c5b130d49368a308dd086a5f52' %}

get-git:
  file.managed:
    - name: 'C:\\salt\\tempdownload\\Git-{{ git_version }}-64-bit.exe'
    - source: https://github.com/git-for-windows/git/releases/download/v{{ git_version }}.windows.1/Git-{{ git_version }}-64-bit.exe
    - source_hash: sha256={{ git_hash }}
    - makedirs: True

install-git:
  cmd.run:
    - name: 'C:\\salt\\tempdownload\\Git-{{ git_version }}-64-bit.exe /VERYSILENT /NORESTART /SP- /NOCANCEL /SUPPRESSMSGBOXES'
    - shell: cmd

add-git-to-path:
  cmd.run:
    - name: 'set PATH=%PATH%;C:\Program Files\Git\cmd\'
    - shell: cmd

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

