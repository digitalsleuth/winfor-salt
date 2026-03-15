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
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

lnk-parser-download-only:
  file.managed:
    - name: '{{ downloads }}\lnk-parser\lnk_parser_v{{ version }}.exe'
    - source: https://github.com/AbdulRhmanAlfaifi/lnk_parser/releases/download/v{{ version }}/lnk_parser_v{{ version }}.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
