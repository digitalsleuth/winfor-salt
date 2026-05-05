# Name: Rehex (Reverse Engineers' Hex Editor)
# Website: https://github.com/solemnwarning/rehex
# Description: Hex Editor with useful tools for Reverse Engineering
# Category: Executables
# Author: Daniel Collins
# License: GNU General Public License v2 (https://github.com/solemnwarning/rehex/blob/master/LICENSE.txt)
# Version: 0.64.0
# Notes:

{% set version = '0.64.0' %}
{% set hash = '83c73bcb51b9e67f1e680d09378fe77b863eb343274b9d31dc66ec104ad1dbe2' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

include:
  - winfor.config.shims

rehex-download:
  file.managed:
    - name: 'C:\salt\tempdownload\rehex-{{ version }}-win-x64.zip'
    - source: https://github.com/solemnwarning/rehex/releases/download/{{ version }}/rehex-{{ version }}-win-x64.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

rehex-extract:
  archive.extracted:
    - name: '{{ inpath }}\'
    - source: 'C:\salt\tempdownload\rehex-{{ version }}-win-x64.zip'
    - enforce_toplevel: False
    - overwrite: True
    - require:
      - file: rehex-download

rehex-folder-rename:
  file.rename:
    - name: '{{ inpath }}\rehex'
    - source: '{{ inpath }}\rehex-{{ version }}'
    - force: True
    - makedirs: True
    - require:
      - archive: rehex-extract

rehex-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\REHex.lnk'
    - target: '{{ inpath }}\rehex\rehex.exe'
    - force: True
    - working_dir: '{{ inpath }}\rehex\'
    - makedirs: True
    - require:
      - archive: rehex-extract
      - file: rehex-folder-rename

rehex-shim:
  cmd.run:
    - name: 'powershell -nop -ep Bypass -File {{ inpath }}\New-Shim.ps1 -SourceExe {{ inpath }}\rehex\rehex.exe -OutPath {{ inpath }}\shims\rehex.exe'
    - require:
      - sls: winfor.config.shims
