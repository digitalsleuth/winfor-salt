# Name: Python 3
# Website: https://www.python.org
# Description: Python Programming Language Framework
# Category: Requirements
# Author: Python Software Foundation
# License: Python Software Foundation License Version 2.0 (https://docs.python.org/3.10/license.html)
# Version: 3.10.11150.0
# Notes:

{% set version = '3.10.11150' %}
{% from 'winfor/_macros/is_installed.jinja' import check_installed, get_version %}
{% set installed = check_installed('Python 3') | trim == 'true' %}
{% set installed_version = get_version('Python 3') | trim %}
{% if installed and installed_version | length > 0 and installed_version != version %}
  {% if installed_version.split(".")[0] == '3' and (installed_version.split(".")[1] | int) >= 10 %}

Python {{ major }}.{{ minor }} or above is already installed:
  test.nop
  {% else %}

include:
  - winfor.repos


python3_x64:
  pkg.installed:
    - version: '3.10.11150.0'
    - require:
      - sls: winfor.repos

python3-wheel:
  pip.installed:
    - name: wheel
    - upgrade: True
    - bin_env: 'C:\Program Files\Python310\python.exe'
    - require:
      - pkg: python3_x64

python3-setuptools:
  pip.installed:
    - name: setuptools
    - upgrade: True
    - bin_env: 'C:\Program Files\Python310\python.exe'
    - require:
      - pkg: python3_x64

python3-env-vars:
  win_path.exists:
    - names:
      - 'C:\Program Files\Python310\Scripts\'
      - 'C:\Program Files\Python310\'
    - index: 0

python3-symlink:
  file.symlink:
    - name: 'C:\Program Files\Python310\python3.exe'
    - target: 'C:\Program Files\Python310\python.exe'
    - force: True
    - makedirs: True
    - win_inheritance: True
    - require:
      - pkg: python3_x64

python3-filetype-association-package-state:
  cmd.run:
    - name: 'ftype Python.File="C:\Windows\py.exe" %L %*'
    - shell: cmd
    - require:
      - pkg: python3_x64

python3-pathext-package-state:
  cmd.run:
    - names:
      - setx /M PATHEXT "%PATHEXT:;.PY;.PYW=%"
      - setx /M PATHEXT "%PATHEXT%;.PY;.PYW"
    - shell: cmd
    - require:
      - pkg: python3_x64

  {% endif %}
{% endif %}
