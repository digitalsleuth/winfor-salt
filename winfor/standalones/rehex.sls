# Name: Rehex (Reverse Engineers' Hex Editor)
# Website: https://github.com/solemnwarning/rehex
# Description: Hex Editor with useful tools for Reverse Engineering
# Category: Executables
# Author: Daniel Collins
# License: GNU General Public License v2 (https://github.com/solemnwarning/rehex/blob/master/LICENSE.txt)
# Version: 0.63.4
# Notes:

{% set version = '0.63.4' %}
{% set hash = '68fd81bdea7fac87d77b2db6dd71bedcc77600d476db9a155012524b6d3db822' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

include:
  - winfor.config.shims

rehex-download:
  file.managed:
    - name: 'C:\salt\tempdownload\rehex_{{ version }}-win-x64.zip'
    - source: https://github.com/solemnwarning/rehex/releases/download/{{ version }}/rehex-{{ version }}-win-x64.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

rehex-extract:
  archive.extracted:
    - name: '{{ inpath }}\'
    - source: 'C:\salt\tempdownload\rehex_{{ version }}-win-x64.zip'
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
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\Rehex.lnk'
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
