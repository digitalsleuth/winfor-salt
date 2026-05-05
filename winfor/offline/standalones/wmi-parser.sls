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
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}

include:
  - winfor.config.shims

wmi-parser-extract-offline:
  archive.extracted:
    - name: '{{ inpath }}\wmi-parser'
    - source: '{{ downloads }}\wmi-parser\wmi-parser.v{{ version }}.zip'
    - enforce_toplevel: False

wmi-parser-shim-offline:
  cmd.run:
    - name: 'powershell -nop -ep Bypass -File {{ inpath }}\New-Shim.ps1 -SourceExe {{ inpath }}\wmi-parser\wmi-parser.exe -OutPath {{ inpath }}\shims\wmi-parser.exe'
    - require:
      - sls: winfor.config.shims
      - archive: wmi-parser-extract-offline
