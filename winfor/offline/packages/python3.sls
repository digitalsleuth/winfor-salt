# Name: Python 3
# Website: https://www.python.org
# Description: Python Programming Language Framework
# Category: Requirements
# Author: Python Software Foundation
# License: Python Software Foundation License Version 2.0 (https://docs.python.org/3.10/license.html)
# Version: 3.10.11150.0
# Notes:

{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set version = '3.10.11' %}
{% from 'winfor/_macros/is_installed.jinja' import check_installed %}
{% set installed = check_installed('Python ' + version + '*') | trim == 'true' %}

{% if not installed %}

python3-x64-offline:
  cmd.run:
    - name: 'python-{{ version }}-amd64.exe /quiet InstallAllUsers=1 InstallLauncherAllUsers=1 Include_pip=1 AssociateFiles=1'
    - cwd: '{{ downloads }}\python3'

python3-env-vars-offline:
  win_path.exists:
    - names:
      - 'C:\Program Files\Python310\Scripts\'
      - 'C:\Program Files\Python310\'
    - index: 0
    - require:
      - cmd: python3-x64-offline

python3-symlink-offline:
  file.symlink:
    - name: 'C:\Program Files\Python310\python3.exe'
    - target: 'C:\Program Files\Python310\python.exe'
    - force: True
    - makedirs: True
    - win_inheritance: True
    - require:
      - cmd: python3-x64-offline

python3-filetype-association-offline:
  cmd.run:
    - name: 'ftype Python.File="C:\Windows\py.exe" %L %*'
    - shell: cmd

python3-pathext-offline:
  cmd.run:
    - names:
      - setx /M PATHEXT "%PATHEXT:;.PY;.PYW=%"
      - setx /M PATHEXT "%PATHEXT%;.PY;.PYW"
    - shell: cmd

{% else %}
"Python {{ version }} is already installed":
  test.nop
{% endif %}

