# Name: Rehex (Reverse Engineers' Hex Editor)
# Website: https://github.com/solemnwarning/rehex
# Description: Hex Editor with useful tools for Reverse Engineering
# Category: Executables
# Author: Daniel Collins
# License: GNU General Public License v2 (https://github.com/solemnwarning/rehex/blob/master/LICENSE.txt)
# Version: 0.62.0
# Notes:

{% set version = '0.62.0' %}
{% set hash = 'bfe76cdf4bdfe94180ab25882901bd6479488c0865aa38d318e7f4d6cf2cb58e' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

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

rehex-env-vars:
  win_path.exists:
    - name: '{{ inpath }}\rehex'
