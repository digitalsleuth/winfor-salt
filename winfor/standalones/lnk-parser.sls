# Name: lnk_parser
# Website: https://github.com/AbdulRhmanAlfaifi/lnk_parser
# Description: Parser for Windows LNK files
# Category: Windows Analysis
# Author: AbdulRhman Alfaifi
# License: MIT License (https://github.com/AbdulRhmanAlfaifi/lnk_parser/blob/master/LICENSE)
# Version: 0.2.0
# Notes: 

{% set version = '0.2.0' %}
{% set hash = 'f8c4bef56771a64d2f8abd5d9e17f463565bf700efee085b71f84cd97259c1cd' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}

lnk-parser-download:
  file.managed:
    - name: '{{ inpath }}\lnk-parser\lnk_parser.exe'
    - source: https://github.com/AbdulRhmanAlfaifi/lnk_parser/releases/download/v{{ version }}/lnk_parser_x86_64.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True

lnk-parser-env:
  win_path.exists:
    - name: '{{ inpath }}\lnk-parser\'
    - require:
      - file: lnk-parser-download
