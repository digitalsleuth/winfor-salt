# Name: smi-parser
# Website: https://github.com/digitalsleuth/smi-parser
# Description: Parses Caroolive SMI GPS files
# Category: Raw Parsers / Decoders
# Author: Corey Forman
# License: GNU General Public License v3.0 (https://github.com/digitalsleuth/smi-parser/blob/main/LICENSE)
# Version: 1.1.0
# Notes:

{% set version = '1.1.0' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set pkg = 'smi-parser-'~ version ~'.exe' %}
{% set exists = salt['file.file_exists'](downloads + '\\smi-parser\\' + pkg) %}

{% if exists %}

include:
  - winfor.config.shims

smi-parser-copy-offline:
  file.copy:
    - name: '{{ inpath }}\smi-parser\smi-parser.exe'
    - source: '{{ downloads }}\smi-parser\{{ pkg }}'
    - makedirs: True
    - force: True

smi-parser-shim-offline:
  cmd.run:
    - name: 'powershell -nop -ep Bypass -File {{ inpath }}\New-Shim.ps1 -SourceExe {{ inpath }}\smi-parser\smi-parser.exe -OutPath {{ inpath }}\shims\smi-parser.exe'
    - require:
      - sls: winfor.config.shims
      - file: smi-parser-copy-offline

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
