# Name: lnk_parser
# Website: https://github.com/AbdulRhmanAlfaifi/lnk_parser
# Description: Parser for Windows LNK files
# Category: Windows Analysis
# Author: AbdulRhman Alfaifi
# License: MIT License (https://github.com/AbdulRhmanAlfaifi/lnk_parser/blob/master/LICENSE)
# Version: 0.4.3
# Notes: 

{% set version = '0.4.3' %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('lnk-parser') %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

lnk-parser-download-only:
  file.managed:
    - name: '{{ downloads }}\lnk-parser\lnk-parser-{{ version }}.exe'
    - source: https://github.com/AbdulRhmanAlfaifi/lnk_parser/releases/download/v{{ version }}/lnk_parser_v{{ version }}.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
