# Name: jq
# Website: https://jqlang.github.io/jq 
# Description: Command-line JSON processor
# Category: Utilities
# Author: Stephen Dolan et al (https://github.com/jqlang/jq/blob/master/AUTHORS)
# License: Multi-license (https://github.com/jqlang/jq/blob/master/COPYING)
# Version: 1.8.1
# Notes: 

{% set version = '1.8.1' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}

include:
  - winfor.config.shims

jq-offline:
  file.managed:
    - name: '{{ inpath }}\jq\jq.exe'
    - source: '{{ downloads }}\jq\jq-win64-{{ version }}.exe'
    - makedirs: True

jq-shim-offline:
  cmd.run:
    - name: 'powershell -nop -ep Bypass -File {{ inpath }}\New-Shim.ps1 -SourceExe {{ inpath }}\jq\jq.exe -OutPath {{ inpath }}\shims\jq.exe'
    - require:
      - sls: winfor.config.shims
      - file: jq-offline
