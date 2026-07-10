# Name: jq
# Website: https://jqlang.github.io/jq 
# Description: Command-line JSON processor
# Category: Utilities
# Author: Stephen Dolan et al (https://github.com/jqlang/jq/blob/master/AUTHORS)
# License: Multi-license (https://github.com/jqlang/jq/blob/master/COPYING)
# Version: 1.8.2
# Notes: 

{% set version = '1.8.2' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set pkg = 'jq-'~ version ~'.exe' %}
{% set exists = salt['file.file_exists'](downloads + '\\jq\\' + pkg) %}

{% if exists %}

include:
  - winfor.config.shims

jq-offline:
  file.managed:
    - name: '{{ inpath }}\jq\jq.exe'
    - source: '{{ downloads }}\jq\{{ pkg }}'
    - makedirs: True

jq-shim-offline:
  cmd.run:
    - name: 'powershell -nop -ep Bypass -File {{ inpath }}\New-Shim.ps1 -SourceExe {{ inpath }}\jq\jq.exe -OutPath {{ inpath }}\shims\jq.exe'
    - require:
      - sls: winfor.config.shims
      - file: jq-offline

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
