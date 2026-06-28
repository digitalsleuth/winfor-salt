# Name: DIE (Detect It Easy)
# Website: https://github.com/horsicq/DIE-engine
# Description: Reverse Engineering Engine
# Category: Executables
# Author: Hors (horsicq)
# License: MIT License (https://github.com/horsicq/DIE-engine/blob/master/LICENSE)
# Version: 3.21
# Notes: Detect It Easy - DIE 

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set version = '3.21' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

include:
  - winfor.config.shims

die-extract-offline:
  archive.extracted:
    - name: '{{ inpath }}\'
    - source: '{{ downloads }}\die\die_win64_portable_{{ version }}_x64.zip'
    - enforce_toplevel: False

die-shim-offline:
  cmd.run:
    - name: 'powershell -nop -ep Bypass -File {{ inpath }}\New-Shim.ps1 -SourceExe {{ inpath }}\die\die.exe -OutPath {{ inpath }}\shims\die.exe'
    - require:
      - sls: winfor.config.shims

die-shortcut-offline:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\DIE.lnk'
    - target: '{{ inpath }}\die\die.exe'
    - force: True
    - working_dir: '{{ inpath }}\die\'
    - makedirs: True
    - require:
      - archive: die-extract-offline
      - cmd: die-shim-offline
