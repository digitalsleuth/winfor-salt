# Name: WMI Parser
# Website: https://github.com/woanware/wmi-parser
# Description: Parse the WMI object database for persistence
# Category: Windows Analysis
# Author: Mark Woan
# License: Unknown
# Version: 0.0.2
# Notes: 

{% set version = '0.0.2' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('wmi-parser') %}

include:
  - winfor.config.shims

wmi-parser-download:
  file.managed:
    - name: 'C:\salt\tempdownload\wmi-parser.v{{ version }}.zip'
    - source: https://github.com/woanware/wmi-parser/releases/download/v{{ version }}/wmi-parser.v{{ version }}.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

wmi-parser-extract:
  archive.extracted:
    - name: '{{ inpath }}\wmi-parser'
    - source: 'C:\salt\tempdownload\wmi-parser.v{{ version }}.zip'
    - enforce_toplevel: False
    - require:
      - file: wmi-parser-download

wmi-parser-shim:
  cmd.run:
    - name: 'powershell -nop -ep Bypass -File {{ inpath }}\New-Shim.ps1 -SourceExe {{ inpath }}\wmi-parser\wmi-parser.exe -OutPath {{ inpath }}\shims\wmi-parser.exe'
    - require:
      - sls: winfor.config.shims
