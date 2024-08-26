{% set current_commit = salt['cmd.run']('powershell -c "(Invoke-RestMethod -Uri https://api.github.com/repos/digitalsleuth/salt-winrepo-ng/commits)[0].sha"') -%}
{% set head = "C:\\ProgramData\\Salt Project\\Salt\\srv\\salt\\win\\repo-ng\\salt-winrepo-ng\\.git\\HEAD" %}
{% if salt['file.file_exists'](head) %}
{%- set local_commit = salt['file.read'](head)|trim -%}
{% else %}
{% set local_commit = '' %}
{% endif %}

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

{% if local_commit == current_commit %}
Local repo up-to-date with online repo:
  test.nop
{% else %}

repo-update:
  cmd.run:
    - name: '"C:\Program Files\Salt Project\Salt\salt-call.bat" --local winrepo.update_git_repos'
    - require:
      - file: repo-add-1
      - file: repo-add-2
      - file: repo-add-3

repo-refresh-db:
  cmd.run:
    - name: '"C:\Program Files\Salt Project\Salt\salt-call.bat" --local pkg.refresh_db'
    - require:
      - cmd: repo-update

{% endif %}
