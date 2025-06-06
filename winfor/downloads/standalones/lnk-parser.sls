# Name: lnk_parser
# Website: https://github.com/AbdulRhmanAlfaifi/lnk_parser
# Description: Parser for Windows LNK files
# Category: Windows Analysis
# Author: AbdulRhman Alfaifi
# License: MIT License (https://github.com/AbdulRhmanAlfaifi/lnk_parser/blob/master/LICENSE)
# Version: 0.4.1
# Notes: 

{% set version = '0.4.1' %}
{% set hash = '08b9858911669e023aa4a0f03e630e1f6f6fb531bd0b768c48616a9074f0f1e4' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

lnk-parser-download-only:
  file.managed:
    - name: '{{ downloads }}\lnk-parser\lnk_parser_x86_64-{{ version }}.exe'
    - source: https://github.com/AbdulRhmanAlfaifi/lnk_parser/releases/download/v{{ version }}/lnk_parser_x86_64.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
