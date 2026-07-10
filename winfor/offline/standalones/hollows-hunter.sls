# Name: hollows_hunter
# Website: https://github.com/hasherezade/hollows_hunter
# Description: Scans running processes for implants and dumps them if found
# Category: Executables
# Author: hasherezade
# License: BSD 2-Clause Simplified License (https://github.com/hasherezade/hollows_hunter/blob/master/LICENSE)
# Version: 0.4.1.1
# Notes: 

{% set version = '0.4.1.1' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set pkg = 'hollows-hunter-'~ version ~'.exe' %}
{% set exists = salt['file.file_exists'](downloads + '\\hollows-hunter\\' + pkg) %}

{% if exists %}

include:
  - winfor.config.shims

hollows-hunter-offline:
  file.managed:
    - name: '{{ inpath }}\hollows-hunter\hollows-hunter.exe'
    - source: '{{ downloads }}\hollows-hunter\{{ pkg }}'
    - skip_verify: True
    - makedirs: True

hollows-hunter-shim-offline:
  cmd.run:
    - name: 'powershell -nop -ep Bypass -File {{ inpath }}\New-Shim.ps1 -SourceExe {{ inpath }}\hollows-hunter\hollows-hunter.exe -OutPath {{ inpath }}\shims\hollows-hunter.exe'
    - require:
      - sls: winfor.config.shims

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
