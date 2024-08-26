# Name: DIE (Detect It Easy)
# Website: https://github.com/horsicq/DIE-engine
# Description: Reverse Engineering Engine
# Category: Executables
# Author: Hors (horsicq)
# License: MIT License (https://github.com/horsicq/DIE-engine/blob/master/LICENSE)
# Version: 3.08
# Notes: Detect It Easy - DIE 

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set version = '3.08' %}
{% set hash = 'a6b9ea7ea2e06a048ac4aef3d27020fbc383bbad448da6c767118ebfd2449d5e' %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

die-download:
  file.managed:
    - name: 'C:\salt\tempdownload\die_win64_portable_{{ version }}_x64.zip'
    - source: https://github.com/horsicq/DIE-engine/releases/download/{{ version }}/die_win64_portable_{{ version }}_x64.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

die-extract:
  archive.extracted:
    - name: '{{ inpath }}\die'
    - source: 'C:\salt\tempdownload\die_win64_portable_{{ version }}_x64.zip'
    - enforce_toplevel: False
    - require:
      - file: die-download

die-env-vars:
  win_path.exists:
    - name: '{{ inpath }}\die\'

standalones-die-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\DIE.lnk'
    - target: '{{ inpath }}\die\die.exe'
    - force: True
    - working_dir: '{{ inpath }}\die\'
    - makedirs: True
    - require:
      - file: die-download
      - archive: die-extract
