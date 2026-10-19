# Name: smi-parser
# Website: https://github.com/digitalsleuth/smi-parser
# Description: Parses Caroolive SMI GPS files
# Category: Raw Parsers / Decoders
# Author: Corey Forman
# License: GNU General Public License v3.0 (https://github.com/digitalsleuth/smi-parser/blob/main/LICENSE)
# Version: 1.1.0
# Notes:

{% set version = '1.1.0' %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('smi-parser') %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

smi-parser-download-only:
  file.managed:
    - name: '{{ downloads }}\smi-parser\smi-parser-{{ version }}.exe'
    - source: https://github.com/digitalsleuth/smi-parser/releases/download/v{{ version }}/smi-parser.exe 
    - source_hash: sha256={{ hash }}
    - makedirs: True
