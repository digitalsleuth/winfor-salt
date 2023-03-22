# Name: smi-parser
# Website: https://github.com/digitalsleuth/smi-parser
# Description: Parses Caroolive SMI GPS files
# Category: Raw Parsers / Decoders
# Author: Corey Forman
# License: GNU General Public License v3.0 (https://github.com/digitalsleuth/smi-parser/blob/main/LICENSE)
# Version: 1.1.0
# Notes:

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set version = '1.1.0' %}
{% set hash = 'bc09ddee32a418e412a3f075fedd9cdc5054c31e7b4459f6f12f645eeefa5245' %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

smi-parser-download:
  file.managed:
    - name: '{{ inpath }}\smi-parser\smi-parser.exe'
    - source: https://github.com/digitalsleuth/smi-parser/releases/download/v{{ version }}/smi-parser.exe 
    - source_hash: sha256={{ hash }}
    - makedirs: True

smi-parser-env-vars:
  win_path.exists:
    - name: '{{ inpath }}\smi-parser\'
    - require:
      - file: smi-parser-download
