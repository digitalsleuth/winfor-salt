# Name: lnk_parser
# Website: https://github.com/AbdulRhmanAlfaifi/lnk_parser
# Description: Parser for Windows LNK files
# Category: Windows Analysis
# Author: AbdulRhman Alfaifi
# License: MIT License (https://github.com/AbdulRhmanAlfaifi/lnk_parser/blob/master/LICENSE)
# Version: 0.4.3
# Notes: 

{% set version = '0.4.3' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}

include:
  - winfor.config.shims

lnk-parser-offline:
  file.managed:
    - name: '{{ inpath }}\lnk-parser\lnk-parser.exe'
    - source: '{{ downloads }}\lnk-parser\lnk_parser_v{{ version }}.exe'
    - skip_verify: True
    - makedirs: True

lnk-parser-shim-offline:
  cmd.run:
    - name: 'powershell -nop -ep Bypass -File {{ inpath }}\New-Shim.ps1 -SourceExe {{ inpath }}\lnk-parser\lnk-parser.exe -OutPath {{ inpath }}\shims\lnk-parser.exe'
    - require:
      - sls: winfor.config.shims
