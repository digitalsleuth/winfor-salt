# Name: Volatility3
# Website: https://github.com/volatilityfoundation/volatility3
# Description: Memory analysis toolset
# Category: Windows Analysis
# Author: Volatility Foundation
# License: Volatility Software License (https://www.volatilityfoundation.org/license/vsl-v1.0)
# Version: 2.27.0
# Notes: Downgraded from 2.28.x until Win 11 memory parsing issues resolved

{% set version = "2.27.0" %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set pkg = 'volatility3-'~ version ~'-py3-none-any.whl' %}
{% set exists = salt['file.file_exists'](downloads + '\\volatility3\\packages\\' + pkg) %}

{% if exists %}

include:
  - winfor.offline.packages.python3
  - winfor.offline.python3-tools.py3-pycryptodome
  - winfor.offline.python3-tools.yara-python

volatility3-offline:
  cmd.run:
    - name: '"C:\Program Files\Python310\python.exe" -m pip install --no-index --find-links=.\packages volatility3=={{ version }}'
    - cwd: '{{ downloads }}\volatility3\'
    - require:
      - sls: winfor.offline.packages.python3
      - sls: winfor.offline.python3-tools.py3-pycryptodome
      - sls: winfor.offline.python3-tools.yara-python

volatility3-wrapper-offline:
  file.managed:
    - name: 'C:\Program Files\Python310\Scripts\vol3.cmd'
    - win_inheritance: True
    - contents:
      - '@echo off'
      - '"C:\Program Files\Python310\Scripts\vol.exe" %*'
    - require:
      - cmd: volatility3-offline

volatility3-shell-wrapper-offline:
  file.managed:
    - name: 'C:\Program Files\Python310\Scripts\volshell3.cmd'
    - win_inheritance: True
    - contents:
      - '@echo off'
      - '"C:\Program Files\Python310\Scripts\volshell.exe" %*'
    - require:
      - cmd: volatility3-offline

volatility3-symbols-folder-offline:
  file.directory:
    - name: 'C:\Program Files\Python310\Scripts\symbols\'
    - force: True
    - makedirs: True
    - win_inheritance: True
    - require:
      - cmd: volatility3-offline

volatility3-windows-symbols-extract-offline:
  archive.extracted:
    - name: 'C:\Program Files\Python310\Scripts\symbols\'
    - source: '{{ downloads }}\volatility3\windows.zip'
    - enforce_toplevel: False
    - require:
      - file: volatility3-symbols-folder-offline

volatility3-linux-symbols-extract-offline:
  archive.extracted:
    - name: 'C:\Program Files\Python310\Scripts\symbols\'
    - source: '{{ downloads }}\volatility3\linux.zip'
    - enforce_toplevel: False
    - require:
      - file: volatility3-symbols-folder-offline

volatility3-mac-symbols-extract-offline:
  archive.extracted:
    - name: 'C:\Program Files\Python310\Scripts\symbols\'
    - source: '{{ downloads }}\volatility3\mac.zip'
    - enforce_toplevel: False
    - require:
      - file: volatility3-symbols-folder-offline

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
