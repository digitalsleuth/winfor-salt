# Name: exeinfope
# Website: https://github.com/ExeinfoASL/ASL
# Description: EXE, Packer, Compiler detection
# Category: Executables
# Author: ExeinfoASL
# License: None Listed
# Version: 0.0.9.9
# Notes: 

{% set version = '0.0.9.9' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set hash = '6a0d8c0930a58dd3e070993f3d92136deb9f912935888a40268bfe7fd00e4ef2' %}

include:
  - winfor.config.shims

exeinfope-download:
  file.managed:
    - name: 'C:\salt\tempdownload\exeinfope.zip'
    - source: https://github.com/ExeinfoASL/ASL/releases/download/v{{ version }}/exeinfope.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

exeinfope-extract:
  archive.extracted:
    - name: '{{ inpath }}\'
    - source: 'C:\salt\tempdownload\exeinfope.zip'
    - enforce_toplevel: False
    - require:
      - file: exeinfope-download

exeinfope-shim:
  cmd.run:
    - name: 'powershell -nop -ep Bypass -File {{ inpath }}\New-Shim.ps1 -SourceExe {{ inpath }}\exeinfope\exeinfope.exe -OutPath {{ inpath }}\shims\exeinfope.exe'
    - require:
      - sls: winfor.config.shims

standalones-exeinfope-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\ExeInfoPE.lnk'
    - target: '{{ inpath }}\ExeinfoPe\exeinfope.exe'
    - force: True
    - working_dir: '{{ inpath }}\ExeinfoPe\'
    - makedirs: True
    - require:
      - file: exeinfope-download
      - archive: exeinfope-extract
