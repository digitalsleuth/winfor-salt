# Name: DIE (Detect It Easy)
# Website: https://github.com/horsicq/DIE-engine
# Description: Reverse Engineering Engine
# Category: Executables
# Author: Hors (horsicq)
# License: MIT License (https://github.com/horsicq/DIE-engine/blob/master/LICENSE)
# Version: 3.06
# Notes: Detect It Easy - DIE 

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set version = '3.06' %}
{% set hash = 'f1f075145a7b5ee8556dbf8a66c4e64e6b7eff71bcfeaed669f8f8471862fac9' %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

die-download:
  file.managed:
    - name: 'C:\salt\tempdownload\die_win64_portable_{{ version }}.zip'
    - source: https://github.com/horsicq/DIE-engine/releases/download/{{ version }}/die_win64_portable_{{ version }}.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

die-extract:
  archive.extracted:
    - name: '{{ inpath }}\die'
    - source: 'C:\salt\tempdownload\die_win64_portable_{{ version }}.zip'
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
