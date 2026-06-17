# Name: SilkETW
# Website: https://github.com/mandiant/SilkETW
# Description: Wrapper for ETW (Event Tracing for Windows)
# Category: Windows Analysis
# Author: Mandiant
# License: Apache License v2 (https://github.com/mandiant/SilkETW/raw/master/LICENSE.txt) 3rd-party license (https://github.com/mandiant/SilkETW/blob/master/LICENSE-3RD-PARTY.txt)
# Version: 0.8
# Notes: Sample Usage - https://www.mandiant.com/resources/blog/silketw-because-free-telemetry-is-free

{% set version = '0.8' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}

include:
  - winfor.config.shims

silketw-extract-offline:
  archive.extracted:
    - name: '{{ inpath }}\silketw'
    - source: '{{ downloads }}\silketw\SilkETW_SilkService_v{{ version }}.zip'
    - enforce_toplevel: False

silketw-shim-offline:
  cmd.run:
    - name: 'powershell -nop -ep Bypass -File {{ inpath }}\New-Shim.ps1 -SourceExe {{ inpath }}\silketw\v8\SilkETW\SilkETW.exe -OutPath {{ inpath }}\shims\silketw.exe'
    - require:
      - sls: winfor.config.shims
