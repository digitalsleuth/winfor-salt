# Name: capa
# Website: https://github.com/mandiant/capa
# Description: FLARE tool to identify capabilities in executables
# Category: Executables
# Author: Mandiant
# License: Apache License 2.0 (https://github.com/mandiant/capa/blob/master/LICENSE.txt)
# Version: 9.1.0
# Notes: 

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set version = '9.1.0' %}

include:
  - winfor.config.shims

capa-extract-offline:
  archive.extracted:
    - name: '{{ inpath }}\capa'
    - source: '{{ downloads }}\capa\capa-v{{ version }}-windows.zip'
    - enforce_toplevel: False

capa-rules-offline:
  file.copy:
    - name: '{{ inpath }}\capa\capa-rules'
    - source: '{{ downloads }}\capa\capa-rules'
    - recurse: True
    - force: True
    - require:
      - archive: capa-extract-offline

capa-shim-offline:
  cmd.run:
    - name: 'powershell -nop -ep Bypass -File {{ inpath }}\New-Shim.ps1 -SourceExe {{ inpath }}\capa\capa.exe -OutPath {{ inpath }}\shims\capa.exe'
    - require:
      - sls: winfor.config.shims
      - archive: capa-extract-offline
