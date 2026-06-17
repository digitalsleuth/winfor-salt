# Name: OfficeMalScanner
# Website: http://www.reconstructer.org/main.html
# Description: Office Document analysis tool to detect implants and malware
# Category: Documents / Editors
# Author: Frank Boldewin
# License: Unknown
# Version: 0.62
# Notes: 

{% set version = '0.62' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}

include:
  - winfor.config.shims

officemalscanner-extract-offline:
  archive.extracted:
    - name: '{{ inpath }}\officemalscanner'
    - source: '{{ downloads }}\officemalscanner\OfficeMalScanner-{{ version }}.zip'
    - enforce_toplevel: False

officemalscanner-shim-offline:
  cmd.run:
    - name: 'powershell -nop -ep Bypass -File {{ inpath }}\New-Shim.ps1 -SourceExe {{ inpath }}\officemalscanner\officemalscanner.exe -OutPath {{ inpath }}\shims\officemalscanner.exe'
    - require:
      - sls: winfor.config.shims
