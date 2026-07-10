# Name: pe-sieve
# Website: https://github.com/hasherezade/pe-sieve
# Description: Scans a process and dumps possible implants
# Category: Executables
# Author: hasherezade
# License: BSD 2-Clause Simplified License (https://github.com/hasherezade/pe-sieve/blob/master/LICENSE)
# Version: 0.4.1.1
# Notes: 

{% set version = '0.4.1.1' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set pkg = 'pe-sieve-'~ version ~'.exe' %}
{% set exists = salt['file.file_exists'](downloads + '\\pe-sieve\\' + pkg) %}

{% if exists %}

include:
  - winfor.config.shims

pe-sieve-copy-offline:
  file.copy:
    - name: '{{ inpath }}\pe-sieve\pe-sieve.exe'
    - source: '{{ downloads }}\pe-sieve\{{ pkg }}'
    - makedirs: True
    - force: True

pe-sieve-shim-offline:
  cmd.run:
    - name: 'powershell -nop -ep Bypass -File {{ inpath }}\New-Shim.ps1 -SourceExe {{ inpath }}\pe-sieve\pe-sieve.exe -OutPath {{ inpath }}\shims\pe-sieve.exe'
    - require:
      - sls: winfor.config.shims

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
