# Name: lnk_parser
# Website: https://github.com/AbdulRhmanAlfaifi/lnk_parser
# Description: Parser for Windows LNK files
# Category: Windows Analysis
# Author: AbdulRhman Alfaifi
# License: MIT License (https://github.com/AbdulRhmanAlfaifi/lnk_parser/blob/master/LICENSE)
# Version: 0.4.3
# Notes: 

{% set version = '0.4.3' %}
{% set hash = 'd647b635dba8fc671596b9b3332e807eafce515d915767037bb33759d44fe2e7' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}

include:
  - winfor.config.shims

lnk-parser-download:
  file.managed:
    - name: '{{ inpath }}\lnk-parser\lnk-parser.exe'
    - source: https://github.com/AbdulRhmanAlfaifi/lnk_parser/releases/download/v{{ version }}/lnk_parser_v{{ version }}.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True

lnk-parser-shim:
  cmd.run:
    - name: 'powershell -nop -ep Bypass -File {{ inpath }}\New-Shim.ps1 -SourceExe {{ inpath }}\lnk-parser\lnk-parser.exe -OutPath {{ inpath }}\shims\lnk-parser.exe'
    - require:
      - sls: winfor.config.shims
