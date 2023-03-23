# Name: smi-parser
# Website: https://github.com/digitalsleuth/smi-parser
# Description: Parses Caroolive SMI GPS files
# Category: Raw Parsers / Decoders
# Author: Corey Forman
# License: GNU General Public License v3.0 (https://github.com/digitalsleuth/smi-parser/blob/main/LICENSE)
# Version: 1.1.0
# Notes:

{% set version = '1.1.0' %}
{% set hash = 'bc09ddee32a418e412a3f075fedd9cdc5054c31e7b4459f6f12f645eeefa5245' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

smi-parser-download-only:
  file.managed:
    - name: '{{ downloads }}\smi-parser.exe'
    - source: https://github.com/digitalsleuth/smi-parser/releases/download/v{{ version }}/smi-parser.exe 
    - source_hash: sha256={{ hash }}
    - makedirs: True
