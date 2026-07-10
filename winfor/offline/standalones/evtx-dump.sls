# Name: evtx_dump
# Website: https://github.com/omerbenamram/evtx
# Description: EVTX Event Log Parser
# Category: Logs
# Author: Omer BenAmram
# License: Apache License v2 (https://github.com/omerbenamram/evtx/blob/master/LICENSE-APACHE) and MIT License (https://github.com/omerbenamram/evtx/blob/master/LICENSE-MIT)
# Version: 0.12.2
# Notes: 

{% set version = '0.12.2' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set pkg = 'evtx-dump-'~ version ~'.exe' %}
{% set exists = salt['file.file_exists'](downloads + '\\evtx-dump\\' + pkg) %}

{% if exists %}

include:
  - winfor.config.shims

evtx-dump-offline:
  file.managed:
    - name: '{{ inpath }}\evtx-dump\evtx-dump.exe'
    - source: '{{ downloads }}\evtx-dump\{{ pkg }}'
    - skip_verify: True
    - makedirs: True
    - replace: True

evtx-dump-shim-offline:
  cmd.run:
    - name: 'powershell -nop -ep Bypass -File {{ inpath }}\New-Shim.ps1 -SourceExe {{ inpath }}\evtx-dump\evtx-dump.exe -OutPath {{ inpath }}\shims\evtx-dump.exe'
    - require:
      - sls: winfor.config.shims
      - file: evtx-dump-offline

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}