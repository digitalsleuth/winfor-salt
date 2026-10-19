# Name: FLOSS (FLARE Obfuscated String Solver)
# Website: https://github.com/mandiant/flare-floss
# Description: Extract obfuscated strings from malware
# Category: Executables
# Author: Mandiant
# License: Apache License v2.0 (https://github.com/mandiant/flare-floss/blob/master/LICENSE.txt)
# Version: 3.2.0
# Notes: 

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set version = '3.2.0' %}
{% set hash = 'c0c73bb99d043fedd8e913038b65d1591fd6308cd938d8a91df87b733b369af5' %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

include:
  - winfor.config.shims

floss-download:
  file.managed:
    - name: 'C:\salt\tempdownload\floss-v{{ version }}-windows.zip'
    - source: https://github.com/mandiant/flare-floss/releases/download/v{{ version }}/floss-v{{ version }}-windows.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

floss-extract:
  archive.extracted:
    - name: '{{ inpath }}\floss'
    - source: 'C:\salt\tempdownload\floss-v{{ version }}-windows.zip'
    - enforce_toplevel: False
    - require:
      - file: floss-download

floss-shim:
  cmd.run:
    - name: 'powershell -nop -ep Bypass -File {{ inpath }}\New-Shim.ps1 -SourceExe {{ inpath }}\floss\floss.exe -OutPath {{ inpath }}\shims\floss.exe'
    - require:
      - sls: winfor.config.shims
