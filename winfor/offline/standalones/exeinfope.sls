# Name: exeinfope
# Website: https://github.com/ExeinfoASL/ASL
# Description: EXE, Packer, Compiler detection
# Category: Executables
# Author: ExeinfoASL
# License: None Listed
# Version: 0.0.9.5
# Notes: 

{% set version = '0.0.9.5' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

include:
  - winfor.config.shims

exeinfope-extract-offline:
  archive.extracted:
    - name: '{{ inpath }}\'
    - source: '{{ downloads }}\exeinfope\exeinfope-{{ version }}.zip'
    - enforce_toplevel: False

exeinfope-shim-offline:
  cmd.run:
    - name: 'powershell -nop -ep Bypass -File {{ inpath }}\New-Shim.ps1 -SourceExe {{ inpath }}\exeinfope\exeinfope.exe -OutPath {{ inpath }}\shims\exeinfope.exe'
    - require:
      - sls: winfor.config.shims
      - archive: exeinfope-extract-offline

exeinfope-shortcut-offline:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\ExeInfoPE.lnk'
    - target: '{{ inpath }}\exeinfope\exeinfope.exe'
    - force: True
    - working_dir: '{{ inpath }}\exeinfope\'
    - makedirs: True
    - require:
      - archive: exeinfope-extract-offline
