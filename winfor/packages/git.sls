#{% set git_dir = 'C:\Program Files\Git\cmd' %}
#{% set env_path = salt['environ.get']('PATH') %}
#{% set env_path = env_path ~ ';' ~ git_dir %}

git:
  pkg.installed

#git-env-var:
#  cmd.run:
#    - name: 'doskey git="C:\Program Files\Git\cmd\git.exe" $*'
#    - shell: cmd

#git-env-var:
#  cmd.run:
#    - name: 'set PATH={{ env_path }}'
#    - shell: cmd

#environ-setenv-path-git:
#  environ.setenv:
#    - name: PATH
#    - value: {{ env_path }}
#    - update_minion: True
#    - onchanges:
#      - win_path: win-path-exists-git
