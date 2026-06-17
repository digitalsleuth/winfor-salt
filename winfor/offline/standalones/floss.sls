# Name: FLOSS (FLARE Obfuscated String Solver)
# Website: https://github.com/mandiant/flare-floss
# Description: Extract obfuscated strings from malware
# Category: Executables
# Author: Mandiant
# License: Apache License v2.0 (https://github.com/mandiant/flare-floss/blob/master/LICENSE.txt)
# Version: 3.1.1
# Notes: 

{% set version = '3.1.1' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

include:
  - winfor.config.shims

floss-extract-offline:
  archive.extracted:
    - name: '{{ inpath }}\floss'
    - source: '{{ downloads }}\floss\floss-v{{ version }}-windows.zip'
    - enforce_toplevel: False

floss-shim-offline:
  cmd.run:
    - name: 'powershell -nop -ep Bypass -File {{ inpath }}\New-Shim.ps1 -SourceExe {{ inpath }}\floss\floss.exe -OutPath {{ inpath }}\shims\floss.exe'
    - require:
      - sls: winfor.config.shims
