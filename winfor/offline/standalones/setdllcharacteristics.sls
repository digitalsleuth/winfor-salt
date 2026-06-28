# Name: setdllcharacteristics
# Website: https://blog.didierstevens.com/2010/10/17/setdllcharacteristics/
# Description: Manually edit the characteristics of DLL's 
# Category: Executables
# Author: Didier Stevens
# License: Public Domain
# Version: 0.0.0.1
# Notes: 

{% set version = '0.0.0.1' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}

include:
  - winfor.config.shims

setdll-extract-offline:
  archive.extracted:
    - name: '{{ inpath }}\setdll'
    - source: '{{ downloads }}\setdllcharacteristics\setdllcharacteristics_v{{ version | replace(".","_") }}.zip'
    - enforce_toplevel: False

setdll-shim-offline:
  cmd.run:
    - name: 'powershell -nop -ep Bypass -File {{ inpath }}\New-Shim.ps1 -SourceExe {{ inpath }}\setdll\setdllcharacteristics.exe -OutPath {{ inpath }}\shims\setdll.exe'
    - require:
      - sls: winfor.config.shims
