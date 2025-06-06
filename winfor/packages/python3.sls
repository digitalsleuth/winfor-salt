# Name: Python 3
# Website: https://www.python.org
# Description: Python Programming Language Framework
# Category: Requirements
# Author: Python Software Foundation
# License: Python Software Foundation License Version 2.0 (https://docs.python.org/3.10/license.html)
# Version: 3.10.11150.0
# Notes:

{% set installed = salt['cmd.run']('powershell -c "(Get-ItemProperty HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\Uninstall\\* | Where-Object {$_.DisplayName -match \'^Python 3\' } | Select-Object -ExpandProperty DisplayVersion | Select -First 1)"') %}
{% set version = '3.10.11150' %}
{% set major = installed.split(".")[0] %}
{% set minor = installed.split(".")[1] %}

include:
  - winfor.repos

{% if installed and major == '3' and (minor | int) >= 10 %}
Python {{ major }}.{{ minor }} already installed:
  test.nop
{% else %}

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

{% endif %}
