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
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('smi-parser') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

include:
  - winfor.config.shims

smi-parser-download:
  file.managed:
    - name: '{{ inpath }}\smi-parser\smi-parser.exe'
    - source: https://github.com/digitalsleuth/smi-parser/releases/download/v{{ version }}/smi-parser.exe 
    - source_hash: sha256={{ hash }}
    - makedirs: True

smi-parser-shim:
  cmd.run:
    - name: 'powershell -nop -ep Bypass -File {{ inpath }}\New-Shim.ps1 -SourceExe {{ inpath }}\smi-parser\smi-parser.exe -OutPath {{ inpath }}\shims\smi-parser.exe'
    - require:
      - sls: winfor.config.shims
