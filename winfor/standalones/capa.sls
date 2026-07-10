# Name: capa
# Website: https://github.com/mandiant/capa
# Description: FLARE tool to identify capabilities in executables
# Category: Executables
# Author: Mandiant
# License: Apache License 2.0 (https://github.com/mandiant/capa/blob/master/LICENSE.txt)
# Version: 9.4.0
# Notes: 

{% set version = '9.4.0' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set hash = '670ab1a58b81f59cb57533bf4021ac1e7033fbe9b5d5cc180f796976081e3bb5' %}

include:
  - winfor.packages.git
  - winfor.config.shims

capa-download:
  file.managed:
    - name: 'C:\salt\tempdownload\capa-v{{ version }}-windows.zip'
    - source: https://github.com/mandiant/capa/releases/download/v{{ version }}/capa-v{{ version }}-windows.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

capa-extract:
  archive.extracted:
    - name: '{{ inpath }}\capa'
    - source: 'C:\salt\tempdownload\capa-v{{ version }}-windows.zip'
    - enforce_toplevel: False
    - require:
      - file: capa-download

capa-rules:
  git.latest:
    - name: https://github.com/mandiant/capa-rules.git
    - target: '{{ inpath }}\capa\capa-rules'
    - rev: master
    - force_clone: True
    - force_reset: True
    - require:
      - sls: winfor.packages.git
      - archive: capa-extract

capa-shim:
  cmd.run:
    - name: 'powershell -nop -ep Bypass -File {{ inpath }}\New-Shim.ps1 -SourceExe {{ inpath }}\capa\capa.exe -OutPath {{ inpath }}\shims\capa.exe'
    - require:
      - sls: winfor.config.shims
